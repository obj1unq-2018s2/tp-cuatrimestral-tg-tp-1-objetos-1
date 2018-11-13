import campeones.*

class EjercitoDeMinions{
	
	var property oleadas = []
	
	method agregarOleada(oleada){
		oleadas.add(oleada)
	}
	
	method estaAbatido(){
		return oleadas.all{oleada => oleada.estaAbatida()}
	}
	
	method recibirAtaque(campeon){
		self.oleadasVivas().forEach{oleada => oleada.recibirAtaque(campeon)}
		/* no se atacan oleadas muertas */
	}
	
	method oleadasVivas(){
		return oleadas.filter({oleada => not oleada.estaAbatida()})
	}
}

class OleadaMinions{
	
	var property cantidadDeMinions
	const property plusDanio
	
	method danioOcasionado() = cantidadDeMinions + plusDanio
	
	method defenderseDeAtaque(campeon){
		campeon.recibirAtaque( self.danioOcasionado() )
	}
	
	method eliminarMinions(campeon){
		const minionsAbatidos = campeon.ataque().min(cantidadDeMinions)
		// si ataque > minions -> minionsAbatidos = cantidadDeMinions
		// si minions > ataque -> minionsAbatidos = ataque
		
		campeon.ganarDinero(minionsAbatidos)
		/* no se usa el setter por si se requiere cambiar el criterio */
		
		cantidadDeMinions -= minionsAbatidos
	}
	
	method recibirAtaque(campeon) {
		self.defenderseDeAtaque(campeon)
		self.eliminarMinions(campeon)
	}
	
	method estaAbatida() = cantidadDeMinions == 0
	
}

