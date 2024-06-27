# Docker Swarm Cluster com Vagrant

Este repositório contém arquivos de configuração do Vagrant para inicializar três máquinas virtuais Ubuntu que formarão um cluster Docker Swarm. Este setup é ideal para testes e aprendizado sobre Docker Swarm. O setup do Docker nas máquinas e do cluster são feitos automaticamente graças aos scripts de configuração que serão executados na construção das VMs.

**OBS: Neste exemplo foi utilizado o VMware Workstation 17 pro mas com poucas alterações é possível
utilizar o virtualbox, veja a documentação do Vagrant.**

## Documentação do Vagrant
- [Vagrant](https://developer.hashicorp.com/vagrant/tutorials/getting-started)

## Pré-requisitos

- [VMware Workstation Pro](https://www.vmware.com/products/desktop-hypervisor.html)
- [VirtualBox](https://www.virtualbox.org/)

## Configuração e Inicialização

1. **Clone este repositório:**

2. **Inicialize as máquinas virtuais:**

    ```bash
    vagrant up
    ```

    Isso irá criar e configurar três máquinas virtuais: `node-master`, `node-1`, e `node-2`. Fique à vontade para alterar o nome de cada VM da maneira que preferir.

3. **Verifique o status das máquinas:**

    ```bash
    vagrant status
    ```

    Você deve ver três máquinas virtuais em execução.

## Estrutura do Repositório

- **Vagrantfile:** Arquivo de configuração principal do Vagrant.
- **scripts/**
  - **node-master.sh:** Script para configurar o nó gerenciador do Docker Swarm.
  - **node-worker.sh:** Script para configurar os nós workers do Docker Swarm.

## Conectar às Máquinas Virtuais

Você pode se conectar a qualquer uma das máquinas virtuais usando o comando `vagrant ssh`.

- Para se conectar ao nó gerenciador:

    ```bash
    vagrant ssh node-master
    ```

- Para se conectar a primeira VM Worker: 

    ```bash
    vagrant ssh node-1
    ```

- Para se conectar a segunda VM worker:

    ```bash
    vagrant ssh node-2
    ```


## Testando o Cluster

1. Conecte-se ao nó gerenciador após finalizar a configuração das 3 VMs:

    ```bash
    vagrant ssh node-master
    ```

2. Verifique o status dos nós no cluster:

    ```bash
    docker node ls
    ```

    Você deve ver uma lista dos três nós no cluster.

## Limpeza

Para destruir as máquinas virtuais e liberar recursos:

```bash
vagrant destroy -f
