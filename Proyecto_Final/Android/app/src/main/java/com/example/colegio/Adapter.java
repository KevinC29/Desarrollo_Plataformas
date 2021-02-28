package com.example.colegio;

import android.content.Context;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.TextView;

import androidx.annotation.NonNull;
import androidx.recyclerview.widget.RecyclerView;

import java.util.List;

import Modelo.Estudiante;

public class Adapter extends RecyclerView.Adapter<Adapter.ViewHolder> {

    LayoutInflater inflater;
    List<Estudiante> estudiantes;

    public Adapter(Context ctx, List<Estudiante> estudiantes){
        this.inflater = LayoutInflater.from(ctx);
        this.estudiantes = estudiantes;
    }



    public class ViewHolder extends RecyclerView.ViewHolder{
        TextView cedula, apellidos, nombres, genero;


        public ViewHolder(View itemView){
            super(itemView);
            cedula = itemView.findViewById(R.id.txtID);
            nombres = itemView.findViewById(R.id.txtNombres);
            apellidos = itemView.findViewById(R.id.txtApellidos);
            genero = itemView.findViewById(R.id.txtGenero);
        }
    }

    @NonNull
    @Override
    public Adapter.ViewHolder onCreateViewHolder(@NonNull ViewGroup parent, int viewType) {
        View view = inflater.inflate(R.layout.custom_layout_list, parent, false);
        return new ViewHolder(view);
    }

    @Override
    public void onBindViewHolder(@NonNull Adapter.ViewHolder holder, int position) {
        holder.cedula.setText(estudiantes.get(position).getDni());
        holder.apellidos.setText(estudiantes.get(position).getApellidos());
        holder.nombres.setText(estudiantes.get(position).getNombres());
        holder.genero.setText(estudiantes.get(position).getGenero());
    }

    @Override
    public int getItemCount() {

        return estudiantes.size();
    }
}
