from django.shortcuts import render, redirect
from apps.modelo.models import Estudiante, Carrera
from django.contrib.auth.models import Group, User
from django.contrib.auth.decorators import login_required
from .forms import FormularioEstudiante, FormularioCarrera
from django.db.models import Q

@login_required
def index(request):
    usuario = request.user
    if usuario.groups.filter(name = "gestion_administrativa").exists(): 
        listaCarreras = Carrera.objects.all()
        busqueda = request.POST.get("busqueda") #busqueda por filtros
        if busqueda:
            listaCarreras = Carrera.objects.filter(
                Q(nombre__icontains = busqueda) |
                Q(codigo__icontains = busqueda)
            ).distinct()
        #manejo del ORM 
        return render (request, 'carreras/index.html', locals())
    else:
        return render(request, 'login/forbidden.html', locals())

@login_required
def crearCarrera(request):
    formulario_carrera = FormularioCarrera(request.POST)
    if request.method == 'POST':
        if formulario_carrera.is_valid():
            carrera = Carrera()
            datos_carrera = formulario_carrera.cleaned_data
            carrera.codigo = datos_carrera.get("codigo")
            carrera.nombre = datos_carrera.get("nombre")
            carrera.duracion = datos_carrera.get("duracion")
            carrera.save()
            return redirect(index)
    return render(request, 'carreras/crearCarreras.html', locals())

@login_required
def modificarCarrera(request, codigo):
    carrera = Carrera.objects.get(codigo=codigo)
    if request.method == 'GET':
        formulario_carrera_editar = FormularioCarrera(instance=carrera)
    else:
        formulario_carrera_editar = FormularioCarrera(
            request.POST, instance=carrera)
        if formulario_carrera_editar.is_valid():
            formulario_carrera_editar.save()
        return redirect(index)
    return render(request, 'carreras/modificarCarrera.html', locals())

@login_required
def eliminarCarrera(request, codigo):
    carrera = Carrera.objects.get(codigo=codigo)
    if request.method == 'POST':
        carrera.delete()
        return redirect(index)
    return render(request, 'carreras/eliminarCarrera.html', locals())

@login_required
def listarEstudiantes(request, codigo):
    carrera = Carrera.objects.get(codigo = codigo)
    estudiantes = Estudiante.objects.filter(carrera = carrera)
    return render(request, 'estudiantes/index.html', locals())

@login_required
def crearEstudiante(request, codigo):
    formulario_estudiante = FormularioEstudiante(request.POST)
    carrera = Carrera.objects.get(codigo = codigo)
    if request.method == 'POST':
        if formulario_estudiante.is_valid():
            estudiante = Estudiante()
            datos_estudiante = formulario_estudiante.cleaned_data
            estudiante.dni = datos_estudiante.get('dni')
            estudiante.apellidos = datos_estudiante.get('apellidos')
            estudiante.nombres = datos_estudiante.get('nombres')
            estudiante.fechaNacimiento = datos_estudiante.get('fechaNacimiento')
            estudiante.genero = datos_estudiante.get('genero')
            estudiante.carrera = carrera
            estudiante.vigencia = datos_estudiante.get('vigencia')
            estudiante.save()

            return redirect(index)
    return render(request, 'estudiantes/crearEstudiantes.html', locals())

@login_required
def modificarEstudiante(request, dni):
    estudiante = Estudiante.objects.get(dni=dni)
    if request.method == 'GET':
        formulario_estudiante_editar = FormularioEstudiante(instance=estudiante)
    else:
        formulario_estudiante_editar = FormularioEstudiante(
            request.POST, instance=estudiante)
        if formulario_estudiante_editar.is_valid():
            formulario_estudiante_editar.save()
        return redirect(index)
    return render(request, 'estudiantes/modificarEstudiantes.html', locals())

@login_required
def eliminarEstudiante(request, dni):
    estudiante = Estudiante.objects.get(dni=dni)
    if request.method == 'POST':
        estudiante.delete()
        return redirect(index)
    return render(request, 'estudiantes/eliminarEstudiantes.html', locals())


