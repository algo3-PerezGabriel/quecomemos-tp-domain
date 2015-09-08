package ar.edu.unsam.dieta.tp.model.app

import ar.tp.dieta.RepoRecetas
import ar.tp.dieta.Usuario
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable
import ar.tp.dieta.Receta
import java.util.List
import java.util.ArrayList
import ar.tp.dieta.RecetarioPublico
import ar.tp.dieta.Busqueda
import ar.tp.dieta.Filtro
import ar.tp.dieta.FiltroPorTemporada

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
				recetario.getRecetas() //aca habría que hacer un recetario.getTopten() da igual para ejemplo
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
		outputTituloGrilla = "Resultado de la busqueda"
		val Busqueda busqueda = new Busqueda()
		busqueda.filtros = this.crearFiltros()
		
		recetasEnGrilla = busqueda.aplicarBusquedaUsuario(theUser, recetario.getRecetas)
		theUser.ultimasConsultadas = recetasEnGrilla
		//tiene que ejecutar la busqueda,
		// y dejar el resultado en recetasEnGrilla, tmb modificar el outputTituloGrilla
		// tambien, se graba el resultado en las ultimas buscadas del usuario (no funncionaria por no haber persistencia)
		
	}
	
	def crearFiltros() {// solamente le aplico un filtro
		var List<Filtro> filtros = 	new ArrayList<Filtro>
		
		filtros.add(new FiltroPorTemporada(conTemporada))
		
		filtros
	}
	
}