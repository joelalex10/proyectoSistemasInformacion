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
