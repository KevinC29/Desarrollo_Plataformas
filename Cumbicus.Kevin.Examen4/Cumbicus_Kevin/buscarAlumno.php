<?php
    include('database.php');
	if (isset($_POST['search'])) {
		$search = $_POST['search'];
		$query = "SELECT * FROM alumno WHERE nombres LIKE '$search%'";
        $resultado = mysqli_query($conexion, $query);    
		if(!$resultado){
			die('sentencia ha fallado');
		}
    }
    
    $json = array();
    while ($row = mysqli_fetch_array($resultado)) {
        $json[] = array(
            "nombres" => $row["nombres"],
            "telefono" => $row["telefono"],
            "direccion" => $row["direccion"],
            "id" => $row["id"]
        );
    }
    $jsonstring = json_encode($json);
    echo $jsonstring;
?>