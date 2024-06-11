from flask import *
from database import*
import uuid

owner=Blueprint('owner',__name__)


@owner.route('/owner_home')
def owner_home():

	return render_template('owner_home.html')

@owner.route('/owner_manageemployees',methods=['post','get'])	
def owner_manageemployees():
	data={}
	oid=session['owner_id']
	q="SELECT * ,CONCAT (employee.email) AS eemail ,CONCAT(employee.phone)  AS ephone ,CONCAT (employee.place) AS eplace ,CONCAT (employee.id_proof) AS eid_proof FROM employee INNER JOIN `owner` USING(owner_id) where owner_id='%s'"%(oid)
	res=select(q)
	data['employeeview']=res

	if "action" in request.args:
		action=request.args['action']
		eid=request.args['eid']

	else:
		action=None

	if action=='delete':
		q="delete from employee where employee_id='%s' "%(eid)
		delete(q)
		flash('successfully')
		return redirect(url_for('owner.owner_manageemployees'))

	if action=='update':
		q="select * from employee where employee_id='%s'"%(eid)
		res=select(q)
		data['employeeup']=res
		


	if "update" in request.form:
		e=request.form['ename']
		pl=request.form['place']
		em=request.form['email']
		p=request.form['phone']
		
		
		q="update employee set employee_name='%s',place='%s',email='%s',phone='%s' where employee_id='%s' "%(e,pl,em,p,eid)
		update(q)
		flash('successfully')
		return redirect(url_for('owner.owner_manageemployees'))


	if "employee" in request.form:
		e=request.form['ename']
		pl=request.form['place']
		em=request.form['email']
		p=request.form['phone']
		i=request.files['imgg']
		path="static/image/"+str(uuid.uuid4())+i.filename
		i.save(path)
		u=request.form['uname']
		pa=request.form['pwd']
		oid=session['owner_id']
		q="insert into login values(null,'%s','%s','employee')"%(u,pa)
		id=insert(q)
		q="insert into employee values(null,'%s','%s','%s','%s','%s','%s','%s')"%(oid,id,e,pl,em,p,path)
		insert(q)

		flash('successfully')
		return redirect(url_for('owner.owner_manageemployees'))
	
	return render_template('owner_manageemployees.html',data=data)



@owner.route('/owner_managebus',methods=['post','get'])	
def owner_managebus():
	data={}
	oid=session['owner_id']
	q="select * from bus inner join owner using (owner_id) where owner_id='%s'"%(oid)
	res=select(q)
	data['busview']=res

	if "action" in request.args:
		action=request.args['action']
		bid=request.args['bid']

	else:
		action=None

	if action=='delete':
		q="delete from bus where bus_id='%s' "%(bid)
		delete(q)
		flash('successfully')
		return redirect(url_for('owner.owner_managebus'))

	if action=='update':
		q="select * from bus where bus_id='%s'"%(bid)
		res=select(q)
		data['busup']=res
		


	if "update" in request.form:
		t=request.form['bnumber']

		q="update bus set bus_number='%s' where bus_id='%s' "%(t,bid)
		update(q)
		flash('successfully')
		return redirect(url_for('owner.owner_managebus'))


	if "bus" in request.form:
		t=request.form['bnumber']
		oid=session['owner_id']
		q="insert into bus values(null,'%s','%s')"%(oid,t)
		insert(q)

		flash('successfully')
		return redirect(url_for('owner.owner_managebus'))
	
	return render_template('owner_managebus.html',data=data)

@owner.route('/owner_vehiclepermit',methods=['post','get'])
def owner_vehiclepermit():

	data={}
	bid=request.args['bid']
	q="select * from permit_details inner join bus using (bus_id) where bus_id='%s'"%(bid)
	res=select(q)
	data['prem']=res


	if "permit" in request.form:
		rep=request.form['pd']
		i=request.files['imgg']
		path="static/image/"+str(uuid.uuid4())+i.filename
		i.save(path)
		bid=request.args['bid']

		q="insert into permit_details values(null,'%s','%s','%s')"%(bid,rep,path)
		insert(q)
		flash('successfully')
		return redirect(url_for('owner.owner_vehiclepermit',bid=bid))


	return render_template('owner_vehiclepermit.html',data=data,bid=bid)

@owner.route('/owner_viewcollection',methods=['post','get'])
def owner_viewcollection():

	data={}
	bid=request.args['bid']
	q="select * from collection inner join employee using(employee_id) inner join bus using (bus_id)  where bus_id='%s'"%(bid)
	res=select(q)
	data['coooo']=res


	return render_template('owner_viewcollection.html',data=data,bid=bid)


@owner.route('/owner_viewexpenses',methods=['post','get'])
def owner_viewexpenses():

	data={}
	bid=request.args['bid']
	q="select * from expenses inner join employee using(employee_id) inner join bus using (bus_id) where bus_id='%s'"%(bid)
	res=select(q)
	data['exp']=res


	return render_template('owner_viewexpenses.html',data=data,bid=bid)

@owner.route('/owner_generate_expenses',methods=['post','get'])	
def owner_generate_expenses():
	data={}
	if "exdate" in request.form:
		daily=request.form['daily']
		if request.form['monthly']=="":
			monthly=""
		else:
			monthly=request.form['monthly']+'%'
		print(monthly)
			
		q="select * from expenses  inner join employee using (employee_id) inner join bus using (bus_id) where date like '%s' or date like '%s'"%(daily,monthly)
		res=select(q)
		print(q)
		data['report']=res
		session['res']=res
		r=session['res']
	else:
		q="select * from expenses  inner join employee using (employee_id) inner join bus using (bus_id)"
		res=select(q)
		data['report']=res
	
	return render_template('owner_generate_expenses.html',data=data)

@owner.route('/expenses')
def expenses():
	data={}

	r=session['res']
	data['r']=r


	return render_template('expenses.html',data=data)	

@owner.route('/owner_generatecollection',methods=['post','get'])	
def owner_generatecollection():
	data={}
	if "exdate" in request.form:
		daily=request.form['daily']
		if request.form['monthly']=="":
			monthly=""
		else:
			monthly=request.form['monthly']+'%'
		print(monthly)
			
		q="select * from collection  inner join employee using (employee_id) inner join bus using (bus_id)where date like '%s' or date like '%s'"%(daily,monthly)
		res1=select(q)
		print(q)
		data['colreport']=res1
		session['res1']=res1
		r1=session['res1']
	else:
		q="select * from collection  inner join employee using (employee_id) inner join bus using (bus_id)"
		res1=select(q)
		data['colreport']=res1
	
	return render_template('owner_generatecollection.html',data=data)

@owner.route('/collection')
def collection():
	data={}

	r1=session['res1']
	data['r1']=r1


	return render_template('collection.html',data=data)

@owner.route('/owner_sendcomplaint',methods=['post','get'])
def owner_sendcomplaint():
	data={}
	oid=session['owner_id']
	q="SELECT * FROM complaints INNER JOIN `owner` ON `complaints`.sender_id=`owner`.owner_id WHERE owner_id='%s' "%(oid)
	res=select(q)
	data['comp']=res

	if "complaints" in request.form:
		comp=request.form['comp']
		oid=session['owner_id']
		q="insert into complaints values(null,'%s','%s','pending',curdate())"%(oid,comp)
		insert(q)
		flash('successfully')
		return redirect(url_for('owner.owner_sendcomplaint'))
	
	return render_template('owner_sendcomplaint.html',data=data)	
