package ar.edu.unsam.dieta.tp.model.app

import ar.tp.dieta.Receta
import ar.tp.dieta.Usuario
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable

@Accessors
@Observable
class VistaRecetaModel {

	Usuario elUsuario = new Usuario
	boolean esFavorita
	Receta laReceta = new Receta()
	
	new(Usuario unUsuario,Receta unaReceta){
		elUsuario = unUsuario
		esFavorita = unUsuario.tieneFavorita(unaReceta)
		laReceta = unaReceta
	}
	
	def setEsFavorita(){
		elUsuario.favearReceta(laReceta)
		esFavorita = elUsuario.tieneFavorita(laReceta)
	}
	
}