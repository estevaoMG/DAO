# DAO

Este é um projeto de exemplo de uma DAO (Decentralized Autonomous Organization) básica criada em Solidity. A DAO permite a criação de propostas, votação pelos membros e execução de propostas aprovadas.

## Funcionalidades

- **Adição de Membros**: O proprietário da DAO pode adicionar novos membros.
- **Criação de Propostas**: Membros podem criar novas propostas com uma descrição.
- **Votação**: Membros podem votar em propostas criadas.
- **Execução de Propostas**: O proprietário pode executar propostas que foram aprovadas.

## Como Funciona

1. **Deploy do Contrato**: O contrato `DAO` é implantado na blockchain. O endereço que implanta o contrato se torna o proprietário e o primeiro membro.

2. **Adição de Membros**: O proprietário pode adicionar novos membros à DAO, permitindo que eles participem na criação e votação de propostas.

3. **Criação de Propostas**: Qualquer membro pode criar uma proposta fornecendo uma descrição. A proposta é armazenada na blockchain com um contador de votos inicializado em zero.

4. **Votação**: Os membros podem votar nas propostas. Cada membro pode votar apenas uma vez por proposta.

5. **Execução de Propostas**: O proprietário pode executar uma proposta que tenha pelo menos um voto. Neste ponto, a lógica de execução da proposta pode ser implementada no contrato.