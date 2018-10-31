import campeones.*


class AnilloDeDoran {
	
	const property precio = 300
	const property poseeHabilidad = false
	
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
	
	const property precio = 500
	const property poseeHabilidad = false	
	var property usosDisponiblesDeHabilidad = 1
	
	method activarHabilidad(campeon){
		if (usosDisponiblesDeHabilidad == 1) {
			campeon.dineroDispnible(500)
			self.usosDisponiblesDeHabilidad(0)
		}
	}
/*este metodo se fija si aun no ha sido usada la habilidad, en dicho caso permite su
 * activacion y no permite que se vuelva a activar. */
	
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
	
	override method poseeHabilidad() = not super() // False
		
	override method precio() = super() + 100
	
	override method vidaOtorgada(campeon) = super(campeon) + 5
	override method ataqueOtorgado(campeon) = super(campeon) * 2
	
	override method consecuenciasDeEquipado(campeon){
		super(campeon)
		campeon.modificarDanio(5)
				 
	}
	
	override method consecuenciasDeDesequipado(campeon){}			
}

class PosionDeVida {
	
	const property precio = 50
	const property poseeHabilidad = true	
	var property usosDisponiblesDeHabilidad = 2
	
	method activarHabilidad(campeon){
		if (usosDisponiblesDeHabilidad >= 1) {
			campeon.modificarDanio(-50)
			usosDisponiblesDeHabilidad -= 1
		}
	}
	
	
}
