from django.contrib import admin

# Register your models here.
from apps.modelo.models import Estudiante
from apps.modelo.models import Carrera

class AdminEstudiante(admin.ModelAdmin):
    list_display = ["dni","apellidos","nombres","fechaNacimiento","genero", "carrera", "vigencia"]
    list_editable=["apellidos","nombres", "vigencia"]
    list_filter = ["genero", "carrera"]
    search_fields = ["apellidos", "nombres", "dni"]

    class Meta:
        model=Estudiante

admin.site.register(Estudiante,AdminEstudiante)

class AdminCarrera(admin.ModelAdmin):
    list_display = ["codigo","nombre","duracion"]
    list_filter = ["codigo", "nombre"]
    search_fields = ["codigo"]
    class Meta:
        model = Carrera

admin.site.register(Carrera, AdminCarrera)

