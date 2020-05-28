DOCKER

Pra rodar esta bagaça com sudo é necessário criar um grupo "docker" (com sudo obviamente) e adicionar seu usuário lá.

Parâmetros importantes do docker:
 -t (terminal)
 -i (iteratividade)
 -ti (um fodendo terminal iterativo)
 -d (container rodando como um processo em BG, um daemon)

Os dois pontos ":" após o nome da imagem indica a versão a ser buscada. Exemplo: centos:7

Se utilizar o ctrl+D pra sair do container, o processo do shell vai ser parado e maquina vai ser fechada. Pra sair e deixar o container rodando tem que usar o ctrl+p+q.

Pra voltar pro container: docker attach "id_container".

O docker create "container" apenas cria o container mas não roda automaticamente.

Listar containers rodando: docker ps

Para parar o container: docker stop "id_container".

Para iniciar: docker start "id_container".

Para pausar: docker pause "id_container".

Para despausar: docker unpause "id_container".

Status do container: docker stats "id_container".

Para saber os processos rodando nos containers: docker top "id_container".

Para saber os logs de algum container: docker logs "id_container".

Para remover um container PARADO e não em execução: docker rm "id_container".

Se estiver rodando, usar o "-f".

COMO LIMITAR RECURSOS

Importante: o comando docker inspect "id_container" mostra todas as informações do container, e utilizando este comando com pipes dá pra verificar apenas as informações desejadas ;)

Memória RAM:

É possível colocar limitação de memória ram na criação dele utilziando o --memory (ou -m) "quantidade_memoria"

Para alterar o valor de memória em um container já em utilização: docker update -m "quantidade_memoria" "id_container"

Limitar CPU:

A limitação de uso de cpu não é tããão intuitiva assim. Vou reescrever essa parte depois que tiver entendido 100%, mas aqui vão os comandos:

Limitar na criação: usar flag --cpu-shares "quantidade_em_mb"

Limitar com container já rodando: update --cpu-shares "quantidade_em_mb" "id_container"

VOLUMES

