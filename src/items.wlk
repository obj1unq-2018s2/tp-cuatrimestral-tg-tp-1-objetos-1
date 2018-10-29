import campeones.*


class AnilloDeDoran {
	
	method vidaOtorgada(campon) = 60
	method ataqueOtorgado(camepon) = 15

	
	method consecuenciasDeEquipado(campeon){
		campeon.modificarDanio(5)
	}
	
	method consecuenciasDeDesequipado(campeon){
		campeon.modificarDanio(-10)
	}		
		
}

class TomoAmplificador {
	
	method vidaOtorgada(campeon) = campeon.danioRecibido() * 0.25	
	method ataqueOtorgado(campeon) = campeon.danioRecibido() * 0.05
	
	method consecuenciasDeEquipado(campeon){
		campeon.modificarBloqueo(2)
	}
	
	method consecuenciasDeDesequipado(campeon){
		campeon.modificarBloqueo(1)
		campeon.modificarDanio(30)
	}			
	
}

class SombreroDeRabadon inherits TomoAmplificador {
	
	override method vidaOtorgada(campeon) = super(campeon) + 5
	override method ataqueOtorgado(campeon) = super(campeon) * 2
	
	override method consecuenciasDeEquipado(campeon){
		super(campeon)
		campeon.modificarDanio(5)
				 
	}
	
	override method consecuenciasDeDesequipado(campeon){}			
}


