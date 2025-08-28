<?php
include('conexao.php');

$rede = $_GET['rede'];
?>

<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <title><?php echo $rede; ?> - Farmapp</title>
    <style>
        body { font-family: Arial; background:rgb(236, 241, 236); }
        .container { max-width: 900px; margin: auto; background: white; padding: 20px; border-radius: 10px; }
        .farmacia { border: 1px solid #ccc; padding: 10px; border-radius: 8px; margin-bottom: 10px; background:hsl(0, 0.00%, 100.00%); }
        .farmacia h2 { margin: 0; color:rgb(19, 143, 11); }
        .farmacia p { margin: 4px 0; }
        .voltar { display: inline-block; margin-bottom: 15px; background:rgb(19, 143, 11); color: white; padding: 10px 20px; border-radius: 8px; text-decoration: none; }
        .voltar:hover { background:rgb(19, 143, 11); }
        .btn-visualizar {
            display: block;
            background:rgb(19, 143, 11); 
            color: white;
            text-decoration: none;
            padding: 15px 40px;
            border-radius: 10px;
            width: 80px;
            font-weight: bold;
            font-size: 15px;
            margin-left: 700px;
        }
    </style>
</head>
<body>

<div class="container">
    <a href="index.php" class="voltar">Voltar</a>
    <h1>Farmácias <?php echo $rede; ?></h1>

    <?php
    $sql = "SELECT * FROM farmacias AS f INNER JOIN enderecos AS e ON f.id = e.farmacia_id WHERE rede = '$rede' ;";

    $result = mysqli_query($conn, $sql);

    if (mysqli_num_rows($result) > 0) {
        while ($linha = mysqli_fetch_assoc($result)) {
            echo '<pre>';
            print_r($linha);
            echo '</pre>';
            echo "<div class='farmacia'>";
            echo "<h2>" . $linha['nome'] . "</h2>";
            echo "<p><strong>Endereço:</strong> " . $linha['logradouro'] . "</p>";
            echo "<p><strong>Telefone:</strong> " . $linha['telefone'] . "</p>";
            echo "<p><strong>Horário:</strong> " . $linha['horario'] . "</p>";
            echo "<p><strong>Serviços:</strong> " . $linha['servicos'] . "</p>";
            echo "<a href='detalhes.php?id=" . $linha['id'] . "' class='btn-visualizar'>Visualizar</a>";
            echo "</div>";
        }
    } else {
        echo "<p>Nenhuma farmácia encontrada.</p>";
    }

    mysqli_close($conn);
    
    ?>
</div>




</body>
</html>
