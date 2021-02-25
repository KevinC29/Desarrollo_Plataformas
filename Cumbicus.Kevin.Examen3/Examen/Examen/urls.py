from django.contrib import admin
from django.urls import path, include
from . import views

urlpatterns = [
    path('admin/', admin.site.urls),
    path('estudiantes/', include('apps.gestion_estudiantes.urls')),
    path('', views.index, name='homepage')
]
