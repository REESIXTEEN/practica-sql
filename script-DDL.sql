--------- Crear esquema ---------

CREATE SCHEMA pablogomez AUTHORIZATION fwphzagw


--------- Crear tablas ---------

CREATE TABLE pablogomez.grupo_empresarial(
	id_grupo varchar(20) not null,
	nombre varchar(128) not null,
	descripcion varchar(512) null
);
ALTER TABLE pablogomez.grupo_empresarial
ADD CONSTRAINT grupo_empresarial_PK PRIMARY KEY (id_grupo);


CREATE TABLE pablogomez.marca(
	id_marca varchar(20) not null,
	id_grupo varchar(20) not null,
	nombre varchar(128) not null,
	descripcion varchar(512) null
);
ALTER TABLE pablogomez.marca
ADD CONSTRAINT marca_PK PRIMARY KEY (id_marca);
ALTER TABLE pablogomez.marca
ADD CONSTRAINT marca_id_grupo_FK FOREIGN KEY (id_grupo)
REFERENCES pablogomez.grupo_empresarial(id_grupo);


CREATE TABLE pablogomez.modelo(
	id_modelo varchar(20) not null,
	id_marca varchar(20) not null,
	nombre varchar(128) not null,
	descripcion varchar(512) null
);
ALTER TABLE pablogomez.modelo
ADD CONSTRAINT modelo_PK PRIMARY KEY (id_modelo);
ALTER TABLE pablogomez.modelo
ADD CONSTRAINT modelo_id_marca_FK FOREIGN KEY (id_marca)
REFERENCES pablogomez.marca(id_marca);


CREATE TABLE pablogomez.aseguradora(
	id_aseguradora varchar(20) not null,
	nombre varchar(128) not null,
	descripcion varchar(512) null
);
ALTER TABLE pablogomez.aseguradora
ADD CONSTRAINT aseguradora_PK PRIMARY KEY (id_aseguradora);


CREATE TABLE pablogomez.color(
	id_color varchar(20) not null,
	nombre varchar(128) not null,
	descripcion varchar(512) null
);
ALTER TABLE pablogomez.color
ADD CONSTRAINT color_PK PRIMARY KEY (id_color);


CREATE TABLE pablogomez.coche(
	id_coche varchar(20) not null,
	id_modelo varchar(20) not null,
	id_aseguradora varchar(20) not null,
	id_color varchar(20) not null,
	matricula varchar(20) not null,
	km_totales int not null,
	poliza varchar(128) not null,
	fecha_compra date not null,
	fecha_venta date not null DEFAULT '4000-01-01',
	descripcion varchar(512) null
);
ALTER TABLE pablogomez.coche
ADD CONSTRAINT coche_PK PRIMARY KEY (id_coche);
ALTER TABLE pablogomez.coche
ADD CONSTRAINT coche_id_modelo_FK FOREIGN KEY (id_modelo)
REFERENCES pablogomez.modelo(id_modelo);
ALTER TABLE pablogomez.coche
ADD CONSTRAINT coche_id_aseguradora_FK FOREIGN KEY (id_aseguradora)
REFERENCES pablogomez.aseguradora(id_aseguradora);
ALTER TABLE pablogomez.coche
ADD CONSTRAINT coche_id_color_FK FOREIGN KEY (id_color)
REFERENCES pablogomez.color(id_color);


CREATE TABLE pablogomez.moneda(
	id_moneda varchar(20) not null,
	nombre varchar(128) not null,
	descripcion varchar(512) null
);
ALTER TABLE pablogomez.moneda
ADD CONSTRAINT moneda_PK PRIMARY KEY (id_moneda);


CREATE TABLE pablogomez.revision(
	id_revision varchar(20) not null,
	id_coche varchar(20) not null,
	id_moneda varchar(20) not null,
	fecha date not null,
	kms int not null,
	importe int not null,
	comentarios varchar(512) null
);
ALTER TABLE pablogomez.revision
ADD CONSTRAINT revision_PK PRIMARY KEY (id_revision,id_coche);
ALTER TABLE pablogomez.revision
ADD CONSTRAINT revision_id_coche_FK FOREIGN KEY (id_coche)
REFERENCES pablogomez.coche(id_coche);
ALTER TABLE pablogomez.revision
ADD CONSTRAINT revision_id_moneda_FK FOREIGN KEY (id_moneda)
REFERENCES pablogomez.moneda(id_moneda);
