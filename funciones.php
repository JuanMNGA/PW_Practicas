<?php
	
	function conectar_bd(){
		$connection = mysql_connect("localhost","root","") or die ("No se puede conectar con el servidor.");
		mysql_select_db("encuesta_pw") or die ("No se puede conectar con la base de datos.");
	}

	function obtener_preguntas(){
		$consulta = mysql_query("");
	}

	function enviar_respuestas(){
		
	}

?>