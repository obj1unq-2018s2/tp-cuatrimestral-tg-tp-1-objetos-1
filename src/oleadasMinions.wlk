class OleadaMinions{
	var property cantidadDeMinions
	var property plusDanio
	
	method danioOcasionado() = cantidadDeMinions + plusDanio
	
	method defenderse(campeon){
		campeon.danioRecibido( self.danioOcasionado() )
	}
}