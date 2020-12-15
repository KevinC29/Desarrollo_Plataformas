<?php
	include("database.php");
	if (isset($_POST["id"])) {
		$id = $_POST["id"];
		$name = $_POST["name"];
		$description = $_POST["description"];    
		$query = "UPDATE task SET name = '$name', description = '$description' WHERE id = '$id'";
		$result = mysqli_query($conexion, $query);

		if (!$result) {
			die("Fallo consulta Editar");
		}
		echo "Tarea actualizada correctamente";
	}
?>