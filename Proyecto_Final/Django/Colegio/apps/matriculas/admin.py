from django.contrib import admin

# Register your models here.
from apps.modelo.models import Matricula
from apps.modelo.models import Curso

class AdminMatricula(admin.ModelAdmin):
    list_display = ["estudiante","curso","fechaMatricula"]
    list_editable=["curso"]
    list_filter = ["curso"]
    search_fields = ["estudiante", "curso"]

    class Meta:
        model=Matricula

admin.site.register(Matricula,AdminMatricula)

class AdminCurso(admin.ModelAdmin):
    list_display = ["codigo","nombre","creditos","docente"]
    list_filter = ["codigo", "nombre"]
    search_fields = ["codigo"]

    class Meta:
        model = Curso

admin.site.register(Curso, AdminCurso)
