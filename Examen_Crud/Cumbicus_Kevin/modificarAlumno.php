<?php
	include("database.php");
	if (isset($_POST["id"])) {
		$id = $_POST["id"];
		$nombres = $_POST["nombres"];
    	$telefono = $_POST["telefono"];
    	$direccion = $_POST["direccion"];    
		$query = "UPDATE alumno SET nombres = '$nombres', telefono = '$telefono', direccion = '$direccion' WHERE id = '$id'";
		$result = mysqli_query($conexion, $query);

		if (!$result) {
			die("Fallo consulta Editar");
		}
		echo "Persona Modificada correctamente";
	}
?>