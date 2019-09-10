let inputNome = document.querySelector(".nome");
let inputIdade = document.querySelector(".idade");
let button = document.querySelector(".btn");
let resposta = document.querySelector(".resposta");


button.addEventListener ('click', function Dados() {
    console.log (`Meu nome é ${inputNome.value} e minha idade é ${inputIdade.value} anos`)
    resposta.innerHTML = `Meu nome é ${inputNome.value} e minha idade é ${inputIdade.value} anos`
    inputNome.value = ''
    inputIdade.value = ''
})