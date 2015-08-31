package ar.tp.dieta

import ar.tp.dieta.Accion
import queComemos.entrega3.repositorio.BusquedaRecetas
import java.util.List

class AgregaResultadosAFavoritos implements Accion {
	
	override execute(Usuario usuario, BusquedaRecetas busqueda, List<Receta> recetas) {
		if(usuario.resultadoDeConsultasAFavoritos){
			recetas.forEach[ receta | usuario.agregarRecetaFavorita(receta) ]
		}
	}
	
}