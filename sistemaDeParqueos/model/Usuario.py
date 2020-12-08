class Usuario:
    def __init__(self, ci, nombre, usuario, password):
        self.__ci=ci
        self.__nombre=nombre
        self.__usuario=usuario
        self.__password=password

    @property
    def ci(self):
        return self.__ci

    @property
    def nombre(self):
        return self.__nombre

    @property
    def usuario(self):
        return self.__usuario

    @property
    def password(self):
        return self.__password

    @ci.setter
    def ci(self, ci):
        self.__ci=ci

    @nombre.setter
    def nombre(self, nombre):
        self.__nombre = nombre

    @usuario.setter
    def usuario(self, usuario):
        self.__usuario = usuario

    @password.setter
    def password(self, password):
        self.__password = password

    