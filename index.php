<?php
$conexion = mysqli_connect("localhost", "root", "", "FlightSight");

$aeropuertos = mysqli_query($conexion, "SELECT * FROM aeropuerto");
?>

<!DOCTYPE html>
<html>
<head>
    <title>FlightSight ✈️</title>

    <style>
        body {
            margin: 0;
            font-family: Arial;
            background: linear-gradient(to right, #2c003e, #6a0572);
            color: white;
        }

        .header {
            padding: 20px;
            font-size: 24px;
            font-weight: bold;
        }

        .contenedor {
            text-align: center;
            margin-top: 80px;
        }

        .buscador {
            background: white;
            color: black;
            padding: 20px;
            border-radius: 10px;
            display: inline-block;
        }

        select, button {
            padding: 10px;
            margin: 10px;
            font-size: 16px;
        }

        button {
            background: #6a0572;
            color: white;
            border: none;
            cursor: pointer;
        }
    </style>
</head>

<body>

<div class="header">
    ✈️ FlightSight
</div>

<div class="contenedor">
    <h1>Busca tu vuelo</h1>

    <form action="resultados.php" method="GET">
        <div class="buscador">

            <select name="origen" required>
                <option value="">Origen</option>
                <?php while($a = mysqli_fetch_assoc($aeropuertos)) { ?>
                    <option value="<?php echo $a['idaeropuerto']; ?>">
                        <?php echo $a['ciudad']; ?>
                    </option>
                <?php } ?>
            </select>

            <?php
            $aeropuertos2 = mysqli_query($conexion, "SELECT * FROM aeropuerto");
            ?>

            <select name="destino" required>
                <option value="">Destino</option>
                <?php while($a = mysqli_fetch_assoc($aeropuertos2)) { ?>
                    <option value="<?php echo $a['idaeropuerto']; ?>">
                        <?php echo $a['ciudad']; ?>
                    </option>
                <?php } ?>
            </select>

            <br>

            <button type="submit">Buscar vuelos</button>

        </div>
    </form>

</div>

</body>
</html>