from django import forms
from apps.modelo.models import Estudiante, Carrera


class FormularioEstudiante(forms.ModelForm):
    class Meta:
        model = Estudiante
        fields = ["dni", "apellidos", "nombres",
                  "fechaNacimiento", "genero", 
                  "carrera", "vigencia"]

class FormularioCarrera(forms.ModelForm):

    class Meta:
        model = Carrera
        fields = ["codigo", "nombre", "duracion"]

