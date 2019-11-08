create database Engenheiro;
use Engenheiro;
create table Engenheiro (
	idEngenheiro int primary key auto_increment,
    nomeEngenheiro varchar(45),
    CREA int,
    sexo char(1),
    check(sexo = "M" or sexo = "F" or sexo = "N"),
    salario decimal(8,2)
) auto_increment = 1;

insert into Engenheiro values
	(null, 'Lula Livre', 102331123, 'M',  '9828.83'),
    (null, 'Dilmãe', 102321235, 'F',  '10428.58'),
    (null, 'Conde Drácula', 23090902, 'N',  '7828.90'),
    (null, 'Bonossauro', 000000, 'N',  '0.5');
    
create table Obras(
	idObra int,
    nomeObra varchar()
)