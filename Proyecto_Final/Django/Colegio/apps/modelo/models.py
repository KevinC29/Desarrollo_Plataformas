from django.db import models

# Create your models here.
class Carrera(models.Model):
    carrera_id = models.AutoField(primary_key=True)
    codigo = models.CharField(max_length=3, unique = True, null=False)
    nombre = models.CharField(max_length=50, unique = True, null=False)
    duracion = models.PositiveSmallIntegerField(default=5)

    def __str__(self):
        txt = "{0} (Duración: {1} año(s))"
        return txt.format(self.nombre, self.duracion)

class Estudiante(models.Model):
    listaGenero =(
        ('F','Femenino'),
        ('M','Masculino')
    )
    estudiante_id = models.AutoField(primary_key=True)
    dni = models.CharField(max_length=10, unique = True, null=False)
    apellidos = models.CharField(max_length=70)
    nombres = models.CharField(max_length=70)
    fechaNacimiento = models.DateField()
    genero = models.CharField(max_length=1, choices=listaGenero, default='F')
    carrera = models.ForeignKey(Carrera, null=False, blank=False, on_delete=models.CASCADE)
    vigencia = models.BooleanField(default=True)

    def nombreCompleto(self):
        txt = "{0}, {1}"
        return txt.format(self.apellidos, self.nombres)

    def __str__(self):
        txt = "{0} / Carrera: {1} / {2}"
        if self.vigencia:
            estadoEstudiante = "VIGENTE"
        else:
            estadoEstudiante = "DE BAJA"
        return txt.format(self.nombreCompleto(), self.carrera, estadoEstudiante)

class Curso(models.Model):
    curso_id = models.AutoField(primary_key=True)
    codigo = models.CharField(max_length=6, unique = True, null=False)
    nombre = models.CharField(max_length=30, unique = True, null=False)
    creditos = models.PositiveSmallIntegerField()
    docente = models.CharField(max_length=100)

    def __str__(self):
        txt = "{0} ({1}) / Docente: {2}"
        return txt.format(self.nombre, self.codigo, self.docente)

class Matricula(models.Model):
    matricula_id = models.AutoField(primary_key=True)
    estudiante = models.ForeignKey(Estudiante, null=False, blank=False, on_delete=models.CASCADE)
    curso = models.ForeignKey(Curso, null=False, blank=False, on_delete=models.CASCADE)
    fechaMatricula = models.DateTimeField(auto_now_add=True)

    def __str__(self):
        txt = "{0} matricul{1} en el curso {2} / Fecha: {3}"
        if self.estudiante.sexo == "F":
            letraSexo = "a"
        else:
            letraSexo = "o"
        fechaM = self.fechaMatricula.strftime("%A %d/%m/%Y %H:%M:%S")
        return txt.format(self.estudiante.nombreCompleto(), letraSexo, self.curso, fechaM)