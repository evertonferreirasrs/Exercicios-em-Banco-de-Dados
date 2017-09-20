Create table Paciente
(
	CRH Serial NOT NULL,
	Nome Varchar(150) NOT NULL,
	Endereco Varchar(150) NOT NULL,
	Cidade Varchar(100) NOT NULL,
	Fone Varchar(15),
	Nascimento Timestamp NOT NULL,
	Sexo Varchar(1) NOT NULL,
	Responsavel Varchar(150),
	Primary key(CRH)
);

Create table Medico
(
	CRM Bigint NOT NULL,
	Nome Varchar(150) NOT NULL,
	Endereco Varchar(150) NOT NULL,
	Cidade Varchar(100) NOT NULL,
	Primary key(CRM)
);

Create table Consulta
(
	CRH_FK Bigint NOT NULL,
	CRM_FK Integer NOT NULL,
	Data Timestamp NOT NULL,
	Primary key(CRH_FK,CRM_FK,Data)
);

Create table Leito
(
	Numero Serial NOT NULL,
	Tipo Varchar(150) NOT NULL,
	Primary key(Numero)
) ;

Create table Internacao
(
	CRH_FK Integer NOT NULL,
	CRM_FK Integer NOT NULL,
	Data_FK Timestamp NOT NULL,
	Numero_FK Integer NOT NULL,
	DataEntrada Timestamp NOT NULL,
	DataPrevista Timestamp,
	Primary key(CRH_FK,CRM_FK,Data_FK,Numero_FK)
);

Create table TipoExame
(
	Codigo Serial NOT NULL,
	Tipo Varchar(150) NOT NULL,
	Preco Double precision,
	Primary key(Codigo)
);

Create table Exame
(
	CRH_FK Integer NOT NULL,
	CRM_FK Integer NOT NULL,
	Data_FK Timestamp NOT NULL,
	Codigo_FK Integer NOT NULL,
	Data Timestamp,
	Resultado Varchar(200),
	Primary key(CRH_FK,CRM_FK,Data_FK,Codigo_FK,Data)
);

Create table Fone
(
	CRM_FK Integer NOT NULL,
	Fone Char(15) NOT NULL,
	Primary key(CRM_FK,Fone)
);

Create table Especialidade
(
	Id Serial NOT NULL,
	Nome Varchar(150) NOT NULL,
	Primary key(Id)
);

Create table Especialista
(
	CRM_FK Integer NOT NULL,
	Id_FK Integer NOT NULL,
	Primary key(CRM_FK, Id_FK)
);

Alter table Consulta add constraint RI_Consulta_Paciente foreign key (CRH_FK)
references Paciente (CRH) on update restrict on delete restrict;

Alter table Consulta add constraint RI_Consulta_Medico foreign key (CRM_FK)
references Medico (CRM) on update restrict on delete restrict;

Alter table Internacao add constraint RI_Internacao_Consulta foreign key (CRH_FK,CRM_FK,Data_FK)
references Consulta (CRH_FK,CRM_FK,Data) on update restrict on delete restrict;

Alter table Internacao add constraint RI_Internacao_Leito foreign key (Numero_FK)
references Leito (Numero) on update restrict on delete restrict;

Alter table Exame add constraint RI_Exame_TipoExame foreign key (Codigo_FK)
references TipoExame (Codigo) on update restrict on delete restrict;

Alter table Exame add constraint RI_Exame_Consulta foreign key (CRH_FK,CRM_FK,Data_FK)
references Consulta (CRH_FK,CRM_FK,Data) on update restrict on delete restrict;

Alter table Fone add constraint RI_Fone_Medico foreign key (CRM_FK)
references Medico (CRM) on update restrict on delete restrict;

Alter table Especialista add constraint RI_Especialista_Medico foreign key (CRM_FK)
references Medico (CRM) on update restrict on delete restrict;

Alter table Especialista add constraint RI_Especialista_Especialidade foreign key (ID_FK)
references Especialidade (ID) on update restrict on delete restrict;
