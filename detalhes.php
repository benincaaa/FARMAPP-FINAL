<?php
include('conexao.php');
$id = $_GET['id'];

$sql = "SELECT * FROM farmacias WHERE id = $id";
$result = mysqli_query($conn, $sql);
$farmacia = mysqli_fetch_assoc($result);
?>

<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <title><?php echo $farmacia['nome']; ?> - Detalhes</title>

    <style>
        body { background: #f1f1f1; font-family: Arial; }
    .container { max-width: 900px; margin: auto; background: white; padding: 20px; border-radius: 10px; }
    img { width: 100%; max-width: 600px; border-radius: 10px; }
    .avaliacao { font-size: 24px; color: #FFD700; }
    table { border: 1px solid #ccc; border-collapse: collapse; width: 100%; margin-top: 15px;}
    td, th { border: 1px solid #ccc; padding: 8px; text-align: center; }
    .voltar { display: inline-block; margin-bottom: 15px;  background-color: #009933;; color: white; padding: 10px 20px; border-radius: 8px; text-decoration: none; }
    .voltar:hover {background-color: #009933;}
    .btn-mapa { display: inline-block; margin-bottom: 15px;  background-color: #009933;; color: white; padding: 10px 20px; border-radius: 8px; text-decoration: none}

   </style>
    <div class="container">
    <a href="index.php" class="voltar">Voltar</a>
    <h1><?php echo $farmacia['nome']?></h1>

    <p><strong>Endereço:</strong> <?php echo $farmacia['endereco']; ?></p>
    <p><strong>Telefone:</strong> <?php echo $farmacia['telefone']; ?></p>
    <p><strong>Horário:</strong> <?php echo $farmacia['horario']; ?></p>
    <p><strong>Serviços:</strong> <?php echo $farmacia['servicos']; ?></p>
    <a href="https://www.google.com/maps/search/?api=1&query=<?php echo urlencode($farmacia['endereco']); ?>" 
   target="_blank" 
   class="btn-mapa">Ver no Mapa</a>
   <hr>
<h2>Deixe sua Avaliação</h2>

<style>
.form-avaliacao label {
    font-weight: bold;
    display: block;
    margin-top: 15px;
    color: #333;
}

.form-avaliacao input[type="text"],
.form-avaliacao select,
.form-avaliacao textarea {
    width: 100%;
    padding: 10px;
    margin-top: 5px;
    border: 1px solid #ccc;
    border-radius: 6px;
    box-sizing: border-box;
    font-size: 15px;
    background: #fff;
}

.form-avaliacao textarea {
    resize: vertical;
}

.form-avaliacao button {
    margin-top: 20px;
    background-color: #009933;
    color: white;
    border: none;
    padding: 12px 20px;
    border-radius: 8px;
    cursor: pointer;
    font-size: 16px;
   
}

.form-avaliacao button:hover {
    background-color: #007a29;
}
</style>

<form action="salvar-avaliacao.php" method="POST" class="form-avaliacao">
    <input type="hidden" name="farmacia_id" value="<?php echo $farmacia['id']; ?>">

    <label for="nome_usuario">Seu nome:</label>
    <input type="text" id="nome_usuario" name="nome_usuario" required>

    <label for="nota">Nota (1 a 5):</label>
    <select name="nota" id="nota" required>
        <option value="">Selecione</option>
        <?php for ($i = 1; $i <= 5; $i++) echo "<option value='$i'>$i</option>"; ?>
    </select>

    <label for="comentario">Comentário (opcional):</label>
    <textarea name="comentario" id="comentario" rows="4" placeholder="Deixe sua opinião..."></textarea>

    <button type="submit">Enviar Avaliação</button>
</form>


<style>
.card-avaliacao {
    background: #f9f9f9;
    border: 1px solid #ccc;
    border-radius: 10px;
    padding: 15px;
    margin-bottom: 15px;
}
.stars {
    color: #FFD700;
    font-size: 18px;
}
.avaliador {
    font-weight: bold;
    color: #333;
}
.data {
    font-size: 12px;
    color: #777;
}
</style>

<h2>Avaliações Recentes</h2>

<?php
$sql_aval = "SELECT * FROM avaliacoes WHERE farmacia_id = $id ORDER BY data DESC";
$res_aval = mysqli_query($conn, $sql_aval);

if (!$res_aval) {
    echo "<p style='color: red;'>Erro na consulta de avaliações: " . mysqli_error($conn) . "</p>";
} elseif (mysqli_num_rows($res_aval) > 0) {
    while ($aval = mysqli_fetch_assoc($res_aval)) {
        echo "<div class='card-avaliacao'>";
        echo "<p class='avaliador'>{$aval['nome_usuario']} - ";
        
        // Estrelas
        echo "<span class='stars'>";
        for ($i = 1; $i <= 5; $i++) {
            echo $i <= $aval['nota'] ? "★" : "☆";
        }
        echo "</span></p>";
        
        if (!empty($aval['comentario'])) {
            echo "<p><em>\"{$aval['comentario']}\"</em></p>";
        }

        echo "<p class='data'>" . date('d/m/Y H:i', strtotime($aval['data'])) . "</p>";
        echo "</div>";
    }
} else {
    echo "<p>Esta farmácia ainda não possui avaliações.</p>";
}
?>
