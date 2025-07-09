<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <title>FARMAPP</title>
    <link rel="stylesheet" href="home.css">
    <link rel="shortcut icon" href="favicon.ico" type="image/x-icon">
</head>
<body>

    <header>
        <h1>FARMAPP</h1>
    </header>

    <main>
        <form action="/action_page.php">
            <input type="search" id="barra" name="gsearch" placeholder="Digite o nome do medicamento" required>
            <button type="submit" id="Pesquisar">Pesquisar</button>
        </form>
        <h2>SELECIONE A REDE FARMACÊUTICA DESEJADA:</h2>
        <div class="container">
            <a href="farmacias.php?rede=Panvel" class="caixa">PANVEL</a>
            <a href="farmacias.php?rede=São João" class="caixa">São João</a>
            <a href="farmacias.php?rede=Droga Raia" class="caixa">Droga Raia</a>
            <a href="farmacias.php?rede=Associadas" class="caixa">Associadas</a>
        </div>
    </main>
    <footer>
        <h3>Todos os Direitos Reservados | Senac Distrito Criativo</h3>
    </footer>
</body>
</html>