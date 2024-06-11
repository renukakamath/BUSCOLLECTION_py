from flask import * 
from database import* 
import uuid

api=Blueprint('api',__name__)

@api.route('/logins')
def logins():
	data={}
	u=request.args['username']
	p=request.args['password']
	q1="select * from login where username='%s' and `password`='%s'"%(u,p)
	print(q1)
	res=select(q1)
	if res:
		data['data']=res
		data['status']='success'
	else:
		data['status']='failed'
	return str(data)


@api.route('/register',methods=['get','post'])
def register():
	data={}
	
	fname=request.form['fname']
	p=request.form['place']
	t=request.form['Type']

	ph=request.form['phone']

	e=request.form['email']

	
	lid=request.form['log_id']
	bid=request.form['bid']




	img=request.files['image']
	path="static/image/"+str(uuid.uuid4())+img.filename
	img.save(path)



	q="insert into staff values(null,'%s','%s','%s','%s','%s','%s','%s','%s')"%(lid,bid,fname,p,ph,e,path,t)
	insert(q)
	data['status']='success'
	return str(data)

@api.route('/ViewBus')
def ViewBus():
	data={}
	
	q1="select * from bus inner join owner using (owner_id)"
	print(q1)
	res=select(q1)
	if res:
		data['data']=res
		data['status']='success'
	else:
		data['status']='failed'
	return str(data)

@api.route('/Viewsatff')
def Viewsatff():
	data={}
	
	q1="select * from staff inner join bus using (bus_id)"
	print(q1)
	res=select(q1)
	if res:
		data['data']=res
		data['status']='success'
	else:
		data['status']='failed'
	return str(data)

@api.route('/send_complaint', methods=['get','post'])
def send_complaint():
	data = {}
	complaint = request.args['complaint']
	login_id = request.args['login_id']
	q = "INSERT INTO `complaints` (`sender_id`, `complaint_des`, `reply`, `date`) VALUES ((SELECT `employee_id` FROM `employee` WHERE `login_id` = '%s'), '%s', 'pending', curdate())" %(login_id, complaint)
	res = insert(q)
	print(q)
	if res:
		data['status'] = 'success'
	else:
		data['status'] = 'failed'
	data['method'] = 'send_complaint'
	return str(data)

@api.route('/view_complaints', methods=['get', 'post'])
def view_complaints():
	data = {}
	login_id = request.args['login_id']
	q = "SELECT * FROM `complaints` WHERE `sender_id` = (SELECT `employee_id` FROM `employee` WHERE `login_id` = '%s') ORDER BY `complaint_id` DESC" %(login_id)
	res = select(q)
	if res:
		data['data'] = res
		data['status'] = 'success'
	else:
		data['status'] = 'failed'
	data['method'] = 'view_complaints'
	return str(data)

@api.route('/AddCollection')	
def AddCollection():
	data={}
	c=request.args['collection']
	bid=request.args['bid']
	
	l=request.args['login_id']
	q="insert into collection values(null,(select employee_id from employee where login_id='%s'),'%s','%s',curdate())"%(l,bid,c)
	insert(q)
	print(q)
	data['status']="success"
	data['method']='AddCol'
	return str(data)

@api.route('/Viewcollection')
def Viewcollection():
	data={}
	bid=request.args['bid']
	lid=request.args['login_id']
	q="select * from collection inner join bus using (bus_id) inner join employee using (employee_id) where bus_id='%s' and employee_id=(select employee_id from employee where login_id='%s')"%(bid,lid)
	print(q)
	res=select(q)
	if res:
		data['data']=res
		data['status']="success"
	data['method']='Viewcol'
	return str(data)

@api.route('/Addexp')	
def Addexp():
	data={}
	c=request.args['exp']
	amt=request.args['amount']
	bid=request.args['bid']
	
	l=request.args['login_id']
	q="insert into expenses values(null,(select employee_id from employee where login_id='%s'),'%s','%s','%s',curdate())"%(l,bid,c,amt)
	insert(q)
	print(q)
	data['status']="success"
	data['method']='AddCol'
	return str(data)

@api.route('/Viewexp')
def Viewexp():
	data={}
	bid=request.args['bid']
	lid=request.args['login_id']
	q="select * from expenses inner join bus using (bus_id) inner join employee using (employee_id) where bus_id='%s' and employee_id=(select employee_id from employee where login_id='%s')"%(bid,lid)
	print(q)
	res=select(q)
	if res:
		data['data']=res
		data['status']="success"
	data['method']='Viewcol'
	return str(data)

@api.route('/Addser')	
def Addser():
	data={}
	c=request.args['exp']
	amt=request.args['amount']
	bid=request.args['bid']
	
	l=request.args['login_id']
	q="insert into service_details values(null,'%s',(select employee_id from employee where login_id='%s'),'%s','%s',curdate())"%(bid,l,c,amt)
	insert(q)
	print(q)
	data['status']="success"
	data['method']='AddCol'
	return str(data)

@api.route('/Viewser')
def Viewser():
	data={}
	bid=request.args['bid']
	lid=request.args['login_id']
	q="select * from service_details inner join bus using (bus_id) inner join employee using (employee_id) where bus_id='%s' and employee_id=(select employee_id from employee where login_id='%s')"%(bid,lid)
	print(q)
	res=select(q)
	if res:
		data['data']=res
		data['status']="success"
	data['method']='Viewcol'
	return str(data)



