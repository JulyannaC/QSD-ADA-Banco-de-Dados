- ACID

1. Atomicidade: Seria a garantia de que a transação será feita totalmente ou não será feita. Nesse caso, a transação não é feita “pela metade”. Se por ventura uma operação da transação falhar, consequentemente, toda a transação falhará. Essa propriedade evita perda ou corrupção de dados, como quando a fonte de dados de streaming falha no meio do fluxo.

2. Consistência: Seria a proteção da integridade dos dados. Ou seja, se um banco de dados fizer uma operação que não seja válida, o processo será impedido e retornará para o estado inicial do processo. As operações serão legítimas se passarem por todas as verificações do banco de dados, incluindo todas as restrições inseridas nele (gatilhos, funções, procedimentos, entre outros). 

3. Isolamento: A capacidade de isolamento seria o fato de uma transação não “atrapalhar” a outra e ocorrer de forma isolada, garantindo que sejam feitas de forma individual. 

4. Durabilidade: Seria a preservação dos dados após as operações terem sido realizadas. Ou seja, uma vez que uma transação for efetuada, ela permanecerá dessa forma, mesmo que ocorram problemas graves no sistema, sem precisar de retrabalho. 