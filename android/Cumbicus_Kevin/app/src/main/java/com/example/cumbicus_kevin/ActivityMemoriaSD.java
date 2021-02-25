package com.example.cumbicus_kevin;

import android.app.Activity;
import android.os.Bundle;

import com.google.android.material.floatingactionbutton.FloatingActionButton;
import com.google.android.material.snackbar.Snackbar;

import androidx.appcompat.app.AppCompatActivity;
import androidx.appcompat.widget.Toolbar;

import android.os.Environment;
import android.util.Log;
import android.view.View;
import android.widget.EditText;
import android.widget.Toast;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;

public class ActivityMemoriaSD extends AppCompatActivity {
    EditText cajaArchivo, cajaContenido;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_memoria_s_d);

        cajaArchivo = findViewById(R.id.txtArchivoSD);
        cajaContenido = findViewById(R.id.txtContenidoSD);
    }


    public void Guardar(View view) {
        String nomarchivo = cajaArchivo.getText().toString();
        String contenido = cajaContenido.getText().toString();
        try {
            File tarjetaSD = Environment.getExternalStorageDirectory();
            File file = new  File(tarjetaSD.getPath(), nomarchivo);
            OutputStreamWriter crear = new OutputStreamWriter(
                    openFileOutput(nomarchivo, Activity.MODE_PRIVATE));

            crear.write(contenido);
            crear.flush();
            crear.close();
            Toast.makeText(this, "Cuardado Correctamente",
                    Toast.LENGTH_SHORT).show();
            cajaArchivo.setText("");
            cajaContenido.setText("");
        } catch (IOException ex) {
            Log.e("ERROR GUARDAR", ex.getMessage());
        }
    }

    public void Consultar(View v) {
        String nomarchivo = cajaArchivo.getText().toString();

        try {
            File tarjetaSD = Environment.getExternalStorageDirectory();
            File file = new  File(tarjetaSD.getPath(), nomarchivo);
            InputStreamReader abrirarchivo = new InputStreamReader(openFileInput(nomarchivo));
            BufferedReader leerA = new BufferedReader(abrirarchivo);
            String linea = leerA.readLine();
            String todo = "";
            while (linea != null) {
                todo = todo + linea + "\n";
                linea = leerA.readLine();
            }
            leerA.close();
            abrirarchivo.close();
            cajaContenido.setText(todo);
        } catch (IOException ex) {
            Log.e("ERROR LECTURA", ex.getMessage());
        }
    }
}