<?php
include("database.php");

if (isset($_POST["nombres"])) {
    $nombres = $_POST["nombres"];
    $telefono = $_POST["telefono"];
    $direccion = $_POST["direccion"];    
    $query = "INSERT INTO alumno(nombres, telefono, direccion) VALUES ('$nombres', '$telefono', '$direccion')";
    $result = mysqli_query($conexion, $query);
    if (!$result) {
        die("La consulta de Crear ha fallado");
        echo "fallo al crear";
    }
    echo "Se registro correctamente";
    }
?>