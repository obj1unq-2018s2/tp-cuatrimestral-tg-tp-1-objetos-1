import items.*
import oleadasMinions.*

class Campeon{

	const property vidaInicial
	const property ataqueInicial
	/* vida inicial y ataque inicial, se asignan en cada campeon pero nunca se 
	 * modifican durante la partida, por ahora */
	
	var property bloqueosDisponibles = 0
	var property danioRecibido = 0
	/*bloqueosDisponibles y danio recibido se modifican durante el equipado
	 * y el desequipado de items, ademas dentro de las batallas contra minions */
	
	var property inventario = [] // lista de items que tiene el campeon (se usa lista porque puede tener dos items iguales)
	
	method vida() {
		return vidaInicial + inventario.sum(
			{ item => item.vidaOtorgada(self) }
		)
	}
	/*es la vida total que tiene un campeon teniendo en cuenta los puntos adicionales otorgados por los items */
	
	method ataque() {
		return ataqueInicial + inventario.sum(
			{ item => item.ataqueOtorgada(self) }
		)
	}
	/*es el ataque total que tiene un campeon teniendo en cuenta los puntos adicionales otorgados por los items */
	
	
	method equiparse(item){
		inventario.add(item) 
		item.consecuenciasDeEquipado(self)
	}
	
	method desequiparse(item){
		inventario.remove(item)
		item.consecuenciasDeDesequipado(self)
	}
	
	method atacarOleada(oleada){
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
	
	
	method estaMuerto() = danioRecibido >= self.vida()
	
	method modificarDanio(danio) {
		danioRecibido += danio 
	}
	
	method modificarBloqueo(bloqueos) {
		bloqueosDisponibles += bloqueos 
	}
}

