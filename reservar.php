<?php
$conexion = mysqli_connect("localhost", "root", "", "FlightSight");

$idvuelo = $_GET['id'];

// obtener asientos
$asientos = mysqli_query($conexion, "SELECT * FROM asiento");

// obtener tarifas
$tarifas = mysqli_query($conexion, "SELECT * FROM tarifa");

if($_POST){

    $dni = $_POST['dni'];
    $nombre = $_POST['nombre'];
    $asiento = $_POST['asiento'];
    $tarifa = $_POST['tarifa'];

    // verificar pasajero
    $verificar = mysqli_query($conexion, "SELECT * FROM pasajero WHERE idpasajero='$dni'");

    if(mysqli_num_rows($verificar) == 0){
        mysqli_query($conexion, "INSERT INTO pasajero 
        VALUES ('$dni','$nombre','','','','','2000-01-01','PE')");
    }

    // crear reserva
    mysqli_query($conexion, "INSERT INTO reserva (idpasajero, fecha, estado)
    VALUES ('$dni',NOW(),'ACTIVO')");

    $idreserva = mysqli_insert_id($conexion);

    // obtener tarifa
    $t = mysqli_fetch_assoc(mysqli_query($conexion, "SELECT * FROM tarifa WHERE idtarifa=$tarifa"));

    $precio = $t['precio_base'];
    $impuesto = $t['impuesto'];
    $total = $precio + $impuesto;

    // guardar detalle
    mysqli_query($conexion, "INSERT INTO detalle_reserva 
(idreserva, idvuelo, idasiento, idtarifa, precio_base, impuesto, descuento, total)
VALUES ($idreserva, $idvuelo, $asiento, $tarifa, $precio, $impuesto, 0, $total)");
    echo "<script>
window.location.href='pago.php?id=$idreserva';
</script>";
}
?>

<!DOCTYPE html>
<html>
<head>
<title>Reservar ✈️</title>

<style>
body {
    font-family: Arial;
    background: linear-gradient(to right, #2c003e, #6a0572);
    color: white;
    text-align: center;
}

.form {
    background: white;
    color: black;
    padding: 20px;
    margin: 50px auto;
    width: 350px;
    border-radius: 10px;
}

input, select {
    padding: 10px;
    margin: 10px;
    width: 80%;
}

button {
    padding: 10px;
    background: purple;
    color: white;
    border: none;
    cursor: pointer;
}

/* 🎯 ASIENTOS */
.asientos {
    display: grid;
    grid-template-columns: repeat(4, 60px);
    gap: 10px;
    justify-content: center;
    margin-top: 10px;
}

.asiento {
    padding: 10px;
    background: #ddd;
    border-radius: 5px;
    cursor: pointer;
}

input[type="radio"] {
    display: none;
}

input[type="radio"]:checked + .asiento {
    background: purple;
    color: white;
}
</style>

</head>

<body>

<h1>Reserva tu vuelo ✈️</h1>

<div class="form">

<form method="POST">

<input type="text" name="dni" placeholder="DNI" required>
<input type="text" name="nombre" placeholder="Nombre" required>

<p><b>Selecciona tu asiento</b></p>

<div class="asientos">

<?php while($a = mysqli_fetch_assoc($asientos)){ ?>
    <label>
        <input type="radio" name="asiento" value="<?php echo $a['idasiento']; ?>" required>
        <div class="asiento">
            <?php echo $a['fila'] . $a['letra']; ?>
        </div>
    </label>
<?php } ?>

</div>

<p><b>Tipo de tarifa</b></p>

<select name="tarifa" required>
<option value="">Seleccionar</option>
<?php while($t = mysqli_fetch_assoc($tarifas)){ ?>
<option value="<?php echo $t['idtarifa']; ?>">
<?php echo $t['clase']; ?>
</option>
<?php } ?>
</select>

<br>

<button type="submit">Confirmar Reserva</button>

</form>

</div>

</body>
</html>