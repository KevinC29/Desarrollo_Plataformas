<?php
    include('database.php');
	if (isset($_POST['search'])) {
		$search = $_POST['search'];
		$query = "SELECT * FROM persona WHERE name LIKE '$search%'";
        $resultado = mysqli_query($conexion, $query);    
		if(!$resultado){
			die('sentencia ha fallado');
		}
    }
    
    $json = array();
    while ($row = mysqli_fetch_array($resultado)) {
        $json[] = array(
            "name" => $row["name"],
            "last_name" => $row["last_name"],
            "id" => $row["id"]
        );
    }
    $jsonstring = json_encode($json);
    echo $jsonstring;
?>