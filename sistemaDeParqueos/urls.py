"""sistemaDeParqueos URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/3.1/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))

    LINK PARA EJECUTAR EL PROYECTO
    http://127.0.0.1:8000/
"""
from django.contrib import admin
from django.urls import path
from sistemaDeParqueos import vistas
urlpatterns = [
    path('admin/', admin.site.urls),
    path('saludo/',vistas.saludo),
    path('fecha/<int:edad>/<int:nacimiento>',vistas.obtenerFecha),
    path('inicio/',vistas.mostrarLogin),
    path('comparacion/',vistas.comparacion),
    path('cargador/',vistas.cargardor),
    path('llamadas/',vistas.llamada_estilos),
    path('logIn/',vistas.mostrarLogin),
    path('/fecha<int:edad>/<int:nacimiento>',vistas.obtenerFecha)
]
