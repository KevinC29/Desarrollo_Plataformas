from django.urls import path

from . import views

urlpatterns = [
    path('', views.index, name="clientes"),
    path('crear_clientes', views.crearCliente, name="crear_clientes"),
]
