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
	
	var property dineroDisponible = 0 // lo inicializamos en cero
	
	method vida() {
		return vidaInicial + inventario.sum(
			{ item => item.vidaOtorgada(self) }
		)
	}
	/*es la vida total que tiene un campeon teniendo en cuenta los puntos adicionales otorgados por los items */
	
	method ataque() {
		return ataqueInicial + inventario.sum(
			{ item => item.ataqueOtorgado(self) }
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

	//method dineroGanadoEnTF(oleada)  { //TF = TEAM FIGHT(por ahora solo hay contra minions)
	//	if (self.ataque() >= oleada.cantidadDeMinions()){return oleada.cantidadDeMinions()}
	//	else (return self.ataque())
	//} 
	/* es decir, cuando la oleada es abatida recibe como dinero la cantidad de
 	* minions que tenia dicha oleada, en caso de no ser abatida recibe de dinero el ataque
 	* del heroe, que es igual a la cantidad de minions abatidos.
 	*/
		
	method atacarOleada(oleada){
		if (oleada.estaAbatida()) { }
		else {
			//dineroDisponible += self.dineroGanadoEnTF(oleada)
			//lo calcula con otro metodo que se llama desde el item
			oleada.recibirAtaque(self)
		}
	}
	
	method ganarDinero(minionsEliminados) {
		dineroDisponible += minionsEliminados
		/* no se usa el setter por si se requiere cambiar el criterio */
	}
	
	method recibirAtaque(danio){
		if (bloqueosDisponibles >= 1) {
			bloqueosDisponibles -= 1
		}
		else{
			self.modificarDanio(danio)
		}
	}
	
	method modificarDanio(danio) {
		danioRecibido += danio 
	}
		
	method modificarBloqueo(bloqueos) {
		bloqueosDisponibles += bloqueos 
	}
	
	method puedeComprarItem(item) = self.dineroDisponible() >= item.precio()	
	
	method comprarItem(item){
		if (self.puedeComprarItem(item)) {
			self.equiparse(item)
			dineroDisponible -= item.precio()
		}
		else {
			throw new UserException("Saldo insuficiente")
		}
	}
	
	method venderItem(item){
		self.desequiparse(item)
		dineroDisponible += item.precio() / 2
	}
	
	method activarHabilidad(item){
		if (item.habilidadDisponible()) {
			item.activarHabilidad(self)
		}
	}
	
	method estaMuerto() = danioRecibido >= self.vida()
	
}

class UserException inherits wollok.lang.Exception {
	constructor(_mensaje) = super(_mensaje)
}

