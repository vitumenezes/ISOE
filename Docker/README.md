# DOCKER

---

Pra rodar com sudo é necessário criar um grupo "docker" (com sudo obviamente) e adicionar seu usuário lá.

###### Parâmetros importantes do docker:
 
   -t (terminal)
   -i (iteratividade)
   -ti (um fodendo terminal iterativo)
   -d (container rodando como um processo em BG, um daemon)

Os dois pontos ":" após o nome da imagem indicam a versão a ser buscada. Exemplo: `centos:7`

Se utilizar o ctrl+D pra sair do container, o processo do shell vai ser parado e maquina vai ser fechada. Pra sair e deixar o container rodando tem que usar o `ctrl+p+q`

Pra voltar pro container: `docker attach "id_container"`

> O docker create "container" apenas cria o container mas não roda automaticamente.

Listar containers rodando: `docker ps`

Para parar o container: `docker stop "id_container"`

Para iniciar: `docker start "id_container"`

Para pausar: `docker pause "id_container"`

Para despausar: `docker unpause "id_container"`

Status do container: `docker stats "id_container"`

Para saber os processos rodando nos containers: `docker top "id_container"`

Para saber os logs de algum container: `docker logs "id_container"`

Para remover um container PARADO e não em execução: `docker rm "id_container"`

> Se estiver rodando, usar o "-f".

---

## COMO LIMITAR RECURSOS

**Importante: o comando docker inspect "id_container" mostra todas as informações do container, e utilizando este comando com pipes dá pra verificar apenas as informações desejadas ;)**

### Memória RAM:

É possível colocar limitação de memória ram na criação dele utilizando o `--memory (ou -m) "quantidade_memoria"`

Para alterar o valor de memória em um container já em utilização: `docker update -m "quantidade_memoria" "id_container"`

### Limitar CPU:

*A limitação de uso de cpu não é tããão intuitiva assim. Vou reescrever essa parte depois que tiver entendido 100%, mas aqui vão os comandos:*

Limitar na criação: usar flag `--cpu-shares "quantidade_em_mb"`

Limitar com container já rodando: `update --cpu-shares "quantidade_em_mb" "id_container"`

---

## VOLUMES

Um volume no docker é um filesystem que está montado dentro container, mas que na verdade está no host docker e sendo compartilhado.

Subindo um container especificando um volume (exemplo): `docker run -ti -v /volume /bin/bash`

Para ver onde está montado o novo volume no host: `docker inspect -f {{.Mounts}} "container_id"`

Apontar um novo volume para um diretório existente no host (mapeamento) (exemplo): `docker run -ti -v /path/do/diretorio:/volume debian`

### Container Data_Only

Container que possui volumes que serão compartilhados com outros containers.

Como criar (exemplo): `docker create -v /data --name dbdados centos`
> O container é criado apenas, não fica em execução.

Para importar os volumes do container criado utiliza-se o parâmetro `--volumes-from "container"`

---

## DockerFile

Pra quem já sofreu fazendo makefiles: surpresa! Segue a mesma ideia.

*Alguns parâmetros*

**FROM**: determina qual imagem base será usada para montar a imagem desejada
**RUN**: serve para executar comandos dentro do container
> Geralmente usado para instalar pacotes, afins.
> Quanto menos RUNs, melhor. Cada novo RUN é uma nova camada. Então é interessante concatenar o máximo de comandos possíveis.
**ADD**: copia arquivo/diretorio/arquivos *.tar* da máquina host para o container
**CMD**: parâmetro do entrypoint
**LABEL**: colocar metadatas no container
**COPY**: igual ao ADD, mas não envia arquivos *.tar*
**ENTRYPOINT**: faz com que um processo seja o principal processo do container, caso o processo morra, o container morre também
**ENV**: serve para determinar variáveis de ambiente para o container
**EXPOSE**: mostra qual porta do container precisa ser exposta
**USER**: qual será o usuário default da máquina
**WORKDIR**: diretório de trabalho do container (onde você vai cair assim que inicia o container
**VOLUME**: cria um volume no container
**MAINTAINER**: o escritor do dockerfile
