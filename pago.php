<?php
$conexion = mysqli_connect("localhost", "root", "", "FlightSight");

$idreserva = $_GET['id'];

// obtener métodos
$metodos = mysqli_query($conexion, "SELECT * FROM metodo_pago");

// obtener total desde detalle
$detalle = mysqli_fetch_assoc(mysqli_query($conexion, "
SELECT total FROM detalle_reserva WHERE idreserva=$idreserva
"));

$total = $detalle['total'];

if($_POST){

    $metodo = $_POST['metodo'];

    mysqli_query($conexion, "INSERT INTO pago 
    (idreserva, idmetodo, fecha, monto, moneda, estado)
    VALUES ($idreserva, $metodo, NOW(), $total, 'PEN', 'PAGADO')");

    echo "<h2 style='color:green;'>✅ Pago realizado con éxito 💳</h2>";
}
?>

<!DOCTYPE html>
<html>
<head>
<title>Pago</title>

<style>
body {
    font-family: Arial;
    background: linear-gradient(to right, #2c003e, #6a0572);
    color: white;
    text-align: center;
}

.box {
    background: white;
    color: black;
    padding: 20px;
    margin: 50px auto;
    width: 300px;
    border-radius: 10px;
}

select, button {
    padding: 10px;
    margin: 10px;
    width: 80%;
}
</style>

</head>

<body>

<h1>Pago de tu vuelo 💳</h1>

<div class="box">

<p>Total a pagar: <b>S/ <?php echo $total; ?></b></p>

<form method="POST">

<select name="metodo" required>
<option value="">Selecciona método</option>
<?php while($m = mysqli_fetch_assoc($metodos)){ ?>
<option value="<?php echo $m['idmetodo']; ?>">
<?php echo $m['descripcion']; ?>
</option>
<?php } ?>
</select>

<br>

<button type="submit">Pagar</button>

</form>

</div>

</body>
</html>