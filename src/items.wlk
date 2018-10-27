import campeones.*

class Items {
	
	//method agregarAtributos(campeon){
	//	campeon.vidaAdicional(self)
	//	campeon.ataqueAdicional(self)
	//}
}

class AnilloDeDoran inherits Items {
	
	method vidaOtorgada(campon) = 60
	method ataqueOtorgado(camepon) = 15

	
	method consecuenciasDeEquipado(campeon){
		//campeon.danioRecibido(campeon.danioRecibido() + 5) //NOSE SI SE PUEDE ------ AGUS:NO, DA ERROR
		campeon.modificarDanio(5)
	}
	
	method consecuenciasDeDesequipado(campeon){
		//if (campeon.danioRecibido() >= 10){campeon.danioRecibido(campeon.danioRecibido() -10)}  
		//else (campeon.danioRecibido(0))
		campeon.modificarDanio(-10)
	}		
		
}

class TomoAmplificador inherits Items {
	
	method vidaOtorgada(campeon) = campeon.danioRecibido() * 0.25	
	method ataqueOtorgado(campeon) = campeon.danioRecibido() * 0.05
	
	method consecuenciasDeEquipado(campeon){
		//campeon.bloqueosDisponibles(campeon.bloqueosDisponibles() + 2) 
		campeon.modificarBloqueo(2)
	}
	
	method consecuenciasDeDesequipado(campeon){
		//campeon.bloqueosDisponibles(campeon.bloqueosDisponibles() + 1)
		campeon.modificarBloqueo(1)
		campeon.modificarDanio(30)
	}			
	
}

class SombreroDeRabadon inherits Items {
	
	method vidaOtorgada(campeon) = campeon.danioRecibido() * 0.25 + 5
	method ataqueOtorgado(campeon) = campeon.ataqueInicial() * 0.05 * 2
	
	method consecuenciasDeEquipado(campeon){
		//campeon.bloqueosDisponibles(campeon.bloqueosDisponibles() + 2)
		campeon.modificarBloqueo(2)
		campeon.modificarDanio(5)		 
	}
	
	method consecuenciasDeDesequipado(campeon){}			
}


