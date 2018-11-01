import campeones.*

class OleadaMinions{
	var property cantidadDeMinions
	var property plusDanio
	
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
		
		//if( cantidadDeMinions >= ataqueCampeon ) {
		//	cantidadDeMinions -= ataqueCampeon
		//}
		//else {
		//	cantidadDeMinions = 0
		//}
	}
	/*elimina la cantidad de minions dependiendo el ataque que posee el campeon */
	
	method recibirAtaque(campeon) {
		self.defenderseDeAtaque(campeon)
		//self.eliminarMinionsEnTF(campeon)
		self.eliminarMinions(campeon)
	}
	
	method estaAbatida() = cantidadDeMinions == 0
	
	/*se podria haber evitado este metodo, pero de esta manera podria resultar mas util a futuro */
}