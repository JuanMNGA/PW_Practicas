<html>
<head>
    <meta content="text/html"; charset="utf-8" http-equiv="content-type"/>
	<title>Estadisticas</title>
</head>

	<body>
			<h1>Estadísticas</h1>
			<?php
				error_reporting(E_ALL & ~E_NOTICE & ~E_DEPRECATED);

				// Conectar con el servidor de base de datos
				$conexion = @mysql_connect ("localhost", "root", "150787")
					or die ("No se puede conectar con el servidor");

				// Seleccionar base de datos
				mysql_select_db ("encuesta_pw")
					or die ("No se puede seleccionar la base de datos");
				 
				mysql_query("SET NAMES 'UTF8'");
			
				// Enviar consulta
				$consulta="SELECT * FROM encuestas_rellenas ORDER BY id ASC";
				$resultado = mysql_query($consulta, $conexion);					 
					 
				if ($row = mysql_fetch_array($resultado))
				{ 
					echo "<table border = '1'> \n"; 
					echo "<tr class=Arriba><td>id</td><td>id estudios</td><td>Usuario</td><td>Titulación</td><td>Biblioteca</td><td>Sexo</td><td>Hora de comienzo</td><td>Hora de finalización</td></tr> \n"; 
					
					do { 
						echo "<tr><td>".$row[0]."</td><td>".$row[1]."</td><td>".$row[4]."</td><td>".$row[5]."</td><td>".$row[6]."</td><td>".$row[7]."</td><td>".$row[2]."</td><td>".$row[3]."</td></tr> \n"; 
					} while ($row = mysql_fetch_array($resultado)); 
					
					echo "</table>\n"; 
				} 
				else { 
					echo "¡No se ha encontrado ningún registro!"; 
				}
				
				// Cerrar conexión
				mysql_close ($conexion);
			?>
			<center>
			<br>
			<a href="index.php">Inicio</a>
			<a href="generarInforme.php">Generar Informe</a>	
			</center>
  </body>
</html>
				