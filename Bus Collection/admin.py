from flask import * 
from database import*



admin=Blueprint('admin',__name__)

@admin.route('/admin_home')
def admin_home():

	return render_template('admin_home.html')

@admin.route('/admin_viewowner')
def admin_viewowner():
	data={}
	q="select * from owner inner join login using(login_id)"
	res=select(q)
	data['owners']=res
	if "action" in request.args:
		action=request.args['action']
		oid=request.args['oid']

	else:
		action=None
	if action=='accept':
		q="update login set usertype='owner' where login_id='%s'"%(oid)
		update(q)
		flash('successfully')
		return redirect(url_for('admin.admin_viewowner'))
	if action=='reject':
		q="update login set usertype='reject' where login_id='%s'"%(oid)
		update(q)
		flash('successfully')
		return redirect(url_for('admin.admin_viewowner'))
			

	return render_template('admin_viewowner.html',data=data)

@admin.route('/admin_viewbus')
def admin_viewbus():
	data={}
	q="select * from bus inner join owner using (owner_id)"
	res=select(q)
	data['buss']=res


	return render_template('admin_viewbus.html',data=data)

@admin.route('/admin_viewemployees')
def admin_viewemployees():
	data={}
	q="SELECT * ,CONCAT (employee.email) AS eemail ,CONCAT(employee.phone)  AS ephone ,CONCAT (employee.place) AS eplace ,CONCAT (employee.id_proof) AS eid_proof FROM employee INNER JOIN `owner` USING(owner_id)"
	res=select(q)
	data['employeesss']=res


	return render_template('admin_viewemployees.html',data=data)

@admin.route('/admin_viewcomplaints')
def admin_viewcomplaints():
	data={}
	q="select * from complaints"
	res=select(q)
	data['complaintsss']=res


	return render_template('admin_viewcomplaints.html',data=data)

@admin.route('/admin_sendreply',methods=['post','get'])
def admin_sendreply():
	if "reply" in request.form:
		rep=request.form['rep']
		cid=request.args['cid']
		q="update complaints set reply='%s' where complaint_id='%s'"%(rep,cid)
		update(q)
		flash('successfully')
		return redirect(url_for('admin.admin_viewcomplaints'))
	
	return render_template('admin_sendreply.html')




