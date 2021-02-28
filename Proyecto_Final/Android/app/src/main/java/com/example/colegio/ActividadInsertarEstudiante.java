package com.example.colegio;

import androidx.appcompat.app.AppCompatActivity;

import android.os.Bundle;
import android.widget.Button;
import android.widget.EditText;
import android.widget.Toast;

import com.android.volley.AuthFailureError;
import com.android.volley.Request;
import com.android.volley.RequestQueue;
import com.android.volley.Response;
import com.android.volley.VolleyError;
import com.android.volley.toolbox.StringRequest;
import com.android.volley.toolbox.Volley;

import org.json.JSONException;
import org.json.JSONObject;

import java.io.UnsupportedEncodingException;

public class ActividadInsertarEstudiante extends AppCompatActivity {

    private RequestQueue requestQueue;
    private EditText dni, apellidos, nombres, fechaNacimiento, genero, vigencia, carrera;
    private Button btn_submit;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_actividad_insertar_estudiante);

        dni = (EditText)findViewById(R.id.txtIngresarDNI);
        apellidos = (EditText)findViewById(R.id.txtIngresarApellidos);
        nombres = (EditText)findViewById(R.id.txtIngresarNombres);
        fechaNacimiento = (EditText)findViewById(R.id.txtIngresarFecha);
        genero = (EditText)findViewById(R.id.txtIngresarGenero);
        vigencia = (EditText)findViewById(R.id.txtIngresarVigencia);
        carrera = (EditText)findViewById(R.id.txtIngresarCarrera_id);
        btn_submit = (Button)findViewById(R.id.btnIngresar);

        btn_submit.setOnClickListener((view)->{

            String data = "{" +
                    "\'dni\'" + "\'" + dni.getText().toString() + "\'," +
                    "\'apellidos\'" + "\'" + apellidos.getText().toString() + "\'," +
                    "\'nombres\'" + "\'" + nombres.getText().toString() + "\'," +
                    "\'fechaNacimiento\'" + "\'" + fechaNacimiento.getText().toString() + "\'," +
                    "\'genero\'" + "\'" + genero.getText().toString() + "\'," +
                    "\'vigencia\'" + "\'" + vigencia.getText().toString() + "\'," +
                    "\'carrera_id\'" + "\'" + carrera.getText().toString() + "\'," +
                    "}";
            Submit(data);
        });
    }

    private void Submit(String data) {
        final  String savedata = data;
        String URL = "https://my-json-server.typicode.com/KevinC29/Desarrollo_Plataformas/posts";

        requestQueue = Volley.newRequestQueue(getApplicationContext());
        StringRequest stringRequest = new StringRequest(Request.Method.POST, URL, new Response.Listener<String>() {
            @Override
            public void onResponse(String response) {
                try {
                    JSONObject objres = new JSONObject(response);
                    Toast.makeText(getApplicationContext(), objres.toString(), Toast.LENGTH_LONG).show();
                } catch (JSONException e) {
                    Toast.makeText(getApplicationContext(), "Server Error", Toast.LENGTH_LONG).show();
                }
            }
        }, new Response.ErrorListener() {
            @Override
            public void onErrorResponse(VolleyError error) {
                Toast.makeText(getApplicationContext(), error.getMessage(), Toast.LENGTH_LONG).show();
            }
        });
        requestQueue.add(stringRequest);
    }
}