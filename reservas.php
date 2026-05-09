<?php
$conexion = mysqli_connect("localhost", "root", "", "FlightSight");

$idruta = $_GET['id'];

if($_POST){

    $dni = $_POST['dni'];
    $nombre = $_POST['nombre'];

    mysqli_query($conexion, "INSERT INTO pasajero 
    (idpasajero, nombre, apaterno, amaterno, telefono, mail, fecha_nac, idpais)
    VALUES ('$dni','$nombre','','','','','2000-01-01','PE')");

    mysqli_query($conexion, "INSERT INTO reserva 
    (idreserva, idpasajero, fecha, estado)
    VALUES (NULL,'$dni',NOW(),'ACTIVO')");

    echo "Reserva creada 😎";
}
?>

<!DOCTYPE html>
<html>
<head>
    <title>Reservar</title>
</head>

<body>

<h2>Completa tus datos ✈️</h2>

<form method="POST">
    DNI: <input type="text" name="dni" required><br><br>
    Nombre: <input type="text" name="nombre" required><br><br>

    <button type="submit">Confirmar reserva</button>
</form>

</body>
</html>