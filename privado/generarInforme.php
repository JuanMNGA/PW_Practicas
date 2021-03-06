<?php
  include('../funciones.php');
  conectar_bd();
?>
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
		
					$usuario = $_POST['usuario'];
					$titulacion = $_POST['titulacion'];
					$biblioteca = $_POST['biblioteca'];
					$sexo = $_POST['sexo'];
							
					$consulta = obtener_informe($usuario, $titulacion, $biblioteca, $sexo);
											
					$resultado = mysql_query($consulta);
						 
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
					mysql_close ();
			?>
			
			<br>
			<a href="../index.php">Inicio</a>
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
        		<option value="PAS">PAS</option>
        		<option value="Profesor">Profesor</option>
        		<option value="Estudiante">Estudiante</option>
		</td>
		</tr>

		</table>

		<table>
		Titulación:             
		<td>
    		<select name="titulacion" size="1" style=" width:300px">
        		<option value="Grado en Ingeniería Informática">Grado en Ingeniería Informática</option>
        		<option value="Grado en Ingeniería Aeroespacial">Grado en Ingeniería Aeroespacial</option>
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
    	<a href="../index.php">Inicio</a>
    	<a href="estadisticas.php">Registros de encuestas</a>
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
