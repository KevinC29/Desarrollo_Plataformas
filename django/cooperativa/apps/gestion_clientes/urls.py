from django.urls import path
from . import views

urlpatterns = [
    
    path('',views.index, name="clientes"),
    path('crearClientes', views.crearCliente, name="crearClientes"),
    path('modificar/<int:cedula>/', views.modificarCliente, name="modificar"),
    path('eliminar/<int:cedula>/', views.eliminarCliente, name="eliminar"),
    path('cuentas/<int:cedula>/', views.listarCuentas, name="cuentas"),
    path('crearCuentas', views.crearCuenta, name="crearCuentas"),
]
