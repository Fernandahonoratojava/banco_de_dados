CREATE DATABASE hospital;

CREATE TABLE `medico` (
	`id_medico` INT AUTO_INCREMENT,
    `cpf` varchar(255) NOT NULL,
	`crm` varchar(50) NOT NULL,
	`nome` varchar(255) NOT NULL,
	`telefone` varchar(255) NOT NULL,
	`email` varchar(255),
	`especialidades_fk` INT,
	PRIMARY KEY (`id_medico`)
);

CREATE TABLE `receita` (
	`id_receita` INT AUTO_INCREMENT,
	`instrucoes` TEXT NOT NULL,
	`medicamentos` varchar(500) NOT NULL,
	`quantidade` varchar(500) NOT NULL,
    `consulta_fk` INT,
	PRIMARY KEY (`id_receita`)
);

CREATE TABLE `paciente` (
	`id_paciente` INT AUTO_INCREMENT,
	`nome` varchar(255) NOT NULL,
	`endereco` varchar(255) NOT NULL,
	`data_nascimento` varchar(255) NOT NULL,
	`convenio` varchar(255) NOT NULL,
	`cpf` varchar(255) NOT NULL UNIQUE,
	`convenio_fk` INT,
	PRIMARY KEY (`id_paciente`)
);

CREATE TABLE `quarto` (
	`id_quarto` INT AUTO_INCREMENT,
	`numero` INT NOT NULL,
	`tipo_fk` INT,
	PRIMARY KEY (`id_quarto`)
);

CREATE TABLE `tipo_quarto` (
	`id_tipo` INT AUTO_INCREMENT,
	`descricao` TEXT NOT NULL,
	`valor_diaria` FLOAT NOT NULL,
	PRIMARY KEY (`id_tipo`)
);

CREATE TABLE `internacao` (
	`id_internacao` INT AUTO_INCREMENT,
	`data_prev_alta` DATE NOT NULL,
	`data_alta` DATE NOT NULL,
	`data_entrada` DATE NOT NULL,
	`procedimento` TEXT NOT NULL,
    `medico_fk` INT NOT NULL,
    `paciente_fk` INT NOT NULL,
    `enfermeiro_fk` INT NOT NULL,
    `quarto_fk` INT NOT NULL,
	PRIMARY KEY (`id_internacao`)
);


CREATE TABLE `enfermeiro` (
	`id_enfermeiro` INT AUTO_INCREMENT,
	`nome` varchar(255) NOT NULL,
	`cpf` varchar(255) NOT NULL UNIQUE,
	`cre` varchar(255) NOT NULL,
	PRIMARY KEY (`id_enfermeiro`)
);

CREATE TABLE `convenio` (
	`id_convenio` INT AUTO_INCREMENT,
	`nome` varchar(255) NOT NULL,
	`tempo_carencia` varchar(255) NOT NULL,
	`cnpj` varchar(255) NOT NULL,
	PRIMARY KEY (`id_convenio`)
);

CREATE TABLE `consultas` (
	`id_consulta` INT AUTO_INCREMENT,
	`marcacoes` TEXT NOT NULL,
	`medico_fk` INT NOT NULL,
    `paciente_fk` INT NOT NULL,
    `convenio_fk` INT NOT NULL,
	`especialidade_fk` INT NOT NULL,
	PRIMARY KEY (`id_consulta`)
);
CREATE TABLE `especialidades` (
	`id_especialidades` INT AUTO_INCREMENT,
	`nome_especialidade` TEXT NOT NULL,
	PRIMARY KEY (`id_especialidades`)
);

ALTER TABLE `medico` ADD FOREIGN KEY (`especialidades_fk`) REFERENCES `especialidades`(`id_especialidades`) on delete cascade on update cascade; 

ALTER TABLE `receita` ADD CONSTRAINT `receita_fk0` FOREIGN KEY (`consulta_fk`) REFERENCES `consultas`(`id_consulta`);

ALTER TABLE `paciente` ADD CONSTRAINT `paciente_fk0` FOREIGN KEY (`convenio_fk`) REFERENCES `convenio` (`id_convenio`);

ALTER TABLE `quarto` ADD CONSTRAINT `quarto_fk0` FOREIGN KEY (`tipo_fk`) REFERENCES `tipo_quarto`(`id_tipo`);

ALTER TABLE `internacao` ADD CONSTRAINT `internacao_fk0` FOREIGN KEY (`medico_fk`) REFERENCES `medico`(`id_medico`);
ALTER TABLE `internacao` ADD CONSTRAINT `internacao_fk1` FOREIGN KEY (`paciente_fk`) REFERENCES `paciente`(`id_paciente`);
ALTER TABLE `internacao` ADD CONSTRAINT `internacao_fk2` FOREIGN KEY (`enfermeiro_fk`) REFERENCES `enfermeiro`(`id_enfermeiro`);
ALTER TABLE `internacao` ADD CONSTRAINT `internacao_fk3` FOREIGN KEY (`quarto_fk`) REFERENCES `quarto`(`id_quarto`);

ALTER TABLE `consultas` ADD CONSTRAINT `consultas_fk0` FOREIGN KEY (`medico_fk`) REFERENCES `medico`(`id_medico`);
ALTER TABLE `consultas` ADD CONSTRAINT `consultas_fk1` FOREIGN KEY (`paciente_fk`) REFERENCES `paciente`(`id_paciente`);
ALTER TABLE `consultas` ADD CONSTRAINT `consultas_fk2` FOREIGN KEY (`convenio_fk`) REFERENCES `convenio`(`id_convenio`);
ALTER TABLE `consultas` ADD CONSTRAINT `consultas_fk3` FOREIGN KEY (`especialidade_fk`) REFERENCES `especialidades`(`id_especialidades`);


USE hospital;
INSERT INTO medico (id_medico, cpf, crm, nome, telefone, email, especialidades_fk) VALUES ( 1,'467.555.387-11','68368326', 'Carlos José Dos Santos', '119333-4354', 'carlosjose@gmail.com', 1);
INSERT INTO medico (id_medico, cpf, crm, nome, telefone, email, especialidades_fk) VALUES ( 2,'467.329.387-11','68396726', 'João Lucas Santos', '119333-4354', 'lucassantos@gmail.com', 2);
INSERT INTO medico (id_medico, cpf, crm, nome, telefone, email, especialidades_fk) VALUES ( 3,'798.329.387-00','60008326', 'Maria Aparecida', '119333-4354', 'mariaaparecida@gmail.com', 3);
INSERT INTO medico (id_medico, cpf, crm, nome, telefone, email, especialidades_fk) VALUES ( 4,'467.329.387-11','11168326', 'Joana Carvalho Da Silva', '119333-4354', 'joanacarvalho@gmail.com', 4);
INSERT INTO medico (id_medico, cpf, crm, nome, telefone, email, especialidades_fk) VALUES ( 5,'467.119.387-11','68368888', 'Ana Beatriz Santos', '119333-4354', 'anabeatriz@gmail.com', 4);
INSERT INTO medico (id_medico, cpf, crm, nome, telefone, email, especialidades_fk) VALUES ( 6,'467.329.387-22','00068326', 'Carlos Eduardo Silveira', '119333-4354', 'carloseduardo@gmail.com', 5);
INSERT INTO medico (id_medico, cpf, crm, nome, telefone, email, especialidades_fk) VALUES ( 7,'652.329.387-33','68777326', 'Paulo Andre Souza', '119333-4354', 'pauloandre@gmail.com', 5);
INSERT INTO medico (id_medico, cpf, crm, nome, telefone, email, especialidades_fk) VALUES ( 8,'879.329.387-11','68368999', 'Marcos Gabriel Moura', '119333-4354', 'marcosgabriel@gmail.com', 6);
INSERT INTO medico (id_medico, cpf, crm, nome, telefone, email, especialidades_fk) VALUES ( 9,'467.329.387-66','68355526', 'Gilmara Da Silva Santos', '119333-4354', 'gilmarasantos@gmail.com', 7);
INSERT INTO medico (id_medico, cpf, crm, nome, telefone, email, especialidades_fk) VALUES ( 10,'897.329.387-11','60008326', 'Alexandra Carvalho', '119333-4354', 'alexandracarvalho@gmail.com', 7);

INSERT INTO convenio (id_convenio, nome, tempo_carencia, cnpj) VALUES ( 1,'Plena Saúde', '3 meses', '86496946848');
INSERT INTO convenio (id_convenio, nome, tempo_carencia, cnpj) VALUES ( 2,'Santa Helena', '2 meses', '86496946008');
INSERT INTO convenio (id_convenio, nome, tempo_carencia, cnpj) VALUES ( 3,'Notredame', '3 meses', '00096946848');
INSERT INTO convenio (id_convenio, nome, tempo_carencia, cnpj) VALUES ( 4,'Saúde e família', '1 meses', '11116946848');

INSERT INTO paciente (id_paciente, nome, endereco, data_nascimento, convenio, cpf, convenio_fk) VALUES ( 1,'Carlos Dos Santos','Rua Santos Moura,78', '20/10/1976', 'Plena', '467.000.387-11', 1);
INSERT INTO paciente (id_paciente, nome, endereco, data_nascimento, convenio, cpf, convenio_fk) VALUES ( 2,'Carla Regina','Rua Moacir Santos,50', '10/10/1990', 'Plena', '467.111.387-11', 1);
INSERT INTO paciente (id_paciente, nome, endereco, data_nascimento, convenio, cpf, convenio_fk) VALUES ( 3,'Caroline Moraes Santos','Avenida Rui Barbosa,114', '06/01/1999', 'Plena', '101.555.387-11', 1);
INSERT INTO paciente (id_paciente, nome, endereco, data_nascimento, convenio, cpf, convenio_fk) VALUES ( 4,'Roberto Augusto','Rua Augusto dos Santos,5', '01/02/1980', 'Santa Helena', '666.526.000-11', 2);
INSERT INTO paciente (id_paciente, nome, endereco, data_nascimento, convenio, cpf, convenio_fk) VALUES ( 5,'Cavalcante Soares','Avenida General Cardoso,78', '25/11/1977', 'Santa Helena', '888.555.387-11', 2);
INSERT INTO paciente (id_paciente, nome, endereco, data_nascimento, convenio, cpf, convenio_fk) VALUES ( 6,'Roberta Vicente','Rua Santos Dumont,100', '20/10/2000', 'Santa Helena', '467.555.387-88', 2);
INSERT INTO paciente (id_paciente, nome, endereco, data_nascimento, convenio, cpf, convenio_fk) VALUES ( 7,'João Barbosa Ramos','Avenida Coronel Barros,10', '25/01/1990', 'Notredame', '467.555.999-11', 3);
INSERT INTO paciente (id_paciente, nome, endereco, data_nascimento, convenio, cpf, convenio_fk) VALUES ( 8,'Henrique Gabriel Ramos','Rua Carlos Bonfim,88', '20/02/2001', 'Notredame', '333.555.387-11', 3);
INSERT INTO paciente (id_paciente, nome, endereco, data_nascimento, convenio, cpf, convenio_fk) VALUES ( 9,'Juliana Mota Moraes','Rua Alfredo Ramos,12', '29/03/1978', 'Saúde e Família', '467.555.000-11', 4);
INSERT INTO paciente (id_paciente, nome, endereco, data_nascimento, convenio, cpf, convenio_fk) VALUES ( 10,'Carlos Batista','Rua Rio Claro,90', '01/11/2004', 'Saúde e Família', '666.522.000-11', 4);
INSERT INTO paciente (id_paciente, nome, endereco, data_nascimento, convenio, cpf, convenio_fk) VALUES ( 11,'Carla Rodrigues','Avenida Augusto Teixeira,116', '29/05/1998', 'Saúde e Família', '467.676.000-11', 4);
INSERT INTO paciente (id_paciente, nome, endereco, data_nascimento, convenio, cpf, convenio_fk) VALUES ( 12,'Fernanda Maia','Viela do café,07', '15/05/2006', 'Plena', '000.555.387-11', 1);
INSERT INTO paciente (id_paciente, nome, endereco, data_nascimento, convenio, cpf, convenio_fk) VALUES ( 13,'José Campos','Rua Santtana,120', '22/09/2000', 'Plena', '887.111.387-11', 1);
INSERT INTO paciente (id_paciente, nome, endereco, data_nascimento, convenio, cpf, convenio_fk) VALUES ( 14,'Alfredo Carvalho','Rua Jose Campos,78', '05/11/1980', 'Notredame', '467.555.424-11', 3);
INSERT INTO paciente (id_paciente, nome, endereco, data_nascimento, convenio, cpf, convenio_fk) VALUES ( 15,'Ana Beatriz Barbosa','Rua Campos Sales,66', '20/10/2001', 'Notredame', '467.121.387-09', 3);

INSERT INTO especialidades  (id_especialidades,nome_especialidade) VALUES ( 1,'Cardiologia');
INSERT INTO especialidades  (id_especialidades,nome_especialidade) VALUES ( 2,'Pediatria');
INSERT INTO especialidades  (id_especialidades,nome_especialidade) VALUES ( 3,'Gastroenterologia');
INSERT INTO especialidades  (id_especialidades,nome_especialidade) VALUES ( 4,'Ginecologia');
INSERT INTO especialidades  (id_especialidades,nome_especialidade) VALUES ( 5,'Dermatologia');
INSERT INTO especialidades  (id_especialidades,nome_especialidade) VALUES ( 6,'Ortopedia');
INSERT INTO especialidades  (id_especialidades,nome_especialidade) VALUES ( 7,'Psiquiatria');

INSERT INTO consultas  (id_consulta, marcacoes, medico_fk, paciente_fk, convenio_fk, especialidade_fk) VALUES ( 1,'01/01/2015 às 10h', 1, 1, 1, 1);
INSERT INTO consultas  (id_consulta, marcacoes, medico_fk, paciente_fk, convenio_fk, especialidade_fk) VALUES ( 2,'02/01/2015 às 10h', 2, 2, 2, 2);
INSERT INTO consultas  (id_consulta, marcacoes, medico_fk, paciente_fk, convenio_fk, especialidade_fk) VALUES ( 3,'01/01/2019 às 11h', 3, 3, 3, 3);
INSERT INTO consultas  (id_consulta, marcacoes, medico_fk, paciente_fk, convenio_fk, especialidade_fk) VALUES ( 4,'12/12/2015 às 12h', 4, 4, 4, 4);
INSERT INTO consultas  (id_consulta, marcacoes, medico_fk, paciente_fk, convenio_fk, especialidade_fk) VALUES ( 5,'09/07/2016 às 13h', 5, 5, 1, 5);
INSERT INTO consultas  (id_consulta, marcacoes, medico_fk, paciente_fk, convenio_fk, especialidade_fk) VALUES ( 6,'10/06/2017 às 14h', 6, 6, 2, 6);
INSERT INTO consultas  (id_consulta, marcacoes, medico_fk, paciente_fk, convenio_fk, especialidade_fk) VALUES ( 8,'11/10/2018 às 15h', 7, 7, 3, 7);
INSERT INTO consultas  (id_consulta, marcacoes, medico_fk, paciente_fk, convenio_fk, especialidade_fk) VALUES ( 9,'22/09/2019 às 16h', 8, 8, 4, 1);
INSERT INTO consultas  (id_consulta, marcacoes, medico_fk, paciente_fk, convenio_fk, especialidade_fk) VALUES ( 10,'11/05/2020 às 17h', 9, 9, 1, 2);
INSERT INTO consultas  (id_consulta, marcacoes, medico_fk, paciente_fk, convenio_fk, especialidade_fk) VALUES ( 11,'15/08/2021 às 10h', 10, 10, 2, 3);
INSERT INTO consultas  (id_consulta, marcacoes, medico_fk, paciente_fk, convenio_fk, especialidade_fk) VALUES ( 12,'01/01/2022 às 11h', 8, 11, 3, 4);
INSERT INTO consultas  (id_consulta, marcacoes, medico_fk, paciente_fk, convenio_fk, especialidade_fk) VALUES ( 13,'04/12/2015 às 12h', 9, 12, 4, 5);
INSERT INTO consultas  (id_consulta, marcacoes, medico_fk, paciente_fk, convenio_fk, especialidade_fk) VALUES ( 14,'19/02/2017 às 13h', 7, 13, 2, 6);
INSERT INTO consultas  (id_consulta, marcacoes, medico_fk, paciente_fk, convenio_fk, especialidade_fk) VALUES ( 15,'22/08/2018 às 14h', 10, 14, 2, 7);
INSERT INTO consultas  (id_consulta, marcacoes, medico_fk, paciente_fk, convenio_fk, especialidade_fk) VALUES ( 16,'06/09/2019 às 15h', 9, 15, 3, 1);
INSERT INTO consultas  (id_consulta, marcacoes, medico_fk, paciente_fk, convenio_fk, especialidade_fk) VALUES ( 17,'01/01/2018 às 16h', 1, 11, 4, 2);
INSERT INTO consultas  (id_consulta, marcacoes, medico_fk, paciente_fk, convenio_fk, especialidade_fk) VALUES ( 18,'27/05/2019 às 17h', 2, 10, 1, 3);
INSERT INTO consultas  (id_consulta, marcacoes, medico_fk, paciente_fk, convenio_fk, especialidade_fk) VALUES ( 19,'07/11/2018 às 10h', 3, 9, 2, 4);
INSERT INTO consultas  (id_consulta, marcacoes, medico_fk, paciente_fk, convenio_fk, especialidade_fk) VALUES ( 20,'01/09/2015 às 11h', 4, 8, 3, 5);

INSERT INTO tipo_quarto  (id_tipo, descricao, valor_diaria) VALUES ( 1,'Apartamento', 200.50);
INSERT INTO tipo_quarto  (id_tipo, descricao, valor_diaria) VALUES ( 2,'Quarto duplo', 100.00);
INSERT INTO tipo_quarto  (id_tipo, descricao, valor_diaria) VALUES ( 3,'Enfermearia', 150.50);

INSERT INTO quarto  (id_quarto, numero, tipo_fk) VALUES ( 1,01, 1);
INSERT INTO quarto  (id_quarto, numero, tipo_fk) VALUES ( 2,02, 2);
INSERT INTO quarto  (id_quarto, numero, tipo_fk) VALUES ( 3,03, 3);

INSERT INTO enfermeiro  (id_enfermeiro, nome, cpf, cre) VALUES ( 1,'André Soares Santos', '777.332.444-55', '0000863276');
INSERT INTO enfermeiro  (id_enfermeiro, nome, cpf, cre) VALUES ( 2,'Regina Angela Silva', '121.332.444-55', '7326863999');
INSERT INTO enfermeiro  (id_enfermeiro, nome, cpf, cre) VALUES ( 3,'João Santana Dos Santos', '777.343.444-55', '2226863276');
INSERT INTO enfermeiro  (id_enfermeiro, nome, cpf, cre) VALUES ( 4,'Marcos Lucas Ramos', '777.332.898-55', '7326888276');
INSERT INTO enfermeiro  (id_enfermeiro, nome, cpf, cre) VALUES ( 5,'Fernanda Honorato', '454.332.444-55', '6666863276');
INSERT INTO enfermeiro  (id_enfermeiro, nome, cpf, cre) VALUES ( 6,'Ana Laura', '777.332.765', '7326863999');
INSERT INTO enfermeiro  (id_enfermeiro, nome, cpf, cre) VALUES ( 7,'José de Jesus', '777.332.535-55', '0006863276');
INSERT INTO enfermeiro  (id_enfermeiro, nome, cpf, cre) VALUES ( 8,'Filomena Pereira', '777.332.070-55', '7555563276');
INSERT INTO enfermeiro  (id_enfermeiro, nome, cpf, cre) VALUES ( 9,'Maria da Paz', '777.121.444-55', '1116863276');
INSERT INTO enfermeiro  (id_enfermeiro, nome, cpf, cre) VALUES ( 10,'Ketylin Ferreira', '777.332.000-55', '7000863276');

INSERT INTO internacao (id_internacao, data_prev_alta, data_alta, data_entrada, procedimento, medico_fk, paciente_fk, enfermeiro_fk, quarto_fk) VALUES ( 1,01/01/2022, 02/01/2022, 25/12/2021, 'Realizado uma cirurgia no paciente', 1, 1, 1, 1);
INSERT INTO internacao (id_internacao, data_prev_alta, data_alta, data_entrada, procedimento, medico_fk, paciente_fk, enfermeiro_fk, quarto_fk) VALUES ( 2,10/12/2021, 22/11/2021, 08/12/2021, 'Realizado uma cirurgia no paciente', 2, 1, 2, 1);
INSERT INTO internacao (id_internacao, data_prev_alta, data_alta, data_entrada, procedimento, medico_fk, paciente_fk, enfermeiro_fk, quarto_fk) VALUES ( 3,22/08/2019, 21/08/2019, 18/08/2019, 'Realizado um transplante no paciente', 3, 3, 1, 2);
INSERT INTO internacao (id_internacao, data_prev_alta, data_alta, data_entrada, procedimento, medico_fk, paciente_fk, enfermeiro_fk, quarto_fk) VALUES ( 4,09/01/2018, 10/01/2018, 01/01/2018, 'Realizado uma cirurgia no paciente', 4, 2, 4, 3);
INSERT INTO internacao (id_internacao, data_prev_alta, data_alta, data_entrada, procedimento, medico_fk, paciente_fk, enfermeiro_fk, quarto_fk) VALUES ( 5,07/12/2017, 07/12/2017, 01/12/2017, 'Realizado uma cirurgia no paciente', 5, 3, 5, 3);
INSERT INTO internacao (id_internacao, data_prev_alta, data_alta, data_entrada, procedimento, medico_fk, paciente_fk, enfermeiro_fk, quarto_fk) VALUES ( 6,25/02/2019, 26/02/2019, 20/02/2019, 'Realizado uma cirurgia no paciente', 6, 4, 6, 1);
INSERT INTO internacao (id_internacao, data_prev_alta, data_alta, data_entrada, procedimento, medico_fk, paciente_fk, enfermeiro_fk, quarto_fk) VALUES ( 7,30/12/2021, 30/12/2021, 10/12/2021, 'Realizado uma cirurgia no paciente', 7, 5, 7, 2);

INSERT INTO receita(id_receita,instrucoes, medicamentos,quantidade, consulta_fk) values(1, 'Tomar remédio de 8h em 8h','Dipirona', '20 gotas', 1);
INSERT INTO receita(id_receita,instrucoes, medicamentos,quantidade, consulta_fk) values(2, 'Tomar remédio de 8h em 8h','Cefaliv', '1 comprimido', 2);
INSERT INTO receita(id_receita,instrucoes, medicamentos,quantidade, consulta_fk) values(3, 'Tomar remédio de 8h em 8h','fluxetina', '1 comprimido', 3);
INSERT INTO receita(id_receita,instrucoes, medicamentos,quantidade, consulta_fk) values(4, 'Tomar remédio de 8h em 8h','Paracetamol', '20 gotas', 4);
INSERT INTO receita(id_receita,instrucoes, medicamentos,quantidade, consulta_fk) values(5, 'Tomar remédio de 12h em 12h','Loratadina', '20 gotas', 5);
INSERT INTO receita(id_receita,instrucoes, medicamentos,quantidade, consulta_fk) values(6, 'Tomar remédio de 8h em 8h','Postan', '1 comprimido', 6);
INSERT INTO receita(id_receita,instrucoes, medicamentos,quantidade, consulta_fk) values(7, 'Tomar remédio de 8h em 8h','Neosadina', '1 comprimido', 11);
INSERT INTO receita(id_receita,instrucoes, medicamentos,quantidade, consulta_fk) values(8, 'Tomar remédio de 12h em 12h','Cefalexina', '1 Comprimido', 8);
INSERT INTO receita(id_receita,instrucoes, medicamentos,quantidade, consulta_fk) values(9, 'Tomar remédio de 8h em 8h','Torsilax', '1 comprimido', 9);
INSERT INTO receita(id_receita,instrucoes, medicamentos,quantidade, consulta_fk) values(10, 'Tomar remédio de 12h em 12h','Aspirina', '1 comprimido', 10);

select * from medico;
alter table medico add em_atividade varchar(100);

update medico set em_atividade = 'Ativo' where id_medico = 1;
update medico set em_atividade = 'Ativo' where id_medico = 2;
update medico set em_atividade = 'Ativo' where id_medico = 3;
update medico set em_atividade = 'Ativo' where id_medico = 4;
update medico set em_atividade = 'Ativo' where id_medico = 5;
update medico set em_atividade = 'Ativo' where id_medico = 6;
update medico set em_atividade = 'Ativo' where id_medico = 7;
update medico set em_atividade = 'Ativo' where id_medico = 8;
update medico set em_atividade = 'Inativo' where id_medico = 9;
update medico set em_atividade = 'Inativo' where id_medico = 10;

select * from internacao where data_alta > data_prev_alta;

select * from medico where nome like '%Gabriel%';


