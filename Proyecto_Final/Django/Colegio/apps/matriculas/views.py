from django.shortcuts import render, redirect
from apps.modelo.models import Matricula, Curso, Estudiante
from django.contrib.auth.models import Group, User
from django.contrib.auth.decorators import login_required
from .forms import FormularioEstudiante, FormularioMatricula, FormularioCurso
from django.db.models import Q


@login_required
def index(request):
    usuario = request.user
    if usuario.groups.filter(name = "gestion_matriculas").exists(): 
        listaCursos = Curso.objects.all()   
        busqueda = request.POST.get("busqueda") #busqueda por filtros
        if busqueda:
            listaCursos = Curso.objects.filter(
                Q(nombre__icontains = busqueda) |
                Q(codigo__icontains = busqueda)
            ).distinct()
        #manejo del ORM 
        return render (request, 'cursos/index.html', locals())
    else:
        return render(request, 'login/forbidden.html', locals())


@login_required
def crearCurso(request):
    formulario_curso = FormularioCurso(request.POST)
    if request.method == 'POST':
        if formulario_curso.is_valid():
            curso = Curso()
            datos_curso = formulario_curso.cleaned_data
            curso.codigo = datos_curso.get("codigo")
            curso.nombre = datos_curso.get("nombre")
            curso.creditos = datos_curso.get("creditos")
            curso.docente = datos_curso.get("docente")
            curso.save()
            return redirect(index)
    return render(request, 'cursos/crearCursos.html', locals())

@login_required
def modificarCurso(request, codigo):
    curso = Curso.objects.get(codigo=codigo)
    if request.method == 'GET':
        formulario_curso_editar = FormularioCurso(instance=curso)
    else:
        formulario_curso_editar = FormularioCurso(
            request.POST, instance=curso)
        if formulario_curso_editar.is_valid():
            formulario_curso_editar.save()
        return redirect(index)
    return render(request, 'cursos/modificarCurso.html', locals())

@login_required
def eliminarCurso(request, codigo):
    curso = Curso.objects.get(codigo=codigo)
    if request.method == 'POST':
        curso.delete()
        return redirect(index)
    return render(request, 'cursos/eliminarCurso.html', locals())

@login_required
def listarMatriculas(request, codigo):
    curso = Curso.objects.get(codigo = codigo)
    matriculas = Matricula.objects.filter(curso = curso)
    return render(request, 'matriculas/index.html', locals())

@login_required
def crearMatricula(request, codigo):
    formulario_matricula = FormularioMatricula(request.POST)
    #estudiante = Estudiante.objects.get(dni = dni)
    curso = Curso.objects.get(codigo = codigo)
    if request.method == 'POST':
        if formulario_matricula.is_valid():
            matricula = Matricula()
            datos_matricula = formulario_matricula.cleaned_data
            matricula.estudiante = datos_matricula.get("estudiante")
            matricula.curso = curso
            matricula.save()

            return redirect(index)
    return render(request, 'matriculas/crearMatriculas.html', locals())

@login_required
def modificarMatricula(request, dni):
    estudiante = Estudiante.objects.get(dni = dni)
    matricula = Matricula.objects.get(estudiante= estudiante)
    if request.method == 'GET':
        formulario_matricula_editar = FormularioMatricula(instance=matricula)
    else:
        formulario_matricula_editar = FormularioMatricula(
            request.POST, instance=matricula)
        if formulario_matricula_editar.is_valid():
            formulario_matricula_editar.save()
        return redirect(index)
    return render(request, 'matriculas/modificarMatriculas.html', locals())

@login_required
def eliminarMatricula(request, dni):
    estudiante = Estudiante.objects.get(dni=dni)
    matricula = Matricula.objects.get(estudiante=estudiante)
    if request.method == 'POST':
        matricula.delete()
        return redirect(index)
    return render(request, 'matriculas/eliminarMatriculas.html', locals())

