/* empresa de transporte de carga*/
/*Eliminar la tabala si existe*/
drop database if exists bdTransporteCarga;

/*Creacion de la Base de Datos*/
Create database bdTransporteCarga;

/*Indica que estoy usando una base de datos especifica*/
use bdTransporteCarga;

/*Se crean las tablas en la base de datos indicando que campos son llave primaria y llave foranea*/

Create table tipoDocumento
(
	idTipo int primary key,
    descripcion  varchar(50)
);


Create table conductor
(
	idTipo int,
    idConductor bigint primary key,
    nombre    varchar(50),
    apellido  varchar(50),
    direccion varchar(50),
    correo varchar(50),
    telefono varchar(10),
    foreign key (idTipo) references tipoDocumento(idTipo)
);





Create table marca
(
	idMarca     int primary key,   
    descripcion varchar(50)
);

Create table modelo
(
	idModelo     int primary key,   
    descripcion int
);


Create table camion
(
	idCamion int unique,
    placa varchar(9) primary key,
    idConductor bigint,   
    idMarca     int,
    idModelo     int,
    capacidadMaxTon  int,
    foreign key (idconductor) references conductor(idConductor),
	foreign key (idMarca)     references marca(idMarca),
    foreign key (idModelo)    references modelo(idModelo)
);


Create table cliente
(
	idCliente int primary key,
    nombre    varchar(50),
    apellido  varchar(50),
    direccion varchar(50),
    correo varchar(50),
    telefono varchar(10)
);


Create table factura
(
	idFactura int primary key,
    idCliente int,
    idCamion  int,
    detalle    varchar(50),
    cantidadTon  int,
    valor decimal(12,2),
    fecha date,
    foreign key (idCliente) references cliente(idCliente),
    foreign key (idCamion) references  camion(idCamion)
);


Create table cargo
(
	idCargo int primary key,
    descripcion varchar(50)
);

Create table salario
(
	idSalario int primary key,
    valor decimal(12,2)
);

Create table estadoFun
(
	idEstado int primary key,
    descripcion varchar(30)
);


Create table funcionario
(
	idFuncionario int primary key,
    idTipo int,
    numeroDocumento bigint,
    nombre    varchar(50),
    apellido  varchar(50),
    direccion varchar(50),
    correo varchar(50),
    telefono varchar(10),
    idCargo  int,
    idSalario int,
    fechaIngreso date,
    fechaSalida date,
    idEstado int,
    foreign key (idTipo) references tipoDocumento(idTipo),
    foreign key (idCargo) references cargo(idCargo),
    foreign key (idSalario) references salario(idSalario),
    foreign key (idEstado) references estadoFun(idEstado)
);





/* Se crean los Query para el ingreso de la informacion dentro de las tablas*/

use bdTransporteCarga;
/*Cliente*/
/*Ingresar = Insertar */

insert into cliente(idCliente, nombre,apellido,direccion,correo,telefono) values (1,"Gustavo", "Jimenez","calle 65","tavo@bancodeoccidente.com.co",78545212 );
insert into cliente(idCliente, nombre,apellido,direccion,correo,telefono) values (2,"Patricia", "Ramirez","calle 66","para@bancodeoccidente.com.co",78545212 );
insert into cliente(idCliente, nombre,apellido,direccion,correo,telefono) values (3,"Fernando", "Palacios","calle 67","ferla@bancodeoccidente.com.co",78545212 );
insert into cliente(idCliente, nombre,apellido,direccion,correo,telefono) values (4,"Juana", "Bermudez","calle 68","juber@bancodeoccidente.com.co",78545212 );

/*Modificar */

use bdTransporteCarga;
update cliente set telefono="58584521"
where idcliente = 2;

/*Eliminar*/
Delete from cliente 
where  idcliente = 4;


select * from cliente;

/**/

/*Marca*/
/*Ingresar = Insertar */

insert into marca(idMarca,descripcion) values (1,"VOLVO" );
insert into marca(idMarca,descripcion) values (2,"SCANIA" );
insert into marca(idMarca,descripcion) values (3,"MERCEDES");
insert into marca(idMarca,descripcion) values (4,"FOTON");

/*Modificar */

use bdTransporteCarga;
update marca set descripcion="IVECO"
where idMarca = 3;

/*Eliminar*/
Delete from marca 
where  idMarca = 4;


select * from marca;


/*Modelo*/
/*Ingresar = Insertar */

ALTER TABLE modelo modify descripcion varchar (50);

insert into modelo(idModelo,descripcion) values (1,"EUROSTAR" );
insert into modelo(idModelo,descripcion) values (2,"EUROTECH" );
insert into modelo(idModelo,descripcion) values (3,"TURBOCITY");
insert into modelo(idModelo,descripcion) values (4,"DAILY");

/*Modificar */

use bdTransporteCarga;
update modelo set descripcion="IVECO DAILY"
where idModelo = 4;

/*Eliminar*/
Delete from modelo 
where  idModelo = 4;


select * from modelo;


/*tipoDocumento*/
/*Ingresar = Insertar */


insert into tipoDocumento(idTipo,descripcion) values (1,"NIT" );
insert into tipoDocumento(idTipo,descripcion) values (2,"CC" );
insert into tipoDocumento(idTipo,descripcion) values (3,"TI" );
insert into tipoDocumento(idTipo,descripcion) values (4,"PA" );

/*Modificar */

use bdTransporteCarga;
update tipoDocumento set descripcion="PS"
where idTipo = 4;

/*Eliminar*/
Delete from tipoDocumento 
where  idTipo = 4;


select * from tipoDocumento;

/*Conductor*/
/*Ingresar = Insertar */

insert into conductor(idTipo,idConductor,nombre,apellido,direccion,correo,telefono) values (1,9008566525,"JUAN","PEREZ","CRA 85S 79-52","AEROCARGA@YOPMAIL.COM","3158523635");
insert into conductor(idTipo,idConductor,nombre,apellido,direccion,correo,telefono) values (2,9008864485,"PEDRO","GONZALEZ","CRA 85 9-52","CARGAGONZO@YOPMAIL.COM","3156956578");
insert into conductor(idTipo,idConductor,nombre,apellido,direccion,correo,telefono) values (3,9008554645,"FELIPE","PRADA","CRA 92 79-52","PCARGA@YOPMAIL.COM","3556987123");
insert into conductor(idTipo,idConductor,nombre,apellido,direccion,correo,telefono) values (3,9008557758,"JAIRO","RICO","CRA 25 9-52","CARGOREEL@YOPMAIL.COM","3215485236");

/*Modificar */
use bdTransporteCarga;
update conductor set idConductor=54896566566
where idConductor = 9008557758;

/*Eliminar*/
Delete from conductor 
where  idConductor = 54896566566;


select * from conductor;


/*Camion*/
/*Ingresar = Insertar */

ALTER TABLE camion modify idConductor bigint;


insert into camion(idCamion,placa,idConductor,idMarca,idModelo,capacidadMaxTon) values (1,"AWS-899",9008566525,1,1,15);
insert into camion(idCamion,placa,idConductor,idMarca,idModelo,capacidadMaxTon) values (2,"AFP-425",9008864485,2,2,20);
insert into camion(idCamion,placa,idConductor,idMarca,idModelo,capacidadMaxTon) values (3,"RIL-198",9008554645,3,3,25);
insert into camion(idCamion,placa,idConductor,idMarca,idModelo,capacidadMaxTon) values (4,"KFD-456",9008554645,2,1,8);

/*Modificar */
use bdTransporteCarga;
update camion set capacidadMaxTon=30
where placa = "KFD-456";

/*Eliminar*/
Delete from camion 
where  placa = "KFD-456";


select * from camion;


/*Factura*/
/*Ingresar = Insertar */

insert into factura(idFactura,idCliente,idCamion,detalle,cantidadTon,valor,fecha) values (0001,1,1,"Carga de Arroz",1,2500,"2023-01-01");
insert into factura(idFactura,idCliente,idCamion,detalle,cantidadTon,valor,fecha) values (0002,2,2,"Hierro",5,5500,"2023-01-02");
insert into factura(idFactura,idCliente,idCamion,detalle,cantidadTon,valor,fecha) values (0003,3,3,"Aceite",2,3000,"2023-01-03");
insert into factura(idFactura,idCliente,idCamion,detalle,cantidadTon,valor,fecha) values (0004,1,1,"Electrodomesticos",10,10000,"2023-01-04");
insert into factura(idFactura,idCliente,idCamion,detalle,cantidadTon,valor,fecha) values (0005,2,3,"Cemento",15,20000,"2023-01-05");
insert into factura(idFactura,idCliente,idCamion,detalle,cantidadTon,valor,fecha) values (0006,3,2,"Respuestos",10,10000,"2023-01-06");
insert into factura(idFactura,idCliente,idCamion,detalle,cantidadTon,valor,fecha) values (0007,1,1,"Colchones",1,2500,"2023-01-07");
insert into factura(idFactura,idCliente,idCamion,detalle,cantidadTon,valor,fecha) values (0008,2,2,"Cemento",15,20000,"2023-01-08");
insert into factura(idFactura,idCliente,idCamion,detalle,cantidadTon,valor,fecha) values (0009,3,1,"Licores",10,10000,"2023-01-09");
/*Modificar */
use bdTransporteCarga;
update factura set detalle="Cerveza"
where idFactura = 0009;

/*Eliminar*/
Delete from factura 
where  idFactura = 00002;



/*Cargo*/
/*Ingresar = Insertar */

insert into cargo(idCargo,descripcion) values (1,"Secretaria");
insert into cargo(idCargo,descripcion) values (2,"Vigilante");
insert into cargo(idCargo,descripcion) values (3,"Analista Logistica");
insert into cargo(idCargo,descripcion) values (4,"Comercial");
insert into cargo(idCargo,descripcion) values (5,"Bodeguero");
/*Modificar */

use bdTransporteCarga;
update cargo set descripcion="Auxiliar de Bodega"
where idCargo = 5;

/*Eliminar*/
/*Delete from cargo */
/*where  idCargo = 4;*/


select * from cargo;

/**/


/*Salario*/
/*Ingresar = Insertar */

insert into salario(idSalario,valor) values (1,1250000.00);
insert into salario(idSalario,valor) values (2,1000000.00);
insert into salario(idSalario,valor) values (3,1500000);
insert into salario(idSalario,valor) values (4,2000000.00);
insert into salario(idSalario,valor) values (5,1300000.00);
/*Modificar */

use bdTransporteCarga;
update salario set valor=2500000
where idSalario = 4;

/*Eliminar*/
/*Delete from salario*/
/*where  idSalario = 4;*/


select * from salario;

/**/


/*Estado*/
/*Ingresar = Insertar */

insert into estadoFun(idEstado,descripcion) values (1,"Activo");
insert into estadoFun(idEstado,descripcion) values (2,"Vacaciones");
insert into estadoFun(idEstado,descripcion) values (3,"Retirado");
insert into estadoFun(idEstado,descripcion) values (4,"No remunerado");
/*Modificar */

use bdTransporteCarga;
update estadoFun set descripcion="Vacante"
where idEstado = 4;

/*Eliminar*/
Delete from estadoFun
where  idEstado = 4;


select * from salario;

/**/



/*Funcionario*/
/*Ingresar = Insertar */

insert into funcionario(idFuncionario,idTipo,numeroDocumento,nombre,apellido,direccion,correo,telefono,idCargo,idSalario,fechaIngreso,fechaSalida,idEstado)values (1,1,80754214,"Felipe","Casallas","cra 7 # 19-12","felica@yopmail.com","56523255",3,3,"2021-01-01",null,1);
insert into funcionario(idFuncionario,idTipo,numeroDocumento,nombre,apellido,direccion,correo,telefono,idCargo,idSalario,fechaIngreso,fechaSalida,idEstado)values (2,2,80754214,"Goergina","Celis","cra 5 # 9-11","geoce@yopmail.com","5655412",1,1,"2021-05-01",null,1);
insert into funcionario(idFuncionario,idTipo,numeroDocumento,nombre,apellido,direccion,correo,telefono,idCargo,idSalario,fechaIngreso,fechaSalida,idEstado)values (3,1,80754214,"Gerardo","Masias","cra 3 # 1-8","gema@yopmail.com","5654412",2,1,"2020-01-01",null,1);
insert into funcionario(idFuncionario,idTipo,numeroDocumento,nombre,apellido,direccion,correo,telefono,idCargo,idSalario,fechaIngreso,fechaSalida,idEstado)values (4,2,80656714,"Hernan","Perez","cra 25 # 1-12","herp@yopmail.com","565423698",4,4,"2021-01-01","2022-01-01",3);
insert into funcionario(idFuncionario,idTipo,numeroDocumento,nombre,apellido,direccion,correo,telefono,idCargo,idSalario,fechaIngreso,fechaSalida,idEstado)values (5,1,80796314,"Luisa","Lopez","cra 32 # 9-12","lulo@yopmail.com","56525545",4,4,"2022-01-01",null,1);
insert into funcionario(idFuncionario,idTipo,numeroDocumento,nombre,apellido,direccion,correo,telefono,idCargo,idSalario,fechaIngreso,fechaSalida,idEstado)values (6,2,80452114,"Ernesto","Buendia","cra 63 # 9-1","erbun@yopmail.com","56526646",5,5,"2021-01-01",null,1);
insert into funcionario(idFuncionario,idTipo,numeroDocumento,nombre,apellido,direccion,correo,telefono,idCargo,idSalario,fechaIngreso,fechaSalida,idEstado)values (7,2,80765484,"Ricardo","Fernan","cra 3 # 59-1","rifer@yopmail.com","566352646",5,5,"2021-01-01",null,1);
/*Modificar */

use bdTransporteCarga;
update funcionario set apellido="Fernandez"
where idFuncionario = 7;

/*Eliminar*/
Delete from funcionario
where  idFuncionario = 7;


select * from funcionario;

/**/



/*Reporte que le permita obtener la información total de facturación por cliente.*/
select f.idFactura,c.nombre,c.apellido,ca.placa,f.detalle,f.cantidadTon,f.valor,f.fecha from factura f
inner join cliente c on f.idCliente = c.idCliente 
inner join camion ca on f.idCamion = ca.idCamion
where f.idCliente = 1;


/*Reporte que le permita obtener la información total de la asignación de conductores con sus respectivos camiones*/

select *  from camion c
inner join conductor co on c.idConductor = co.idConductor 
order by c.idCamion asc;


/*Reporte general de nómina de orden de ingreso de funcionarios vs su salario*/

select *  from funcionario f
order by f.fechaIngreso,idSalario asc;

/*o de funcionarios vs su salario. Reporte general de funcionarios retirados */

select *  from funcionario f
where idEstado = 3;



/*El cliente espera como valor agregado un reporte que le sea de utilidad para su compañía*/
select f.idFactura,c.nombre,c.apellido,ca.placa,f.detalle,f.cantidadTon,f.valor,f.fecha from factura f
inner join cliente c on f.idCliente = c.idCliente 
inner join camion ca on f.idCamion = ca.idCamion
order by f.fecha,f.cantidadTon desc;
