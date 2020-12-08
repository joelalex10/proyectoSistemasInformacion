class Cliente:
    def __init__(self, ci, nombre):
        self.__ci=ci
        self.__nombre=nombre

    @property
    def ci(self):
        return self.__ci

    @property
    def nombre(self):
        return self.__nombre

    @ci.setter
    def ci(self,ci):
        self.__ci=ci

    @nombre.setter
    def nombre(self,nombre):
        self.__nombre=nombre
