import localidades.*

class Personaje{
  const property fuerza

  const property inteligencia

  var property rol 

  method esGroso() = self.esInteligente() or rol.esGrosoEnRol(self)

  method esInteligente()

  method potencialOfensivo() = fuerza * 10 + rol.extra()
}


class Humano inherits Personaje{
  override method esInteligente() = self.inteligencia() > 50
}

class Orco inherits Personaje{
  override method esInteligente() = false

  override method potencialOfensivo() = super() * 1.1
}



class Cazador {
  const property mascota

  method extra() = mascota.potencialOfensivo()

  method esGrosoEnRol(personaje) = mascota.esLongevo()
}


object guerrero{
  method extra() = 100 

  method esGrosoEnRol(personaje) = personaje.fuerza() > 50 
}


object brujo {
  method extra(){}

  method esGrosoEnRol(personaje) = true
}


class Mascota {
  const edad
  const fuerza
  const tieneGarras

  method esLongevo() = edad > 10

  method potencialOfensivo() = if (tieneGarras) fuerza * 2 else fuerza
}

