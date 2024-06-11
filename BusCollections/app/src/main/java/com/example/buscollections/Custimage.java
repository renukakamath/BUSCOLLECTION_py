package com.example.buscollections;

import android.app.Activity;
import android.content.SharedPreferences;
import android.preference.PreferenceManager;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ArrayAdapter;
import android.widget.ImageView;
import android.widget.TextView;

import com.squareup.picasso.Picasso;

public class Custimage extends ArrayAdapter<String>  {

	 private Activity context;       //for to get current activity context
	SharedPreferences sh;
	private String[] staff_name;
	private String[] place;
	private String[] phone;
	private String[] email;
	private String[] id_proof;
	private String[] staff_type;


	
	 public Custimage(Activity context, String[] sname, String[] pl, String[] ph, String[] em, String[] image, String[] type ) {
	        //constructor of this class to get the values from main_activity_class

	        super(context, R.layout.cust_images, image);
	        this.context = context;
		 this.staff_name = sname;
		    this.place = pl;

		 this.phone = ph;
		 this.email = em;
		 this.id_proof = image;

		 this.staff_type = type;

	    }

	    @Override
	    public View getView(int position, View convertView, ViewGroup parent) {
	                 //override getView() method

	        LayoutInflater inflater = context.getLayoutInflater();
	        View listViewItem = inflater.inflate(R.layout.cust_images, null, true);
			//cust_list_view is xml file of layout created in step no.2

	        ImageView im = (ImageView) listViewItem.findViewById(R.id.imageView1);
	        TextView t1=(TextView)listViewItem.findViewById(R.id.textView3);


			t1.setText("staff_name : "+staff_name[position]+"\nplace : "+place[position]+"\nphone : "+phone[position]+"\nemail : "+email[position]+"\nstaff_type:"+staff_type[position]);
//			t2.setText(caption[position]);
	        sh=PreferenceManager.getDefaultSharedPreferences(getContext());
	        
	       String pth = "http://"+sh.getString("ip", "")+"/"+id_proof[position];
	       pth = pth.replace("~", "");
//	       Toast.makeText(context, pth, Toast.LENGTH_LONG).show();
	        
	        Log.d("-------------", pth);
	        Picasso.with(context)
	                .load(pth)
	                .placeholder(R.drawable.ic_launcher_background)
	                .error(R.drawable.ic_launcher_background).into(im);
	        
	        return  listViewItem;
	    }

		private TextView setText(String string) {
			// TODO Auto-generated method stub
			return null;
		}
}