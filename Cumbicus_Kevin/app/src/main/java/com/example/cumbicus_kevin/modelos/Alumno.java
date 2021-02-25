package com.example.cumbicus_kevin.modelos;

public class Alumno {
    private String idAlumno;
    private String nombre;
    private String direccion;

    public Alumno (){}

    public Alumno(String idAlumno, String nombre, String direccion){
        this.idAlumno = idAlumno;
        this.nombre = nombre;
        this.direccion = direccion;
    }


    public String getIdAlumno() {
        return idAlumno;
    }

    public void setIdAlumno(String idAlumno) {
        this.idAlumno = idAlumno;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getDireccion() {
        return direccion;
    }

    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }
}
