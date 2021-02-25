<?php
namespace App\Http\Controllers;
use App\Models\Carrera;
use Illuminate\Http\Request;
use App\Http\Helper\ResponseBuilder;
use DB;



class CarreraController extends Controller
{
    
    public function __construct()
    {
        //
    }

    public function allSinRestricciones(Request $request)
    {
        //cliente = Cliente.objects.all();
        $carrera = Carrera::all();
        $status = true;
        $info = 'Carrera List';

        return ResponseBuilder::result($status, $info, $carrera);
    }
    
    public function allJson(Request $request){
        if($request->isJson()){
            $carrera = Carrera::all();
            $status = true;
            $info = "Carrera List";
            return ResponseBuilder::result($status,$info,$carrera);
        }
        $status = false;
        $info = "Anauthorized";
        //return ResponseBuilder::result($status,$info);
        return response()->json(['error'=>'Unauthorized'],401,[]);

    }

    public function getCarrera(Request $request, $codigo){
        if($request->isJson()){
            $carrera = Carrera::where('codigo', $codigo)->first();
            if(!empty($carrera)){ //que no este vacio
               $status = true;
               $info = "Carrera in here" ;
               return ResponseBuilder::result($status,$info,$carrera);
            }else{
               $status = false;
               $info = "Carrera doesn't exist" ;
               return ResponseBuilder::result($status,$info);
            }
        }
        $status = false;
        $info = "Error: Anauthorized";
        return ResponseBuilder::result($status,$info);
    }

    public function createCarrera(Request $request)
    {
        if ($request->isJson()) {
            $data = $request->json()->all();
            $carrera = Carrera::create([
                'codigo' => $data['codigo'],
                'nombre' => $data['nombre'],
                'duracion' => $data['duracion'],
            ]);
            $status = true;
            $info = "Carrera creado con exito";
            return ResponseBuilder::result($status, $info);
        }
        return response()->json(['error' => 'Unauthorized'], 401, []);
    }


}
