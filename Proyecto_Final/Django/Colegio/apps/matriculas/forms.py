from django import forms
from apps.modelo.models import Matricula, Curso, Estudiante

class FormularioEstudiante(forms.ModelForm):
    class Meta:
        model = Estudiante
        fields = ["dni", "apellidos", "nombres",
                  "fechaNacimiento", "genero", 
                  "carrera", "vigencia"]

class FormularioMatricula(forms.ModelForm):
    class Meta:
        model = Matricula
        fields = ["estudiante", "curso"]

class FormularioCurso(forms.ModelForm):

    class Meta:
        model = Curso
        fields = ["codigo", "nombre", "creditos", "docente"]