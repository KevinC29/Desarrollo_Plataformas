from django.db import models

class Estudiante(models.Model):
    listaGenero =(
        ('femenino','Femenino'),
        ('masculino','Masculino')
    )

    estudiante_id = models.AutoField(primary_key = True)
    cedula = models.CharField(max_length = 10, unique = True, null=False)
    nombres = models.CharField(max_length = 70, null=False)
    apellidos = models.CharField(max_length = 70)
    genero = models.CharField(max_length=20,choices = listaGenero, default = "femenino")
    correo= models.CharField(max_length = 105)
    celular = models.CharField(max_length = 15)
    direccion = models.CharField(max_length = 200)

    def __str__(self):
        return self.cedula + " " + self.nombres

class Materia(models.Model):
    
    materia_id = models.AutoField(primary_key = True)
    nombreMateria = models.CharField(max_length = 70, null=False)
    nota1 = models.DecimalField(max_digits=10, decimal_places=2,null=False)
    nota2 = models.DecimalField(max_digits=10, decimal_places=2,null=False)
    nota3 = models.DecimalField(max_digits=10, decimal_places=2,null=False)
    promedio = models.DecimalField(max_digits=10, decimal_places=2,null=False)
    estado = models.CharField(max_length = 70, null=False)
    estudiante = models.ForeignKey(Estudiante, on_delete= models.CASCADE)

    def __str__(self):
        return self.nombreMateria + " " + self.promedio



