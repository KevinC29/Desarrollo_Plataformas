from django.urls import path
from . import views

urlpatterns = [
    
    path('',views.index, name="carreras"),
    path('crearEstudiantes/<int:codigo>/', views.crearEstudiante, name="crearEstudiantes"),
    path('modificarEstudiante/<int:dni>/', views.modificarEstudiante, name="modificarEstudiantes"),
    path('eliminarEstudiante/<int:dni>/', views.eliminarEstudiante, name="eliminarEstudiantes"),
    path('estudiantes/<int:codigo>/', views.listarEstudiantes, name="estudiantes"),
    path('crearCarrera', views.crearCarrera, name="crearCarreras"),
    path('modificarCarrera/<int:codigo>/', views.modificarCarrera, name="modificarCarrera"),
    path('eliminarCarrera/<int:codigo>/', views.eliminarCarrera, name="eliminarCarrera"),

]
