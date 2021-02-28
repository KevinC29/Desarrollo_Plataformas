<?php
namespace App\Http\Controllers;
use App\Models\Curso;
use Illuminate\Http\Request;
use App\Http\Helper\ResponseBuilder;
use DB;



class CursoController extends Controller
{
    
    public function __construct()
    {
        //
    }

    public function allSinRestricciones(Request $request)
    {
        //cliente = Cliente.objects.all();
        $curso = Curso::all();
        $status = true;
        $info = 'Curso List';

        return ResponseBuilder::result($status, $info, $curso);
    }
    
    public function allJson(Request $request){
        if($request->isJson()){
            $curso = Curso::all();
            //$status = true;
            //$info = "Curso List";
            return ResponseBuilder::result($curso);
        }
        $status = false;
        $info = "Anauthorized";
        //return ResponseBuilder::result($status,$info);
        return response()->json(['error'=>'Unauthorized'],401,[]);

    }

    public function getCurso(Request $request, $codigo){
        if($request->isJson()){
            $curso = Curso::where('codigo', $codigo)->first();
            if(!empty($curso)){ //que no este vacio
               $status = true;
               $info = "Curso in here" ;
               return ResponseBuilder::result($status,$info,$curso);
            }else{
               $status = false;
               $info = "Curso doesn't exist" ;
               return ResponseBuilder::result($status,$info);
            }
        }
        $status = false;
        $info = "Error: Anauthorized";
        return ResponseBuilder::result($status,$info);
    }

    public function createCurso(Request $request)
    {
        if ($request->isJson()) {
            $data = $request->json()->all();
            $curso = Curso::create([
                'codigo' => $data['codigo'],
                'nombre' => $data['nombre'],
                'creditos' => $data['creditos'],
                'docente' => $data['docente'],
            ]);
            $status = true;
            $info = "Curso creado con exito";
            return ResponseBuilder::result($status, $info);
        }
        return response()->json(['error' => 'Unauthorized'], 401, []);
    }


}
