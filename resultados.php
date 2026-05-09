<?php
$conexion = mysqli_connect("localhost", "root", "", "FlightSight");

$origen = $_GET['origen'];
$destino = $_GET['destino'];

$sql = "SELECT v.idvuelo, v.fecha_salida, v.fecha_llegada, r.origen, r.destino
        FROM vuelo v
        JOIN ruta r ON v.idruta = r.idruta
        WHERE r.origen='$origen' AND r.destino='$destino'";

$resultado = mysqli_query($conexion, $sql);
?>

<!DOCTYPE html>
<html>
<head>
    <title>Resultados ✈️</title>

    <style>
        body {
            font-family: Arial;
            background: #f4f4f4;
        }

        .card {
            background: white;
            padding: 15px;
            margin: 20px;
            border-radius: 10px;
        }

        button {
            padding: 10px;
            background: purple;
            color: white;
            border: none;
        }
    </style>
</head>

<body>

<h2 style="text-align:center;">Vuelos disponibles ✈️</h2>

<?php
while($fila = mysqli_fetch_assoc($resultado)){
?>

<div class="card">
    ✈️ Vuelo disponible <br>
    <?php echo $origen; ?> → <?php echo $destino; ?><br>
    Salida: <?php echo $fila['fecha_salida']; ?><br>
    Llegada: <?php echo $fila['fecha_llegada']; ?><br><br>

    <button onclick="window.location.href='reservar.php?id=<?php echo $fila['idvuelo']; ?>'">
        Reservar
    </button>
</div>

<?php } ?>

</body>
</html>