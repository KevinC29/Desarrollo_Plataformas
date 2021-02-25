<?php

/** @var \Laravel\Lumen\Routing\Router $router */


$router->get('/', function () use ($router) {
    return $router->app->version();
});
/*
$router->group(["prefix" => "cliente"], function ($router) {
    $router->get("all", "ClienteController@allSinRestricciones");    
    $router->get("allJson", "ClienteController@allJson");
    $router->get("get/{cedula}", "ClienteController@getCliente");
    $router->post('new', 'ClienteController@create');
});*/

$router->group(['middleware' => 'auth'], function() use ($router){
    $router->group(['prefix' => 'cliente'], function($router){
        $router->get("all", "ClienteController@allSinRestricciones");    
        $router->get("allJson", "ClienteController@allJson");
        $router->get("get/{cedula}", "ClienteController@getCliente");
        $router->post('new', 'ClienteController@create');
    });
    $router->group(['prefix' => 'cuenta'], function($router){
        $router->get("all", "CuentaController@allSinRestricciones");    
        $router->get("allJson", "CuentaController@allJson");
        $router->get("get/{numero}", "CuentaController@getCuenta");
        $router->post('new', 'CuentaController@create');
    });
    $router->group(['prefix' => 'transaccion'], function($router){
        $router->get("all", "TransaccionController@allSinRestricciones");    
        $router->get("allJson", "TransaccionController@allJson");
        $router->get("get/{tipo}", "TransaccionController@getTransaccion");
        $router->post('new', 'TransaccionController@create');
    });
});
$router->group(['prefix' => 'usuario'], function($router){
    $router->post('ingresar', 'UserController@login'); 
    $router->post('salir', 'UserController@logout'); 
});

/*
    $router->group(['middleware' => 'auth'], function() use ($router){
        $router->group(['prefix' => 'cliente'], function($router){
            $router->post('new', 'ClienteController@create');
        });
    });
*/

