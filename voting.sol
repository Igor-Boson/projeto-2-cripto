// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Voting {
    // armazena informações de cada opção de voto
    struct Option {
        string name;  
        uint voteCount; 
    }

    // lista de opções de voto
    Option[] public options;

    // verificar se um endereço já votou
    mapping(address => bool) public hasVoted;

    // adicionar uma nova opção de voto
    function addOption(string memory optionName) public {
        options.push(Option({
            name: optionName,
            voteCount: 0
        }));
    }

    // votar em uma opção por índice
    function vote(uint optionIndex) public {
        // verifica se o usuário já votou ou não
        require(!hasVoted[msg.sender], "Ja votou!!.");
        
        // marca o endereço como votou
        hasVoted[msg.sender] = true;

        // incrementa a contagem de votos da opção
        options[optionIndex].voteCount++;
    }

    // obter o total de opcões de voto
    function getOptionsCount() public view returns (uint) {
        return options.length;
    }
}
