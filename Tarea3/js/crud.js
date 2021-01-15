$(document).ready(function() {
    let modificarPersona = false;
    obetenerPersonas(); 

    function obetenerPersonas() {
        $.ajax({
            type: "GET",
            url: "listarPersonas.php",
            success: function (response) {
                const people = JSON.parse(response);
                let template = '';
                people.forEach(persona => {
                    template += `
                    <tr personaId="${persona.id}">
                        <td>${persona.name}</td>
                        <td>${persona.last_name}</td>
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
            name: $("#name").val(),
            last_name: $("#last_name").val(),
            id: $("#personaId").val()
        };

        let url = modificarPersona === false ? "crearPersona.php" : "modificarPersona.php";
        $.post(url, datos, function (response) {
            console.log(response);
            obetenerPersonas();
            $("#task-form").trigger("reset");
        });
        e.preventDefault();
    });
    

    //método modificar
    $(document).on('click', '.task-update', (e)=>{
        const element = $(this)[0].activeElement.parentElement.parentElement;
        const id = $(element).attr('personaId');
        console.log(id);
        $.post('getPersonas.php', { id }, (response) => {
            console.log(response);
            const persona = JSON.parse(response);
            $('#name').val(persona.name);
            $('#last_name').val(persona.last_name);
            $('#personaId').val(persona.id);
            modificarPersona = true;
        });
        e.preventDefault();
    });

    //Metodo de eliminar
    $(document).on('click', '.task-delete', (e)=>{
		if(confirm('Desea eliminar el registro')){
			const element = $(this)[0].activeElement.parentElement.parentElement;
			const id = $(element).attr('personaId');
			$.post('eliminarPersona.php',{ id },(response)=>{
                obetenerPersonas();
			});
        }
        e.preventDefault();
    });
    
    //Metodo de Buscar
    $('#search').keyup(function(){
		if($('#search').val()){
			let search = $('#search').val();
			$.ajax({
				url: 'buscarPersona.php',
				type: 'POST',
				data: {search},
				success: function(response){
					let people = JSON.parse(response);
					let template = '';
					people.forEach(persona =>{
						template += `<li>${persona.name}</li>`;
					});
					$('#container').html(template);
				}
			});
		}
    });
});
