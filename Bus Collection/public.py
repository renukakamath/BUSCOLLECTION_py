from flask import *
from database import*
import uuid


public=Blueprint('public',__name__)

@public.route('/')
def public_home():
	return render_template('public_home.html')

@public.route('/owner_registration',methods=['post','get'])	
def owner_registration():
	if "ownerreg" in request.form:
		c=request.form['oname']
		l=request.form['place']
		
		ph=request.form['phone']
		e=request.form['email']
		i=request.files['imgg']
		path="static/image/"+str(uuid.uuid4())+i.filename
		i.save(path)
		u=request.form['uname']
		pa=request.form['pwd']
		q="select * from login where username='%s' and password='%s'"%(u,pa)
		res=select(q)
		if res:

			flash('already exist')

		else:
			
			q="insert into login values(null,'%s','%s','pending')"%(u,pa)
			id=insert(q)
			q="insert into `owner` values(null,'%s','%s','%s','%s','%s','%s')"%(id,c,l,ph,e,path)
			insert(q)
			flash('successfully')
			return redirect(url_for('public.owner_registration'))

	return render_template('owner_registration.html')




@public.route('/public_login',methods=['post','get'])	
def public_login():
	if "login" in request.form:
		u=request.form['uname']
		pa=request.form['pwd']
		q="select * from login where username='%s' and password='%s'"%(u,pa)
		res=select(q)
		if res:
			session['login_id']=res[0]['login_id']
			lid=session['login_id']
			if res[0]['usertype']=="admin":
				return redirect(url_for('admin.admin_home'))

			elif res[0]['usertype']=="owner":
				q="select * from `owner` where login_id='%s'"%(lid)
				res=select(q)
				if res:
					session['owner_id']=res[0]['owner_id']
					oid=session['owner_id']
				return redirect(url_for('owner.owner_home'))

			


		else:
			flash('invalid username and password')

	return render_template('public_login.html')