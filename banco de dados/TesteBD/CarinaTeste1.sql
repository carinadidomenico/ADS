create database Empresa;
use Empresa;

create table Empresa (
	idEmpresa int primary key auto_increment,
    nomeEmpresa varchar(40),
    bairro varchar (40)
);

create table Funcionario(
	idFunc int primary key auto_increment,
    nomeFunc varchar(40),
    salario int,
    dataNasc date,
    fkEmpresa int,
    foreign key (fkEmpresa) references Empresa(idEmpresa) 
) auto_increment = 100;

insert into Empresa values
	(null, "C6 Bank", 'Jardim Paulista'),
	(null, "Bradesco", 'Itaim Bibi'),
	(null, "Santander", 'Saúde'),
    (null, "Banco do Brasil", 'Sé'),
    (null, "Itaú", 'Santana');
    

insert into Funcionario values 
	(null, "Paula Santos", 5000.00, "1980-12-12", 5),
    (null, "Joana Silva", 5200.00, "1962-03-21", 1),
    (null, "Marcio Oliveira", 3700.00, "1979-06-30", 1),
    (null, "Marília Cavalcanti", 2300.00, "1996-01-31", 5),
    (null, "José Campos", 4200.00, "1967-11-17", 4),
    (null, "Priscila Mota", 4500.00, "1983-08-12", 1),
    (null, "Paula Santos", 5000.00, "1975-09-24", 2);
    
select * from Empresa;
select * from Funcionario order by salario desc;

select * from Empresa, Funcionario where fkEmpresa = idEmpresa
									and nomeEmpresa = "C6 Bank";
delete from Funcionario where idFunc = 102;

select * from Funcionario;
