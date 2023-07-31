# lab-sd-proj-balanca
Projeto final da disciplina Laboratório de Sistemas Digitais: Balança de veículos pesados.
Desenvolvido por: Alex Campbell; Everson Elias; Nathan Caldeira.

O nosso projeto objetiva a criação de uma balança para pesagem de veículos pesados, de modo a permitir a fiscalização do transporte rodoviário brasileiro de cargas. No Brasil, a Lei da Balança dispõe sobre os limites de peso dos veículos de carga. Quando um caminhão, por exemplo, ultrapassa o peso permitido, a fiscalização deve aplicar uma multa.

O controle de carga, principalmente de veículos pesados, é de extrema importância, porque veículos sobrecarregados causam mais acidentes e desgastam as rodovias de forma mais acentuada.

Descrição da solução implementada:
1)	O veículo chega ao ponto de fiscalização e é direcionado, pelo agente fiscalizador, para o local da pesagem, o qual é devidamente sinalizado e demarcado por duas cancelas e dois semáforos.
2)	Antes de se posicionar sobre a balança, o veículo fiscalizado passa por um semáforo e por uma cancela de entrada. A cancela de entrada se abre ao comando do operador e quando finalizada a abertura, o primeiro semáforo sinaliza positivamente para que o veículo se posicione.
3)	Após o acionamento feito pelo operador, a cancela de entrada se fecha, o primeiro semáforo sinaliza em vermelho e a leitura do peso do veículo pode ser efetuada.
4)	Já sobre a balança, obtém-se o peso bruto do veículo. Além disso, o agente fiscalizador informa o peso máximo permitido pela Lei da Balança, de acordo com o tipo do veículo, e um número identificador do atendimento.
5)	Realiza-se um cálculo, com base nos valores informados, para aferir se houve a infração e, eventualmente, o valor da multa a ser aplicada. Ademais, gera-se um número de controle, para que o proprietário/condutor do veículo possa acompanhar o processo administrativo da infração, caso haja sobrecarga, e/ou comprovar que o veículo fora fiscalizado durante o trajeto. Vale ressaltar que esse número também será utilizado para administração pública, havendo, ou não, infração.
6)	Por fim, o veículo é liberado da área de pesagem, tendo que passar por mais um semáforo e outra cancela, que também são controlados pelo agente fiscalizador. O mesmo processo descrito anteriormente para a cancela e o semáforo é seguido para a saída do veículo: o acionamento para a abertura da cancela é realizado, o segundo semáforo indica verde e o veículo poderá sair, permitindo o fechamento da cancela e do semáforo, novamente, reiniciando o processo para o próximo veículo.

O projeto foi desenvolvido em Intel® Quartus®.
