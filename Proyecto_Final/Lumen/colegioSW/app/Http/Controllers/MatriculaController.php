<?php
namespace App\Http\Controllers;
use App\Models\Matricula;
use Illuminate\Http\Request;
use App\Http\Helper\ResponseBuilder;
use DB;



class MatriculaController extends Controller
{
    
    public function __construct()
    {
        //
    }

    public function allSinRestricciones(Request $request)
    {
        //cliente = Cliente.objects.all();
        $matricula = Matricula::all();
        $status = true;
        $info = 'Matricula List';

        return ResponseBuilder::result($status, $info, $matricula);
    }
    
    public function allJson(Request $request){
        if($request->isJson()){
            $matricula = Matricula::all();
            $status = true;
            $info = "Matricula List";
            return ResponseBuilder::result($status,$info,$matricula);
        }
        $status = false;
        $info = "Anauthorized";
        //return ResponseBuilder::result($status,$info);
        return response()->json(['error'=>'Unauthorized'],401,[]);

    }

    public function getMatricula(Request $request, $curso_id){
        if($request->isJson()){
            $matricula = Matricula::where('curso_id', $curso_id)->first();
            if(!empty($matricula)){ //que no este vacio
               $status = true;
               $info = "Matricula in here" ;
               return ResponseBuilder::result($status,$info,$matricula);
            }else{
               $status = false;
               $info = "Matricula doesn't exist" ;
               return ResponseBuilder::result($status,$info);
            }
        }
        $status = false;
        $info = "Error: Anauthorized";
        return ResponseBuilder::result($status,$info);
    }

    public function createMatricula(Request $request)
    {
        if ($request->isJson()) {
            $data = $request->json()->all();
            $matricula = Matricula::create([
                'fechaMatricula' => $data['fechaMatricula'],
                'curso_id' => $data['curso_id'],
                'estudiante_id' => $data['estudiante_id'],
                
            ]);
            $status = true;
            $info = "Matricula creado con exito";
            return ResponseBuilder::result($status, $info);
        }
        return response()->json(['error' => 'Unauthorized'], 401, []);
    }
}
