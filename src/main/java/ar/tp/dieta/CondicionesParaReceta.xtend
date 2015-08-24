package ar.tp.dieta

import org.eclipse.xtend.lib.annotations.Accessors
import java.util.List
import java.util.ArrayList
import java.util.Iterator
import org.uqbar.commons.utils.Observable

@Observable
@Accessors
class CondicionesParaReceta {
	
	Receta receta
	List<Condicion> condiciones = new ArrayList<Condicion>
	
	new(Receta unaReceta){
		receta = unaReceta
		inicializarCondiciones()
	}
	
	def inicializarCondiciones() {
		condiciones.add(new CondicionCeliaco)
		condiciones.add(new CondicionHipertension)
		condiciones.add(new CondicionVegano)
		condiciones.add(new CondicionDiabetes)
	}
	
	def devolverListaString(){
		val Iterator<Condicion> condicionIter =
			condiciones.filter[condi | receta.soyInadecuadoParaCondicion(condi)].iterator()
		val List<String> condicionesListString = new ArrayList<String>
		while(condicionIter.hasNext){
			condicionesListString.add(condicionIter.next.getNombre)
		}
		condicionesListString
	}
	
}