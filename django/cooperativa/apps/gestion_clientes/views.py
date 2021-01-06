from django.shortcuts import render, redirect
from apps.modelo.models import Cliente, Cuenta
from django.contrib.auth.decorators import login_required
from .forms import FormularioCliente, FormularioCuenta

@login_required
def index(request):
    #manejo del ORM
    listaClientes = Cliente.objects.all()
    return render(request, 'clientes/index.html', locals())


def crearCliente(request):
    formulario_cliente = FormularioCliente(request.POST)
    formulario_cuenta = FormularioCuenta(request.POST)
    if request.method == 'POST':
        if formulario_cliente.is_valid() and formulario_cuenta.is_valid():
            cliente = Cliente()
            datos_cliente = formulario_cliente.cleaned_data
            cliente.cedula = datos_cliente.get('cedula')
            cliente.nombres = datos_cliente.get('nombres')
            cliente.apellidos = datos_cliente.get('apellidos')
            cliente.genero = datos_cliente.get('genero')
            cliente.estadoCivil = datos_cliente.get('estadoCivil')
            cliente.correo = datos_cliente.get('correo')
            cliente.telefono = datos_cliente.get('telefono')
            cliente.celular = datos_cliente.get('celular')
            cliente.direccion = datos_cliente.get('direccion')
            #ORM
            cliente.save()
            # ORM
            cuenta = Cuenta()
            datos_cuenta = formulario_cuenta.cleaned_data
            cuenta.numero = datos_cuenta.get("numero")
            cuenta.saldo = datos_cuenta.get("saldo")
            cuenta.tipoCuenta = datos_cuenta.get("tipoCuenta")
            cuenta.cliente = cliente
            #ORM
            cuenta.save()
            return redirect(index)
    return render(request, 'clientes/crearClientes.html', locals())


def modificarCliente(request, cedula):
    cliente = Cliente.objects.get(cedula=cedula)
    formulario_cliente= FormularioCliente(request.POST)
    if request.method=='POST':
        if formulario_cliente.is_valid():
            datos=formulario_cliente.cleaned_data
            cliente.cedula=datos.get('cedula')
            cliente.nombres=datos.get('nombres')
            cliente.apellidos=datos.get('apellidos')
            cliente.genero=datos.get('genero')
            cliente.estadoCivil=datos.get('estadoCivil')
            cliente.correo=datos.get('correo')
            cliente.telefono=datos.get('telefono')
            cliente.celular=datos.get('celular')
            cliente.direccion=datos.get('direccion')
            cliente.save()
            return redirect(index)
    if request.method=='GET':
        eliminarCliente(request, cedula)
    return render(request, 'clientes/modificar.html', locals())


def eliminarCliente(request, cedula):
    cliente = Cliente.objects.get(cedula=cedula)
    if request.method == 'POST':
        cliente.delete()
        return redirect(index)
    return render(request, 'clientes/eliminar.html', locals())

def listarCuentas(request, cedula):
    cliente = Cliente.objects.get(cedula = cedula)
    cuentas = Cuenta.objects.filter(cliente = cliente)
    return render(request, 'cuentas/index.html', locals())

def crearCuenta(request):
    return render(request, 'cuentas/crearCuentas.html')


def modificarCuenta(request):
    return render(request, 'hola principal')


def eliminarCuenta(request):
    return render(request, 'hola principal')