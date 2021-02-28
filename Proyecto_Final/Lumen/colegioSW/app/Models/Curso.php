<?php 
namespace App\Models;
use Illuminate\Database\Eloquent\Model;

class Curso extends Model
{
    protected $table = 'modelo_curso';
    protected $fillable = ['codigo', 'nombre', 'creditos', 'docente'];
    public $timestamps = false; 

    protected $hidden = [
        "curso_id"        
    ];
}
