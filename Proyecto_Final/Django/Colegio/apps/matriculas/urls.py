from django.urls import path
from . import views

urlpatterns = [
    
    path('',views.index, name="matriculas"),
    path('crearMatriculas/<int:codigo>/', views.crearMatricula, name="crearMatriculas"),
    path('modificarMatriculas/<int:dni>/', views.modificarMatricula, name="modificarMatriculas"),
    path('eliminarMatriculas/<int:dni>/', views.eliminarMatricula, name="eliminarMatriculas"),
    path('matriculas/<int:codigo>/', views.listarMatriculas, name="matriculas"),
    path('crearCursos', views.crearCurso, name="crearCursos"),
    path('modificarCurso/<int:codigo>/', views.modificarCurso, name="modificarCurso"),
    path('eliminarCurso/<int:codigo>/', views.eliminarCurso, name="eliminarCurso"),
    
]