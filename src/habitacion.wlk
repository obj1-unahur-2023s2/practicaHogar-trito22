import persona.*

class Habitacion {
	var property ocupantes = []
	
	method agregarOcupante(unaPersona) = ocupantes.add(unaPersona)
	method nivelConfort(unaPersona) = 0
	method puedeEntrar(unaPersona) = true

}

class UsoGeneral inherits Habitacion{
	override method nivelConfort(unaPersona) = 10
}

class Dormitorio inherits Habitacion{
	var property personasDurmiendo = []
	
	method agregarPersona(unaPersona) = personasDurmiendo.add(unaPersona)
	method confortASumar() = 10 / personasDurmiendo.size()
	override method nivelConfort(unaPersona){
		return if(personasDurmiendo == 0){10}else{self.confortASumar() + 10}
	}
	override method puedeEntrar(unaPersona){
		return (ocupantes.all({o => self.ocupanteDuerme(o)}))
	}
	method ocupanteDuerme(unOcupante){
		return personasDurmiendo.contains(unOcupante)
	}
}

class Banio inherits Habitacion{
	var metrosCuadrados 
	
	method metrosCuadrados(cantidad){
		metrosCuadrados = cantidad
	}
	method porcentajeMetrosCuadrados(porcentaje) = self.metrosCuadrados() * porcentaje
	override method nivelConfort(unaPersona) = if(unaPersona.edad() >= 4){12}else{14}
	override method puedeEntrar(unaPersona){
		return unaPersona.edad() >= 4
	}
}

class Cocina inherits Habitacion{
	
}