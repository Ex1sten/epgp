<font color='#f00'>
<h1><b>THIS DOCUMENTATION IS OUTDATED</b></h1>

<b>YOU CAN FIND UP TO DATE DOCUMENTATION <a href='Home.md'>HERE</a>.</b>
</font>

# Introdução #

EPGP é baseado no conceito de Pontos de Esforço (EP) e Pontos de Gear (GP) onde Pontos de Esforço quantifica o esforço que cada membro dedica aos objetivos (comuns) da guilda e os Pontos de Gear quantifica o que cada membro ganhou em troca disso. A prioridade dos itens que caírem é computada como quociente dos dois; Prioridade (PR) é igual ao EP / GP.

É fato que o EPGP é como o sistema de Zero Sum (outro sistema de distribuição de loot), mas sem a necessidade de rebalancear o sistema ou impor taxas para os pontos dados em outros esforços na guilda. O sistema de Zero Sum funciona com GP/N pontos para cada jogador para cada item dropado (GP é o valor do item e N o número de jogadores na raid) então o somatório de todos os pontos para todos os membros da guild é zero. Diferente disso, a definição de EPGP é balanceada uma vez que a prioridade (e a chance de receber um item) é diretamente proporcional ao esforço que você colocou e inversamente proporcional à recompensa que você obteve. É também muito mais flexível que o Zero Sum uma vez que ele não requere um balanceamento de pontos (a soma tem que ser igual a zero, por exemplo). Tal como os pontos podem ser obtidos por qualquer coisa sem taxas ou sistemas complicados (veja abaixo). Também outro problema do Zero Sum é o valor randômico de cada Boss. Matar um Boss, é matar um Boss, e o esforço envolvido nisso é o mesmo, não importa se aconteceu de cair um ou dois épicos. Com o sistema do Zero Sum, o valor de pontos do esforço para matar o Boss é proporcional aos itens que caíram e definitivamente não representa de forma justa o esforço que cada membro colocou na guild.

Pontos de EP podem ser ganhos de diversas atividades:

  * Estar online na hora da raid;
  * Matar um boss;
  * Número de wipes em cada tentativa de um novo boss;
  * Estando presente até o final da raid;
  * Ajudar de forma notável a guild (fazendo poções para uma luta específica);
  * Fazendo coisas que ninguém quer mais fazer como atualizar o site da guild;

Pontos de GP podem ser computados a partir de uma série de ações:
  * Receber loot em uma raid;
  * Receber itens do banco da guild para enchants de alto nível;
  * Pegar gold do banco da guild para materiais ou reparos;

Obviamente que cada guild pode escolher qualquer combinação (ou até mesmo estabelecer seu próprio critério de pontuação) dos pontos acima. Assinalar pontos para cada atividade/ação não é algo que o EPGP tenta resolver. Cabe ao gerenciamento da guild pois isto esta fora do escopo do sistema (e é o caso de muitos sistemas populares de loot).

Outra variação do EPGP, em relação aos outros sistemas de loot, é a Janela de Raid (RW). Esja janela de N raids representa as últimas X raids na qual o EP e GP são contabilizados. Isto significa que os pontos de EP e GP são somados apenas para um N número de raids. Isto resolve uma série de problemas que existem em outros sistemas de loot na prática, como o DKP (EP no caso) que só permite que novos membros adiquiram itens depois de um altíssimo e longo esforço na guild. Outra coisa no conceito de Janela de Raid é o número mínimo de Raids para que o EP se torne efetivo. Dado um número K, onde 0 <= K <= N, um membro precisa participar no mínimo de K raids antes de receber qualquer loot. Guilds mais evoluídas podem colocar este rateio bem alto para controlar o alto número de requisições para as raids e guilds casuais podem colocar esse índice baixo para incentivar pessoas a participarem mais.

# Especificações #

Cada membro começa com EP = 0 e GP = 1. Logicamente PR (Prioridade) = 0. A medida que os EPs são adquiridos, a PR aumenta, quando GPs são gastos, PR abaixa. Vamos pegar um exemplo, assuma 3 membros A, B e C. EP por Raid 10, GP por item 10 e RW (janela de raid) = 3. Também assuma que um membro A vá em todas as raids e os membros B e C vão somente em duas das três raids.

Aqui é como o EPGP está antes do início das Raids:

|**Membro**| **EP/GP (PR)** | **Raid 1** | **Raid 2** | **Raid 3** |
|:---------|:---------------|:-----------|:-----------|:-----------|
| A        | 0/1 (0)        | 0/0        | 0/0        | 0/0        |
| B        | 0/1 (0)        | 0/0        | 0/0        | 0/0        |
| C        | 0/1 (0)        | 0/0        | 0/0        | 0/0        |

Após a primeira raid em que todos foram, A e B receberam os itens que caíram:

| **Membro** | **EP/GP (PR)** | **Raid 1** | **Raid 2** | **Raid 3** |
|:-----------|:---------------|:-----------|:-----------|:-----------|
| A          | 10/10 (1)      | 10/10      | 0/0        | 0/0        |
| B          | 10/10 (1)      | 10/10      | 0/0        | 0/0        |
| C          | 10/1 (10)      | 10/0       | 0/0        | 0/0        |

Note que o padrão GP = 1 não conta na soma inicial dos GPs. Na segunda raid todos participaram, então o próximo a receber os itens que caíram é o C e vamos dizer que o B recebeu um item também (O membro B estava empatado em PR (prioridade) com o membro A então eles tiraram na sorte, usando o /roll):

| **Membro** | **EP/GP (PR)** | **Raid 1** | **Raid 2** | **Raid 3** |
|:-----------|:---------------|:-----------|:-----------|:-----------|
| A          | 20/10 (2)      | 10/0       | 10/10      | 0/0        |
| B          | 20/20 (1)      | 10/10      | 10/10      | 0/0        |
| C          | 20/10 (2)      | 10/10      | 10/0       | 0/0        |

Agora, na próxima raid, apenas o A participou e recebeu o loot.

| **Membro** | **EP/GP (PR)** | **Raid 1** | **Raid 2** | **Raid 3** |
|:-----------|:---------------|:-----------|:-----------|:-----------|
| A          | 30/20 (1.5)    | 10/10      | 10/0       | 10/10      |
| B          | 20/20  (1)     |  0/0       | 10/10      | 10/10      |
| C          | 20/10  (2)     |  0/0       | 10/10      | 10/0       |

Na próxima raid, já que a janela é de 3 raids apenas, o valor da Raid 1 é retirado para os novos valores. vamos supor que os três participaram, a ordem de prioridade da tabela anterior era C a depois A, vamos supor que os dois pegaram um item:

| **Membro** | **EP/GP  (PR)** | **Raid 1** | **Raid 2** | **Raid 3** |
|:-----------|:----------------|:-----------|:-----------|:-----------|
| A          | 30/20 (1.5)     | 10/10      | 10/10      | 10/0       |
| B          | 20/10  (2)      | 10/0       |  0/0       | 10/10      |
| C          | 20/20  (1)      | 10/10      |  0/0       | 10/10      |

Neste ponto, A recebeu 3 itens e B e C receberam 2.

# Problemas e Soluções #

## Farming de EP ##

Este problema não existe no EPGP por causa do uso da janela de Raid (RW). Apenas os EPs e GPs recentes são contabilizados. Então se você usou os seus pontos de prioridade dentro da janela de raid, ele é simplesmente perdido a medida que as raids vão acontecendo.

## Novos membros vs veteranos ##

Por causa da Raid Windows, os novos membros se tornarão iguais aos veteranos de acordo com o tempo da janela de raid. É simples porque o sistema esquece todos os eventos (EP recebidos e loots adquiridos) que aconteceram antes da janela de raid.

## Membros que já estão com gears e membros que não estão ##

Membros que já estão com gears acabarão com as prioridades mais altas e conseguirão obter um novo (e raro) item. Isto irá satisfazer estes membros. Membros que não estão com nenhuma parte do gear irão acabar pegando alguma coisa dentra da janela de Raid e a prioridade deles será menor. Então os membros que ainda estão sem gear não irão atrapalhar membros que estão aguardando um item especial cair.

## Complexidade ##

Sem ser como o Zero Sum com taxações, rebalanceamentos quando membros saem e voltam para a guild, este sistema é simplório de entender e mantê-lo atualizado. Ele também trás a vantagem de mais membros entenderem porque receberam ou porque não receberam determinado item e também permite que mais membros da guild fiquem satisfeitos.

## Dificuldade em assinalar valores para boss kill ou tentativas ##

Por causa dos pontos de esforços estão desanexados dos pontos de gear é mais fácil assinalar valores para cada categoria de item. Guild Masters e Officers podem se focar em balancear pontos para diferentes Boss e tentativas de matá-los de materiais adquiridos em farming. Se você notar o exemplo acima, nada mudaria mesmo que os esforços da raid somassem 987 EP e as peças valessem apenas 123 pontos. Balancear esforço com itens é extremamente difícil, mas balancear eles separadamente é simples.