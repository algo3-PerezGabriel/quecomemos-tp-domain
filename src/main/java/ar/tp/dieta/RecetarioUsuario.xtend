package ar.tp.dieta

import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable

@Accessors
@Observable
class RecetarioUsuario {

	Usuario Marcela = new UsuarioBuilder("Marcela").peso(60.4).altura(1.83).fechaNacimiento(1992, 6, 4).sexo("F").rutina(new RutinaActiva).preferencia("carne").preferencia("pescado").email("mujersincondicion@test.com").build()

	Receta arrozConPollo = new RecetaBuilder("Arroz Blanco")
			.calorias(10).autor("Antonio Gasalla")
			.dificultad("Facil")
			.procesoPreparacion("Hervir el arroz. Comer.")
			.temporada("Invierno")
			.agregarIngrediente(new IngredienteBuilder("Arroz Blanco").cantidad(500).build())
			.agregarIngrediente(new IngredienteBuilder("Pollo Entero").cantidad(1).build())
			.agregarCondimento(new IngredienteBuilder("sal").build())
			.agregarCondimento(new IngredienteBuilder("Aceite").build())
			.agregarCondimento(new IngredienteBuilder("Azafrán").build())
			.build()
			
	
	def getFavorita(){
		Marcela.contenesEstaRecetaEnFavs(arrozConPollo.nombreDeLaReceta)
	}

	def setFavorita(){
		Marcela.agregarRecetaFavorita(arrozConPollo.nombreDeLaReceta)		
	}

}