#!/bin/bash
#Sistema de funções. Havera dois sistemas a ser escolhido pelo usuário
#=====================================================================#
#Obs: Na primeira opção da função que mostra as horas foi criada uma espécie de módulo como se usa em liguagens como c# por exemplo,
#no caso foi pego um arquivo fora do script e colocado dentro de uma variável no sistema, evitando colocar o código inteiro,
#podendo ficar de algumas formas por exemplo:
#'hora="./Hora_Atual.sh"', foi testado também colocando o caminho que o arquivo esta: 'hora=/home/ricado ./Hora_Atual' e
#'hora=/home/ricardo/Hora_Atual', nesse caso com ou sem o comando executável './', testes também foram realizados com ou sem
#aspas dupla e simples no qual foi executado.
#Ou seja, foi testado de várias formas trazendo o arquivo de fora do script com o uso de variável.
#=====================================================================#
#Verificar se o usuário existe no sistema
echo "Digite um usuário:"
read usu
while [ -z $usu ] #Função -z indica se entrada de usuário esta vazia
do
echo "Sem dados inserido. Digite algo."
read usu
done
#Criando uma variável com o comando de verificação de usuários no sistema linux
lista=$(cat /etc/passwd | cut -d: -f1)
contar=0
#Usando a estrutura For para percorrer todos os usuários existentes no sistema, mas antes foi criada 
#uma estrutura while caso seja digitado um usuário inexistente
while [ $contar == 0 ]
do
for i in $lista
do
if [[ $usu == $i && -n $usu ]] #Função -n verifica se foi digitado algo
then
contar=$contar+1
echo "Logado. Pode acessar o sistema."
fi
done
if [ -z $usu ]
then
echo "Sem dados inserido. Digite algo."
read usu
elif test $contar == 0
then
echo "Sem permissão. Digite novamente."
read usu
fi
done
#==============================================================#
#Acesso ao sistema de funções
EscolhaFuncao() #Inicio da função principal
{
echo "Escolha uma opção:"
read escolha
#Caso o usuário digite uma opção não existente ou digitar nada, usar o loop while até que escolha uma opção que exista
#e que a entrada de usuário não esteja vazia
while [[ $escolha != "1" && $escolha != "2" && $escolha != "3" || -z $escolha ]]
do
echo "Opção não existe ou sem dados inserido no campo de entrada."
((contar=$contar+1))
echo "Escolha uma opção válida:"
read escolha
done
#==============================================================#
#Criando as opções de escolha com case
case $escolha in #Inicio do case
"1") hora;;
"2") processo;;
"3") sair;;
esac #Fim do case
}
#1º sistema de escolha
hora() #Inicio da opção 1
{
#Criando uma variável com o arquivo e onde se localiza sem precisar digitar todo o código
hora=/home/ricardo/Hora_Atual.sh
$hora 
} #Fim da opção 1
#2º Sistema de escolha
processo() #Inicio da opção 2
{
echo "Digite um comando:"
read digite
until $digite
do
echo "Processando. Atenção: Erro no sistema."
sleep 5 
exit
done
echo "Processado"
} #Fim da opção 2
sair() #Opção de sair
{
echo "Saindo"
sleep 3
exit
}
EscolhaFuncao
#Fim da função principal 
echo "Saindo do sistema"
sleep 3
