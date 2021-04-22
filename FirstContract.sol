pragma solidity ^0.8.1;
// SPDX-License-Identifier: MIT

contract FirstContract {

    event NewCharacter(string name, uint id);

    string usersName;
    uint idDigits = 16;
    uint idModulus = 10 ** idDigits;

    struct Character {
        string name;
        uint rand;
    }

    function setUsersName(string memory _name) public {
        _createNewCharacter(_name);
    }

    Character[] private characters;

    function getCharactersOnElement(uint _element) public view returns (Character memory){
        return characters[_element];
    }

    function getAllCharacters() public view returns (Character[] memory) {
        return characters;
    }

    function _createCharacter(string memory _name, uint _id) private {
        characters.push(Character(_name, _id));
        emit NewCharacter(_name,_id);
        _returnNameAndId(_name, _id);
    }

    function _generateRandomId(string memory _name) private view returns (uint) {
        uint id = uint(keccak256(abi.encodePacked(_name)));
        return id % idModulus;
    }

    function _createNewCharacter(string memory _name) private {
        uint randId = _generateRandomId(_name);
        _createCharacter(_name, randId);
    }

    function _returnNameAndId(string memory _name, uint _id) private pure returns (string memory, uint) {
        string memory name = _name;
        uint id = _id;
        return(name, id);
    }

}
