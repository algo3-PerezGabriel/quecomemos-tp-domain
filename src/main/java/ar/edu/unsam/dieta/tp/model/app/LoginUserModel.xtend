package ar.edu.unsam.dieta.tp.model.app

import ar.tp.dieta.RepoDeUsuarios
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable
import ar.tp.dieta.Usuario

@Accessors
@Observable
class LoginUserModel {
	
	RepoDeUsuarios repoUsuarios = new RepoDeUsuarios
	
	String nombreUsuario
	String passUsuario
	Usuario elUsuario
	
	def validarLogin() { //habría que laburarlo con excepciones para atrapar los errores
		//aca que abra la ventana etc.
		elUsuario = repoUsuarios.logearUsuario(nombreUsuario, passUsuario)
		 //esto devolvería el usuario o la excepcion
		new QueComemosAppModel(elUsuario)
	}
	
}