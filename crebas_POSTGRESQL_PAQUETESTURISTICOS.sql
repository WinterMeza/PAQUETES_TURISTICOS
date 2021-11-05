/*==============================================================*/
/* DBMS name:      PostgreSQL 8                                 */
/* Created on:     5/11/2021 0:46:59                            */
/*==============================================================*/


drop table AGENTE;

drop table CIUDAD;

drop table CLIENTE;

drop table CONTRATACION;

drop table CONVENIOS;

drop table EMPRESA_PAQUETES;

drop table EPOCAS_VENTA;

drop table PAGO;

drop table PAIS;

drop table PAQUETE_TURISTICO;

drop table PROVINCIA;

drop table SASTIFACCION;

drop table SERVICIOS;

drop table SERVICIOS_ADICIONALES;

drop table TIPO_PAGO;

/*==============================================================*/
/* Table: AGENTE                                                */
/*==============================================================*/
create table AGENTE (
   ID_AGENTE            INT4                 not null,
   ID_EMPRESA_PA        INT4                 not null,
   NOMBRE_A             VARCHAR(100)         not null,
   CEDULA_A             VARCHAR(10)          not null,
   NUME_TELE_G          VARCHAR(10)          not null,
   CORREO_A             VARCHAR(100)         not null,
   FECHA_INGRESO        DATE                 not null,
   constraint PK_AGENTE primary key (ID_AGENTE)
);

/*==============================================================*/
/* Table: CIUDAD                                                */
/*==============================================================*/
create table CIUDAD (
   ID_CIUDAD            INT4                 not null,
   ID_PROVINCIA         INT4                 null,
   NOMBRE_CIUDAD        VARCHAR(50)          not null,
   constraint PK_CIUDAD primary key (ID_CIUDAD)
);

/*==============================================================*/
/* Table: CLIENTE                                               */
/*==============================================================*/
create table CLIENTE (
   ID_CLIENTE           INT4                 not null,
   NOMBRE_C             VARCHAR(100)         not null,
   CEDULA_C             VARCHAR(10)          not null,
   NUME_TELE_C          VARCHAR(10)          not null,
   CORREO_C             VARCHAR(100)         not null,
   TIPO_USUARIO         VARCHAR(20)          null,
   constraint PK_CLIENTE primary key (ID_CLIENTE)
);

/*==============================================================*/
/* Table: CONTRATACION                                          */
/*==============================================================*/
create table CONTRATACION (
   ID_CONTRATACION      INT4                 not null,
   ID_SA                INT4                 not null,
   ID_CLIENTE           INT4                 not null,
   ID_AGENTE            INT4                 not null,
   FECHA_PAGO           DATE                 not null,
   FECHA_INICIO_VIAJE   DATE                 not null,
   FECHA_FIN_VIAJE      DATE                 not null,
   constraint PK_CONTRATACION primary key (ID_CONTRATACION)
);

/*==============================================================*/
/* Table: CONVENIOS                                             */
/*==============================================================*/
create table CONVENIOS (
   ID_CONVENIOS         INT4                 not null,
   ID_EMPRESA_PA        INT4                 null,
   ID_SASTIFACION       INT4                 not null,
   TIPO_EMPRESA         VARCHAR(100)         not null,
   DIRECCION_EMPREC     VARCHAR(100)         not null,
   PROPIETARIO_EMPREC   VARCHAR(100)         not null,
   NUMERO_TELEC         CHAR(10)             not null,
   constraint PK_CONVENIOS primary key (ID_CONVENIOS)
);

/*==============================================================*/
/* Table: EMPRESA_PAQUETES                                      */
/*==============================================================*/
create table EMPRESA_PAQUETES (
   ID_EMPRESA_PA        INT4                 not null,
   ID_EPOCAS            INT4                 not null,
   NOMBRE_E             VARCHAR(50)          not null,
   constraint PK_EMPRESA_PAQUETES primary key (ID_EMPRESA_PA)
);

/*==============================================================*/
/* Table: EPOCAS_VENTA                                          */
/*==============================================================*/
create table EPOCAS_VENTA (
   ID_EPOCAS            INT4                 not null,
   SITIO_E              VARCHAR(100)         not null,
   FECHA_VENTAS_ALTAS   DATE                 not null,
   FECHA_VENTA_BAJAS    DATE                 not null,
   constraint PK_EPOCAS_VENTA primary key (ID_EPOCAS)
);

/*==============================================================*/
/* Table: PAGO                                                  */
/*==============================================================*/
create table PAGO (
   ID_PAGO              INT4                 not null,
   ID_CONTRATACION      INT4                 null,
   ID_TIPO_P            INT4                 not null,
   ID_SERVICIOS         INT4                 not null,
   ID_SA                INT4                 not null,
   TOTAL_PAGO           MONEY                not null,
   constraint PK_PAGO primary key (ID_PAGO)
);

/*==============================================================*/
/* Table: PAIS                                                  */
/*==============================================================*/
create table PAIS (
   ID_PAIS              INT4                 not null,
   NOMBRE_PAIS          VARCHAR(50)          not null,
   constraint PK_PAIS primary key (ID_PAIS)
);

/*==============================================================*/
/* Table: PAQUETE_TURISTICO                                     */
/*==============================================================*/
create table PAQUETE_TURISTICO (
   ID_PT                INT4                 not null,
   ID_EMPRESA_PA        INT4                 not null,
   ID_CIUDAD            INT4                 null,
   ID_AGENTE            INT4                 not null,
   ID_CLIENTE           INT4                 not null,
   ID_CONVENIOS         INT4                 not null,
   TIPO_PT              VARCHAR(100)         not null,
   CANTIDAD_PT          INT4                 not null,
   PRECIO_PT            MONEY                not null,
   TOTAL_PT             MONEY                not null,
   constraint PK_PAQUETE_TURISTICO primary key (ID_PT)
);

/*==============================================================*/
/* Table: PROVINCIA                                             */
/*==============================================================*/
create table PROVINCIA (
   ID_PROVINCIA         INT4                 not null,
   ID_PAIS              INT4                 null,
   NOMBRE_PROVINCIA     VARCHAR(50)          not null,
   constraint PK_PROVINCIA primary key (ID_PROVINCIA)
);

/*==============================================================*/
/* Table: SASTIFACCION                                          */
/*==============================================================*/
create table SASTIFACCION (
   ID_SASTIFACION       INT4                 not null,
   ID_CLIENTE           INT4                 not null,
   FECHA_INCIDENTES     DATE                 not null,
   INCIDENTES_S         VARCHAR(100)         not null,
   TOTAL_VISITAS        INT4                 not null,
   BUENAS_VISITAS       INT4                 not null,
   MALAS_VISITAS        INT4                 not null,
   constraint PK_SASTIFACCION primary key (ID_SASTIFACION)
);

/*==============================================================*/
/* Table: SERVICIOS                                             */
/*==============================================================*/
create table SERVICIOS (
   ID_SERVICIOS         INT4                 not null,
   ID_PT                INT4                 not null,
   HOSPEDAJES           MONEY                not null,
   TRASLADO             MONEY                not null,
   EVENTOS              MONEY                not null,
   constraint PK_SERVICIOS primary key (ID_SERVICIOS)
);

/*==============================================================*/
/* Table: SERVICIOS_ADICIONALES                                 */
/*==============================================================*/
create table SERVICIOS_ADICIONALES (
   ID_SA                INT4                 not null,
   NOMBRE_S             VARCHAR(50)          not null,
   SEGURO_VIDA          MONEY                not null,
   SEGURO_ACCIDENTES    MONEY                not null,
   constraint PK_SERVICIOS_ADICIONALES primary key (ID_SA)
);

/*==============================================================*/
/* Table: TIPO_PAGO                                             */
/*==============================================================*/
create table TIPO_PAGO (
   ID_TIPO_P            INT4                 not null,
   CREDITO_P            MONEY                not null,
   DEBITO_P             MONEY                not null,
   constraint PK_TIPO_PAGO primary key (ID_TIPO_P)
);

alter table AGENTE
   add constraint FK_AGENTE_CONTRATAN_EMPRESA_ foreign key (ID_EMPRESA_PA)
      references EMPRESA_PAQUETES (ID_EMPRESA_PA)
      on delete restrict on update restrict;

alter table CIUDAD
   add constraint FK_CIUDAD_EXISTEN_PROVINCI foreign key (ID_PROVINCIA)
      references PROVINCIA (ID_PROVINCIA)
      on delete restrict on update restrict;

alter table CONTRATACION
   add constraint FK_CONTRATA_BRINDA_SERVICIO foreign key (ID_SA)
      references SERVICIOS_ADICIONALES (ID_SA)
      on delete restrict on update restrict;

alter table CONTRATACION
   add constraint FK_CONTRATA_REALIZA_CLIENTE foreign key (ID_CLIENTE)
      references CLIENTE (ID_CLIENTE)
      on delete restrict on update restrict;

alter table CONTRATACION
   add constraint FK_CONTRATA_REGISTRA_AGENTE foreign key (ID_AGENTE)
      references AGENTE (ID_AGENTE)
      on delete restrict on update restrict;

alter table CONVENIOS
   add constraint FK_CONVENIO_MANTIENE_EMPRESA_ foreign key (ID_EMPRESA_PA)
      references EMPRESA_PAQUETES (ID_EMPRESA_PA)
      on delete restrict on update restrict;

alter table CONVENIOS
   add constraint FK_CONVENIO_REGISTRAN_SASTIFAC foreign key (ID_SASTIFACION)
      references SASTIFACCION (ID_SASTIFACION)
      on delete restrict on update restrict;

alter table EMPRESA_PAQUETES
   add constraint FK_EMPRESA__EXAMINA_EPOCAS_V foreign key (ID_EPOCAS)
      references EPOCAS_VENTA (ID_EPOCAS)
      on delete restrict on update restrict;

alter table PAGO
   add constraint FK_PAGO_POSEE_SERVICIO foreign key (ID_SERVICIOS)
      references SERVICIOS (ID_SERVICIOS)
      on delete restrict on update restrict;

alter table PAGO
   add constraint FK_PAGO_SE_REALIZ_CONTRATA foreign key (ID_CONTRATACION)
      references CONTRATACION (ID_CONTRATACION)
      on delete restrict on update restrict;

alter table PAGO
   add constraint FK_PAGO_TIENE_SERVICIO foreign key (ID_SA)
      references SERVICIOS_ADICIONALES (ID_SA)
      on delete restrict on update restrict;

alter table PAGO
   add constraint FK_PAGO_TIPOPAGO__TIPO_PAG foreign key (ID_TIPO_P)
      references TIPO_PAGO (ID_TIPO_P)
      on delete restrict on update restrict;

alter table PAQUETE_TURISTICO
   add constraint FK_PAQUETE__COMPRA_CLIENTE foreign key (ID_CLIENTE)
      references CLIENTE (ID_CLIENTE)
      on delete restrict on update restrict;

alter table PAQUETE_TURISTICO
   add constraint FK_PAQUETE__J_CIUDAD foreign key (ID_CIUDAD)
      references CIUDAD (ID_CIUDAD)
      on delete restrict on update restrict;

alter table PAQUETE_TURISTICO
   add constraint FK_PAQUETE__OFRECE_EMPRESA_ foreign key (ID_EMPRESA_PA)
      references EMPRESA_PAQUETES (ID_EMPRESA_PA)
      on delete restrict on update restrict;

alter table PAQUETE_TURISTICO
   add constraint FK_PAQUETE__RECIBE_CONVENIO foreign key (ID_CONVENIOS)
      references CONVENIOS (ID_CONVENIOS)
      on delete restrict on update restrict;

alter table PAQUETE_TURISTICO
   add constraint FK_PAQUETE__VENDEN_AGENTE foreign key (ID_AGENTE)
      references AGENTE (ID_AGENTE)
      on delete restrict on update restrict;

alter table PROVINCIA
   add constraint FK_PROVINCI_CONTIENE_PAIS foreign key (ID_PAIS)
      references PAIS (ID_PAIS)
      on delete restrict on update restrict;

alter table SASTIFACCION
   add constraint FK_SASTIFAC_REGISTRAN_CLIENTE foreign key (ID_CLIENTE)
      references CLIENTE (ID_CLIENTE)
      on delete restrict on update restrict;

alter table SERVICIOS
   add constraint FK_SERVICIO_OFRECEN_PAQUETE_ foreign key (ID_PT)
      references PAQUETE_TURISTICO (ID_PT)
      on delete restrict on update restrict;

