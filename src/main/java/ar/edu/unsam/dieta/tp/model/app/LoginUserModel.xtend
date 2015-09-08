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
	
	def validarLogin() {
		//aca que abra la ventana etc.
		elUsuario = repoUsuarios.logearUsuario(nombreUsuario, passUsuario)
		 //esto devuelve el usuario o error
		new QueComemosAppModel(elUsuario)
	}
	
}