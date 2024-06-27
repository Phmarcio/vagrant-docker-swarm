#!/bin/bash

# Atualizar a lista de pacotes e instalar as atualizações mais recentes
sudo apt update
sudo apt upgrade -y

# Instalar pacotes necessários para permitir que o apt use repositórios via HTTPS
sudo apt install apt-transport-https ca-certificates curl software-properties-common -y

# Adicionar a chave GPG do Docker
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg

# Adicionar o repositório Docker ao APT
echo "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

# Atualizar a lista de pacotes novamente
sudo apt update

# Instalar o Docker
sudo apt install docker-ce docker-ce-cli containerd.io -y

# Verificar se o Docker está instalado corretamente e está em execução
sudo systemctl status docker

# Verificar a versão instalada do Docker
docker --version

# Adicionar o usuário ao grupo docker para permitir executar comandos Docker sem sudo (opcional)
sudo usermod -aG docker ${USER}

# Aplicar alterações de grupo sem necessidade de logout/login (opcional)
newgrp docker

# Testar a instalação do Docker
docker run hello-world

# Instalar o Docker Compose (opcional)
sudo curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

# Verificar a instalação do Docker Compose
docker-compose --version

echo "Instalação do Docker concluída com sucesso!"

while [ ! -f /vagrant/swarm_join_command.txt ]; do
    sleep 2
done
    JOIN_COMMAND=$(cat /vagrant/swarm_join_command.txt)
    sudo $JOIN_COMMAND