<?php
	include("database.php");
	if (isset($_POST["id"])) {
		$id = $_POST["id"];
		$name = $_POST["name"];
		$last_name = $_POST["last_name"];    
		$query = "UPDATE persona SET name = '$name', last_name = '$last_name' WHERE id = '$id'";
		$result = mysqli_query($conexion, $query);

		if (!$result) {
			die("Fallo consulta Editar");
		}
		echo "Persona Modificada correctamente";
	}
?>