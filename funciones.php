<?php

	if(isset($_POST['submit'])){
		switch($_POST['submit']){
			case 'Enviar':
				enviar_todo();
				break;
		}
	}	
	
	function conectar_bd(){
		//echo "Conectada";
		$connection = mysql_connect("localhost","root","") or die ("No se puede conectar con el servidor.");
		mysql_select_db("encuesta_pw") or die ("No se puede conectar con la base de datos.");
		mysql_query("SET NAMES 'UTF8'");
	}

	function insertar_nueva_encuesta($id_estudio){
		$consulta = mysql_query("INSERT INTO `encuestas_rellenas`(`id_estudios`) VALUES ('".$id_estudio."')");
	}

	function obtener_secciones(){
		$consulta = mysql_query("SELECT count(*) FROM `secciones`");
		return $consulta;
	}

	function obtener_preguntas($dimension){
		$consulta = mysql_query("SELECT * FROM `preguntas` WHERE id_dimension='".$dimension."'");
		return $consulta;
	}

	function obtener_estudios(){
		$consulta = mysql_query("SELECT * FROM `estudios`");
		return $consulta;
	}

	function enviar_respuestas($id_encuesta, $id_pregunta, $respuesta){
		$consulta = mysql_query("INSERT INTO `respuestas`(`id_encuesta_rellena`,`id_pregunta`,`respuesta`) VALUES ('".$id_encuesta."','".$id_pregunta."','".$respuesta."')");
	}

	function existe_admin($user, $pass){
		$query = "SELECT * FROM `acceso` WHERE usuario='".$user."' and password='".$pass."'";
		$consulta = mysql_query($query);
		return mysql_num_rows($consulta);	
	}

	function obtener_estadisticas(){
		$consulta = "SELECT * FROM encuestas_rellenas ORDER BY id ASC";
		return $consulta;
	}
	
	function obtener_informe($usuario, $titulacion, $biblioteca, $sexo){
		$consulta = "SELECT respuestas.id_pregunta,preguntas.pregunta,count(respuestas.id_pregunta),sum(respuestas.respuesta)/count(respuestas.id_pregunta) FROM respuestas,preguntas,encuestas_rellenas WHERE respuestas.id_pregunta=preguntas.id AND respuestas.id_encuesta_rellena=encuestas_rellenas.id AND encuestas_rellenas.usuario='$usuario' AND encuestas_rellenas.titulacion='$titulacion' AND encuestas_rellenas.biblioteca='$biblioteca' AND encuestas_rellenas.sexo='$sexo'GROUP BY id_pregunta";
		return $consulta;
	}

	function enviar_todo(){
		echo "HOLA";
	}

?>