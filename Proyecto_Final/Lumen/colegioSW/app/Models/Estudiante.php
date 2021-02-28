<?php 
namespace App\Models;
use Illuminate\Database\Eloquent\Model;

class Estudiante extends Model
{
    protected $table = 'modelo_estudiante';
    protected $fillable = ['dni', 'apellidos', 'nombres',  'fechaNacimiento', 'genero', 'vigencia', 'carrera_id'];
    public $timestamps = false; 

    protected $hidden = [
        "estudiante_id"        
    ];
}
