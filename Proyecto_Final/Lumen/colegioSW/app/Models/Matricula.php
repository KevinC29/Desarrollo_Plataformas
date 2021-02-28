<?php 
namespace App\Models;
use Illuminate\Database\Eloquent\Model;

class Matricula extends Model
{
    protected $table = 'modelo_matricula';
    protected $fillable = ['fechaMatricula', 'curso_id', 'estudiante_id'];
    public $timestamps = false; 

    protected $hidden = [
        "matricula_id"        
    ];
}
