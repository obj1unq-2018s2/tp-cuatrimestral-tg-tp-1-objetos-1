import items.*
import oleadasMinions.*

class Campeon{

	var property vidaInicial
	var property ataqueInicial
	/* vida inicial y ataque inicial, se asignan en cada campeon pero nunca se 
	 * modifican durante la partida, por ahora */
	
	var property bloqueosDisponibles = 0
	var property danioRecibido = 0
	/*bloqueosDisponibles y danio recibido se modifican durante el equipado
	 * y el desequipado de items, ademas dentro de las batallas contra minions */
	
	var property inventario = [] // items que tiene equipados el campeon
	
	//var vidaAdicional = 0 
	//var ataqueAdicional= 0 
	/*debido a que no se puede modificar el ataque y la vida inicial se llevara
	 * un registro de la vida adicional y ataque adicional que seria la vida
	 * otorgen los items*/
	
	//method vidaAdicional(item){
	//	vidaAdicional += item.vidaOtorgada(self)
	//}    
	/*es la vida adicional que se le suma al campeon dependiendo el item y los atrtibutos 
 	* del campeon por ello se pasa por self */
	
	method vida() {
		return vidaInicial + inventario.sum(
			{ item => item.vidaOtorgada(self) }
		)
	}
	
	method ataque() {
		return ataqueInicial + inventario.sum(
			{ item => item.ataqueOtorgada(self) }
		)
	}
	
	//method ataqueAdicional(item){
	//	ataqueAdicional += item.ataqueOtorgado(self) 
	//}	
	/*es el ataque adicional que se le suma al campeon dependiendo el item y los 
	* atrtibutos del campeon por ello se pasa por self */
	
	
	method equiparse(item){
		inventario.add(item) 
		//item.agregarAtributos(self) // no necesariamente necesita ir a la class ITEM, pero si queda mas legible.
		item.consecuenciasDeEquipado(self)
	}
	
	method desequiparse(item){
		inventario.remove(item)
		item.consecuenciasDeDesequipado(self)
	}
	
	method atacarOleada(oleada){
		//if(bloqueosDisponibles >= 1){bloqueosDisponibles -= 1}
		//else{ oleada.defenderse(self) }
		oleada.recibirAtaque(self)
	}
	
	method recibirAtaque(danio){
		if (bloqueosDisponibles >= 1) {
			bloqueosDisponibles -= 1
		}
		else{
			self.modificarDanio(danio)
		}
	}
	
	//method vidaTotal() = vidaInicial + vidaAdicional
	
	//method vidaActual() = (vidaInicial + vidaAdicional) - danioRecibido
	
	//method estaMuerto() = self.danioRecibido() >= self.vidaTotal()
	
	method estaMuerto() = danioRecibido >= self.vida()
	
	method modificarDanio(danio) {
		danioRecibido += danio 
	}
	
		method modificarBloqueo(bloqueos) {
		bloqueosDisponibles += bloqueos 
	}
}






