from django.urls import path
from . import views

urlpatterns = [
    
    path('',views.index, name="estudiantes"),
    path('crearEstudiante', views.crearEstudiante, name="crearEstudiante"),
    path('materias/<int:cedula>/', views.listarMaterias, name="materias"),
    path('crearMateria/<int:cedula>/', views.crearMateria, name="crearMaterias"),

]