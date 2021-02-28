package com.example.colegio;

import androidx.appcompat.app.AppCompatActivity;
import androidx.recyclerview.widget.LinearLayoutManager;
import androidx.recyclerview.widget.RecyclerView;

import android.os.Bundle;
import android.util.Log;
import android.widget.TextView;

import com.android.volley.Request;
import com.android.volley.RequestQueue;
import com.android.volley.Response;
import com.android.volley.VolleyError;
import com.android.volley.toolbox.JsonArrayRequest;
import com.android.volley.toolbox.StringRequest;
import com.android.volley.toolbox.Volley;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import java.util.ArrayList;
import java.util.List;

import Modelo.Estudiante;

public class ActividadMostrarEstudiante extends AppCompatActivity {
    RecyclerView recyclerView;
    List<Estudiante> estudiantes;


    private static final String URL = "https://my-json-server.typicode.com/KevinC29/Desarrollo_Plataformas/posts";
    Adapter adapter;


    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_actividad_mostrar_estudiante);

        recyclerView = findViewById(R.id.ListaEstudiantes);
        estudiantes = new ArrayList<>();
        extraerEstudiantes();



        //iniciarComponentes();
        //stringRequest();
    }

    private void extraerEstudiantes() {
        RequestQueue queue = Volley.newRequestQueue(this);
        JsonArrayRequest jsonArrayRequest = new JsonArrayRequest(Request.Method.GET, URL, null, new Response.Listener<JSONArray>() {
            @Override
            public void onResponse(JSONArray response) {
                for (int i = 0; i < response.length(); i++){
                    try {
                        JSONObject estudianteObject = response.getJSONObject(i);
                        Estudiante estudiante = new Estudiante();
                        estudiante.setDni(estudianteObject.getString("dni").toString());
                        estudiante.setApellidos(estudianteObject.getString("apellidos").toString());
                        estudiante.setNombres(estudianteObject.getString("nombres").toString());
                        estudiante.setGenero(estudianteObject.getString("genero").toString());
                        estudiantes.add(estudiante);
                    }catch (JSONException e){
                        e.printStackTrace();
                    }
                }
                recyclerView.setLayoutManager(new LinearLayoutManager(getApplicationContext()));
                adapter = new Adapter(getApplicationContext(), estudiantes);
                recyclerView.setAdapter(adapter);
            }
        }, new Response.ErrorListener(){
            @Override
            public void onErrorResponse(VolleyError error) {
                Log.d("tag", "onErrorResponse: " + error.getMessage());
            }
        });
        queue.add(jsonArrayRequest);
    }

    /*private void iniciarComponentes() {
        textView = findViewById(R.id.textViewEstudiantes);
    }*/

    /*private void stringRequest(){
        StringRequest request = new StringRequest(
                Request.Method.GET,
                URL,
                new Response.Listener<String>() {
                    @Override
                    public void onResponse(String response) {
                        textView.setText(response);
                    }
                },
                new Response.ErrorListener() {
                    @Override
                    public void onErrorResponse(VolleyError error) {

                    }
                }
        );
        requestQueue.add(request);
    }*/
}