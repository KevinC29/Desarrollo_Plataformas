from django.shortcuts import render, redirect
from django.contrib.auth import authenticate, login, logout
from django.http import HttpResponseRedirect
from django.contrib import messages
from django.urls import reverse
from .forms import FormularioLogin

# Create your views here.


def autenticar(request):
    if request.method == 'POST':
        formulario = FormularioLogin(request.POST)
        if formulario.is_valid():
            usuario = request.POST['username']
            clave = request.POST['password']
            user = authenticate(username=usuario, password=clave)
            if user is not None:
                if user.is_active:
                    login(request, user)
                    return HttpResponseRedirect(reverse('homepage'))
                else:
                    return HttpResponseRedirect(reverse('no_activo'))
            else:
                messages.warning(request, 'Usuario y/o contraseña incorrecta')
    else:
        formulario = FormularioLogin()
    context = {
        'formulario': formulario
    }
    return render(request, 'login/login.html', context)


def desautenticar(request):
    logout()
    return redirect(request, 'login/login.html')


def welcome(request):
    return redirect(request, 'login/welcome.html')

def forbidden(request):
    return redirect(request, 'login/forbidden.html')

def desactivado(request):
    return redirect(request, 'login/desactive.html')
