from django.shortcuts import render, redirect
from apps.modelo.models import Estudiante, Materia
from .forms import FormularioEstudiante, FormularioMateria
from django.db.models import Q

def index(request):
    listaEstudiantes = Estudiante.objects.all()   
    busqueda = request.POST.get("busqueda") #busqueda por filtros
    if busqueda:
        listaEstudiantes = Estudiante.objects.filter(
            Q(nombres__icontains = busqueda) | 
            Q(apellidos__icontains = busqueda) |
            Q(cedula = busqueda)
        ).distinct()
        #manejo del ORM 
    return render (request, 'estudiantes/index.html', locals())
    

def crearEstudiante(request):
    formulario_estudiante = FormularioEstudiante(request.POST)
    formulario_materia = FormularioMateria(request.POST)
    if request.method == 'POST':
        if formulario_estudiante.is_valid():
            estudiante = Estudiante()
            datos_estudiante = formulario_estudiante.cleaned_data
            estudiante.cedula = datos_estudiante.get('cedula')
            estudiante.nombres = datos_estudiante.get('nombres')
            estudiante.apellidos = datos_estudiante.get('apellidos')
            estudiante.genero = datos_estudiante.get('genero')
            estudiante.correo = datos_estudiante.get('correo')
            estudiante.celular = datos_estudiante.get('celular')
            estudiante.direccion = datos_estudiante.get('direccion')
            #ORM
            estudiante.save()

            return redirect(index)
    return render(request, 'estudiantes/crearEstudiantes.html', locals())


def listarMaterias(request, cedula):
    estudiante = Estudiante.objects.get(cedula = cedula)
    materia = Materia.objects.filter(estudiante = estudiante)
    return render(request, 'materias/index.html', locals())

def crearMateria(request, cedula):
    formulario_materia = FormularioMateria(request.POST)
    estudiante = Estudiante.objects.get(cedula = cedula)
    if request.method == 'POST':
        if formulario_materia.is_valid():
            materia = Materia()
            datos_materia = formulario_materia.cleaned_data
            materia.nombreMateria = datos_materia.get("nombreMateria")
            materia.nota1 = datos_materia.get("nota1")
            materia.nota2 = datos_materia.get("nota2")
            materia.nota3 = datos_materia.get("nota3")

            materia.promedio = (materia.nota1 + materia.nota2 + materia.nota3)/3
            if materia.promedio >= 7:
                materia.estado = "Aprobado"
            else:
                materia.estado = "Reprobado"

            materia.estudiante = estudiante
            materia.save()
            return redirect(index)
    return render(request, 'materias/crearMaterias.html', locals())