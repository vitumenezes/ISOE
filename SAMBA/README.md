# SAMBA

## This is a sincere report about my firt contact with SAMBA.

First of all, the situation: i needed to set up a SAMBA server to serve (obviously -_-) some directories and files with some permissions and bla bla bla.
The hypothetical situation was to create a company with 5 sectors and 3 employees each.

descobri que o Debian, por pol�tica de seguran�a, n�o habilita o uso do *sudo* no sistema. � necess�rio que voc� mesmo habilite manualmente :o

- o source.list do Debian tem uma linha que busca pacote no CDROM (?? n�o entendi muito bem vou pesquisar sobre isso),
quebrando o apt-get e eu tenho que apagar a linha referente a isto.

- minha maquina virtual tava sem acesso � net, obviamente algo com as placas. coloquei em modo bridge mas mesmo assim n�o funcionou. depois de muita
luta descobri que o erro � na vm mesmo, n�o estava configurada a interface no /etc/network/interfaces.

- pra criar o script pensei em primeiro verificar se o usu�rio executando � o root. descobri que a vari�vel $EUID guarda a informa��o do usu�rio corrente,
e que o root � o 0.

