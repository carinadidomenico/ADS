create database PetShop;
use PetShop;

-- Criando tabela Pet
create table Pet (
	idPet int primary key,
    nome varchar(30),
    tipo varchar(30),
    check(tipo = 'cachorro' or tipo = 'gato' or tipo = 'outro'),
    raça varchar(30),
    dataNasc date
);
select * from Pet;

-- Criando tabela Cliente
create table Cliente (
	idCliente int primary key auto_increment,
    nome varchar(40),
    telefone char(9),
    sexo char(1),
    check (sexo = 'f' or sexo = 'm' or sexo ='n'),
    bairro varchar(30)
);
select * from Cliente;

-- Adicionando chave estrangeira na tabela Pet
alter table Pet add fkCliente int;

-- Fazendo link da fkCliente com idCliente
-- Chave estrangeira sempre vai do lado que tem muitos
alter table Pet add foreign key (fkCliente) references Cliente(idCliente);

-- Inserindo valores na tabela Cliente
insert into Cliente values
	(null,'Carina', '984744515', 'f', 'Tucuruvi');
    
-- Inserindo valores na tabela Pet
insert into Pet values
	(100, 'Tigresa', 'gato', 'SRD', '2003-09-13', 1),
    (101, 'Nina', 'gato', 'siamês', '2010-11-21', 1),
    (102, 'Rabicho', 'gato', 'SRD', '2018-09-16', 1);

-- Exibir os valores das tabelas Pet e Cliente
select * from Pet, Cliente where Pet.fkCliente = Cliente.idCliente;

-- Inserindo valores nas tabelas
insert into Cliente values
	(null,'Kelly', '123456789', 'f', 'Jaçanã'),
    (null,'Lucas', '123456789', 'm', 'Jordanópolis'),
    (null,'Sarah', '123456789', 'f', 'Vila Sônia');;

insert into Pet values
	(103, 'Leia', 'cachorro', 'pug', '2017-11-10', 4),
	(104, 'Salem', 'gato', 'SRD', '2018-09-16', 2),    
	(105, 'Dulce', 'gato', 'SRD', '2018-01-21', 3),
    (106, 'Melinda', 'gato', 'SRD', '2018-09-16', 3),
    (107, 'Guinho', 'gato', 'SRD', '2010-11-21', 3);
insert into Pet values
	(108, 'Augusta', 'outro', 'papagaio', '2017-11-10', 5);

insert into Cliente values
	(null,'Alena', '123456789', 'f', 'Cotia');

-- Alterar campo da tabela
update Cliente set nome = 'Carina Pereira' where idCliente = '1';
update Cliente set nome = 'Lucas Pereira' where idCliente = '4';

-- Exibir os dados de determinado cliente
select * from Pet, Cliente where Pet.fkCliente = Cliente.idCliente and Cliente.nome like 'Carina%';

-- Exibir dados dos clientes cujo sobrenome é Pereira 
select * from Pet, Cliente where Pet.fkCliente = Cliente.idCliente and Cliente.nome like '%Pereira';

-- Exibir dados de determidado tipo de pet
select * from Pet, Cliente where Pet.fkCliente = Cliente.idCliente and Pet.tipo = 'cachorro';

-- Exibir somente nome e data de nascimento dos pets
select nome, dataNasc from Pet;

-- Exibir dados dos Pets em ordem crescente (nome)
select * from Pet order by nome;

-- Exibit dados dos Clientes de um determinado bairro
select * from Cliente order by bairro desc; 

-- Alterar tamanho (varchar) do campo nome 
alter table Cliente modify nome varchar(70);

-- Exibir descrição da tabela
desc Cliente;