<?php
include("database.php");

if (isset($_POST["name"])) {
    $name = $_POST["name"];
    $last_name = $_POST["last_name"];    
    $query = "INSERT INTO persona(name, last_name) VALUES ('$name', '$last_name')";
    $result = mysqli_query($conexion, $query);
    if (!$result) {
        die("La consulta de Crear ha fallado");
        echo "fallo al crear";
    }
    echo "Se registro correctamente";
    }
?>