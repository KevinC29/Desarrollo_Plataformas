function saludar(){
    alert("Hola mi primer script");
}

function sumar(){
    numero1 = parseInt(document.getElementById("n1").value);
    numero2 = parseInt(document.getElementById("n2").value);
    resultado = numero1+numero2;
    alert("La suma es: " + resultado);
}

function invertir(){
    var cadernaObtenida = document.getElementById("cadena").innerText;
    var vector = cadenaObtenida.split(''); // arreglo de caracteres
    var reverso = vector.reverse(); //invertir el arreglo
    var cadenaInvertida = reverso.join(''); // une el arreglo en una sola cadena
    document.write(cadenaInvertida);
}

function validarFormulario(){
    var nombres = document.getElementById("nombres").value;
    if(nombres==""){
        alert("Por favor digite los nombres");
    }
}