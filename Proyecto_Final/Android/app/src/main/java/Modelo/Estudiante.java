package Modelo;

import com.google.gson.annotations.SerializedName;

public class Estudiante {

    private String dni;
    private String apellidos;
    private String nombres;
    private String fechaNacimiento;
    private String genero;
    private String vigencia;
    private String carrera_id;

    public Estudiante(){}

    public Estudiante(String dni, String apellidos, String nombres, String fechaNacimiento, String genero, String vigencia, String carrera_id) {
        this.dni = dni;
        this.apellidos = apellidos;
        this.nombres = nombres;
        this.fechaNacimiento = fechaNacimiento;
        this.genero = genero;
        this.vigencia = vigencia;
        this.carrera_id = carrera_id;
    }

    public String getDni() {
        return dni;
    }

    public void setDni(String dni) {
        this.dni = dni;
    }

    public String getApellidos() {
        return apellidos;
    }

    public void setApellidos(String apellidos) {
        this.apellidos = apellidos;
    }

    public String getNombres() {
        return nombres;
    }

    public void setNombres(String nombres) {
        this.nombres = nombres;
    }

    public String getFechaNacimiento() {
        return fechaNacimiento;
    }

    public void setFechaNacimiento(String fechaNacimiento) {
        this.fechaNacimiento = fechaNacimiento;
    }

    public String getGenero() {
        return genero;
    }

    public void setGenero(String genero) {
        this.genero = genero;
    }

    public String getVigencia() {
        return vigencia;
    }

    public void setVigencia(String vigencia) {
        this.vigencia = vigencia;
    }

    public String getCarrera_id() {
        return carrera_id;
    }

    public void setCarrera_id(String carrera_id) {
        this.carrera_id = carrera_id;
    }
}