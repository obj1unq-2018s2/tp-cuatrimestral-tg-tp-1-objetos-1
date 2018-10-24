import campeones.*

class Items{
	
	method agregarAtributos(campeon){
		campeon.vidaAdicional(self)
		campeon.ataqueAdicional(self)
	}
}

class AnilloDeDoran inherits Items {
	
	method vidaOtorgada(campon) = 60
	method ataqueOtorgado(camepon) = 15

	
	method consecuenciasDeEquipado(campeon){
		campeon.danioRecibido(campeon.danioRecibido() + 5) //NOSE SI SE PUEDE
	}
	
	method consecuenciasDeDesequipado(campeon){
		if (campeon.danioRecibido() >= 10){campeon.danioRecibido(campeon.danioRecibido() -10)}  
		else (campeon.danioRecibido(0))
	}		
		
}

class TomoAmplificador inherits Items {
	
	method vidaOtorgada(campeon) = campeon.danioRecibido() * 0.25	
	method ataqueOtorgado(campeon) = campeon.danioRecibido() * 0.05
	
	method consecuenciasDeEquipado(campeon){
		campeon.bloqueosDisponibles(campeon.bloqueosDisponibles() + 2) 
	}
	
	method consecuenciasDeDesequipado(campeon){
		campeon.bloqueosDisponibles(campeon.bloqueosDisponibles() + 1)
		campeon.danioRecibido(campeon.danioRecibido() + 30)
	}			
	
}

class SombreroDeRabadon inherits Items {
	
	method vidaOtorgada(campeon) = campeon.danioRecibido() * 0.25 + 5
	method ataqueOtorgado(campeon) = campeon.ataqueInicial() * 2
	
	method consecuenciasDeEquipado(campeon){
		campeon.bloqueosDisponibles(campeon.bloqueosDisponibles() + 2)
		campeon.danioRecibido(campeon.danioRecibido() + 5)		 
	}
	
	method consecuenciasDeDesequipado(campeon){}			
}


