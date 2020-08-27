drop table ENDERECO;
drop table COMPANIES;
drop table TELEFONE;
drop table PESSOAS;

CREATE TABLE PESSOAS
(
PESS_CPF VARCHAR(15) NOT NULL,
PESS_NAME VARCHAR(40) NOT NULL,
PESS_BORN_AT DATE NOT NULL,
PESS_OCCUPATION VARCHAR(40) NOT NULL
);

CREATE TABLE ENDERECO
(
PESS_CPF VARCHAR(15) NOT NULL,
END_ZIPCODE VARCHAR(15) NOT NULL,
END_NUMBER INT(40) NOT NULL,
END_COMPLEMENT VARCHAR(10) NOT NULL
);

CREATE TABLE COMPANIES
(
PESS_CPF VARCHAR(15) NOT NULL,
COMP_CNPJ VARCHAR(20) NOT NULL,
COMP_NAME VARCHAR(50) NOT NULL
);

CREATE TABLE TELEFONE
(
PESS_CPF VARCHAR(15) NOT NULL,
TELL_1 VARCHAR(15) NOT NULL,
TELL_2 VARCHAR(15) NULL,
TELL_3 VARCHAR(15) NULL
);

--
 /*PK`s*/
 --
ALTER TABLE PESSOAS
 ADD PRIMARY KEY (PESS_CPF);
 
 ALTER TABLE ENDERECO
 ADD PRIMARY KEY (END_ZIPCODE);
 
 ALTER TABLE COMPANIES
 ADD PRIMARY KEY (COMP_CNPJ);
 
 
 --
 /*FK`s*/
 --
 ALTER TABLE ENDERECO
 ADD constraint f1 FOREIGN KEY(PESS_CPF)
   REFERENCES PESSOAS(PESS_CPF)
   ON DELETE CASCADE;
   
   ALTER TABLE TELEFONE
 ADD constraint f2 FOREIGN KEY(PESS_CPF)
   REFERENCES PESSOAS(PESS_CPF)
   ON DELETE CASCADE;
   
   ALTER TABLE COMPANIES
 ADD constraint f3 FOREIGN KEY(PESS_CPF)
   REFERENCES PESSOAS(PESS_CPF)
   ON DELETE CASCADE;
   
-- -----------------------------------
-- insere dado em PESSOAS 
-- -----------------------------------

insert into PESSOAS values ('644.183.780-30','Adriano da Silva Souza','1992-02-03','Engenheiro da Computação');
insert into PESSOAS values ('474.669.350-10','Paulo Souza Cruz','1978-10-03','Empreendedor');
insert into PESSOAS values ('363.780.800-54','Maria da Juda Mendes','1991-04-20','Professora');

-- -----------------------------------
-- insere dado em ENDERECO 
-- -----------------------------------

insert into ENDERECO values ('644.183.780-30','29160510','14','APP 201');
insert into ENDERECO values ('474.669.350-10','29090290','22','CASA');
insert into ENDERECO values ('363.780.800-54','24717250','1002','CONDOMINIO');

-- -----------------------------------
-- insere dado em COMPANIES 
-- -----------------------------------

insert into COMPANIES values ('644.183.780-30','06.990.590/0001-23','GOOGLE LTDA');
insert into COMPANIES values ('474.669.350-10','975276040001-22','CACAU SHOW');
insert into COMPANIES values ('363.780.800-54','10.475.363/0001-37','PROG INFORMATICA LTDA PROG-INFO');
-- -----------------------------------
-- insere dado em TELEFONE 
-- -----------------------------------

insert into TELEFONE values ('644.183.780-30','55279818299','0279818288','(27)981828822');
insert into TELEFONE values ('474.669.350-10','1181818292',NULL,NULL);
insert into TELEFONE values ('363.780.800-54','27981882222',NULL,NULL);

