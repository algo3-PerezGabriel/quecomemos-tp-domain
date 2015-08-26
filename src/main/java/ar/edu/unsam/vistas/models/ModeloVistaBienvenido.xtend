package ar.edu.unsam.vistas.models

import org.uqbar.commons.utils.Observable
import ar.tp.dieta.Usuario
import ar.tp.dieta.Receta
import java.util.ArrayList
import java.util.List

@Observable
class ModeloVistaBienvenido {
	
	Usuario elUsuario
	List<Receta> recetasAMostrar = new ArrayList<Receta> //para poobar se puede forzar
	
	new(){
		//acá se instancia el usuario
		//se puede instanciar recetasAMostrar para probar la grilla etc.
	}
	
	def getUltimasConsultadas(){
		//Devuelve las ultimas 10 recetass de la lista de favoritas del usuario, de no tener:
		//Devuelve las ultimas que consulto (10) de no haber:
		//Devuelve las 10 mas consultadas en el sistema.
	}
	
	def marcarFavorita(Receta unaReceta){
		elUsuario.agregarFavorita(unaReceta) //hay que resolver este  metodo en Usuario (agregarlo)
	}
	
	def getTituloGrilla(){
		//el titulo depende de qué va a mostrar la grilla utiliza la misma logica
		// y muestra un titulo para cada caso
		
	}
}