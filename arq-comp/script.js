let acertos = 0;
let pontuacao = 0;
let respostas = [
    "FLASH",
    "ROM",
    "EPROM",
    "MEMÓRIA DE MASSA",
    "ADDRESS BUS",
    "ADM",
    "REGISTRADORES",
    "I7",
    "CACHE",
    "CS",
    "CPU",
    "I5",
    "ULA",
    "QUADCORE",
    "THREADS",
    "DUALCORE",
    "RAM",
    "DATABUS",
];
let dicas = [
    "Memória somente de leitura: É a memória não volátil, as informações são permanentemente armazenadas no circuito integrado, a memória não tem dependência de uma corrente elétrica para salvar os dados, os dados são gravados em células individuais utilizando o código binário.",
    "É uma memória não volátil da Unidade de comando Eletrônico do sistema de injeção. Capaz de armazenar informações, que servem para serem recuperadas e utilizadas posteriormente, mesmo após a alimentação ter sido corrompida.",
    "Tem como função armazenar grandes quantidades de informações. Os dados armazenados que temos na memoria de massa não são perdidos quando desligamos o equipamento. Ela não é acessada pelo processador, mas sim por intermédio da memória ram, cache, etc.",
    "um compontente utilizado para especificar um endereço fisíco de memória, assim, quando o processador precisa ler ou escrever em uma locação de memória, o lugar onde tal memórias esta localizado é determinado neste componente em forma de bits.",
    "(Em português): Ele é uma característica dos computadores modernos que possibilita que determinados subsistemas de hardware dentro do computador acessem a memoria dos sistema, sem depender da cpu.",
    "São uma memória local rápida do microprocessador, destinada ao armazenamento de dados e instruções: <br>Utilizado para as operações de movimentações de dados e operações lógicas e aritméticas, mas possuem registradores com funções especificas para determinados fins. Como o Acumulador, Registrador e o Contador de programa.",
    "fabricado pela intel e lançado em meados de 2008, se trata de um processador de 6-8 núcleos, com uma frequência de clock de 6.00 GHz",
    "um componente volátil individual de cada núcleo para o armazenamento temporario de dados para uma acessibilidade mais ágil, guardando certos tipos de recursos para que não seja necessário o trafégo de informações do servidor todas as vezes que uma aplicação é inicializada.",
    "um componente cujo propósito é selecionar um ou mais circuitos integrados que estão conectados na mesma BUS, deixando certos pins surdos, para que não sejam afetados por um comando que seja designado a somente um único circuito integrado",
    "Ele realiza todas as operações lógicas, aritméticas, possuindo registradores.",
    "fabricado pela intel e lançado no dia 08/09/2009, se trata de um processador de 4-6 núcleos, com uma frequência de clocl de 2.66 GHz",
    " é um circuito responsável pelo processamento de operações aritméticas e logicas, ela realiza operações de adição (OR), e AND booleana.",
    "um processador com 4 núcleos, executando a leitura de threads quatro vezes mais rápida que uma CPU de apenas um único núcleo, dessa forma, o processador consegue suportar a execução de múltiplas leituras de threads simultâneamente",
    "uma * é o termo utilizado para definir uma linha de trabalho a qual um núcleo executa, a sequência que é lida para a execução de um processo, sendo primordialmente criadas e organizadas pelo sistema operacional",
    "um processador com 2 núcleos, executando a leitura de threads duas vezes mais rápida que uma CPU de apenas um único núcleo, tendo sido primeiramente implementadas em CPUs em 2004 após o aumento de temperatura gerada por conta da evolução de velocidade de clock no processador, cada núcleo indívidual possui seu próprio cache.",
    "Memoria de acesso aleatório: É a memória volátil que armazena temporariamente os arquivos com os quais você está trabalhando.",
    "um componente que permite transifirir dados entre outros componentes no computador, sendo composto por fios é o sistema por onde os bits percorrem ao serem transmitidos na comunicação",
    "Parabéns, você completou tudo!!!"
];

function validarResposta() {
    let respostaAtual = input_answer.value.toUpperCase();

    if (respostaAtual == respostas[acertos]) {
        p_hint.innerHTML = dicas[acertos]
        img_screen.innerHTML = `<img src="cruzada/img${acertos + 1}.jpeg">`;
        acertos++;
        pontuacao += 100;
        if (acertos == 18) {
            p_hint.innerHTML = "Você ganhou! <br> com uma pontuação total de: " + pontuacao
        }

    }
    else {
        alert("Errado! (-35 Pontos)")
        pontuacao -= 35;
    }
}

/*
1 FLASH -
Embora seja uma EEPROM.É um tipo de memória com características muito semelhantes a memória RAM só tem apenas um diferencial que é fato de ela não ser volátil. Ela preserva os dados por um longo período sem precisar de uma alimentação elétrica.

2 ROM -
Memória somente de leitura: É a memória não volátil, as informações são permanentemente armazenadas no circuito integrado, a memória não tem dependência de uma corrente elétrica para salvar os dados, os dados são gravados em células individuais utilizando o código binário.

3 EPROM -
É uma memória não volátil da Unidade de comando Eletrônico do sistema de injeção. Capaz de armazenar informações, que servem para serem recuperadas e utilizadas posteriormente, mesmo após a alimentação ter sido corrompida.

4 MEMÓRIA DE MASSA -
Tem como função armazenar grandes quantidades de informações. Os dados armazenados que temos na memoria de massa não são perdidos quando desligamos o equipamento. Ela não é acessada pelo processador, mas sim por intermédio da memória ram, cache, etc.
 
5 ADRESSBUS -
um compontente utilizado para especificar um endereço fisíco de memória, assim, quando o processador precisa ler ou escrever em uma locação de memória, o lugar onde tal memórias esta localizado é determinado neste componente em forma de bits.

6 DMA -
Acessso direto a memoria: Ele é uma característica dos computadores modernos que possibilita que determinados subsistemas de hardware dentro do computador acessem a memoria dos sistema, sem depender da cpu.

7 REGISTRADORES - 
São uma memória local rápida do microprocessador, destinada ao armazenamento de dados e instruções:

Utilizado para as operações de movimentações de dados e operações lógicas e aritméticas, mas possuem registradores com funções especificas para determinados fins.
Como o Acumulador, Registrador e o Contador de programa.

8 I7 -
fabricado pela intel e lançado em meados de 2008, se trata de um processador de 6-8 núcleos, com uma frequência de clock de 6.00 GHz

9 CACHE -
um componente volátil individual de cada núcleo para o armazenamento temporario de dados para uma acessibilidade mais ágil, guardando certos tipos de recursos para que não seja necessário o trafégo de informações do servidor todas as vezes que uma aplicação é inicializada.

10 CS -
um componente cujo propósito é selecionar um ou mais circuitos integrados que estão conectados na mesma BUS, deixando certos pins "surdos", para que não sejam afetados por um comando que seja designado a somente um único circuito integrado

11 CPU - 
Unidade central de processamento: Ele realiza todas as operações lógicas, aritméticas, possuindo registradores.

12 I5 - 
fabricado pela intel e lançado no dia 08/09/2009, se trata de um processador de 4-6 núcleos, com uma frequência de clocl de 2.66 GHz

13 ULA -
Unidade lógica aritmética: é um circuito responsável pelo processamento de operações aritméticas e logicas, ela realiza operações de adição (OR), e AND booleana.

14 QUADCORE -
um processador com 4 núcleos, executando a leitura de threads quatro vezes mais rápida que uma CPU de apenas um único núcleo, dessa forma, o processador consegue suportar a execução de múltiplas leituras de threads simultâneamente

15 THREADS -
uma * é o termo utilizado para definir uma linha de trabalho a qual um núcleo executa, a sequência que é lida para a execução de um processo, sendo primordialmente criadas e organizadas pelo sistema operacional

16 DUALCORE -
um processador com 2 núcleos, executando a leitura de threads duas vezes mais rápida que uma CPU de apenas um único núcleo, tendo sido primeiramente implementadas em CPUs em 2004 após o aumento de temperatura gerada por conta da evolução de velocidade de clock no processador, cada núcleo indívidual possui seu próprio cache.

17 RAM - 
Memoria de acesso aleatório: É a memória volátil que armazena temporariamente os arquivos com os quais você está trabalhando.

18 DATABUS -
um componente que permite transifirir dados entre outros componentes no computador, sendo composto por fios é o sistema por onde os bits percorrem ao serem transmitidos na comunicação
*/