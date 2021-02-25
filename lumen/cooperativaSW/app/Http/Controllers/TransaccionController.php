<?php
namespace App\Http\Controllers;
use App\Models\Transaccion;
use Illuminate\Http\Request;
use App\Http\Helper\ResponseBuilder;
use DB;

class TransaccionController extends Controller
{
    
    public function __construct()
    {
        //
    }

    public function allSinRestricciones(Request $request)
    {
        $transaccion = Transaccion::all();
        $status = true;
        $info = 'Transaccion List';

        return ResponseBuilder::result($status, $info, $transaccion);
    }
    
    public function allJson(Request $request){
        if($request->isJson()){
            $transaccion = Transaccion::all();
            $status = true;
            $info = "Transacciones List";
            return ResponseBuilder::result($status,$info,$transaccion);
        }
        $status = false;
        $info = "Anauthorized";
        //return ResponseBuilder::result($status,$info);
        return response()->json(['error'=>'Unauthorized'],401,[]);

    }

    public function getTransaccion(Request $request, $tipo){
        if($request->isJson()){
            $transaccion = Transaccion::where('tipo', $tipo)->first();
            if(!empty($transaccion)){ //que no este vacio
               $status = true;
               $info = "Transaccion in here" ;
               return ResponseBuilder::result($status,$info,$transaccion);
            }else{
               $status = false;
               $info = "Transaccion doesn't exist" ;
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
            $transaccion = Transaccion::create([
                'fecha' => $data['fecha'],
                'tipo' => $data['tipo'],
                'valor' => $data['valor'],
                'descripcion' => $data['descripcion'],
                "updated_at" => $data['updated_at'],
                "cuenta_id" => $data['cuenta_id'],
            ]);
            $status = true;
            $info = "Transaccion creada con exito";
            return ResponseBuilder::result($status, $info);
        }
        return response()->json(['error' => 'Unauthorized'], 401, []);
    }


}
