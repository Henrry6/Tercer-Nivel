<html>
  <div>
    <h1>Conexion a base de datos</h1>
  </div>
<?php

class conexion {
  private $user = "root";
  private $pass = "";
  
  function coenctar () {
    try {
      $pdo = new PDO('mysql:host=localhost;dbname=test', $this->user, $this->pass);
      echo "Conexion correcta";
    }catch (PDOException  $error) {
      echo "No se pudo conectar" . $error->getMessage();
    }
  }
}
$nuevaconexion = new conexion();
$nuevaconexion->coenctar();


?>
</html>