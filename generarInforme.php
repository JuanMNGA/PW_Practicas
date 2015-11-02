<html>
<head>
    <meta content="text/html"; charset="utf-8" http-equiv="content-type"/>
    <title>Programación web</title>  
</head>
<body>
	<center>
		<h1>Informe Universidad de Cádiz</h1>
		<h3>Preguntas relativas a la satisfaccion general que se tiene sobre la biblioteca.</h3>
		<form method=post action=generarInforme.php>

			<?php
				error_reporting(E_ALL & ~E_NOTICE & ~E_DEPRECATED);
				$enviar = $_POST['enviar'];
				
				if (isset($enviar))
				{

					// Conectar con el servidor de base de datos
					$conexion = @mysql_connect ("localhost", "root", "150787")
				 		or die ("No se puede conectar con el servidor");

					// Seleccionar base de datos
					mysql_select_db ("encuesta_pw")
				 		or die ("No se puede seleccionar la base de datos");
				 		
				 	mysql_query("SET NAMES 'UTF8'");
		
					// Enviar consulta
					$usuario = $_POST['usuario'];
					$titulacion = $_POST['titulacion'];
					$biblioteca = $_POST['biblioteca'];
					$sexo = $_POST['sexo'];
							
					$consulta = "SELECT respuestas.id_pregunta,preguntas.pregunta,count(respuestas.id_pregunta),sum(respuestas.respuesta)/count(respuestas.id_pregunta) 
										FROM respuestas,preguntas,encuestas_rellenas 
										WHERE respuestas.id_pregunta=preguntas.id AND respuestas.id_encuesta_rellena=encuestas_rellenas.id 
										AND encuestas_rellenas.usuario='$usuario'
										AND encuestas_rellenas.titulacion='$titulacion'
										AND encuestas_rellenas.biblioteca='$biblioteca'
										AND encuestas_rellenas.sexo='$sexo'
										GROUP BY id_pregunta";
														
					$resultado = mysql_query($consulta, $conexion);
						 
					if ($row = mysql_fetch_array($resultado))
					{ 
						echo "<table border = '1'> \n"; 
						echo "<tr class=Arriba><td>Id</td><td>Pregunta</td><td>Numero de respuestas</td><td>Nota Media</td></tr> \n"; 
						
						do { 
							echo "<tr><td>".$row[0]."</td><td class=pregunta>".$row[1]."</td><td>".$row[2]."</td><td>".$row[3]."</td></tr> \n"; 
						} while ($row = mysql_fetch_array($resultado)); 
						
						echo "</table> \n"; 
					} 
					else { 
						echo "¡No se ha encontrado ningún registro!"; 
					} 

					// Cerrar conexión
					mysql_close ($conexion);
			?>
			
			<br>
			<a href="index.php">Inicio</a>
			<a href="generarInforme.php">Seleccionar opciones</a>
			<a href="estadisticas.php">Estadisticas</a>	
			
			<?php
				}
				else{
			?>	

	<table>
		<P>Selecciona la información necesaria para generar el informe deseado:</P>
		<tr>
		Tipo de usuario:                  
		<td>
    		<select name="usuario" size="1" style=" width:300px">
        		<option value="APS">APS</option>
        		<option value="Profesor">Profesor</option>
        		<option value="Estudiante">Estudiante</option>
		</td>
		</tr>

		</table>

		<table>
		Titulación:             
		<td>
    		<select name="titulacion" size="1" style=" width:300px">
        		<option value="Grado en Ingeniería informática">Grado en Ingeniería informática</option>
		</td>
		</tr>
		</table>

		<table>
		Biblioteca a evaluar          
		<td>
    		<select name="biblioteca" size="1" style=" width:300px">
        		<option value="Biblioteca CASEM">Biblioteca CASEM</option>
        		<option value="Biblioteca ESI">Biblioteca ESI</option>
		</td>
		</tr>
		</table>

		<table>
		Sexo:           
		<td>
   			<select name="sexo" size="1" style=" width:300px">
    			<option value="Hombre">Hombre</option>
        		<option value="Mujer">Mujer</option>
		</td>
		</tr>
		</table>

		<div id="Finalizar">
		<table width="50%" border="0" align="center" cellpadding="10" cellspacing="0">
		<tr>            
		<td><div align="center">
		<input type="submit" name="enviar" value="Enviar formulario">
    	<br><br>
    	<a href="index.php">Inicio</a>
    	<a href="estadisticas.php">Estadisticas</a>
		<br>
		</div></td>
            
		</tr>
		</table>
		</div>

		<?php
		}
		?>
</body>
</html>