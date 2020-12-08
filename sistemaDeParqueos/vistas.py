from datetime import datetime

from django.http import HttpResponse
from django.shortcuts import render
from django.template import Template, Context, loader

from sistemaDeParqueos.model.persona import Persona
import platform

def mostrar(request):
    doc_externo = open("sistemaDeParqueos/views/viewLogIn.html")
    plt = Template(doc_externo.read())
    doc_externo.close()
    ctx = Context()
    documento = plt.render(ctx)
    return HttpResponse(documento)

def comparacion(request):
    per = Persona("Juan", "Perez")
    materias = ["Fisica", "Matematicas", "Quimica", "Literatura", "Calculo"]
    per.setNombre("Diego")
    doc_externo = open("sistemaDeParqueos/views/sadf.html")
    plt = Template(doc_externo.read())
    doc_externo.close()
    ahora = datetime.now()
    nombre = per.mostrarDatos()
    ctx = Context({"variable": nombre, "fecha": ahora, "materias": materias})
    documento = plt.render(ctx)
    return HttpResponse(documento)



def saludo(request):

    per= Persona("Juan","Perez")
    materias = ["Fisica","Matematicas","Quimica","Literatura","Calculo"]
    per.setNombre("Diego")
    doc_externo = open("sistemaDeParqueos/views/sadf.html")
    plt = Template(doc_externo.read())
    doc_externo.close()
    ahora = datetime.now()
    nombre = per.mostrarDatos()
    ctx = Context({"variable":nombre, "fecha":ahora,"materias":materias})
    documento = plt.render(ctx)
    return HttpResponse(documento)

def obtenerFecha(request,edad, nacimiento):
    documento = """
    
    <!DOCTYPE html>
    <html lang="es">
    <head>
        <meta charset="UTF-8">
        <title>Inicio de Sesion</title>
    </head>
    <body>
        <h1>Usted tiene  %s de edad y nacio en %s</h1>
    </body>
    </html>"""%(edad,nacimiento)
    return HttpResponse(documento);

def cargardor(request):
    per = Persona("Juan", "Perez")
    doc_externo = loader.get_template('sadf.html')
    ahora = datetime.now()
    nombre = per.mostrarDatos()
    materias = ["Fisica", "Matematicas", "Quimica", "Literatura", "Calculo"]
    ctx={"variable":nombre, "fecha":ahora,"materias":materias}
    documento=doc_externo.render(ctx)
    return HttpResponse(documento)

def llamada_estilos(request):

    per = Persona("Juan", "Perez")
    ahora = datetime.now()
    nombre = per.mostrarDatos()
    materias = ["Fisica", "Matematicas", "Quimica", "Literatura", "Calculo"]
    arqui = platform.architecture()
    ctx = {"variable": nombre, "fecha": ahora, "materias": materias,"arquitectura":arqui}
    return render(request,"sadf.html",ctx)

def mostrarLogin(request):
    ctx = {}
    return render(request,"viewLogIn.html",ctx)
