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
	
	function obtener_secciones_numero(){
		$consulta = mysql_query("SELECT * FROM `secciones`");
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
	
	function obtener_nombre_estudios($id){
		conectar_bd();
		$consulta = mysql_query("SELECT * FROM `estudios` WHERE id='".$id."'");
		if(!$consulta){
			die('Invalid query: ' . mysql_error());
		}else{
			return $consulta;
		}
	}
	
	function obtener_pregunta_observaciones(){
		conectar_bd();
		$consulta = mysql_query("SELECT * FROM `preguntas` WHERE tipo=7");
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
		$id_estudio = $_POST['pregunta_estudios'];
		$nombre_estudios = mysql_fetch_array(obtener_nombre_estudios($id_estudio));
		$nombre_titulacion = $nombre_estudios["nombre"] ;
		$nombre_biblioteca = $_POST['pregunta_biblioteca'];
		$nombre_sexo = $_POST['pregunta_sexo'];
		$nombre_tipo_usuario = $_POST['pregunta_tipo_usuario'];
		$hora_com = $hora_fin = date("H:i:s");
		//La hora se puede obtener como: date("H:i:s");
		
		switch($nombre_biblioteca){
			case 1:
				$nombre_biblioteca = "Biblioteca CASEM";
			break;
			case 2:
				$nombre_biblioteca = "Biblioteca ESI";
			break;
		}
		switch($nombre_sexo){
			case 1:
				$nombre_sexo = "Hombre";
			break;
			case 2:
				$nombre_sexo = "Mujer";
			break;
		}
		switch($nombre_tipo_usuario){
			case 1:
				$nombre_tipo_usuario = "PAS";
			break;
			case 2:
				$nombre_tipo_usuario = "Profesor";
			break;
			case 3:
				$nombre_tipo_usuario = "Estudiante";
			break;
		}
		
		$consulta = mysql_query("INSERT INTO `encuestas_rellenas` (`id_estudios`,`hora_com`,`hora_fin`,`usuario`,`titulacion`,`biblioteca`,`sexo`) VALUES ('".$id_estudio."','".$hora_com."','".$hora_fin."','".$nombre_tipo_usuario."','".$nombre_titulacion."','".$nombre_biblioteca."','".$nombre_sexo."')");
		
		$last_encuesta_id =  mysql_insert_id();
		
		$num_dim = obtener_secciones_numero();
		$num_dimensiones = mysql_num_rows($num_dim);
    		for($dim_actual = 2; $dim_actual <= $num_dimensiones-1; $dim_actual++){
      			$preguntas = obtener_preguntas($dim_actual);
      			for($i = 1; $i <= mysql_num_rows($preguntas); $i++ ){
      				$pregunta_actual = mysql_fetch_array($preguntas);
          			$pregunta_id = $pregunta_actual["id"];
      				$frase = "pregunta_".$dim_actual."_".$i."";
      				$value_respuesta = $_POST[$frase];
      				
      				$consulta_respuestas = mysql_query("INSERT INTO `respuestas`(`id_encuesta_rellena`,`id_pregunta`,`respuesta`) VALUES ('".$last_encuesta_id."','".$pregunta_id."','".$value_respuesta."')");
      			}
      		}
      		$consulta_id_observaciones = obtener_pregunta_observaciones();
      		$fetch_id_observaciones = mysql_fetch_array($consulta_id_observaciones);
      		$id_observaciones = $fetch_id_observaciones["id"];
      		$value_respuesta = $_POST['observaciones'];
      		$consulta_observaciones = mysql_query("INSERT INTO `respuestas`(`id_encuesta_rellena`,`id_pregunta`,`respuesta`) VALUES ('".$last_encuesta_id."','".$id_observaciones."','".$value_respuesta."')");
      		
      	exit(header('Location: index.php'));
	}

?>
