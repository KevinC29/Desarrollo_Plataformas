package com.example.cumbicus_kevin;

import android.os.Bundle;

import com.google.android.material.floatingactionbutton.FloatingActionButton;
import com.google.android.material.snackbar.Snackbar;

import androidx.appcompat.app.AppCompatActivity;
import androidx.appcompat.widget.Toolbar;
import androidx.fragment.app.FragmentTransaction;

import android.view.View;
import android.widget.Button;

public class ActividadFragmentos extends AppCompatActivity implements View.OnClickListener{

    Button botonFrgUno, botonFrgDos;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_actividad_fragmentos);
        botonFrgUno = findViewById(R.id.btnFrgUno);
        botonFrgDos = findViewById(R.id.btnFrgDos);
        botonFrgUno.setOnClickListener(this);
        botonFrgDos.setOnClickListener(this);
    }

    @Override
    public void onClick(View v) {
        switch (v.getId()){
            case R.id.btnFrgUno:
                FrgUno fragmentoUno = new FrgUno();
                FragmentTransaction transactionUno = getSupportFragmentManager().beginTransaction();
                transactionUno.replace(R.id.contenedor, fragmentoUno);
                transactionUno.commit();
                break;
            case R.id.btnFrgDos:
                FrgDos fragmentoDos = new FrgDos();
                FragmentTransaction transactionDos = getSupportFragmentManager().beginTransaction();
                transactionDos.replace(R.id.contenedor, fragmentoDos);
                transactionDos.commit();
                break;
        }
    }
}