from django.urls import path
from . import views

urlpatterns = [
    # este ejemplo de autenticar es epecial y se implementa en la linea
    # 108 de cooperativa->settings.py
    path('', views.autenticar, name="autenticar"),
    path('desactivado', views.desactivado, name="no_activo"),
]