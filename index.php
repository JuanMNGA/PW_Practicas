<?php
  include('funciones.php');
  conectar_bd();
?>
<html>
<head>
    <meta content="text/html"; charset="utf-8" http-equiv="content-type"/>
    <title>Programación web</title>
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <h1 align="center">Encuesta de satisfacción del servicio de biblioteca</h1>
    <a  style="float: right;" class="btn btn-default" href="privado/generarInforme.php" role="button">Informe</a>
    <a  style="float: right;" class="btn btn-default" href="privado/estadisticas.php" role="button">Estadísticas</a>
    <a  style="float: right;" class="btn btn-default" href="#" role="button">Encuesta</a>
    <br>
    <br>
    <br>
</head>
<body>
<?php
    echo '<form method="post" action=funciones.php>';
    $num_dim = obtener_secciones();
    for($dim_actual = 1; $dim_actual <= $num_dim; $dim_actual++){
      $preguntas = obtener_preguntas($dim_actual);
      echo "<div align=\"center\"class=\"form_group\">";
      switch($dim_actual){
        case 1:
		echo "<label align=\"center\" class=\"btn-lg bg-primary\">Datos personales</label>";
        break;
        case 2:
		echo "<label align=\"center\" class=\"btn-lg bg-primary\">Personal de biblioteca</label>";
        break;
        case 3:
		echo "<label align=\"center\" class=\"btn-lg bg-primary\">Infraestructura</label>";
        break;
        case 4:
		echo "<label align=\"center\" class=\"btn-lg bg-primary\">Recursos</label>";
        break;
        case 5:
		echo "<label align=\"center\" class=\"btn-lg bg-primary\">Observaciones</label>";
        break;
      }
      echo "</div>";
      for($i = 1; $i <= mysql_num_rows($preguntas); $i++ ){
          $pregunta_actual = mysql_fetch_array($preguntas);
          $pregunta_texto = $pregunta_actual["pregunta"];
          echo "<div align=\"center\"class=\"form_group\"><label for=\"exampleInputEmail1\">$pregunta_texto</label>";
          switch($pregunta_actual["tipo"]){
            case 1:
              echo "<select name=\"pregunta_tipo_usuario\" class=\"form-control\"><br><option value=\"1\">PAS<option value=\"2\">Profesor<option value=\"3\" checked>Estudiante</select><br>";
            break;
            case 2:
              $estudios = obtener_estudios();
              $num_estudios = mysql_num_rows($estudios);
              echo "<select name=\"pregunta_estudios\" class=\"form-control\"><br>";
              for($j=1;$j<=$num_estudios;$j++){
                $estudio_actual = mysql_fetch_array($estudios);
                echo "<option value=\"$j\">".$estudio_actual["nombre"];
              }
              echo '</select><br>';
            break;
            case 3:
              echo "<select name=\"pregunta_biblioteca\" class=\"form-control\"><br><option value=\"1\">Biblioteca CASEM<option value=\"2\">Biblioteca ESI</select><br>";
            break;
            case 4:
              echo "<select name=\"pregunta_sexo\" class=\"form-control\"><br><option value=\"1\" checked>Hombre<option value=\"2\">Mujer</select><br>";
            break;
            case 5:
            	$frase = $dim_actual."_".$i;
              echo "<select name=\"pregunta_$frase\" class=\"form-control\"><br><option value=\"1\" checked>0";
              for($j=1;$j<=10;$j++){
                  echo "<option value=\"$j\">$j";
              }
              echo '<option value="11">NS/NC';
              echo '</select><br>';
            break;
            case 6:
              echo "<select name=\"pregunta_edad\" class=\"form-control\"><br><option value=\"1\" checked>18-24<option value=\"2\">25-31<option value=\"3\">32-60</select><br>";
            break;
            case 7:
              echo '<input type="text" class="form-control" name="observaciones" value="" size=150 maxlength=500><br>';
            break;
          }
      }
    }
      echo '<input type="submit" name="submit" class="btn btn-primary btn-lg" value="Enviar">';
    echo '</form>';
?>
</body>
</html>
