from django.db import models

# Create your models here.


class Cliente(models.Model):
    listaGenero = (
        ('femenino', 'Femenino'),
        ('masculino', 'Masculino')
    )

    listaEstadoCivil = (
        ('soltero', 'Soltero'),
        ('casado', 'Casado'),
        ('union', 'Unión Libre'),
        ('divorciado', 'Divorciado'),
        ('viudo', 'Viudo'),
        ('separado', 'Separado')
    )

    cliente_id = models.AutoField(primary_key=True)
    cedula = models.CharField(max_length=10, unique=True, null=False)
    nombres = models.CharField(max_length=70, null=False)
    apellidos = models.CharField(max_length=70, null=False)
    genero = models.CharField(max_length=30, choices=listaGenero, default="femenino")
    estadoCivil = models.CharField(max_length=30,choices=listaEstadoCivil, null=False, default="soltero")
    correo = models.EmailField(max_length=105, null=False)
    telefono = models.CharField(max_length=15)
    celular = models.CharField(max_length=15, null=False)
    direccion = models.TextField(max_length=200)
    date_create = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)


    def _str_(self):
        return self.celular


class Cuenta(models.Model):
    listaTipoCuenta = (
        ('ahorros', 'Ahorros'),
        ('corriente', 'Corriente'),
        ('programado', 'Programado')
    )
    cuenta_id = models.AutoField(primary_key=True)
    numero = models.CharField(max_length=20, unique=True, null=False)
    fechaApertura = models.DateTimeField(auto_now_add=True, null=False)
    tipoCuenta = models.CharField(max_length=30, choices=listaTipoCuenta, default='ahorros')
    saldo = models.DecimalField(max_digits=10, decimal_places=2, null=False)
    estado = models.BooleanField(default=True)
    cliente = models.ForeignKey(Cliente, on_delete=models.CASCADE)
    date_create = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)


    def _str_(self):
        cadena = str(self.saldo) + ":" + str(self.cuenta_id)
        return cadena


class Transaccion(models.Model):
    listaTipoTransaccion = (
        ('deposito', 'Depósito'),
        ('retiro', 'Retiro')
    )

    transaccion_id = models.AutoField(primary_key=True)
    fecha = models.DateTimeField(auto_now_add=True, null=False)
    tipo = models.CharField(max_length=30, choices=listaTipoTransaccion, default='deposito')
    valor = models.DecimalField(max_digits=10, decimal_places=2, null=False)
    cuenta = models.ForeignKey(Cuenta, on_delete=models.CASCADE)
    descripcion = models.TextField(default="Descripción de la Transacción")
    updated_at = models.DateTimeField(auto_now=True)
