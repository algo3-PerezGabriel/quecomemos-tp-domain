package ar.tp.dieta

import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable

@Accessors
@Observable
class RepoDeUsuarios extends RepoRecetas{
	
	public Usuario tojo
	public Usuario juan
	public Usuario gabriel
	public Usuario miguel
	public Usuario carlos
	public Usuario manuel

	List<Receta> topTenConsultas

	Busqueda busquedaPorIngredienteCaro 

	new(){
		tojo = new UsuarioBuilder("Daniel Toja").peso(120.4).altura(1.89).fechaNacimiento(1992, 6, 4).sexo("M").rutina(new RutinaSedentaria).preferencia("carne").condicion(new CondicionHipertension).conRecetaFavorita(fideosConManteca).email("dtoja@unsam.edu.ar").build()
		juan = new UsuarioBuilder("Juan Cantarini").peso(80.0).altura(1.87).fechaNacimiento(1991, 8, 1).sexo("M").rutina(new RutinaSedentaria).email("jcantarini@unsam.edu.ar").build()
		gabriel = new UsuarioBuilder("Gabriel Perez").peso(88.4).altura(1.85).fechaNacimiento(1986, 7, 12).sexo("M").rutina(new RutinaActiva).condicion(new CondicionCeliaco).conRecetaFavorita(arrozConPollo).email("gperez@unsam.edu.ar").build()
		miguel = new UsuarioBuilder("Miguel Gagliardo").peso(95.4).altura(1.73).fechaNacimiento(1992, 6, 28).sexo("M").rutina(new RutinaActiva).preferencia("pescado").email("mgagliardo@unsam.edu.ar").build()
		carlos = new UsuarioBuilder("Carlos Lopez").peso(77.4).altura(1.68).fechaNacimiento(1992, 10, 25).sexo("M").rutina(new RutinaSedentaria).condicion(new CondicionDiabetes).conRecetaFavorita(gelatinaFrambuesa).email("clopez@unsam.edu.ar").build()
		manuel = new UsuarioBuilder("Manuel Scalabrini").peso(82.4).altura(1.95).fechaNacimiento(1992, 4, 1).sexo("M").rutina(new RutinaActiva).preferencia("verduras").condicion(new CondicionVegano).email("mscalabrini@unsam.edu.ar").build()

		gabriel =>[
			crearReceta("Pastel de papa", 1500, "Marcela", "Very dificult", "Hervir la papa, sellar la carne picada, mezclar ambas en una fuente y poner durante 40 minutos en el horno", "Todo el año", new IngredienteBuilder("carne picada").cantidad(500).build(), new IngredienteBuilder("papa").cantidad(300).build())
			crearReceta("Fideos con Tuco", 400, "Marcela", "Facil", "Hervir los fideos, mezclar con la salsa de tomate caliente.", "Todo el año", new IngredienteBuilder("fideos").cantidad(200).build(), new IngredienteBuilder("tomate").cantidad(300).build())
		]

		manuel =>[
			crearReceta("", 1500, "Marcela", "Very dificult", "Hervir la papa, sellar la carne picada, mezclar ambas en una fuente y poner durante 40 minutos en el horno", "Todo el año", new IngredienteBuilder("carne picada").cantidad(500).build(), new IngredienteBuilder("papa").cantidad(300).build())
			crearReceta("Fideos con Tuco", 400, "Marcela", "Facil", "Hervir los fideos, mezclar con la salsa de tomate caliente.", "Todo el año", new IngredienteBuilder("fideos").cantidad(200).build(), new IngredienteBuilder("tomate").cantidad(300).build())
		]
		
		miguel =>[
			crearReceta("Pastel de papa", 1500, "Marcela", "Very dificult", "Hervir la papa, sellar la carne picada, mezclar ambas en una fuente y poner durante 40 minutos en el horno", "Todo el año", new IngredienteBuilder("carne picada").cantidad(500).build(), new IngredienteBuilder("papa").cantidad(300).build())
			crearReceta("Fideos con Tuco", 400, "Marcela", "Facil", "Hervir los fideos, mezclar con la salsa de tomate caliente.", "Todo el año", new IngredienteBuilder("fideos").cantidad(200).build(), new IngredienteBuilder("tomate").cantidad(300).build())
		]


	}

}
/*	agregarFiltro(new FiltroExcesoDeCalorias) //Filtra las recetas que tienen 500 o menos cal
	
	
	new(){
		new RepoRecetas	//Creo las recetas usando la clase RepoRecetas del domain.
		theUser = new UsuarioBuilder("Marcela") //Creacion usuario Marcela
					.peso(120.4)
					.altura(1.75)
					.fechaNacimiento(1992, 6, 4)
					.sexo("F")
					.rutina(new RutinaActiva)
					.preferencia("carne")
					.preferencia("pescado")
					.email("mujersincondicion@test.com")
					//.conRecetaFavorita(gelatinaFrambuesa) Recetas favoritas del repo publico
					//.conRecetaFavorita(arrozConPollo)
					.build()
		theUser => [
			agregarBusqueda(busquedaPorIngredienteCaro)
			setRecetario(recetarioPublico)
			crearReceta("Pastel de papa", 1500, "Marcela", "Very dificult", "Hervir la papa, sellar la carne picada, mezclar ambas en una fuente y poner durante 40 minutos en el horno", "Todo el año", new IngredienteBuilder("carne picada").cantidad(500).build(), new IngredienteBuilder("papa").cantidad(300).build())
			crearReceta("Fideos con Tuco", 400, "Marcela", "Facil", "Hervir los fideos, mezclar con la salsa de tomate caliente.", "Todo el año", new IngredienteBuilder("fideos").cantidad(200).build(), new IngredienteBuilder("tomate").cantidad(300).build())
		]
		topTenConsultas = recetarioPublico.getRecetas
		*  */