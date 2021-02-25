<?php 
namespace App\Models;
use Illuminate\Database\Eloquent\Model;

class Cuenta extends Model
{
    protected $table = 'modelo_cuenta';
    protected $fillable = ['cedula', 'nombres', 'apellidos',  'genero', 'estadoCivil', 'correo', 'telefono', 'celular', 'direccion', 'date_created'];
    public $timestamps = false; //no se guarda los valores del created_at y update_at
    //public $timestamps = true;
    protected $hidden = [
        "cuenta_id"      
    ];
}
