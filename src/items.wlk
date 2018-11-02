import campeones.*

class AnilloDeDoran {
	
	const property precio = 300
	const property habilidadDisponible = false
	
	method vidaOtorgada(campeon) = 60
	method ataqueOtorgado(camepon) = 15
	
	method activarHabilidad(campeon){ }	
	/*este metodo se realiza para no perder el polimorfismo ya que de todas formas no era necesario estrictamente, ya que al tener 
	 * false en habilidad disponible no entra en el IF que apunta a este metodo*/
	
	method consecuenciasDeEquipado(campeon){
		campeon.modificarDanio(5)
	}
	
	method consecuenciasDeDesequipado(campeon){
		campeon.modificarDanio(-10)
	}		
}

class TomoAmplificador {
	
	const property precio = 500
	var property habilidadDisponible = true
	
	method activarHabilidad(campeon){
		const dinero = campeon.dineroDisponible().max(500)
		campeon.dineroDisponible(dinero)
		habilidadDisponible = false
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
	
	override method habilidadDisponible() = false
		
	override method precio() = super() + 100
	
	override method vidaOtorgada(campeon) = super(campeon) + 5
	
	override method ataqueOtorgado(campeon) = super(campeon) * 2
	
	override method consecuenciasDeEquipado(campeon){
		super(campeon)
		campeon.modificarDanio(5)
				 
	}
	
	override method consecuenciasDeDesequipado(campeon) {}			
}

class PosionDeVida {
	
	const property precio = 50
	var property usosDisponiblesDeHabilidad = 2
	
	method vidaOtorgada(campeon) = 0
	method ataqueOtorgado(camepon) = 0
	
	method activarHabilidad(campeon){
		campeon.modificarDanio(-50)
		usosDisponiblesDeHabilidad -= 1
	}
	
	method habilidadDisponible() {
		return usosDisponiblesDeHabilidad != 0
	}
	method consecuenciasDeEquipado(campeon){}
	method consecuenciasDeDesequipado(campeon){}
	
}

class BastonVacio{
	
	const property precio = 0 	
	var property materiales = []

	method agregarMaterial(item){
		materiales.add(item)
	}
	
	/*method estaDisponible() = true
	 solo es utilizado en habilidad disponible. 
	
	method habilidadDisponible() {
		materiales.map{ item => item.habilidadDisponible() }.any{estadoDeHabilidad => estadoDeHabilidad.estaDisponible()}
	}
	toma los materiales(items) del baston vacio y chequea si alguno tiene habilidad disponible, en ese caso el campeon podra activar
	  la habilidad del baston vacia a pesar de que haya alguno de los items dentro que no tenga habilidad disponible.
	 */
	 
	 method habilidadDisponible() = true
	
	method vidaOtorgada(campeon){
		return	materiales.map{item => item.vidaOtorgada()}.sum() / 2	
	}
	
	method ataqueOtorgado(campeon){
		return	materiales.map{item => item.ataqueOtorgado()}.sum()
	}
	
	method activarHabilidad(campeon){
		materiales.forEach{ item => item.activarHabilidad(campeon) }
	}
	
	
	method consecuenciasDeEquipado(campeon){}
	method consecuenciasDeDesequipado(campeon){}	
	
	
}
