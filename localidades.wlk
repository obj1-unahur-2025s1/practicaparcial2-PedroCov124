import personaje.*


class Aldea{
    var property cantidaDeHabitantes
    const property cantidaMaxDeHabitantes = 0

    var property ejercito

    method potencialOfensivoDeLaLocalidad() = ejercito.potencialOfensivoDelEjercito()

    method esDesalojada(rival) {
    
        if (cantidaMaxDeHabitantes > rival.cantidadDeIntegrantes()){
            cantidaDeHabitantes = rival.cantidadDeIntegrantes()

            ejercito = rival
        }
        else{
            var ejercitoDividito = rival.dividirEjercito()

            cantidaDeHabitantes = ejercitoDividito.cantidadDeIntegrantes()

            ejercito = ejercitoDividito
        }
    } 
}

class Ciudad{
    var property cantidaDeHabitantes
    const property cantidaMaxDeHabitantes = 0

    var property ejercito

    method potencialOfensivoDeLaLocalidad() = ejercito.potencialOfensivoDelEjercito() + 300

    method esDesalojada(rival) {
        cantidaDeHabitantes = rival.cantidadDeIntegrantes()

        ejercito = rival
    }    
}


class Ejercito{
    var integrantes

    method cantidadDeIntegrantes() = integrantes.size()

    method sumarseAlEjercito(personaje) = integrantes.add(personaje)

    method potencialOfensivoDelEjercito() = integrantes.sum({e => e.potencialOfensivo()}) 

    method atacar(localidad) = if (localidad.potencialOfensivoDeLaLocalidad() < self.potencialOfensivoDelEjercito()) localidad.esDesalojada(integrantes)

    method dividirEjercito() {
        integrantes.sortBy({e,l => e.potencialOfensivo() > l.potencialOfensivo()})
        
        return integrantes.take(10)
    }
}
