<?php
namespace App\Http\Controllers;
use App\Models\Estudiante;
use Illuminate\Http\Request;
use App\Http\Helper\ResponseBuilder;
use DB;



class EstudianteController extends Controller
{
    
    public function __construct()
    {
        //
    }

    public function allSinRestricciones(Request $request)
    {
        //cliente = Cliente.objects.all();
        $estudiante = Estudiante::all();
        $status = true;
        $info = 'Estudiante List';

        return ResponseBuilder::result($status, $info, $estudiante);
    }
    
    public function allJson(Request $request){
        if($request->isJson()){
            $estudiante = Estudiante::all();
            $status = true;
            $info = "Estudiante List";
            return ResponseBuilder::result($status,$info,$estudiante);
        }
        $status = false;
        $info = "Anauthorized";
        //return ResponseBuilder::result($status,$info);
        return response()->json(['error'=>'Unauthorized'],401,[]);

    }

    public function getEstudiante(Request $request, $dni){
        if($request->isJson()){
            $estudiante = Estudiante::where('dni', $dni)->first();
            if(!empty($estudiante)){ //que no este vacio
               $status = true;
               $info = "Estudiante in here" ;
               return ResponseBuilder::result($status,$info,$estudiante);
            }else{
               $status = false;
               $info = "Estudiante doesn't exist" ;
               return ResponseBuilder::result($status,$info);
            }
        }
        $status = false;
        $info = "Error: Anauthorized";
        return ResponseBuilder::result($status,$info);
    }

    public function createEstudiante(Request $request)
    {
        if ($request->isJson()) {
            $data = $request->json()->all();
            $estudiante = Estudiante::create([
                'dni' => $data['dni'],
                'apellidos' => $data['apellidos'],
                'nombres' => $data['nombres'],
                'fechaNacimiento' => $data['fechaNacimiento'],
                'genero' => $data['genero'],
                'vigencia' => $data['vigencia'],
                "carrera_id" => $data['carrera_id'],
            ]);
            $status = true;
            $info = "Estudiante creado con exito";
            return ResponseBuilder::result($status, $info);
        }
        return response()->json(['error' => 'Unauthorized'], 401, []);
    }


}
