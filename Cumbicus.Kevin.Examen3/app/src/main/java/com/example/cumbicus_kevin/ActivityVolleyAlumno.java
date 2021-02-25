package com.example.cumbicus_kevin;

import androidx.appcompat.app.AppCompatActivity;
import androidx.recyclerview.widget.RecyclerView;

import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.TextView;
import android.widget.Toast;

import com.example.cumbicus_kevin.controlador.ServicioWebVolly;
import com.example.cumbicus_kevin.modelos.Alumno;

import org.json.JSONException;
import org.w3c.dom.Text;

public class ActivityVolleyAlumno extends AppCompatActivity {
    EditText cajaId, cajaNombre, cajaDireccion;
    Button botonGuardar, botonBuscarTodos;
    TextView datos;
    ServicioWebVolly servicio;
    RecyclerView recyclerViewAlumno;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_volley_alumno);
        cargarComponentes();
        servicio = new ServicioWebVolly(ActivityVolleyAlumno.this);
    }

    private void cargarComponentes() {
        cajaId = findViewById(R.id.txtIdAlumnoVolly);
        cajaNombre = findViewById(R.id.txtNombreAlumnoVolly);
        cajaDireccion = findViewById(R.id.txtDireccionAlumnoVolly);
        datos = findViewById(R.id.lblDatosAlumnoVolly);
        botonGuardar = findViewById(R.id.btnInstertarAlumnoVolly);
        botonBuscarTodos = findViewById(R.id.btnBuscarTodosAlumnosVolly);
        recyclerViewAlumno = findViewById(R.id.recyclerAlumnoVolly);
    }

    public void onClick(View v){
        switch (v.getId()){
            case R.id.btnInstertarAlumnoVolly:
                Alumno alumno = new Alumno();
                alumno.setIdAlumno(cajaId.getText().toString());
                alumno.setNombre(cajaNombre.getText().toString());
                alumno.setDireccion(cajaDireccion.getText().toString());
                try{
                    boolean estado = servicio.insertar(alumno);
                    if (estado)
                        Toast.makeText(ActivityVolleyAlumno.this, "Alumno Registrado", Toast.LENGTH_SHORT).show();
                    else
                        Toast.makeText(ActivityVolleyAlumno.this, "Alumno no Registrado", Toast.LENGTH_SHORT).show();
                    break;
                }catch (JSONException e){
                    e.printStackTrace();
                }
        }
    }
}