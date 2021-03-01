package com.example.colegio;

import androidx.appcompat.app.AppCompatActivity;

import android.os.Bundle;
import android.util.Log;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.TextView;
import android.widget.Toast;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import Modelo.Estudiante;
import okhttp3.OkHttpClient;
import okhttp3.ResponseBody;
import retrofit2.Call;
import retrofit2.Callback;
import retrofit2.Response;
import retrofit2.Retrofit;
import retrofit2.converter.gson.GsonConverterFactory;

public class ActividadInsertarEstudiante extends AppCompatActivity {

    private TextView textViewResult;
    private EditText dni, apellidos, nombres, fechaNacimiento, genero, vigencia, carrera;
    private Button btn_submit;
    private static final String URL = "https://my-json-server.typicode.com/KevinC29/Desarrollo_Plataformas/";

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_actividad_insertar_estudiante);
        textViewResult = findViewById(R.id.txt_view_result);

        dni = findViewById(R.id.txtIngresarDNI);
        apellidos = findViewById(R.id.txtIngresarApellidos);
        nombres = findViewById(R.id.txtIngresarNombres);
        fechaNacimiento = findViewById(R.id.txtIngresarFecha);
        genero = findViewById(R.id.txtIngresarGenero);
        vigencia =findViewById(R.id.txtIngresarVigencia);
        carrera = findViewById(R.id.txtIngresarCarrera_id);
        btn_submit = findViewById(R.id.btnIngresar);

        btn_submit.setOnClickListener((view)->{
            postEstudiante();
        });
    }

    private void postEstudiante() {
        Retrofit retrofit = new Retrofit.Builder()
                .baseUrl(URL)
                .addConverterFactory(GsonConverterFactory.create())
                .build();
        PostService postService = retrofit.create(PostService.class);
        Estudiante estudiante = new Estudiante();
        estudiante.setDni(dni.getText().toString());
        estudiante.setApellidos(apellidos.getText().toString());
        estudiante.setNombres(nombres.getText().toString());
        estudiante.setFechaNacimiento(fechaNacimiento.getText().toString());
        estudiante.setGenero(genero.getText().toString());
        estudiante.setVigencia(vigencia.getText().toString());
        estudiante.setCarrera_id(carrera.getText().toString());

        Call<Estudiante> call = postService.post(estudiante);
        call.enqueue(new Callback<Estudiante>() {
            @Override
            public void onResponse(Call<Estudiante> call, Response<Estudiante> response) {
                if (response.isSuccessful()) {
                    Toast.makeText(getApplicationContext(), "agregado con exito", Toast.LENGTH_LONG).show();
                    textViewResult.setText(estudiante.getDni() + "\n" + estudiante.getApellidos() + "\n" + estudiante.getNombres());
                }else{
                    Log.println(Log.INFO, "Estudiante==",estudiante.getNombres());
                }
                textViewResult.setText(estudiante.getDni() + "\n" + estudiante.getApellidos() + "\n" + estudiante.getNombres());
            }

            @Override
            public void onFailure(Call<Estudiante> call, Throwable t) {
                Toast.makeText(getApplicationContext(), "Error por: " + t.getMessage(), Toast.LENGTH_LONG).show();
                Log.println(Log.INFO, "error==",estudiante.getNombres());
            }
        });
    }
}