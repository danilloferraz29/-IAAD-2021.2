-- Introdução ao Armazenamento e Análise de Dados (IAAD) - BSI/UFRPE

drop database if exists startup_danillo;
create database startup_danillo;

use startup_danillo;

create table STARTUP(
	id_startup char (5) not null primary key,
    nome_startup varchar(20),
    cidade_sede varchar(20)
);
create table PROGRAMADOR(
	id_programador char(5) primary key,
    id_star char(5),
    nome_programador varchar (20) not null,
    genero char (1),
    data_nascimento date not null,
    email varchar (25)
    );
create table linguagem_programação(
	id_linguagem char (5) primary key not null,
    nome_linguagem varchar (20),
    ano_lancamento year(4) not null
);
create table PROGRAMADOR_LINGUAGEM(
	id_pro char(5) not null,
    id_ling char (5) not null,
    primary key(id_pro,id_ling)
    );

-- populando as tabelas do banco de dados
insert into linguagem_programação values
('20001','Python','1991'),
('20002','PHP','1995'),
('20003','Java','1995'),
('20004','C','1972'),
('20005','JavaScript','1995'),
('20006','Dart','2011');
insert into startup values
('10001','Tech4Toy','Porto Alegre'),
('10002','Smart123','Belo Horizonte'),
('10003','knowledgeUp','Rio de Janeiro'),
('10004','BSI Next Level','Recife'),
('10005','QualiHelth','São Paulo'),
('10006','ProEdu','Florianópolis');
insert into programador_linguagem values
('30001','20001'),
('30001','20002'),
('30002','20003'),
('30003','20004'),
('30003','20005'),
('30004','20005'),
('30007','20001'),
('30007','20002');
insert into programador values
('30001','10001','João Pedro','M','1993-06-23','joaop@mail.com'),
('30002','10002','Paula Silva','F','1986-01-10','paulas@mail.com'),
('30003','10003','Renata Vieira','F','1991-05-07','renatav@mail.com'),
('30004','10004','Felipe Santos','M','1976-11-25','felipes@mail.com'),
('30005','10001','Ana Cristina','F','1968-02-19','anac@mail.com'),
('30006','10004','Alexandre Alves','M','1988-07-07','alexandrea@mail.com'),
('30007','10002','Laura Marques','F','1987-10-04','lauram@mail.com');

-- Aplicando a restrição de integridade referencial
alter table programador_linguagem ADD FOREIGN KEY(id_pro) REFERENCES programador(id_programador);
alter table programador_linguagem ADD FOREIGN KEY(id_ling) REFERENCES linguagem_programação(id_linguagem);
alter table programador ADD FOREIGN KEY(id_star) REFERENCES startup(id_startup);
commit;