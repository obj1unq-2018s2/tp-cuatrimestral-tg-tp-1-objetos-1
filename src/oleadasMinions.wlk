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
}