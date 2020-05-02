#!/bin/bash
#====================================
#Esse script irá verificar se o nome digitado pelo usuário
#existe em uma das duas listas criada, no sistema é usado um for pra
#percorre-las.
#====================================
echo "Digite um nome que possa ter em uma das listas:"
read elemento
#contar=0
while [[ -z $elemento || $elemento =~ [0-9] || $elemento =~ [.] ]] # =~ não permite número ou ponto
do
echo "Sem dados inserido ou possui número ou ponto. Digite algo."
read elemento
#contar=$contar+1
done
#Criando um contador que será usado dentro da estrutura "for" depois da condição "if"
contar=0
#Criando duas arrays de nomes
nomes1=('Luan' 'Francisco' 'Sonia' 'Patrick' 'Ramom')
nomes2=('Fabio' 'Camila' 'Sandro' 'Vera' 'Mike')
while [ $contar == 0 ]
do
for i in ${nomes1[@]}
do 
if [[ $elemento == $i && -n $elemento ]]
then
echo "$elemento faz parte da 1º lista de nomes"
contar=$contar+1
exit
fi
done  
for j in ${nomes2[@]} #Também pode ser usado ${nomes[*]}
do
if [[ $elemento == $j && -n $elemento ]]
then
echo "$elemento faz parte da 2º lista de nomes"
exit
fi
done
#Obs: Caso fosse usado um else ou mesmo um elif o script iria rodar todas as posições havendo ou não o nome desejado,
#por isso foi tirado e construido uma nova condição como mostra abaixo no qual ira verificar se a variável contar é igual
#a zero, isso faz com que impede de visualizar todas as posições. 
#Identificar se o usuário preencheu o campo de entrada de usuário
if [[ -z $elemento || $elemento =~ [0-9] || $elemento =~ [.] ]]
then
echo "Sem dados inserido ou possui número ou ponto. Digite algo."
read elemento
elif test $contar == 0
then
echo "Não faz parte de nenhuma das duas listas"
echo "Digite novamente"
read elemento
fi
done
