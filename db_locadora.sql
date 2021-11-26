CREATE DATABASE db_locadora;
USE db_locadora;

    /* CRIAR TABELAS */ 

CREATE TABLE tb_veiculo (
    cd_placa INT NOT NULL PRIMARY KEY,
    cd_chassi INT NOT NULL,
    nm_fabricante VARCHAR(35),
    dt_ano_fabricacao YEAR(4) NOT NULL,
    ds_modelo VARCHAR(30) NOT NULL,
    ds_marca VARCHAR(30) NOT NULL,
    ds_cor VARCHAR(20) NOT NULL,
    ds_combustivel VARCHAR(30) NOT NULL,
    nr_porta INT NOT NULL,
    nr_assento INT NOT NULL,
    ic_cambio CHAR(1) NOT NULL
);


CREATE TABLE tb_categoria (
    cd_categoria INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    nm_categoria VARCHAR(15),
    id_placa INT NOT NULL,
    FOREIGN KEY (id_placa) REFERENCES tb_veiculo (cd_placa)
);


CREATE TABLE tb_endereco (
    cd_endereco INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    ie_estado CHAR(2) NOT NULL,
    ds_cidade VARCHAR(35) NOT NULL,
    ds_bairro VARCHAR(35) NOT NULL,
    ds_rua VARCHAR(35) NOT NULL,
    nr_local INT NOT NULL
);


CREATE TABLE tb_oficina (
    cd_cnpj INT NOT NULL PRIMARY KEY,
    nm_oficina VARCHAR(30) NOT NULL,
    nm_proprietario VARCHAR(45) NOT NULL,
    id_endereco_oficina INT NOT NULL,
    FOREIGN KEY (id_endereco_oficina) REFERENCES tb_endereco (cd_endereco)
);


CREATE TABLE tb_manutencao (
    cd_manutencao INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    nm_manutencao VARCHAR(45) NOT NULL,
    vl_valor FLOAT NOT NULL,
    id_cnpj_manutencao INT NOT NULL,
    FOREIGN KEY (id_cnpj_manutencao) REFERENCES tb_oficina (cd_cnpj)
);


CREATE TABLE tb_manutencao_veiculo (
    cd_manutencao_veiculo INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    dt_saida TIMESTAMP NOT NULL,
    dt_entrada TIMESTAMP NOT NULL,
    id_solucao_manutencao INT NOT NULL,
    FOREIGN KEY (id_solucao_manutencao) REFERENCES tb_manutencao (cd_manutencao),
    id_solucao_placa INT NOT NULL,
    FOREIGN KEY (id_solucao_placa) REFERENCES tb_veiculo (cd_placa)
);


CREATE TABLE tb_funcionario (
    cd_funcionario INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    cd_cpf INT NOT NULL,
    nm_funcionario VARCHAR(45) NOT NULL,
    dt_nascimento DATE NOT NULL,
    ic_sexo CHAR(1) NOT NULL,
    id_endereco_funcionario INT NOT NULL,
    FOREIGN KEY (id_endereco_funcionario) REFERENCES tb_endereco (cd_endereco)
);


CREATE TABLE tb_cliente (
    cd_cliente INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    cd_rg INT NOT NULL,
    nm_cliente VARCHAR(40) NOT NULL,
    dt_nasc DATE NOT NULL,
    ic_cnh VARCHAR(5) NOT NULL,
    id_endereco_cliente INT NOT NULL,
    FOREIGN KEY (id_endereco_cliente) REFERENCES tb_endereco (cd_endereco)
);


CREATE TABLE tb_locacao (
    cd_locacao INT NOT NULL PRIMARY KEY AUTO_INCREMENT, 
    hr_entrada TIMESTAMP NOT NULL,
    hr_saida TIMESTAMP NOT NULL,
    vl_diaria FLOAT NOT NULL
);


CREATE TABLE tb_locacao_cliente (
    id_solucao_locacao INT NOT NULL,
    FOREIGN KEY (id_solucao_locacao) REFERENCES tb_locacao (cd_locacao),
    id_cd_cliente INT NOT NULL,
    FOREIGN KEY (id_cd_cliente) REFERENCES tb_cliente (cd_cliente),
    id_automovel INT NOT NULL,
    FOREIGN KEY (id_automovel) REFERENCES tb_veiculo (cd_placa)
);


    /* INSERIR DADOS */

INSERT INTO tb_veiculo VALUES
    (1, 12, "fordinho", "2003", "focus", "decepticon", "rosa", "Diesel", 2, 7, "m"),
    (2, 13, "senhor dos aneis", "2000", "ka", "autobots", "azul", "Gasolina", 7, 2, "a"),
    (3, 14, "diego", "2019", "cbr 650r", "decepticon", "azul", "Gasolina", 0 , 2, "m"),
    (4, 15, "renato", "2011", "punto", "autobots", "vermelho", "Diesel", 7, 2, "a"),
    (5, 16, "laurinho", "2008", "uno", "decepticon", "bege", "alcool", 4, 5, "m"),
    (6, 17, "renan", "2021", "fit", "autobots", "limo", "Etanol", 7, 2, "a"),
    (7, 18, "adalberto", "2015", "uno", "decepticon", "verde", "alcool", 4, 5, "m"),
    (8, 19, "denis", "2077", "ninja", "autobots", "azul", "Gasolina", 0, 2, "a"),
    (9, 20, "roberval", "2004", "onix", "decepticon", "preto", "alcool", 4, 5, "m"),
    (10, 21, "paulo", "2009", "cb 500x", "autobots", "cinza", "Gasolina", 0, 2, "a"),
    (11, 22, "jonas", "2006", "caoa chery arrizo 6", "decepticon", "amarelo", "Etanol", 2, 7, "m"),
    (12, 23, "marcelo", "2005", "jetta", "decepticon", "cinza", "Diesel", 2, 7, "a"),
    (13, 24, "rodolfinho", "2004", "sh 150i", "decepticon", "preto", "Gasolina", 0, 2, "m"),
    (14, 25, "vivaldo", "2010", "spin", "autobots", "violeta", "Diesel", 2, 7, "m"),
    (15, 26, "murilo", "2011", "cg 150 fan", "autobots", "laranja", "Etanol", 0, 2, "a");
    
    
INSERT INTO tb_categoria VALUES (null, "sedan", 1),
    (null, "sedan", 2),
    (null, "sport", 3),
    (null, "hatch", 4),
    (null, "hatch", 5),
    (null, "suv", 6),
    (null, "hatch", 7),
    (null, "sport", 8),
    (null, "hatch", 9),
    (null, "trail", 10),
    (null, "sedan", 11),
    (null, "sedan", 12),
    (null, "scooter", 13),
    (null, "suv", 14),
    (null, "street", 15);
    
    
INSERT INTO tb_endereco VALUES 
	
    /* ENDEREÇO DAS OFICINAS */
    
	(null, "sp", "santos", "vila das flores", "rua joão medeiro", 1),
    (null, "sp", "santos", "vila das flores", "rua maria medeiro", 2),
    (null, "sp", "santos", "vila das flores", "rua joão andradina", 3),
    
    /* ENDEREÇO DOS FUNCIONARIOS */
    
    (null, "df", "taguatinga", "vila nova", "rua el dorado", 4),
    (null, "df", "ceilandia", "vila velha", "rua policarpo", 5),
    (null, "df", "sobradinho", "vila meio a meio", "rua eliza", 6),
    (null, "sp", "itaquera", "vila limão", "rua aphelios", 7),
    (null, "sp", "itapoã", "vila morango", "rua elizabeth", 8),
    (null, "mg", "são caetano", "vila liberdade", "rua linda", 9),
    (null, "mg", "são mineiro", "vila liberdade", "rua feia", 10),
    (null, "es", "santo", "vila da gama", "rua bela", 11),
    (null, "es", "espirito", "vila de gemas", "rua afrodite", 12),
    (null, "es", "samambaia", "vila ocidental", "rua zeus", 13),
    
    /* ENDEREÇO DOS CLIENTES */
    
    (null, "pr", "taguatinga", "vila liberdade", "rua didi", 14),
    (null, "pr", "taguatinga", "vila liberdade", "rua once", 15),
    (null, "bh", "taguatinga", "vila liberdade", "rua ieda", 16),
    (null, "bh", "taguatinga", "vila liberdade", "rua crespa", 17),
    (null, "bh", "taguatinga", "vila liberdade", "rua azevedo", 18),
    (null, "ce", "cearema", "vila josefa", "rua silviano", 19),
    (null, "ce", "cearema", "vila do quilo", "rua alex", 20),
    (null, "ce", "tilemes", "vila mariana", "rua antonio", 21),
    (null, "ce", "tilemes", "vila longiqua", "rua do silex", 22),
    (null, "ce", "tilemes", "vila gabriel", "rua diamantini", 23);
    
    
INSERT INTO tb_oficina VALUES (123, "mecanica medeiros", "raylla silva", 1),
    (124, "mecanica sas", "diego silva", 2),
    (125, "mecanica drumom", "yasmin silva", 3);
    
    
INSERT INTO tb_manutencao VALUES
    (null, "corretiva", 780.5, 123),
    (null, "preventiva", 300.0, 124),
    (null, "preventiva", 300.0, 125);
    
    
INSERT INTO tb_manutencao_veiculo VALUES
    (null, "2020-03-10", "2020-03-01", 1, 5),
    (null, "2020-06-05", "2020-06-02", 2, 3),
    (null, "2020-07-08", "2020-03-03", 3, 10);
    
    
INSERT INTO tb_funcionario VALUES (null, 52369228873, "jose de moraes pereira", "1980-01-12", "m", 4),
	(null, 13047216203, "samira da silva", "1983-11-30", "f", 5),
	(null, 14977633364, "robson leitão", "1979-03-14", "m", 6),
	(null, 15692525645, "vanessa pereira", "1985-02-02", "f", 7),
	(null, 16323984386, "ketterllyn machado", "1987-08-23", "f", 8),
	(null, 17831862497, "taldo fernando da silva santos oliveira", "1989-04-13", "m", 9),
	(null, 18148242858, "everton silveira", "1990-06-04", "m", 10),
	(null, 19096255319, "isabelly silva", "2000-07-18", "f", 11),
	(null, 20064356610, "pedro vasconcelos", "1978-05-26", "m", 12),
	(null, 21836168811, "leandro oliveira", "1965-11-23", "m", 13);


INSERT INTO tb_cliente VALUES (null, 20345678912, "maria antonieta andrade", "1990-03-20", "AB", 14),
	(null, 21342233913, "joão ribeiro de souza", "1981-03-10", "B", 15),
	(null, 22345678914, "mariete da lima barbosa", "1995-10-22", "AB", 16),
	(null, 23345328915, "romieu da silva lopes", "1987-04-13", "AB", 17),
	(null, 24345218916, "alice das maravilhas antonine", "1987-12-06", "AB", 18),
	(null, 25303883917, "julio andrade lima", "1991-01-01", "AB", 19),
	(null, 26345383418, "rafael picante da lima", "1993-09-12", "A", 20),
	(null, 27772727219, "richard figueiro de nobrega", "1989-07-07", "ABC", 21),
	(null, 28875678920, "matue da silva", "1992-02-03", "AB", 22),
	(null, 29383833921, "alyar leticia pinheiro", "1993-06-21", "BD", 23);


INSERT INTO tb_locacao VALUES (null, "2019-05-01 12:23:31", "2019-06-01 08:10:11", 600),
    (null, "2019-05-11 13:10:01", "2019-06-17 08:10:11", 660),
    (null, "2020-06-24 14:13:40", "2020-07-27 09:10:11", 740),
    (null, "2020-07-02 15:25:41", "2020-08-20 11:10:11", 870),
    (null, "2020-12-14 16:29:32", "2021-01-21 14:10:11", 756);

INSERT INTO tb_locacao_cliente VALUES (1, 1, 1),
    (2, 2, 2),
    (3, 3, 3),
    (4, 4, 4),
    (5, 5, 5);
