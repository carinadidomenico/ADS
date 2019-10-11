create database PetShop;
use PetShop;

-- Criando tabela Pet
create table Pet (
	idPet int primary key auto_increment,
    nome varchar(30),
    tipo varchar(30),
    check(tipo = 'cachorro' or tipo = 'gato' or tipo = 'outro'),
    raça varchar(30),
    dataNasc date
)auto_increment=100;
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
	(null, 'Tigresa', 'gato', 'SRD', '2003-09-13', 1),
    (null, 'Nina', 'gato', 'siamês', '2010-11-21', 1),
    (null, 'Rabicho', 'gato', 'SRD', '2018-09-16', 1);

-- Exibir os valores das tabelas Pet e Cliente
select * from Pet, Cliente where Pet.fkCliente = Cliente.idCliente;

-- Inserindo valores nas tabelas
insert into Cliente values
	(null,'Sarah', '123456789', 'f', 'Vila Sônia'),
    (null,'Kelly', '123456789', 'f', 'Jaçanã'),
    (null,'Lucas', '123456789', 'm', 'Jordanópolis');

insert into Pet values
	(null, 'Leia', 'cachorro', 'pug', '2017-11-10', 4),
	(null, 'Salem', 'gato', 'SRD', '2018-09-16', 2),    
	(null, 'Dulce', 'gato', 'SRD', '2018-01-21', 3),
    (null, 'Melinda', 'gato', 'SRD', '2018-09-16', 3),
    (null, 'Guinho', 'gato', 'SRD', '2010-11-21', 3);
insert into Pet values
	(null, 'Augusta', 'outro', 'papagaio', '2017-11-10', 5);

insert into Cliente values
	(null  l,'Alena', '123456789', 'f', 'Cotia');

-- Alterar campo da tabela
update Cliente set nome = 'Carina Pereira' where idCliente = '1';
update Cliente set nome = 'Lucas Pereira' where idCliente = '4';

-- Exibir os dados de determinado cliente
select * from Pet, Cliente where Pet.fkCliente = Cliente.idCliente and Cliente.nome like 'Carina%';

-- Exibir os dados das duas tabelas 
select * from Pet, Cliente where Pet.fkCliente = Cliente.idCliente;

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

-- Deletar coluna sexo
alter table Cliente drop column sexo;

-- Deletar pet cujo idPet é 109
delete from pet where idPet= 109;

select * from Pet, Cliente where Pet.fkCliente = Cliente.idCliente;

-- Deletar tabela Pet (deletando primeiro por ter a foreign key);
drop table Pet;

-- Deletar tabela Cliente;
drop table Cliente;