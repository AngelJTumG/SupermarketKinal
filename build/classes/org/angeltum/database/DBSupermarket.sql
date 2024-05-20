-- DLL
drop database if exists DBSupermarket;

create database DBSupermarket;

use DBSupermarket;
set global time_zone = '-6:00';

create table Clientes(
	clienteID int ,
    nombreClientes varchar (45),
    apellidosClientes varchar (45),
    direccionClientes varchar (128),
    NIT varchar (13),
    telefonoClientes varchar (13),
    correoClientes varchar (128),
    primary key PK_ClienteID(clienteID)
);

create table Proveedores(
	codigoProveedor int,
    NitProveedor varchar (10),
    nombresProveedor varchar (60),
    apellidosProveedor varchar (60),
    direccionProveedor varchar (150),
    razonSocial varchar (60),
    contactoPrincipal varchar (100),
    paginaWeb varchar(50),
    
    primary key PK_CodigoProveedor(codigoProveedor)
);

create table Compras(
	numeroDocumento int,
    fechaDocumento date,
	descripcion varchar(60),
    totalDocumento decimal(10,2),
    
    primary key PK_NumeroDocumento(numeroDocumento)
);

create table TipoProducto(
	codigoTipoProducto int,
    descripcion varchar(45),
    
    primary key PK_CodigoTipoProducto(codigoTipoProducto)
);

create table CargoDeEmpleado(
	codigoCargoEmpleado int,
    nombreCargo varchar(50),
    descripcionCargo varchar (45),
    
	primary key PK_CodigoCargoEmpleado(codigoCargoEmpleado)
);

create table TelefonoProveedor
(
	codigoTelefonoProveedor int not null,
    numeroPrincipal varchar(8),
    numeroSecundario varchar(8),
    observaciones varchar(45),
    codigoProveedor int,
    primary key PK_codigoTelefonoProveedor (codigoTelefonoProveedor),
	foreign key (codigoProveedor) references Proveedores(codigoProveedor)

);


CREATE TABLE Empleados(
    codigoEmpleado INT ,
    nombresEmpleado VARCHAR(50),
    apellidosEmpleado VARCHAR(50),
    sueldo DECIMAL(10,2),
    direccion VARCHAR(150),
    turno VARCHAR(15),
    codigoCargoEmpleado INT,
    PRIMARY KEY (codigoEmpleado),
    FOREIGN KEY (codigoCargoEmpleado) REFERENCES CargoDeEmpleado(codigoCargoEmpleado)
);

create table EmailProveedor
(
	codigoEmailProveedor int not null,
    emailProveedor varchar(50),
    descripcion varchar(100),
    codigoProveedor int not null,
    primary key PK_codigoEmailProveedor (codigoEmailProveedor),
	foreign key (codigoProveedor) references Proveedores(codigoProveedor)

);


create table Factura
(
	numeroFactura int not null,
	estado varchar(50),
    totalFactura decimal(10,2),
    fechaFactura varchar(45),
    clienteID int not null,
    codigoEmpleado int not null,
    primary key PK_numeroFactura (numeroFactura),
	foreign key (clienteID) references Clientes(clienteID),
	FOREIGN KEY (codigoEmpleado) REFERENCES Empleados(codigoEmpleado)
);


create table Productos
(
	codigoProducto varchar(15),
	descripcionProducto varchar(45),
    precioUnitario decimal(10,2),
    precioDocena decimal(10,2),
    precioMayor decimal(10,2),
    existencia int not null,
    codigoTipoProducto int not null,
    codigoProveedor int not null,
    primary key PK_codigoProducto (codigoProducto),
	foreign key (codigoTipoProducto) references TipoProducto(codigoTipoProducto),
	foreign key (codigoProveedor) references Proveedores(codigoProveedor) 
);


create table DetalleFactura
(
	codigoDetalleFactura int not null,
    precioUnitario decimal(10,2),
    cantidad int,
    numeroFactura int not null,
    codigoProducto varchar(15),
    primary key PK_codigoDetalleFactura (codigoDetalleFactura),
	foreign key (numeroFactura) references Factura(numeroFactura),
    foreign key (codigoProducto) references Productos(codigoProducto)
);


create table DetalleCompra
(
	codigoDetalleCompra int not null,
    costoUnitario decimal(10,2),
    cantidad int not null,
    codigoProducto varchar(15),
    numeroDocumento int not null,
    primary key PK_codigoDetalleCompra (codigoDetalleCompra),
	foreign key (codigoProducto) references Productos(codigoProducto),
    foreign key (numeroDocumento) references Compras(numeroDocumento)
);

