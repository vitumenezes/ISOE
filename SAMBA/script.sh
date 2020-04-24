#!/bin/bash

### Verificacao inicial se o usuario executando e o root #

if [ "$EUID" -ne 0 ]
	then echo "Execute como root"
	exit
fi


# ------------- Criacao das pastas ------------ #
#
#
### se nao existir o diretorio /srv, cria

if [ ! -d /srvv ]
then
	echo "Diretorio srv nao existe. Criando..."
	mkdir /srvv
fi


### criacao do diretorio da empresa
mkdir /srvv/grengenharia
echo "Diretorio da empresa criado!"

### array com o nome dos 5 setores
setores=(rh ti hidraulica infraestrutura estruturas_fundacoes)

### laco percorrendo o array com os setores
for setor in "${setores[@]}"
do
	mkdir /srvv/grengenharia/$setor
done
echo "Setores criados!"

### criacao da pasta de usuarios separada do array por organizacao
mkdir /srvv/grengenharia/usuarios
echo "Diretorio de usuarios criado!"

### criacao das pastas de usuarios
usuarios=(sara paulo antony gabriela gabriel taynara jaqueligia larissa rafaela rafael ivo iago renato victor davyson)

for usuario in "${usuarios[@]}"
do
	mkdir /srvv/grengenharia/usuarios/$usuario
done
echo "Diretorios dos usuarios criados!"

###### ---------------------- Permissoes ----------------------- ######

### nenhuma permissao de escrita na pasta da empresa
chmod 555 /srvv/grengenharia

### alterando grupos dos setores e suas permissoes. os nomes dos grupos e setores sao iguais
for setor in "${setores[@]}"
do
	chgrp $setor /srvv/grengenharia/$setor
	chmod 575 /srvv/grengenharia/$setor
done


### alterando donos das pastas dos usuarios e suas permissoes
for usuario in "${usuarios[@]}"
do
	chown $usuario /srvv/grengenharia/usuarios/$usuario
	chmod 700 /srvv/grengenharia/usuarios/$usuario
done

### permissoes diretorio usuarios
chmod 555 /srvv/grengenharia/usuarios


### protecao sobre as pastas
chattr +a /srvv/grengenharia
cd /srvv/grengenharia
chattr +a rh/ ti/ infraestrutura/ hidraulica/ estruturas_fundacoes/ usuarios/
