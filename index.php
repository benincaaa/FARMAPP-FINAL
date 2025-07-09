<?php

?>

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
        <img src="Logo FarmApp.png" alt="" class="logo-header" >
        
    </header>

    <main>
        <form action="/action_page.php">
            <input type="search" id="barra" name="gsearch" placeholder="Digite o nome do medicamento" required>
            <button type="submit" id="Pesquisar">Pesquisar</button>
        </form>
        <h2>SELECIONE A REDE FARMACÊUTICA DESEJADA:</h2>
        <div class="container">
            <a href="farmacias.php?rede=Panvel" class="caixa"><img src="https://www.juvenil.com.br/portal/imgs/textos/panvel-farmacias1606159587.png" alt=""></a>
            <a href="farmacias.php?rede=São João" class="caixa"><img src="https://astc.com.br/wp-content/uploads/2023/08/saojoao-removebg-preview-1.png" alt=""></a>
            <a href="farmacias.php?rede=Droga Raia" class="caixa"><img src="https://www.masterambiental.com.br/wp-content/uploads/2023/07/droga-raia.png" alt=""></a>
            <a href="farmacias.php?rede=Associadas" class="caixa"><img src="https://images.seeklogo.com/logo-png/32/2/farmacias-associadas-logo-png_seeklogo-322007.png" alt=""></a>
        </div>
    </main>
    <footer>
        <h3>Todos os Direitos Reservados | Senac Distrito Criativo</h3>
    </footer>
</body>
</html>