package ar.edu.unsam.dieta.tp.model.app

import ar.tp.dieta.RepoRecetas
import ar.tp.dieta.Usuario
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable
import ar.tp.dieta.Receta
import java.util.List
import java.util.ArrayList
import ar.tp.dieta.RecetarioPublico

@Observable
@Accessors
class QueComemosAppModel {
	
	Usuario theUser
	String outputTituloGrilla
	Receta recetaSeleccionada
	List<Receta> recetasEnGrilla = new ArrayList<Receta>
	RecetarioPublico recetario = new RepoRecetas().getRecetarioPublico	//para cada login se crea nuevamente un recetario
														// aca juega lo de persistencia.
	List<String> temporadas = #["INVIERNO","OTOÑO","VERANO","PRIMAVERA","TODO EL AÑO"]
	List<String> dificultades = #["FACIL","MEDIANA","DIFICIL"]
	
	String conNombre
	String conDificultad
	String conIngrediente
	String conTemporada
	int caloriasInferior
	int caloriasSuperior
	boolean conFiltrosUsuario
	
	
	
	new(Usuario elUsr){
		theUser = elUsr
		recetasEnGrilla = this.decidirRecetas()
	}
	
	def decidirRecetas(){
		if(!theUser.sinFavoritas){ //Si hay recetas Favoritas.
			outputTituloGrilla = "Estas son tus recetas favoritas"
			theUser.getRecetasFavoritas()
		}
		else{
			if(!theUser.sinConsultadas){ //Si hay busquedas
				outputTituloGrilla = "Estas fueron tus últimas consultas"
				theUser.getUltimasConsultadas()
			}
			else{ //Si no hay recetas favoritas ni busquedas
				outputTituloGrilla = "Estas son las recetas top del momento"
				recetario.getRecetas()
			}
		}
	}
	
	def favearReceta(){
		theUser.favearReceta(recetaSeleccionada)
	}
	
	def vistaDetalle() {
		new VistaRecetaModel(theUser, recetaSeleccionada)
	}
	
	def ejecutarBusqueda() {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}
	
}