#!/bin/bash

# Scrapea sinonimos de uma lista de quase 2000 palavras!
num=0
date > sinonimos.dat

for palavra in $(cat palavras.txt)
do
	num=$((num+1))				# Contador de palavras
	echo $num $palavra			# RESULTADO NA TELA...	
	linha=$(echo -n "${palavra}, " ; lynx -dump -nolist https://www.sinonimos.com.br/${palavra} | grep '[0-9]' | sed '1d; $d; s/[0-9]//g; s/\./,/g; s/^ *//' | xargs)
	echo $linha >> sinonimos.txt
	
done
date >> sinonimos.dat

echo "FINALIZADO"
sleep 20
poweroff

# lynx -dump -nolist https://www.sinonimos.com.br/erro/ | grep '[0-9]' | sed '1d; $d' 



