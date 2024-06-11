package com.example.buscollections;

import androidx.appcompat.app.AlertDialog;
import androidx.appcompat.app.AppCompatActivity;

import android.content.DialogInterface;
import android.content.Intent;
import android.content.SharedPreferences;
import android.os.Bundle;
import android.preference.PreferenceManager;
import android.util.Log;
import android.view.View;
import android.widget.AdapterView;
import android.widget.ArrayAdapter;
import android.widget.ListView;
import android.widget.Toast;

import org.json.JSONArray;
import org.json.JSONObject;

public class ViewBus extends AppCompatActivity implements JsonResponse, AdapterView.OnItemClickListener {
    ListView l1;
    SharedPreferences sh;
    String [] owner_name,phone,bus_number,value,bus_id;
    public static String phn,bid ,tlati,tlongi;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_view_bus);
        l1=(ListView)findViewById(R.id.list);
        l1.setOnItemClickListener(this);
        sh = PreferenceManager.getDefaultSharedPreferences(getApplicationContext());
        JsonReq JR = new JsonReq();
        JR.json_response = (JsonResponse) ViewBus.this;
        String q = "/ViewBus?login_id=" +sh.getString("log_id", "");
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
                owner_name = new String[ja1.length()];
                phone = new String[ja1.length()];


                bus_number = new String[ja1.length()];
                bus_id = new String[ja1.length()];


                value = new String[ja1.length()];



                String[] value = new String[ja1.length()];

                for (int i = 0; i < ja1.length(); i++) {
                    owner_name[i] = ja1.getJSONObject(i).getString("owner_name");

                    phone[i] = ja1.getJSONObject(i).getString("phone");
                    bus_number[i] = ja1.getJSONObject(i).getString("bus_number");
                    bus_id[i] = ja1.getJSONObject(i).getString("bus_id");







                    value[i] = "owner_name:" + owner_name[i] + "\nphone: " + phone[i]+ "\nbus_number: " + bus_number[i]   ;

                }
                ArrayAdapter<String> ar = new ArrayAdapter<String>(getApplicationContext(), R.layout.custtext, value);

                l1.setAdapter(ar);

            }
        } catch (Exception e) {
            // TODO: handle exception
            e.printStackTrace();
            Toast.makeText(getApplicationContext(), e.toString(), Toast.LENGTH_LONG).show();

        }
    }

    @Override
    public void onItemClick(AdapterView<?> adapterView, View view, int i, long l) {
        bid=bus_id[i];


        final CharSequence[] items = {"Add Staff","View Staff","Add Expenses","Add Collection","Add Services","Cancel"};

        AlertDialog.Builder builder = new AlertDialog.Builder(ViewBus.this);
        builder.setItems(items, new DialogInterface.OnClickListener() {
            @Override
            public void onClick(DialogInterface dialog, int item) {

                if (items[item].equals("Add Staff")) {

                    startActivity(new Intent(getApplicationContext(),Registration.class));


                }
                else if (items[item].equals("View Staff")) {
                    startActivity(new Intent(getApplicationContext(),ViewStaff.class));


                }

                else if (items[item].equals("Add Expenses")) {
                    startActivity(new Intent(getApplicationContext(),AddExpenses.class));


                } else if (items[item].equals("Add Collection")) {

                    startActivity(new Intent(getApplicationContext(),AddCollection.class));

                }else if (items[item].equals("Add Services")) {


                    startActivity(new Intent(getApplicationContext(),AddServices.class));
                }



                else if (items[item].equals("Cancel")) {


                    dialog.dismiss();
                }
            }

        });
        builder.show();
    }
}