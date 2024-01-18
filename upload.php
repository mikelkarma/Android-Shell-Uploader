<?php
// Nome de usuário e senha para autenticação básica
$usuario_autenticacao = 'Mik';
$senha_autenticacao = 'pass123';

// Verifica se as credenciais estão corretas
if (!isset($_SERVER['PHP_AUTH_USER']) || !isset($_SERVER['PHP_AUTH_PW']) ||
    $_SERVER['PHP_AUTH_USER'] !== $usuario_autenticacao || $_SERVER['PHP_AUTH_PW'] !== $senha_autenticacao) {
    header('WWW-Authenticate: Basic realm="Autenticação necessária"');
    header('HTTP/1.0 401 Unauthorized');
    echo '[-] Mik - Autenticação falhou.';
    exit;
}

// Diretório base para salvar os uploads
$diretorio_base = 'uploads';

// Crie o diretório base se não existir
if (!file_exists($diretorio_base)) {
    mkdir($diretorio_base, 0777, true);
}

// Loop através dos arquivos enviados
foreach ($_FILES as $arquivo) {
    $nome_arquivo = basename($arquivo['name']);
    $caminho_destino = $diretorio_base . '/' . $nome_arquivo;

    // Move o arquivo para o diretório de destino
    if (move_uploaded_file($arquivo['tmp_name'], $caminho_destino)) {
        echo "[+] Mik - Upload de arquivo $nome_arquivo concluído com sucesso.\n";
    } else {
        echo "[-] Mik - Falha ao realizar upload de arquivo $nome_arquivo.\n";
    }
}
?>
