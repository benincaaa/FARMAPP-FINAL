<?php
$servidor = "localhost";
$usuario = "root";
$senha = "";
$banco = "farmacias";

$conn = mysqli_connect($servidor, $usuario, $senha, $banco);


if (!$conn) {
    die("Falha na conexão: " . mysqli_connect_error());
}
?>
