<?php

/** @var \Laravel\Lumen\Routing\Router $router */

/*
|--------------------------------------------------------------------------
| Application Routes
|--------------------------------------------------------------------------
|
| Here is where you can register all of the routes for an application.
| It is a breeze. Simply tell Lumen the URIs it should respond to
| and give it the Closure to call when that URI is requested.
|
*/

$router->get('/', function () use ($router) {
    return $router->app->version();
});

//Servicios con Api_Token

/*$router->group(['middleware' => 'auth'], function() use ($router){
    $router->group(['prefix' => 'carrera'], function($router){
        $router->get("all", "CarreraController@allSinRestricciones");    
        $router->get("allJson", "CarreraController@allJson");
        $router->get("get/{codigo}", "CarreraController@getCarrera");
        $router->post('new', 'CarreraController@createCarrera');
    });
    $router->group(['prefix' => 'curso'], function($router){
        $router->get("all", "CursoController@allSinRestricciones");    
        $router->get("allJson", "CursoController@allJson");
        $router->get("get/{codigo}", "CursoController@getCurso");
        $router->post('new', 'CursoController@createCurso');
    });
    $router->group(['prefix' => 'estudiante'], function($router){
        $router->get("all", "EstudianteController@allSinRestricciones");    
        $router->get("allJson", "EstudianteController@allJson");
        $router->get("get/{dni}", "EstudianteController@getEstudiante");
        $router->post('new', 'EstudianteController@createEstudiante');
    });
    $router->group(['prefix' => 'matricula'], function($router){
        $router->get("all", "MatriculaController@allSinRestricciones");    
        $router->get("allJson", "MatriculaController@allJson");
        $router->get("get/{curso_id}", "MatriculaController@getMatricula");
        $router->post('new', 'MatriculaController@createMatricula');
    });
});*/

//Login
$router->group(['prefix' => 'usuario'], function($router){
    $router->post('ingresar', 'UserController@login'); 
    $router->post('salir', 'UserController@logout'); 
});

//Servicios del Proyecto
//$router->group(['prefix' => 'carrera'], function($router){
    $router->get("all", "CarreraController@allSinRestricciones");    
    $router->get("allJson", "CarreraController@allJson");
    $router->get("get/{codigo}", "CarreraController@getCarrera");
    $router->post('new', 'CarreraController@createCarrera');
//});
$router->group(['prefix' => 'curso'], function($router){
    $router->get("all", "CursoController@allSinRestricciones");    
    $router->get("allJson", "CursoController@allJson");
    $router->get("get/{codigo}", "CursoController@getCurso");
    $router->post('new', 'CursoController@createCurso');
});
$router->group(['prefix' => 'estudiante'], function($router){
    $router->get("all", "EstudianteController@allSinRestricciones");    
    $router->get("allJson", "EstudianteController@allJson");
    $router->get("get/{dni}", "EstudianteController@getEstudiante");
    $router->post('new', 'EstudianteController@createEstudiante');
});
$router->group(['prefix' => 'matricula'], function($router){
    $router->get("all", "MatriculaController@allSinRestricciones");    
    $router->get("allJson", "MatriculaController@allJson");
    $router->get("get/{curso_id}", "MatriculaController@getMatricula");
    $router->post('new', 'MatriculaController@createMatricula');
});