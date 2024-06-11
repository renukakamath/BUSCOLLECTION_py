package com.example.buscollections;

import androidx.appcompat.app.AppCompatActivity;

import android.content.Intent;
import android.content.SharedPreferences;
import android.os.Bundle;
import android.preference.PreferenceManager;
import android.util.Log;
import android.view.View;
import android.widget.ArrayAdapter;
import android.widget.Button;
import android.widget.EditText;
import android.widget.ListView;
import android.widget.Toast;

import org.json.JSONArray;
import org.json.JSONObject;

public class AddServices extends AppCompatActivity implements JsonResponse {
    EditText e1, e2, e3, e4, e5;
    Button b1;
    ListView l1;
    SharedPreferences sh;
    String exp,amount;
    String[] employee_name, bus_number, expence_amount, expence_name,date ,value;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_add_services);

        e1 = (EditText) findViewById(R.id.exp);
        e2 = (EditText) findViewById(R.id.amount);

        l1 = (ListView) findViewById(R.id.list);
        sh = PreferenceManager.getDefaultSharedPreferences(getApplicationContext());


        b1 = (Button) findViewById(R.id.campbutton);

        JsonReq JR = new JsonReq();
        JR.json_response = (JsonResponse) AddServices.this;
        String q = "/Viewser?login_id=" + sh.getString("log_id", "")+"&bid="+ViewBus.bid ;
        q = q.replace(" ", "%20");
        JR.execute(q);

        b1.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                exp = e1.getText().toString();
                amount = e2.getText().toString();


                JsonReq JR = new JsonReq();
                JR.json_response = (JsonResponse) AddServices.this;
                String q = "/Addser?exp=" + exp + "&login_id=" + sh.getString("log_id", "")+"&bid="+ViewBus.bid+"&amount="+amount;
                q = q.replace(" ", "%20");
                JR.execute(q);

            }
        });
    }

    @Override
    public void response(JSONObject jo) {
        try {

            String method=jo.getString("method");
            if(method.equalsIgnoreCase("AddCol")) {

                String status = jo.getString("status");
                Log.d("pearl", status);


                if (status.equalsIgnoreCase("success")) {
                    Toast.makeText(getApplicationContext(), "ADDED SUCCESSFULLY", Toast.LENGTH_LONG).show();
                    startActivity(new Intent(getApplicationContext(), AddServices.class));

                } else {

                    Toast.makeText(getApplicationContext(), " failed.TRY AGAIN!!", Toast.LENGTH_LONG).show();
                }
            }
            else if(method.equalsIgnoreCase("Viewcol"))
            {
                String status=jo.getString("status");
                Log.d("pearl",status);


                if(status.equalsIgnoreCase("success")){
                    JSONArray ja1=(JSONArray)jo.getJSONArray("data");

                    employee_name=new String[ja1.length()];
                    bus_number=new String[ja1.length()];
                    expence_amount=new String[ja1.length()];
                    date=new String[ja1.length()];

                    value=new String[ja1.length()];
                    expence_name=new String[ja1.length()];


                    for(int i = 0;i<ja1.length();i++)
                    {
                        employee_name[i]=ja1.getJSONObject(i).getString("employee_name");
                        bus_number[i]=ja1.getJSONObject(i).getString("bus_number");
                        expence_name[i]=ja1.getJSONObject(i).getString("service_type");
                        expence_amount[i]=ja1.getJSONObject(i).getString("service_amount");
                        date[i]=ja1.getJSONObject(i).getString("date");




                        value[i]="employee_name: "+employee_name[i]+"\nbus_number: "+bus_number[i]+"\nservice_type: "+expence_name[i]+"\nservice_amount: "+expence_amount[i]+"\ndate:"+date[i] ;

                    }
                    ArrayAdapter<String> ar=new ArrayAdapter<String>(getApplicationContext(),R.layout.custtext,value);
                    l1.setAdapter(ar);
                }
            }

        }

        catch (Exception e) {
            // TODO: handle exception
            e.printStackTrace();
            Toast.makeText(getApplicationContext(), e.toString(), Toast.LENGTH_LONG).show();
        }
    }
    public void onBackPressed()
    {
        // TODO Auto-generated method stub
        super.onBackPressed();
        Intent b=new Intent(getApplicationContext(),Userhome.class);
        startActivity(b);
    }
}
