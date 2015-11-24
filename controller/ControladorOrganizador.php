<?php

<<<<<<< HEAD

	loadclasses("model","Pincho.php");
	loadclasses("model","BD.php");
	loadclasses("model","JuradoProfesional.php");
	loadclasses("model","CodigoPincho.php");
	loadclasses("model", "Usuarios.php");
	


>>>>>>> origin/master

/*	public function revisarPinchos() {

	}

    public function recuperarPincho() {

    }

    public function seleccionarPropuesta() {

	}

    public function aceptarPropuesta() {

	}

    public function denegarPropuesta() {

	}

    public function registrarPincho() {

    }

    public function eliminarPincho() {

    }
    */

	function gestionarPropuesta($id,$a) {
		$datos = datosPropuestaGastronomica($id);
		$fila = mysqli_fetch_assoc($datos);
		$id = $fila["idpincho"];
		$nombre = $fila["nombrepincho"];
		$foto = $fila["fotopincho"];
		$descripcion = $fila["descripcionpincho"];
		$ingredientes = $fila["ingredientesp"];
		$precio = $fila["precio"];
		$pincho = new Pincho();
		return $pincho->modificar($id, $nombre, $foto, $descripcion, $ingredientes, $precio, $a);
	}

	function listarPinchosSinAceptar(){
		$pincho = new Pincho();
		$lista = $pincho->listarSinGestionar();
		return $lista;
	}

    function seleccionarFinalistas($num) {
		$pincho = new CodigoPincho();
		$res = $pincho->listarLikes($num);
		return $res;
	}

    function comprobarParticipantes($num) {
		$pincho = new Pincho();
		$res = $pincho->listar();
		if(mysqli_num_rows($res) >= $num) return true;
		else return false;
    }

    // public function elegirFinalistas() {
	//
    // }

    /* public function recuperarJuradoProfesional() {

    }*/

	function registrarJuradoProfesional() {
		$login = $_POST["loginjuradoprofesional"];
		$nombre = $_POST["nombrejuradoprofesional"];
		$email=$_POST["emailjuradoprofesional"];
		$password=$_POST["passwordjuradoprofesional"];
		$reconocimientos=$_POST["reconocimientos"];

		$usuario = new Usuarios();
		$juradoprofesional = new JuradoProfesional();
		$juradoprofesional->usuarios_login=$login;
		$juradoprofesional->nombrejuradoprofesional=$nombre;
		$juradoprofesional->recomientos=$reconocimientos;
		//$juradoprofesional->fotojuradoprofesional=$foto;
		$usuarios->insertar($login, $password, $email, "jpro");
		$juradoprofesional->insertar($juradoprofesional);
	}


	/*  Inserta una nueva tupla a la tabla votaprofesional por cada jurado asignado a un pincho
	*   Parametros:
	*		$idpincho - clave primaria del pincho a asignar.
	*		$loginsJuradoProfesional - array con los login de cada jurado
	*   Return: Devuelve TRUE si se han podido insertar los datos.
	*/
	function asignarPinchosJuradoProfesional($idpincho,$loginsJuradoProfesional) {
		$asignar = new VotaProfesional();
		$asignar->pincho_idpincho = $idpincho;
		foreach ($loginsJuradoProfesional as $login) {
			$asignar->juradoprofesional_usuarios_login = $login;
			$res = $asignar->insertar($asignar);
			if(!$res) return $res;
		}
		return $res;
	}

	function datosPropuestaGastronomica($id) {
		$pincho = new Pincho();
		$datos =  $pincho->recuperar($id);
		return $datos;
	}
// loadclasses("view","footer.html");
?>
