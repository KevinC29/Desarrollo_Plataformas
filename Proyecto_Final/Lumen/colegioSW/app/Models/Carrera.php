<?php 
namespace App\Models;
use Illuminate\Database\Eloquent\Model;

class Carrera extends Model
{
    protected $table = 'modelo_carrera';
    protected $fillable = ['codigo', 'nombre', 'duracion'];
    public $timestamps = false; 

    protected $hidden = [
        "carrera_id"        
    ];
}
