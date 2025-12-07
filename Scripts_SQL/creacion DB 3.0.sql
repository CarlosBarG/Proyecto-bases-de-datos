/*==============================================================*/
/* DBMS name:      ORACLE Version 12c                           */
/* Created on:     6/12/2025 8:34:37 p. m.                      */
/*==============================================================*/


alter table CASO
   drop constraint FK_CASO_C___C_CLIENTE;

alter table CASO
   drop constraint FK_CASO_C___ESP_ESPECIAL;

alter table CLIENTE
   drop constraint FK_CLIENTE_C___TD_TIPODOCU;

alter table CONTACTO
   drop constraint FK_CONTACTO_CL___C_CLIENTE;

alter table CONTACTO
   drop constraint FK_CONTACTO_RELATIONS_TIPOCONT;

alter table DOCUMENTO
   drop constraint FK_DOCUMENT_E___D_EXPEDIEN;

alter table ESPECIA_ETAPA
   drop constraint FK_ESPECIA__ESP___E_E_ESPECIAL;

alter table ESPECIA_ETAPA
   drop constraint FK_ESPECIA__E___E_E_ETAPAPRO;

alter table ESPECIA_ETAPA
   drop constraint FK_ESPECIA__IM___E_E_IMPUGNAC;

alter table ESPECIA_ETAPA
   drop constraint FK_ESPECIA__I___E_E_INSTANCI;

alter table ESP___ABOGADO
   drop constraint FK_ESP___AB_ESP___A_ABOGADO;

alter table ESP___ABOGADO
   drop constraint FK_ESP___AB_ESP___A2_ESPECIAL;

alter table EXPEDIENTE
   drop constraint FK_EXPEDIEN_C___E_CASO;

alter table EXPEDIENTE
   drop constraint FK_EXPEDIEN_E_E___E_ESPECIA_;

alter table EXPEDIENTE
   drop constraint FK_EXPEDIEN_E___A_ABOGADO;

alter table EXPEDIENTE
   drop constraint FK_EXPEDIEN_E___L_LUGAR;

alter table LUGAR
   drop constraint FK_LUGAR_L___L_LUGAR;

alter table LUGAR
   drop constraint FK_LUGAR_L___TL_TIPOLUGA;

alter table PAGO
   drop constraint FK_PAGO_FP___P_FORMAPAG;

alter table PAGO
   drop constraint FK_PAGO_F___P_FRANQUIC;

alter table PAGO
   drop constraint FK_PAGO_RELATIONS_CASO;

alter table RESULTADO
   drop constraint FK_RESULTAD_E___R_EXPEDIEN;

alter table SUCESO
   drop constraint FK_SUCESO_E___S_EXPEDIEN;

drop table ABOGADO cascade constraints;

drop index C___ESP_FK;

drop index C___C_FK;

drop table CASO cascade constraints;

drop index C___TD_FK;

drop table CLIENTE cascade constraints;

drop index CL___C_FK;

drop index RELATIONSHIP_1_FK;

drop table CONTACTO cascade constraints;

drop index E___D_FK;

drop table DOCUMENTO cascade constraints;

drop table ESPECIALIZACION cascade constraints;

drop index ESP___E_E_FK;

drop index IM___E_E_FK;

drop index E___E_E_FK;

drop index I___E_E_FK;

drop table ESPECIA_ETAPA cascade constraints;

drop index ESP___A2_FK;

drop index ESP___A_FK;

drop table ESP___ABOGADO cascade constraints;

drop table ETAPAPROCESAL cascade constraints;

drop index E_E___E_FK;

drop index E___A_FK;

drop index E___L_FK;

drop index C___E_FK;

drop table EXPEDIENTE cascade constraints;

drop table FORMAPAGO cascade constraints;

drop table FRANQUICIA cascade constraints;

drop table IMPUGNACION cascade constraints;

drop table INSTANCIA cascade constraints;

drop index L___L_FK;

drop index L___TL_FK;

drop table LUGAR cascade constraints;

drop index RELATIONSHIP_23_FK;

drop index F___P_FK;

drop index FP___P_FK;

drop table PAGO cascade constraints;

drop index E___R_FK;

drop table RESULTADO cascade constraints;

drop index E___S_FK;

drop table SUCESO cascade constraints;

drop table TIPOCONTACT cascade constraints;

drop table TIPODOCUMENTO cascade constraints;

drop table TIPOLUGAR cascade constraints;

/*==============================================================*/
/* Table: ABOGADO                                               */
/*==============================================================*/
create table ABOGADO (
   CEDULA               VARCHAR2(10)          not null,
   NOMBRE               VARCHAR2(30)          not null,
   APELLIDO             VARCHAR2(30)          not null,
   NTARJETAPROFESIONAL  VARCHAR2(5)           not null,
   constraint PK_ABOGADO primary key (CEDULA)
);

/*==============================================================*/
/* Table: CASO                                                  */
/*==============================================================*/
create table CASO (
   NOCASO               NUMBER(5,0)           not null,
   CODCLIENTE           VARCHAR2(5)           not null,
   CODESPECIALIZACION   VARCHAR2(3)           not null,
   FECHAINICIO          DATE                  not null,
   FECHAFIN             DATE,
   VALOR                VARCHAR2(10)          not null,
   constraint PK_CASO primary key (NOCASO)
);

/*==============================================================*/
/* Index: C___C_FK                                              */
/*==============================================================*/
create index C___C_FK on CASO (
   CODCLIENTE ASC
);

/*==============================================================*/
/* Index: C___ESP_FK                                            */
/*==============================================================*/
create index C___ESP_FK on CASO (
   CODESPECIALIZACION ASC
);

/*==============================================================*/
/* Table: CLIENTE                                               */
/*==============================================================*/
create table CLIENTE (
   CODCLIENTE           VARCHAR2(5)           not null,
   IDTIPODOC            VARCHAR2(2)           not null,
   NOMCLIENTE           VARCHAR2(30)          not null,
   APELLCLIENTE         VARCHAR2(30)          not null,
   NDOCUMENTO           VARCHAR2(15)          not null,
   constraint PK_CLIENTE primary key (CODCLIENTE)
);

/*==============================================================*/
/* Index: C___TD_FK                                             */
/*==============================================================*/
create index C___TD_FK on CLIENTE (
   IDTIPODOC ASC
);

/*==============================================================*/
/* Table: CONTACTO                                              */
/*==============================================================*/
create table CONTACTO (
   CODCLIENTE           VARCHAR2(5)           not null,
   CONSECONTACTO        NUMBER(4,0)           not null,
   IDTIPOCONTA          VARCHAR2(3)           not null,
   VALORCONTACTO        VARCHAR2(50)          not null,
   NOTIFICACION         SMALLINT              not null,
   constraint PK_CONTACTO primary key (CODCLIENTE, CONSECONTACTO)
);

/*==============================================================*/
/* Index: RELATIONSHIP_1_FK                                     */
/*==============================================================*/
create index RELATIONSHIP_1_FK on CONTACTO (
   IDTIPOCONTA ASC
);

/*==============================================================*/
/* Index: CL___C_FK                                             */
/*==============================================================*/
create index CL___C_FK on CONTACTO (
   CODCLIENTE ASC
);

/*==============================================================*/
/* Table: DOCUMENTO                                             */
/*==============================================================*/
create table DOCUMENTO (
   CODESPECIALIZACION   VARCHAR2(3)           not null,
   PASOETAPA            NUMBER(2,0)           not null,
   NOCASO               NUMBER(5,0)           not null,
   CONSECEXPE           NUMBER(4,0)           not null,
   CONDOC               NUMBER(4,0)           not null,
   UBICADOC             VARCHAR2(50)          not null,
   constraint PK_DOCUMENTO primary key (CODESPECIALIZACION, PASOETAPA, NOCASO, CONSECEXPE, CONDOC)
);

/*==============================================================*/
/* Index: E___D_FK                                              */
/*==============================================================*/
create index E___D_FK on DOCUMENTO (
   CODESPECIALIZACION ASC,
   PASOETAPA ASC,
   NOCASO ASC,
   CONSECEXPE ASC
);

/*==============================================================*/
/* Table: ESPECIALIZACION                                       */
/*==============================================================*/
create table ESPECIALIZACION (
   CODESPECIALIZACION   VARCHAR2(3)           not null,
   NOMESPECIALIZACION   VARCHAR2(30)          not null,
   constraint PK_ESPECIALIZACION primary key (CODESPECIALIZACION)
);

/*==============================================================*/
/* Table: ESPECIA_ETAPA                                         */
/*==============================================================*/
create table ESPECIA_ETAPA (
   CODESPECIALIZACION   VARCHAR2(3)           not null,
   PASOETAPA            NUMBER(2,0)           not null,
   NINSTANCIA           NUMBER(1,0),
   CODETAPA             VARCHAR2(3)           not null,
   IDIMPUGNA            VARCHAR2(2),
   constraint PK_ESPECIA_ETAPA primary key (CODESPECIALIZACION, PASOETAPA)
);

/*==============================================================*/
/* Index: I___E_E_FK                                            */
/*==============================================================*/
create index I___E_E_FK on ESPECIA_ETAPA (
   NINSTANCIA ASC
);

/*==============================================================*/
/* Index: E___E_E_FK                                            */
/*==============================================================*/
create index E___E_E_FK on ESPECIA_ETAPA (
   CODETAPA ASC
);

/*==============================================================*/
/* Index: IM___E_E_FK                                           */
/*==============================================================*/
create index IM___E_E_FK on ESPECIA_ETAPA (
   IDIMPUGNA ASC
);

/*==============================================================*/
/* Index: ESP___E_E_FK                                          */
/*==============================================================*/
create index ESP___E_E_FK on ESPECIA_ETAPA (
   CODESPECIALIZACION ASC
);

/*==============================================================*/
/* Table: ESP___ABOGADO                                         */
/*==============================================================*/
create table ESP___ABOGADO (
   CEDULA               VARCHAR2(10)          not null,
   CODESPECIALIZACION   VARCHAR2(3)           not null,
   constraint PK_ESP___ABOGADO primary key (CEDULA, CODESPECIALIZACION)
);

/*==============================================================*/
/* Index: ESP___A_FK                                            */
/*==============================================================*/
create index ESP___A_FK on ESP___ABOGADO (
   CEDULA ASC
);

/*==============================================================*/
/* Index: ESP___A2_FK                                           */
/*==============================================================*/
create index ESP___A2_FK on ESP___ABOGADO (
   CODESPECIALIZACION ASC
);

/*==============================================================*/
/* Table: ETAPAPROCESAL                                         */
/*==============================================================*/
create table ETAPAPROCESAL (
   CODETAPA             VARCHAR2(3)           not null,
   NOMETAPA             VARCHAR2(30)          not null,
   constraint PK_ETAPAPROCESAL primary key (CODETAPA)
);

/*==============================================================*/
/* Table: EXPEDIENTE                                            */
/*==============================================================*/
create table EXPEDIENTE (
   CODESPECIALIZACION   VARCHAR2(3)           not null,
   PASOETAPA            NUMBER(2,0)           not null,
   NOCASO               NUMBER(5,0)           not null,
   CONSECEXPE           NUMBER(4,0)           not null,
   CODLUGAR             VARCHAR2(5)           not null,
   CEDULA               VARCHAR2(10),
   FECHAETAPA           DATE                  not null,
   constraint PK_EXPEDIENTE primary key (CODESPECIALIZACION, PASOETAPA, NOCASO, CONSECEXPE)
);

/*==============================================================*/
/* Index: C___E_FK                                              */
/*==============================================================*/
create index C___E_FK on EXPEDIENTE (
   NOCASO ASC
);

/*==============================================================*/
/* Index: E___L_FK                                              */
/*==============================================================*/
create index E___L_FK on EXPEDIENTE (
   CODLUGAR ASC
);

/*==============================================================*/
/* Index: E___A_FK                                              */
/*==============================================================*/
create index E___A_FK on EXPEDIENTE (
   CEDULA ASC
);

/*==============================================================*/
/* Index: E_E___E_FK                                            */
/*==============================================================*/
create index E_E___E_FK on EXPEDIENTE (
   CODESPECIALIZACION ASC,
   PASOETAPA ASC
);

/*==============================================================*/
/* Table: FORMAPAGO                                             */
/*==============================================================*/
create table FORMAPAGO (
   IDFORMAPAGO          VARCHAR2(3)           not null,
   DESCFORMAPAGO        VARCHAR2(30)          not null,
   constraint PK_FORMAPAGO primary key (IDFORMAPAGO)
);

/*==============================================================*/
/* Table: FRANQUICIA                                            */
/*==============================================================*/
create table FRANQUICIA (
   CODFRANQUICIA        VARCHAR2(3)           not null,
   NOMFRANQUICIA        VARCHAR2(40)          not null,
   constraint PK_FRANQUICIA primary key (CODFRANQUICIA)
);

/*==============================================================*/
/* Table: IMPUGNACION                                           */
/*==============================================================*/
create table IMPUGNACION (
   IDIMPUGNA            VARCHAR2(2)           not null,
   NOMIMPUGNA           VARCHAR2(30)          not null,
   constraint PK_IMPUGNACION primary key (IDIMPUGNA)
);

/*==============================================================*/
/* Table: INSTANCIA                                             */
/*==============================================================*/
create table INSTANCIA (
   NINSTANCIA           NUMBER(1,0)           not null,
   constraint PK_INSTANCIA primary key (NINSTANCIA)
);

/*==============================================================*/
/* Table: LUGAR                                                 */
/*==============================================================*/
create table LUGAR (
   CODLUGAR             VARCHAR2(5)           not null,
   IDTIPOLUGAR          VARCHAR2(4)           not null,
   LUG_CODLUGAR         VARCHAR2(5),
   NOMLUGAR             VARCHAR2(30)          not null,
   DIRELUGAR            VARCHAR2(40)          not null,
   TELLUGAR             VARCHAR2(15)          not null,
   EMAILLUGAR           VARCHAR2(50),
   constraint PK_LUGAR primary key (CODLUGAR)
);

/*==============================================================*/
/* Index: L___TL_FK                                             */
/*==============================================================*/
create index L___TL_FK on LUGAR (
   IDTIPOLUGAR ASC
);

/*==============================================================*/
/* Index: L___L_FK                                              */
/*==============================================================*/
create index L___L_FK on LUGAR (
   LUG_CODLUGAR ASC
);

/*==============================================================*/
/* Table: PAGO                                                  */
/*==============================================================*/
create table PAGO (
   CONSECPAGO           NUMBER(3,0)           not null,
   IDFORMAPAGO          VARCHAR2(3),
   CODFRANQUICIA        VARCHAR2(3),
   NOCASO               NUMBER(5,0)           not null,
   FECHAPAGO            DATE,
   VALORPAGO            NUMBER(10,0)          not null,
   NTARJETA             NUMBER(15,0),
   constraint PK_PAGO primary key (CONSECPAGO)
);

/*==============================================================*/
/* Index: FP___P_FK                                             */
/*==============================================================*/
create index FP___P_FK on PAGO (
   IDFORMAPAGO ASC
);

/*==============================================================*/
/* Index: F___P_FK                                              */
/*==============================================================*/
create index F___P_FK on PAGO (
   CODFRANQUICIA ASC
);

/*==============================================================*/
/* Index: RELATIONSHIP_23_FK                                    */
/*==============================================================*/
create index RELATIONSHIP_23_FK on PAGO (
   NOCASO ASC
);

/*==============================================================*/
/* Table: RESULTADO                                             */
/*==============================================================*/
create table RESULTADO (
   CODESPECIALIZACION   VARCHAR2(3)           not null,
   PASOETAPA            NUMBER(2,0)           not null,
   NOCASO               NUMBER(5,0)           not null,
   CONSECEXPE           NUMBER(4,0)           not null,
   CONRESUL             NUMBER(4,0)           not null,
   DESCRESUL            VARCHAR2(200)         not null,
   constraint PK_RESULTADO primary key (CODESPECIALIZACION, PASOETAPA, NOCASO, CONSECEXPE, CONRESUL)
);

/*==============================================================*/
/* Index: E___R_FK                                              */
/*==============================================================*/
create index E___R_FK on RESULTADO (
   CODESPECIALIZACION ASC,
   PASOETAPA ASC,
   NOCASO ASC,
   CONSECEXPE ASC
);

/*==============================================================*/
/* Table: SUCESO                                                */
/*==============================================================*/
create table SUCESO (
   CODESPECIALIZACION   VARCHAR2(3)           not null,
   PASOETAPA            NUMBER(2,0)           not null,
   NOCASO               NUMBER(5,0)           not null,
   CONSECEXPE           NUMBER(4,0)           not null,
   CONSUCESO            NUMBER(4,0)           not null,
   DESCSUCESO           CHAR(200)             not null,
   constraint PK_SUCESO primary key (CODESPECIALIZACION, PASOETAPA, NOCASO, CONSECEXPE, CONSUCESO)
);

/*==============================================================*/
/* Index: E___S_FK                                              */
/*==============================================================*/
create index E___S_FK on SUCESO (
   CODESPECIALIZACION ASC,
   PASOETAPA ASC,
   NOCASO ASC,
   CONSECEXPE ASC
);

/*==============================================================*/
/* Table: TIPOCONTACT                                           */
/*==============================================================*/
create table TIPOCONTACT (
   IDTIPOCONTA          VARCHAR2(3)           not null,
   DESCTIPOCONTA        VARCHAR2(30)          not null,
   constraint PK_TIPOCONTACT primary key (IDTIPOCONTA)
);

/*==============================================================*/
/* Table: TIPODOCUMENTO                                         */
/*==============================================================*/
create table TIPODOCUMENTO (
   IDTIPODOC            VARCHAR2(2)           not null,
   DESCTIPODOC          VARCHAR2(30)          not null,
   constraint PK_TIPODOCUMENTO primary key (IDTIPODOC)
);

/*==============================================================*/
/* Table: TIPOLUGAR                                             */
/*==============================================================*/
create table TIPOLUGAR (
   IDTIPOLUGAR          VARCHAR2(4)           not null,
   DESCTIPOLUGAR        VARCHAR2(50)          not null,
   constraint PK_TIPOLUGAR primary key (IDTIPOLUGAR)
);

alter table CASO
   add constraint FK_CASO_C___C_CLIENTE foreign key (CODCLIENTE)
      references CLIENTE (CODCLIENTE);

alter table CASO
   add constraint FK_CASO_C___ESP_ESPECIAL foreign key (CODESPECIALIZACION)
      references ESPECIALIZACION (CODESPECIALIZACION);

alter table CLIENTE
   add constraint FK_CLIENTE_C___TD_TIPODOCU foreign key (IDTIPODOC)
      references TIPODOCUMENTO (IDTIPODOC);

alter table CONTACTO
   add constraint FK_CONTACTO_CL___C_CLIENTE foreign key (CODCLIENTE)
      references CLIENTE (CODCLIENTE);

alter table CONTACTO
   add constraint FK_CONTACTO_RELATIONS_TIPOCONT foreign key (IDTIPOCONTA)
      references TIPOCONTACT (IDTIPOCONTA);

alter table DOCUMENTO
   add constraint FK_DOCUMENT_E___D_EXPEDIEN foreign key (CODESPECIALIZACION, PASOETAPA, NOCASO, CONSECEXPE)
      references EXPEDIENTE (CODESPECIALIZACION, PASOETAPA, NOCASO, CONSECEXPE);

alter table ESPECIA_ETAPA
   add constraint FK_ESPECIA__ESP___E_E_ESPECIAL foreign key (CODESPECIALIZACION)
      references ESPECIALIZACION (CODESPECIALIZACION);

alter table ESPECIA_ETAPA
   add constraint FK_ESPECIA__E___E_E_ETAPAPRO foreign key (CODETAPA)
      references ETAPAPROCESAL (CODETAPA);

alter table ESPECIA_ETAPA
   add constraint FK_ESPECIA__IM___E_E_IMPUGNAC foreign key (IDIMPUGNA)
      references IMPUGNACION (IDIMPUGNA);

alter table ESPECIA_ETAPA
   add constraint FK_ESPECIA__I___E_E_INSTANCI foreign key (NINSTANCIA)
      references INSTANCIA (NINSTANCIA);

alter table ESP___ABOGADO
   add constraint FK_ESP___AB_ESP___A_ABOGADO foreign key (CEDULA)
      references ABOGADO (CEDULA);

alter table ESP___ABOGADO
   add constraint FK_ESP___AB_ESP___A2_ESPECIAL foreign key (CODESPECIALIZACION)
      references ESPECIALIZACION (CODESPECIALIZACION);

alter table EXPEDIENTE
   add constraint FK_EXPEDIEN_C___E_CASO foreign key (NOCASO)
      references CASO (NOCASO);

alter table EXPEDIENTE
   add constraint FK_EXPEDIEN_E_E___E_ESPECIA_ foreign key (CODESPECIALIZACION, PASOETAPA)
      references ESPECIA_ETAPA (CODESPECIALIZACION, PASOETAPA);

alter table EXPEDIENTE
   add constraint FK_EXPEDIEN_E___A_ABOGADO foreign key (CEDULA)
      references ABOGADO (CEDULA);

alter table EXPEDIENTE
   add constraint FK_EXPEDIEN_E___L_LUGAR foreign key (CODLUGAR)
      references LUGAR (CODLUGAR);

alter table LUGAR
   add constraint FK_LUGAR_L___L_LUGAR foreign key (LUG_CODLUGAR)
      references LUGAR (CODLUGAR);

alter table LUGAR
   add constraint FK_LUGAR_L___TL_TIPOLUGA foreign key (IDTIPOLUGAR)
      references TIPOLUGAR (IDTIPOLUGAR);

alter table PAGO
   add constraint FK_PAGO_FP___P_FORMAPAG foreign key (IDFORMAPAGO)
      references FORMAPAGO (IDFORMAPAGO);

alter table PAGO
   add constraint FK_PAGO_F___P_FRANQUIC foreign key (CODFRANQUICIA)
      references FRANQUICIA (CODFRANQUICIA);

alter table PAGO
   add constraint FK_PAGO_RELATIONS_CASO foreign key (NOCASO)
      references CASO (NOCASO);

alter table RESULTADO
   add constraint FK_RESULTAD_E___R_EXPEDIEN foreign key (CODESPECIALIZACION, PASOETAPA, NOCASO, CONSECEXPE)
      references EXPEDIENTE (CODESPECIALIZACION, PASOETAPA, NOCASO, CONSECEXPE);

alter table SUCESO
   add constraint FK_SUCESO_E___S_EXPEDIEN foreign key (CODESPECIALIZACION, PASOETAPA, NOCASO, CONSECEXPE)
      references EXPEDIENTE (CODESPECIALIZACION, PASOETAPA, NOCASO, CONSECEXPE);

