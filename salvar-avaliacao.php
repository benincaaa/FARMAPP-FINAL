<?php
include 'conexao.php';

$farmacia_id = $_POST ['farmacia_id'];
$nome = $_POST ['nome_usuario'];
$nota = $_POST ['nota'];
$comentario = $_POST ['comentario'];

$sql = "INSERT INTO avaliacoes (farmacia_id, nome_usuario, nota, comentario)
        VALUES ('$farmacia_id', '$nome', '$nota', '$comentario')";

if (mysqli_query($conn, $sql)) {
    header("Location: detalhes.php?id=$farmacia_id");
    exit;
} else {
    echo "Erro ao salvar avaliação: " . mysqli_error($conn);
}
?>