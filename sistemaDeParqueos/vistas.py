from datetime import datetime

from django.http import HttpResponse
from django.template import Template, Context

def saludo(request):

    per= Persona("Juan","Perez")

    materias = ["Fisica","Matematicas","Quimica","Literatura"]

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


class Persona():

    nombre = ""
    apellido = ""

    def __init__(self, nombre,apellido):
        self.nombre = nombre
        self.apellido = apellido

    def getNombre(self):
        return self.nombre

    def getApellido(self):
        return self.apellido

    def setNombre(self,nombre):
        self.nombre=nombre

    def setApellido(self, apellido):
        self.apellido = apellido

    def mostrarDatos(self):
        return "EL NOMBRE ES: "+self.getNombre()+" \nEL APELLIDO ES: "+self.getApellido()
