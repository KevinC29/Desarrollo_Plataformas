package com.example.cumbicus_kevin;

import android.os.Bundle;

import com.google.android.material.floatingactionbutton.FloatingActionButton;
import com.google.android.material.snackbar.Snackbar;

import androidx.appcompat.app.AppCompatActivity;
import androidx.appcompat.widget.Toolbar;

import android.util.Log;
import android.view.View;
import android.widget.Button;
import android.widget.TextView;

import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;

public class ActivityMemoriaPrograma extends AppCompatActivity {
    Button boton;
    TextView datos;


    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_memoria_programa);
        datos = findViewById(R.id.lblDatosAP);
        boton = findViewById(R.id.btnLeerAP);
        boton.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                try {
                    InputStream input = getResources().openRawResource(R.raw.archivo_raw);
                    BufferedReader lector = new BufferedReader(new InputStreamReader(input));
                    String informacion = lector.readLine();
                    datos.setText(informacion);
                    lector.close();
                }catch(Exception ex){
                    Log.e("ERROR LECTURA", ex.getMessage());
                }
            }
        });
    }
}