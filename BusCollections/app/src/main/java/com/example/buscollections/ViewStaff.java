package com.example.buscollections;

import androidx.appcompat.app.AppCompatActivity;

import android.content.SharedPreferences;
import android.os.Bundle;
import android.preference.PreferenceManager;
import android.util.Log;
import android.widget.ArrayAdapter;
import android.widget.ListView;
import android.widget.Toast;

import org.json.JSONArray;
import org.json.JSONObject;

public class ViewStaff extends AppCompatActivity implements JsonResponse {

    ListView l1;
    SharedPreferences sh;
    String [] staff_name,place,phone,email,id_proof,staff_type,value;
    public static String phn,uid ,tlati,tlongi;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_view_staff);
        l1=(ListView)findViewById(R.id.list);
//        l1.setOnItemClickListener(this);
        sh = PreferenceManager.getDefaultSharedPreferences(getApplicationContext());
        JsonReq JR = new JsonReq();
        JR.json_response = (JsonResponse) ViewStaff.this;
        String q = "/Viewsatff?log_id=" +sh.getString("log_id", "");
        q = q.replace(" ", "%20");
        JR.execute(q);
    }

    @Override
    public void response(JSONObject jo) {
        try {

            String status = jo.getString("status");
            Log.d("pearl", status);


            if (status.equalsIgnoreCase("success")) {
                JSONArray ja1 = (JSONArray) jo.getJSONArray("data");
                staff_name = new String[ja1.length()];
                place = new String[ja1.length()];
                phone = new String[ja1.length()];

                email = new String[ja1.length()];

                id_proof = new String[ja1.length()];
                staff_type = new String[ja1.length()];


                value = new String[ja1.length()];



                String[] value = new String[ja1.length()];

                for (int i = 0; i < ja1.length(); i++) {
                    staff_name[i] = ja1.getJSONObject(i).getString("staff_name");

                    place[i] = ja1.getJSONObject(i).getString("place");
                    phone[i] = ja1.getJSONObject(i).getString("phone");
                    email[i] = ja1.getJSONObject(i).getString("email");

                    id_proof[i] = ja1.getJSONObject(i).getString("id_proof");
                    staff_type[i] = ja1.getJSONObject(i).getString("staff_type");




                    value[i] = "staff_name:" + staff_name[i] + "\nplace: " + place[i] + "\nphone: " + phone[i]+ "\nemail: " + email[i] + "\nstaff_type: " + staff_type[i] ;

                }
                ArrayAdapter<String> ar = new ArrayAdapter<String>(getApplicationContext(), R.layout.custtext, value);

                l1.setAdapter(ar);

                Custimage a=new Custimage(this,staff_name,place,phone,email,id_proof,staff_type);
                l1.setAdapter(a);

            }
        } catch (Exception e) {
            // TODO: handle exception
            e.printStackTrace();
            Toast.makeText(getApplicationContext(), e.toString(), Toast.LENGTH_LONG).show();

        }

    }
}