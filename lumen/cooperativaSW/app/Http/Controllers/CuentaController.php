<?php
namespace App\Http\Controllers;
use App\Models\Cuenta;
use Illuminate\Http\Request;
use App\Http\Helper\ResponseBuilder;
use DB;

class CuentaController extends Controller
{
    
    public function __construct()
    {
        //
    }

    public function allSinRestricciones(Request $request)
    {
        $cuenta = Cuenta::all();
        $status = true;
        $info = 'Cuenta List';

        return ResponseBuilder::result($status, $info, $cuenta);
    }
    
    public function allJson(Request $request){
        if($request->isJson()){
            $cuenta = Cuenta::all();
            $status = true;
            $info = "Cuentas List";
            return ResponseBuilder::result($status,$info,$cuenta);
        }
        $status = false;
        $info = "Anauthorized";
        //return ResponseBuilder::result($status,$info);
        return response()->json(['error'=>'Unauthorized'],401,[]);

    }

    public function getCuenta(Request $request, $numero){
        if($request->isJson()){
            $cuenta = Cuenta::where('numero', $numero)->first();
            if(!empty($cuenta)){ //que no este vacio
               $status = true;
               $info = "Cuenta in here" ;
               return ResponseBuilder::result($status,$info,$cuenta);
            }else{
               $status = false;
               $info = "Cuenta doesn't exist" ;
               return ResponseBuilder::result($status,$info);
            }
        }
        $status = false;
        $info = "Error: Anauthorized";
        return ResponseBuilder::result($status,$info);
    }

    public function create(Request $request)
    {
        if ($request->isJson()) {
            $data = $request->json()->all();
            $cuenta = Cuenta::create([
                'numero' => $data['numero'],
                'fechaApertura' => $data['fechaApertura'],
                'tipoCuenta' => $data['tipoCuenta'],
                'saldo' => $data['saldo'],
                "estado" => $data['estado'],
                "date_created" => $data['date_created'],
                "cliente_id" => $data['cliente_id'],
            ]);
            $status = true;
            $info = "Cuenta creada con exito";
            return ResponseBuilder::result($status, $info);
        }
        return response()->json(['error' => 'Unauthorized'], 401, []);
    }


}
