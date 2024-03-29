<?php 
namespace App\Models;
use Illuminate\Database\Eloquent\Model;

class Cuenta extends Model
{
    protected $table = 'modelo_cuenta';
    protected $fillable = ['numero', 'fechaApertura', 'tipoCuenta',  'saldo', 'estado', 'date_created','cliente_id'];
    public $timestamps = false; //no se guarda los valores del created_at y update_at
    //public $timestamps = true;
    protected $hidden = [
        "cuenta_id"      
    ];
}
