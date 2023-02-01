
--------- Rellenar tablas ---------

INSERT INTO pablogomez.grupo_empresarial (id_grupo,nombre,descripcion)
VALUES 
('GE-001','Volkswagen', 'Grupo de Alemania'),
('GE-002','General Motors', 'Grupo de Estados Unidos'),
('GE-003','Hyundai', 'Grupo de Asia'),
('GE-004','Stellantis', 'Creado en 2019');


INSERT INTO pablogomez.marca (id_marca,id_grupo,nombre)
VALUES 
('M-001','GE-001','Audi'),
('M-002','GE-001','Seat'),
('M-003','GE-001','Cupra'),
('M-004','GE-002','Chevrolet'),
('M-005','GE-002','Cadillac'),
('M-006','GE-002','Hummer'),
('M-007','GE-003','Hyundai'),
('M-008','GE-003','Kia'),
('M-009','GE-004','Peugeot'),
('M-010','GE-004','Fiat'),
('M-011','GE-004','Opel');


INSERT INTO pablogomez.modelo (id_modelo,id_marca,nombre)
VALUES 
('MOD-001','M-001','A3'),
('MOD-002','M-002','Ibiza'),
('MOD-003','M-003','Formentor'),
('MOD-004','M-004','Camaro'),
('MOD-005','M-005','Escalade'),
('MOD-006','M-006','H1'),
('MOD-007','M-007','Tucson'),
('MOD-008','M-008','Picanto'),
('MOD-009','M-009','208'),
('MOD-010','M-010','500'),
('MOD-011','M-011','Astra');


INSERT INTO pablogomez.aseguradora (id_aseguradora,nombre)
VALUES 
('A-001','Mapfre'),
('A-002','Axa'),
('A-003','Adeslas');


INSERT INTO pablogomez.color (id_color,nombre)
VALUES 
('C-001','Negro'),
('C-002','Blanco'),
('C-003','Naranja');


INSERT INTO pablogomez.coche (id_coche,id_modelo,id_aseguradora,id_color,matricula,km_totales,poliza,fecha_compra,fecha_venta)
VALUES 
('CAR-001','MOD-001','A-001','C-002','3489 HJK',35000,'P9823792','2020-02-10',DEFAULT),
('CAR-002','MOD-002','A-002','C-001','3802 ASD',92834,'P9848227','2019-03-13',DEFAULT),
('CAR-003','MOD-005','A-001','C-001','4950 TYU',98383,'P0912737','2018-05-04',DEFAULT),
('CAR-004','MOD-009','A-003','C-003','1182 NBV',3832,'P0823297','2021-09-05',DEFAULT),
('CAR-005','MOD-011','A-003','C-003','0948 POI',20032,'P1657483','2017-04-17','2020-10-05');


INSERT INTO pablogomez.moneda (id_moneda,nombre)
VALUES 
('COIN-001','EUR'),
('COIN-002','USD'),
('COIN-003','BTC');


INSERT INTO pablogomez.revision (id_revision,id_coche,id_moneda,fecha,kms,importe,comentarios)
VALUES 
('R-001','CAR-003','COIN-001','2019-05-06',25000,150,NULL),
('R-002','CAR-003','COIN-001','2020-03-23',56839,249,NULL),
('R-003','CAR-002','COIN-001','2021-05-29',34789,199,'Perdida de aceite considerable');


--------- consulta sql ---------


SELECT b.nombre as modelo, c.nombre as marca, d.nombre as grupo, a.fecha_compra ,a.matricula , e.nombre as color, a.km_totales ,f.nombre as aseguradora, a.poliza 
FROM pablogomez.coche a JOIN pablogomez.modelo b ON a.id_modelo = b.id_modelo 
JOIN pablogomez.marca c ON b.id_marca = c.id_marca 
JOIN pablogomez.grupo_empresarial d ON c.id_grupo = d.id_grupo 
JOIN pablogomez.color e ON a.id_color = e.id_color 
JOIN pablogomez.aseguradora f ON a.id_aseguradora  = f.id_aseguradora 
WHERE a.fecha_venta = '4000-01-01';



