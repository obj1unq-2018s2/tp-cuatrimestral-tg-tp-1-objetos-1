import campeones.*

class OleadaMinions{
	var property cantidadDeMinions
	var property plusDanio
	
	method danioOcasionado() = cantidadDeMinions + plusDanio
	
	method defenderseDeAtaque(campeon){
		campeon.recibirAtaque( self.danioOcasionado() )
	}
	
	method eliminarMinionsEnTF(campeon){
		if( cantidadDeMinions >= campeon.ataque() ){cantidadDeMinions -= campeon.ataque()}
		else {cantidadDeMinions = 0}
	}
	/*elimina la cantidad de minions dependiendo el ataque que posee el campeon */
	
	method recibirAtaque(campeon) {
		self.defenderseDeAtaque(campeon)
		self.eliminarMinionsEnTF(campeon)
	}
	
	method oleadaAbatida() = cantidadDeMinions == 0
	
	/*se podria haber evitado este metodo, pero de esta manera podria resultar mas util a futuro */
}