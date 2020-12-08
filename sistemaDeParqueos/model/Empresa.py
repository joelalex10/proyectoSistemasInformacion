class Empresa:
    def __init__(self, nombre, nit):
        self.__nombre = nombre
        self.__nit = nit

    @property
    def nombre(self):
        return self.__nombre

    @property
    def nit(self):
        return self.__nit

    @nombre.setter
    def nombre(self,nombre):
        self.__nombre=nombre

    @nit.setter
    def nit(self, nit):
        self.__nit = nit

    def toString(self):
        return "EL NOMBRE ES: "+self.nombre+" \nEL NIT ES: "+self.nit




