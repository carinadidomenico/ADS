create database Funcionario;
use Funcionario;

create table Funcionario (
	idFunc int primary key auto_increment,
    nome varchar(40),
    sexo char(1), 
    check (sexo = 'm' or sexo = 'f' or sexo = 'n'),    
-- em versões anteriores a 8.0.16, usar: -- sexo enum ('m', 's', 'n')
	salario decimal(7,2),
    check (salario > 0),
    fkSupervisor int,
    foreign key(fkSupervisor) references Funcionario (idFunc)
) auto_increment = 1000;
select * from Funcionario;
desc Funcionario;
insert into Funcionario values
	(null, 'Maria Luiza', 'f', 15000, null),
    (null, 'Ana Yumi', 'f', 3000, null),
    (null, 'Marcio', 'm', 3500, null);
insert into Funcionario values
	(null, 'Fernanda', 'f', 8000, null);
insert into Funcionario values
	(null, 'Claudia', 'f', 7000, 1000),
    (null, 'Silvio', 'm', 2000, 1001),
    (null, 'Fausto', 'm', 1000, 1001);
insert into Funcionario values
	(null, 'Lancelote', 'm', 2000, 1000);

-- Exibir os dados dos funcionarios e dos supervisores correspondentes
-- f é apelido da tabela Funcionario e s é apelido da tabela Supervisor, criada a partir da tabela Funcionario;
select * from Funcionario as f, Funcionario as s 
	where f.fkSupervisor = s.idFunc;
select * from Funcionario as f;