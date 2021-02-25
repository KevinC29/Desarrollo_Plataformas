package com.example.cumbicus_kevin;

import android.os.Bundle;

import com.example.cumbicus_kevin.adapter.DocenteAdapter;
import com.example.cumbicus_kevin.helper.HelperBDDocente;
import com.example.cumbicus_kevin.modelos.Docente;
import com.google.android.material.floatingactionbutton.FloatingActionButton;
import com.google.android.material.snackbar.Snackbar;

import androidx.appcompat.app.AppCompatActivity;
import androidx.appcompat.widget.Toolbar;
import androidx.recyclerview.widget.LinearLayoutManager;
import androidx.recyclerview.widget.RecyclerView;

import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.TextView;

import java.util.ArrayList;
import java.util.List;

public class ActivityBDDocente extends AppCompatActivity implements View.OnClickListener {
    EditText cajaCedula, cajaApellidos, cajaNombres;
    Button botonGuardar, botonModificar, botonEliminar, botonEliminarTodos, botonBuscar, botonBuscarTodos;
    TextView datos;
    RecyclerView recyclerView;

    HelperBDDocente helper;
    List<Docente> lista;
    DocenteAdapter docenteAdapter;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_b_d_docente);
        cargarComponentes();

        helper = new HelperBDDocente(this,"baseD", null, 1);
        lista = new ArrayList<Docente>(); //lista vacia
        lista = helper.getAllDocentes(); //se rellena la lista con todos los docentes
        recyclerView.setLayoutManager(new LinearLayoutManager(this)); // setear el layout
        docenteAdapter = new DocenteAdapter(lista); // fijando el numero de item en el adapter
        //cargar el recyclerView
        recyclerView.setAdapter(docenteAdapter);

        }

    private void cargarComponentes(){
        cajaCedula = findViewById(R.id.txtCedulaBDHelper);
        cajaApellidos = findViewById(R.id.txtApellidosBDHelper);
        cajaNombres = findViewById(R.id.txtNombresBDHelper);

        botonGuardar = findViewById(R.id.btnGuardarBDHelper);
        botonModificar = findViewById(R.id.btnModificarBDHelper);
        botonEliminar = findViewById(R.id.btnEliminarCedulaBDHelper);
        botonEliminarTodos = findViewById(R.id.btnEliminarTodosBDHelper);
        botonBuscar = findViewById(R.id.btnBuscarCedulaBDHelper);
        botonBuscarTodos = findViewById(R.id.btnBuscarTodosBDHelper);

        datos = findViewById(R.id.lblDatosBDHelper);

        recyclerView = findViewById(R.id.recyclerDocente);

        botonGuardar.setOnClickListener(this);
        botonModificar.setOnClickListener(this);
        botonEliminar.setOnClickListener(this);
        botonEliminarTodos.setOnClickListener(this);
        botonBuscar.setOnClickListener(this);
        botonBuscarTodos.setOnClickListener(this);
    }

    public void onClick(View v){
        switch (v.getId()){
            case R.id.btnGuardarBDHelper:
                Docente doc = new Docente(cajaCedula.getText().toString(),cajaApellidos.getText().toString(),cajaNombres.getText().toString());
                helper.insertar(doc);
                break;
            case R.id.btnModificarBDHelper:
                Docente doc2 = new Docente(cajaCedula.getText().toString(),cajaApellidos.getText().toString(),cajaNombres.getText().toString());
                helper.modificar(doc2);
                break;
            case R.id.btnEliminarCedulaBDHelper:
                helper.eliminarCedula(cajaCedula.getText().toString());
                break;
            case R.id.btnEliminarTodosBDHelper:
                helper.eliminarTodos();
                break;
            case R.id.btnBuscarCedulaBDHelper:
                datos.setText(helper.leerCedula(cajaCedula.getText().toString()));
                break;
            case R.id.btnBuscarTodosBDHelper:
                datos.setText(helper.leerTodos());
                break;
        }
    }
}