<?php 
namespace App\Models;
use Illuminate\Database\Eloquent\Model;

class Transaccion extends Model
{
    protected $table = 'modelo_transaccion';
    protected $fillable = ['fecha', 'tipo', 'valor',  'descripcion', 'updated_at', 'cuenta_id'];
    public $timestamps = false; //no se guarda los valores del created_at y update_at
    //public $timestamps = true;
    protected $hidden = [
        "transaccion_id"      
    ];
}
