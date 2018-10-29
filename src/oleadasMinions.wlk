import campeones.*

class OleadaMinions{
	var property cantidadDeMinions
	var property plusDanio
	
	method danioOcasionado() = cantidadDeMinions + plusDanio
	
	method defenderseDeAtaque(campeon){
		campeon.recibirAtaque( self.danioOcasionado() )
	}
	
	method recibirAtaque(campeon) {
		self.defenderseDeAtaque(campeon)
	}
	/*se podria haber evitado este metodo, pero de esta manera podria resultar mas util a futuro */
}