$(document).ready(function () {
    let modificarAlumno = false;
    obetenerAlumnos();

    function obetenerAlumnos() {
        $.ajax({
            type: "GET",
            url: "listarAlumno.php",
            success: function (response) {
                const people = JSON.parse(response);
                let template = '';
                people.forEach(alumno => {
                    template += `
                    <tr personaId="${alumno.id}">
                        <td>${alumno.id}</td>
                        <td>${alumno.nombres}</td>
                        <td>${alumno.telefono}</td>
                        <td>${alumno.direccion}</td>
                        <td><button class="task-update btn btn-primary my-2 my-sm-0" type="submit" data-toggle="modal" data-target="#crear_Persona">Editar</button></td>
                        <td><button class="task-delete btn btn-danger">Eliminar</button></td>
                    </tr>`
                });
                $("#people").html(template);
            }
        });
    }

    //Crear Persona
    $("#task-form").submit(function (e) {
        const datos = {
            nombres: $("#nombres").val(),
            telefono: $("#telefono").val(),
            direccion: $("#direccion").val(),
            id: $("#personaId").val()
        };

        let url = modificarAlumno === false ? "crearAlumno.php" : "modificarAlumno.php";
        $.post(url, datos, function (response) {
            console.log(response);
            obetenerPersonas();
            $("#task-form").trigger("reset");
        });
    });


    //método modificar
    $(document).on('click', '.task-update', (e) => {
        const element = $(this)[0].activeElement.parentElement.parentElement;
        const id = $(element).attr('personaId');
        console.log(id);
        $.post('getAlumno.php', { id }, (response) => {
            console.log(response);
            const alumno = JSON.parse(response);
            $('#nombres').val(alumno.nombres);
            $('#telefono').val(alumno.telefono);
            $('#direccion').val(alumno.direccion);
            $('#personaId').val(alumno.id);
            modificarAlumno = true;
        });
        e.preventDefault();
    });

    //Metodo de eliminar
    $(document).on('click', '.task-delete', (e) => {
        if (confirm('Desea eliminar el registro')) {
            const element = $(this)[0].activeElement.parentElement.parentElement;
            const id = $(element).attr('personaId');
            $.post('eliminarAlumno.php', { id }, (response) => {
                obetenerPersonas();
            });
        }
    });

    //Metodo de Buscar
    $('#search').keyup(function(){
		if($('#search').val()){
			let search = $('#search').val();
			$.ajax({
				url: 'buscarAlumno.php',
				type: 'POST',
				data: {search},
				success: function(response){
					let people = JSON.parse(response);
					let template = '';
					people.forEach(persona =>{
                        template += `<li>${persona.nombres}</li>
                        <li>${persona.telefono}</li>
                        <li>${persona.direccion}</li>`;
                    });
					$('#container').html(template);
				}
			});
		}
    });
});
