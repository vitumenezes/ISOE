# SAMBA

## This is a sincere report about my firt contact with SAMBA.

First of all, the situation: i needed to set up a SAMBA server to serve (obviously -_-) some directories and files with some permissions and bla bla bla.
The hypothetical situation was to create a company with 5 sectors and 3 employees each.

descobri que o Debian, por política de segurança, não habilita o uso do *sudo* no sistema. é necessário que você mesmo habilite manualmente :o

- o source.list do Debian tem uma linha que busca pacote no CDROM (?? não entendi muito bem vou pesquisar sobre isso),
quebrando o apt-get e eu tenho que apagar a linha referente a isto.

- minha maquina virtual tava sem acesso à net, obviamente algo com as placas. coloquei em modo bridge mas mesmo assim não funcionou. depois de muita
luta descobri que o erro é na vm mesmo, não estava configurada a interface no /etc/network/interfaces.

- pra criar o script pensei em primeiro verificar se o usuário executando é o root. descobri que a variável $EUID guarda a informação do usuário corrente,
e que o root é o 0.

