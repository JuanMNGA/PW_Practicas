<?php
  include('funciones.php');
  conectar_bd();
?>
<html>
<head>
    <meta content="text/html"; charset="utf-8" http-equiv="content-type"/>
    <title>Programación web</title>
    
</head>
<body>
<?php
    echo '<form method="post" action=funciones.php>';
    $num_dim = obtener_secciones();
    for($dim_actual = 1; $dim_actual <= $num_dim; $dim_actual++){
      $preguntas = obtener_preguntas($dim_actual);
      switch($dim_actual){
        case 1:

        break;
        case 2:

        break;
        case 3:

        break;
        case 4:

        break;
        case 5:

        break;
      }
      for($i = 0; $i < mysql_num_rows($preguntas); $i++ ){
          $pregunta_actual = mysql_fetch_array($preguntas);
          echo $pregunta_actual["pregunta"]."<br>";
          switch($pregunta_actual["tipo"]){
            case 1:
              echo "<select name=\"pregunta$i+1\"><br><option value=\"1\">PAS<option value=\"2\">Profesor<option value=\"3\" checked>Estudiante</select><br>";
            break;
            case 2:
              $estudios = obtener_estudios();
              $num_estudios = mysql_num_rows($estudios);
              echo "<select name=\"pregunta$i+1\"><br>";
              for($j=0;$j<$num_estudios;$j++){
                $estudio_actual = mysql_fetch_array($estudios);
                echo "<option value=\"$j+1\">".$estudio_actual["nombre"];
              }
              echo '</select><br>';
            break;
            case 3:
              echo "<select name=\"pregunta$i+1\"><br><option value=\"1\">Biblioteca CASEM<option value=\"2\">Biblioteca ESI</select><br>";
            break;
            case 4:
              echo "<select name=\"pregunta$i+1\"><br><option value=\"1\" checked>Hombre<option value=\"2\">Mujer</select><br>";
            break;
            case 5:
              echo "<select name=\"pregunta$i+1\"><br><option value=\"1\" checked>0";
              for($j=1;$j<10;$j++){
                  echo "<option value=\"$j+1\">$j";
              }
              echo '<option value="11">NS/NC';
              echo '</select><br>';
            break;
            case 6:
              echo "<select name=\"pregunta$i+1\"><br><option value=\"1\" checked>18-24<option value=\"2\">25-31<option value=\"3\">32-60</select><br>";
            break;
            case 7:
              echo '<input type="text" name="observaciones" value="" size=150 maxlength=500><br>';
            break;
          }
      }
    }
      echo '<input type="submit" name="submit" value="Enviar">';
    echo '</form>';
?>
</body>
</html>