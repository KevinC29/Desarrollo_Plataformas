from django.shortcuts import render

def index(request):
    return render (request, 'clientes/index.html')

def crearCliente(request):
    return render (request, 'clientes/crear.html')

def modificarCliente(request):
    return render (request, 'Hola XDXD')

def eliminarCliente(request):
    return render (request, 'Hola XDXD')

def crearCuenta(request):
    return render (request, 'Hola XDXD')

def modificarCuenta(request):
    return render (request, 'Hola XDXD')

def eliminarCuenta(request):
    return render (request, 'Hola XDXD')