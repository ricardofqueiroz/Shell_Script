#!/bin/bash
#Criar o sistema de função principal, no qual havera dois sistemas a ser escolhido
#============================================================#
#Fazer os usuários do sistema linux conectar no sistema das funções
#verificar se o usuário existe
echo "Digite um usuário:"
read usu
while [ -z $usu ] #Função -z indica se entrada de usuário esta vazia
do
echo "Sem dados inserido. Digite algo."
read usu
done
#Criando uma variável para o comando de busca de usuários
lista=$(cat /etc/passwd | cut -d: -f1)
contar=0
#============================================================#
#Criando um loop For que irá percorrer o sistema e verificar os usuários existentes. Mas antes foi criada uma estrutura while
#caso seja digitado um usuário que não exista.
while [ $contar == 0 ]
do
for i in $lista
do
if [[ $usu == $i && -n $usu ]] #Função -n verifica se foi digitado algo
then
contar=$contar+1
echo Logado. "Pode acessar o sistema."
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
#============================================================#
#Entrando no sistema das funções
EscolhaFuncao() #Inicio da função principal
{
echo "Escolha uma opção:"
read escolha
#Caso a opção não exista, usar o loop while até que seja escolhida uma opção existente
while [[ $escolha != "1" && $escolha != "2" && $escolha != "3" || -z $escolha ]] #A função "-z" determina se a variável é vazia ou não. 
do
echo "Opção não existe ou sem dados inserido na entrada de usuário."
((contar=$contar+1))
echo "Escolha uma opção válida:"
read escolha
done 
#============================================================#
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
hora=$(date +%H) #A Hora precisa ser no formato inteiro, de 24 horas, se
#colocado no formato de 12 horas, haverá erro
if [ $hora -ge 6 -a $hora -lt 12 ] 
then
echo "Bom dia. Agora são $(date +%r) AM"
elif [ $hora -ge 12 -a $hora -lt 18 ]
then
echo "Boa tarde. Agora são $(date +%r) PM"
elif [ $hora -ge 18 -a $hora -lt 24 ]
then
echo "Boa noite. Agora são $(date +%r) PM"
elif [ $hora -ge 00 -a $hora -lt 6 ]
then
echo "Boa noite. Agora são $(date +%R) AM da madrugada"
fi 
} #Fim da opção 1
#2º Sistema de escolha
processo() #Inicio da opção 2
#Obs: Caso o usuário tente executar um comando ou um script errado ou inexistente será
#informado o erro de comando ou arquivo não encontrado 
{
echo "Digite um comando:"
read digite
until $digite
do
echo "Processando. Atenção: Erro de processo".
sleep 5 #Tempo de encerramento
exit
done
echo "Processado"
} #Fim da opção 2
sair() 
{
echo "Sair"
sleep 5
exit
}
EscolhaFuncao
#Fim da função principal 
echo "Saindo do sistema"
sleep 5
