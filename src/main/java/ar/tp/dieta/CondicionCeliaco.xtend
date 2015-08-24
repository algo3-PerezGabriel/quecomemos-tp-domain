package ar.tp.dieta

import ar.tp.dieta.Condicion
import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class CondicionCeliaco extends Condicion {

	new (){
		nombre = "celiaco"
	}
	
	override esCeliaco() {
		true
	}
	
	override ingredienteEsInadecuado(ElementoDeReceta unElemento) {
		false
	}
		
}