from django import forms
from apps.modelo.models import Estudiante, Materia


class FormularioEstudiante(forms.ModelForm):
    class Meta:
        model = Estudiante
        fields = ["cedula", "apellidos", "nombres",
                  "genero", "correo", "celular","direccion"]

class FormularioMateria(forms.ModelForm):

    class Meta:
        model = Materia
        fields = ["nombreMateria", "nota1", "nota2", "nota3"]

