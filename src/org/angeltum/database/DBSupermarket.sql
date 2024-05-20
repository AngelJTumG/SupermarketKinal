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
    codigoProveedor int not null,
    primary key PK_codigoTelefonoProveedor (codigoTelefonoProveedor),
	foreign key (codigoProveedor) references Proveedores(codigoProveedor)

);


CREATE TABLE Empleados(
    codigoEmpleado INT AUTO_INCREMENT,
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

delimiter $$
create procedure sp_ListarClientes ()
begin 
	select
    c.clienteID,
    c.nombreClientes,
    c.apellidosClientes,
    c.direccionClientes,
    c.NIT,
    c.telefonoClientes,
    c.correoClientes
    from clientes c;
end $$        
delimiter ;

call sp_ListarClientes;

delimiter $$

create procedure sp_AgregarClientes (in _clienteID int, in _nombreClientes varchar (45), in _apellidosClientes varchar(45), in _direccionClientes varchar(128), in _NIT varchar(13), in _telefonoClientes varchar (13), in _correoClientes varchar(128))
begin 
	insert into Clientes (Clientes.clienteID, Clientes.nombreClientes, Clientes.apellidosClientes, Clientes.direccionClientes, Clientes.NIT, Clientes.telefonoClientes, Clientes.correoClientes)
		values (_clienteID, _nombreClientes, _apellidosClientes, _direccionClientes, _NIT, _telefonoClientes,_correoClientes);
end $$        
delimiter ;

CALL sp_AgregarClientes(45, 'Juan', 'Pérez', '6ta Calle Zona 10', '1234567890123', '555123456', 'juan@gmail.com');
CALL sp_AgregarClientes(46, 'María', 'López', '7ma Avenida Zona 15', '9876543210987', '555987654', 'maria@gmail.com');
CALL sp_AgregarClientes(47, 'Carlos', 'García', '2da Calle Zona 4', '4567890123456', '555456789', 'carlos@gmail.com');
CALL sp_AgregarClientes(48, 'Laura', 'Martínez', '9na Avenida Zona 1', '7890123456789', '555789012', 'laura@gmail.com');
CALL sp_AgregarClientes(49, 'Pedro', 'Rodríguez', '3ra Calle Zona 6', '2345678901234', '555234567', 'pedro@gmail.com');
CALL sp_AgregarClientes(50, 'Ana', 'Gómez', '8va Avenida Zona 12', '5678901234567', '555567890', 'ana@gmail.com');
CALL sp_AgregarClientes(511, 'Sofía', 'Hernández', '4ta Calle Zona 8', '3456789012345', '555345678', 'sofia@gmail.com');
delimiter $$

create procedure sp_buscarClientes (in _clienteID int)
begin 
	select
    c.clienteID,
    c.nombreClientes,
    c.apellidosClientes,
    c.direccionClientes,
    c.NIT,
    c.telefonoClientes,
    c.correoClientes
    from clientes c
    where clienteID = _clienteID;
end $$        
delimiter ;

call sp_buscarClientes(1);

delimiter $$

create procedure sp_eliminarClientes (in _clienteID int)
begin 
	delete from clientes where clienteID = _clienteID;
end $$
delimiter ;

call sp_eliminarClientes(1);

delimiter $$

create procedure sp_actualizar  (in _clienteID int, in _nombreClientes varchar (45), in _apellidosClientes varchar(45), in _direccionClientes varchar(128), in _NIT varchar(13), in _telefonoClientes varchar (13), in _correoClientes varchar(128))
begin 
	update Clientes
    set nombreClientes = _nombreClientes,
    apellidosClientes = _apellidosClientes,
    direccionClientes = _direccionClientes,
    nit = _nit,
    telefonoClientes = _telefonoClientes,
    correoClientes = _correoClientes
    where
    clienteID = _clienteID;
end $$
delimiter ;

CALL sp_AgregarClientes(51, 'Sofía', 'Hernández', '4ta Calle Zona 8', '3456789012345', '555345678', 'sofia@gmail.com');
select * from Clientes;

delimiter $$

CREATE PROCEDURE sp_AgregarProveedor (
    IN codigoProveedor INT,
    IN NitProveedor VARCHAR(10),
    IN nombresProveedor VARCHAR(60),
    IN apellidosProveedor VARCHAR(60),
    IN direccionProveedor VARCHAR(150),
    IN razonSocial VARCHAR(60),
    IN contactoPrincipal VARCHAR(100),
    IN paginaWeb VARCHAR(50)
)
BEGIN
    INSERT INTO Proveedores(codigoProveedor, NitProveedor, nombresProveedor, apellidosProveedor, direccionProveedor, razonSocial, contactoPrincipal, paginaWeb)
    VALUES (codigoProveedor, NITProveedor, nombresProveedor, apellidosProveedor, direccionProveedor, razonSocial, contactoPrincipal, paginaWeb);
END $$

DELIMITER ;

CALL sp_AgregarProveedor(5, 'NIT5', 'Nombre5', 'Apellido5', 'Dirección5', 'Razón Social5', 'Contacto5', 'www.proveedor5.com');
CALL sp_AgregarProveedor(6, 'NIT6', 'Nombre6', 'Apellido6', 'Dirección6', 'Razón Social6', 'Contacto6', 'www.proveedor6.com');
CALL sp_AgregarProveedor(7, 'NIT7', 'Nombre7', 'Apellido7', 'Dirección7', 'Razón Social7', 'Contacto7', 'www.proveedor7.com');
CALL sp_AgregarProveedor(8, 'NIT8', 'Nombre8', 'Apellido8', 'Dirección8', 'Razón Social8', 'Contacto8', 'www.proveedor8.com');
CALL sp_AgregarProveedor(9, 'NIT9', 'Nombre9', 'Apellido9', 'Dirección9', 'Razón Social9', 'Contacto9', 'www.proveedor9.com');
CALL sp_AgregarProveedor(110, 'NIT10', 'Nombre10', 'Apellido10', 'Dirección10', 'Razón Social10', 'Contacto10', 'www.proveedor10.com');
CALL sp_AgregarProveedor(11, 'NIT11', 'Nombre11', 'Apellido11', 'Dirección11', 'Razón Social11', 'Contacto11', 'www.proveedor11.com');

DELIMITER $$

CREATE PROCEDURE sp_ListarProveedor()
BEGIN
    SELECT
        C.codigoProveedor,
        C.NitProveedor,
        C.nombresProveedor,
        C.apellidosProveedor,
        C.direccionProveedor,
        C.razonSocial,
        C.contactoPrincipal,
        C.paginaWeb
    FROM
        Proveedores C;
END $$

DELIMITER ;

CALL sp_ListarProveedor();

DELIMITER $$

CREATE PROCEDURE sp_editarProveedor (
    IN codigoProveedor INT,
    IN NitProveedor VARCHAR(10),
    IN nombresProveedor VARCHAR(60),
    IN apellidosProveedor VARCHAR(60),
    IN direccionProveedor VARCHAR(150),
    IN razonSocial VARCHAR(60),
    IN contactoPrincipal VARCHAR(100),
    IN paginaWeb VARCHAR(50)
)
BEGIN
    UPDATE Proveedores SET
        NitProveedor = NitProveedor,
        Proveedores.nombresProveedor = nombresProveedor,
        Proveedores.apellidosProveedor = apellidosProveedor,
        Proveedores.direccionProveedor = direccionProveedor,
        Proveedores.razonSocial = razonSocial,
        Proveedores.contactoPrincipal = contactoPrincipal,
        Proveedores.paginaWeb = paginaWeb
    WHERE
        Proveedores.codigoProveedor = codigoProveedor;
END $$

DELIMITER ;

CALL sp_AgregarProveedor(10, 'NIT10', 'Nombre10', 'Apellido10', 'Dirección10', 'Razón Social10', 'Contacto10', 'www.proveedor10.com');

DELIMITER $$

CREATE PROCEDURE sp_eliminarProveedor (codigoProveedor INT)
BEGIN
    DELETE FROM Proveedores WHERE codigoProveedor = codigoProveedor;
END $$

DELIMITER ;

DELIMITER $$

CREATE PROCEDURE sp_AgregarCompra (
    IN _numeroDocumento INT,
    IN _fechaDocumento DATE,
    IN _descripcion VARCHAR(60),
    IN _totalDocumento DECIMAL(10,2)
)
BEGIN
    INSERT INTO Compras(numeroDocumento, fechaDocumento, descripcion, totalDocumento)
    VALUES (_numeroDocumento, _fechaDocumento, _descripcion, _totalDocumento);
END $$

DELIMITER ;

CALL sp_AgregarCompra(3, '2024-05-07', 'Compra de materiales de construcción', 800.00);
CALL sp_AgregarCompra(4, '2024-05-06', 'Compra de mobiliario de oficina', 1200.00);
CALL sp_AgregarCompra(5, '2024-05-05', 'Compra de material informático', 1000.00);
CALL sp_AgregarCompra(6, '2024-05-04', 'Compra de suministros de limpieza', 600.00);
CALL sp_AgregarCompra(7, '2024-05-03', 'Compra de herramientas de trabajo', 1500.00);
CALL sp_AgregarCompra(8, '2024-05-02', 'Compra de equipos de seguridad', 2000.00);
CALL sp_AgregarCompra(9, '2024-05-01', 'Compra de materia prima', 700.00);

DELIMITER $$

CREATE PROCEDURE sp_ListarCompras()
BEGIN
    SELECT
        C.numeroDocumento,
        C.fechaDocumento,
        C.descripcion,
        C.totalDocumento
    FROM
        Compras C;
END $$

DELIMITER ;

CALL sp_ListarCompras();

DELIMITER $$

CREATE PROCEDURE sp_EditarCompra (
    IN _numeroDocumento INT,
    IN _fechaDocumento DATE,
    IN _descripcion VARCHAR(60),
    IN _totalDocumento DECIMAL(10,2)
)
BEGIN
    UPDATE Compras SET
        fechaDocumento = _fechaDocumento,
        descripcion = _descripcion,
        totalDocumento = _totalDocumento
    WHERE
        numeroDocumento = _numeroDocumento;
END $$

DELIMITER ;

CALL sp_EditarCompra(1, '2024-05-10', 'Compra de materiales actualizada', 600.00);

DELIMITER $$

CREATE PROCEDURE sp_EliminarCompra (_numeroDocumento INT)
BEGIN
    DELETE FROM Compras WHERE numeroDocumento = _numeroDocumento;
END $$

DELIMITER ;

CALL sp_EliminarCompra(2);

DELIMITER $$

CREATE PROCEDURE sp_AgregarTipoProducto (
    IN _codigoTipoProducto INT,
    IN _descripcion VARCHAR(45)
)
BEGIN
    INSERT INTO TipoProducto(codigoTipoProducto, descripcion)
    VALUES (_codigoTipoProducto, _descripcion);
END $$

DELIMITER ;

CALL sp_AgregarTipoProducto(3, 'Ropa');
CALL sp_AgregarTipoProducto(4, 'Calzado');
CALL sp_AgregarTipoProducto(5, 'Electrónica');
CALL sp_AgregarTipoProducto(6, 'Hogar');
CALL sp_AgregarTipoProducto(7, 'Juguetes');
CALL sp_AgregarTipoProducto(8, 'Alimentos');
CALL sp_AgregarTipoProducto(9, 'Bebidas');


DELIMITER $$
CREATE PROCEDURE sp_ListarTipoProducto()
BEGIN
    SELECT
        T.codigoTipoProducto,
        T.descripcion
    FROM
        TipoProducto T;
END $$
DELIMITER ;

CALL sp_ListarTipoProducto();

DELIMITER $$

CREATE PROCEDURE sp_EditarTipoProducto (
    IN _codigoTipoProducto INT,
    IN _descripcion VARCHAR(45)
)
BEGIN
    UPDATE TipoProducto SET
        descripcion = _descripcion
    WHERE
        codigoTipoProducto = _codigoTipoProducto;
END $$

DELIMITER ;

CALL sp_EditarTipoProducto(1, 'Electrodomésticos actualizados');

DELIMITER $$

CREATE PROCEDURE sp_EliminarTipoProducto (_codigoTipoProducto INT)
BEGIN
    DELETE FROM TipoProducto WHERE codigoTipoProducto = _codigoTipoProducto;
END $$

DELIMITER ;

CALL sp_EliminarTipoProducto(2);

DELIMITER $$

CREATE PROCEDURE sp_AgregarCargoEmpleado (
    IN _codigoCargoEmpleado INT,
    IN _nombreCargo VARCHAR(50),
    IN _descripcionCargo VARCHAR(45)
)
BEGIN
    INSERT INTO CargoDeEmpleado(codigoCargoEmpleado, nombreCargo, descripcionCargo)
    VALUES (_codigoCargoEmpleado, _nombreCargo, _descripcionCargo);
END $$

DELIMITER ;

CALL sp_AgregarCargoEmpleado(3, 'Contador', 'Encargado de contabilidad');
CALL sp_AgregarCargoEmpleado(4, 'Recepcionista', 'Encargado de atención al cliente');
CALL sp_AgregarCargoEmpleado(5, 'Técnico', 'Encargado de mantenimiento');
CALL sp_AgregarCargoEmpleado(6, 'Chofer', 'Encargado de transporte');
CALL sp_AgregarCargoEmpleado(7, 'Auxiliar', 'Encargado de apoyo administrativo');
CALL sp_AgregarCargoEmpleado(8, 'Supervisor', 'Encargado de supervisar operaciones');
CALL sp_AgregarCargoEmpleado(9, 'Analista', 'Encargado de análisis de datos');

DELIMITER $$

CREATE PROCEDURE sp_ListarCargoEmpleado()
BEGIN
    SELECT
        CE.codigoCargoEmpleado,
        CE.nombreCargo,
        CE.descripcionCargo
    FROM
        CargoDeEmpleado CE;
END $$

DELIMITER ;

CALL sp_ListarCargoEmpleado();

DELIMITER $$

CREATE PROCEDURE sp_EditarCargoEmpleado (
    IN _codigoCargoEmpleado INT,
    IN _nombreCargo VARCHAR(50),
    IN _descripcionCargo VARCHAR(45)
)
BEGIN
    UPDATE CargoDeEmpleado SET
        nombreCargo = _nombreCargo,
        descripcionCargo = _descripcionCargo
    WHERE
        codigoCargoEmpleado = _codigoCargoEmpleado;
END $$

DELIMITER ;

CALL sp_EditarCargoEmpleado(1, 'Gerente de ventas', 'Encargado de supervisar las ventas');

DELIMITER $$

CREATE PROCEDURE sp_EliminarCargoEmpleado (_codigoCargoEmpleado INT)
BEGIN
    DELETE FROM CargoDeEmpleado WHERE codigoCargoEmpleado = _codigoCargoEmpleado;
END $$

DELIMITER ;

CALL sp_EliminarCargoEmpleado(2);

DELIMITER ;

-- ----------------------------------------------------------------------------------------------------------------------------


delimiter $$
	create procedure sp_agregarTelefonoProveedor (in codTelPro int, in numPrinPro varchar(8), in numSecPro varchar(8), in obsPro varchar(45),
											  in codPro int)
	begin
	insert into TelefonoProveedor (TelefonoProveedor.codigoTelefonoProveedor, TelefonoProveedor.numeroPrincipal, TelefonoProveedor.numeroSecundario,
								  TelefonoProveedor.observaciones, TelefonoProveedor.codigoProveedor)
    values (codTelPro,numPrinPro, numSecPro, obsPro, codPro);
end$$
delimiter ;

call sp_agregarTelefonoProveedor(1, '12345678', '98765421', 'Entregar las aguas', 1);
call sp_agregarTelefonoProveedor(2, '23456789', '87654321', 'Nos ofrecen cremas', 2);
call sp_agregarTelefonoProveedor(3, '34567890', '76543210', 'La mejor empresa de gaseosas', 3);
call sp_agregarTelefonoProveedor(4, '45678901', '65432109', 'De exportar las carnes y filetes', 4);
call sp_agregarTelefonoProveedor(5, '56789012', '54321098', 'Ofrecen productos dentales', 5);

-- Listar 

delimiter $$
	create procedure sp_listarTelefonoProveedor ()
    begin
		select TelefonoProveedor.codigoTelefonoProveedor, TelefonoProveedor.numeroPrincipal, TelefonoProveedor.numeroSecundario,
			   TelefonoProveedor.observaciones, TelefonoProveedor.codigoProveedor 
        from TelefonoProveedor;
    end$$
delimiter ;

call sp_listarTelefonoProveedor();

-- Buscar 

delimiter $$
	create procedure sp_buscarTelefonoProveedor(in codTelPro int)
    begin
	select TelefonoProveedor.numeroPrincipal, TelefonoProveedor.numeroSecundario,
		   TelefonoProveedor.observaciones, TelefonoProveedor.codigoProveedor from TelefonoProveedor 
    where TelefonoProveedor.codigoTelefonoProveedor = codTelPro;
	end$$
delimiter ;

call sp_buscarTelefonoProveedor(1);
call sp_buscarTelefonoProveedor(2);
call sp_buscarTelefonoProveedor(3);
call sp_buscarTelefonoProveedor(4);
call sp_buscarTelefonoProveedor(5);

-- Actualizar

delimiter $$
	create procedure sp_actualizarTelefonoProveedor(in codTelPro int, in numPrinPro varchar(8), in numSecPro varchar(8), in obsPro varchar(45),
in codPro int)
    begin
		update TelefonoProveedor 
		set
        TelefonoProveedor.numeroPrincipal = numPrinPro,
        TelefonoProveedor.numeroSecundario = numSecPro,
		TelefonoProveedor.observaciones = obsPro,
        TelefonoProveedor.codigoProveedor = codPro
        where 
        TelefonoProveedor.codigoTelefonoProveedor = codTelPro;
    end$$
delimiter ;

call sp_actualizarTelefonoProveedor(1, '12345678', '98765421', 'Entregar aguas salvavidas', 1);

-- Eliminar

delimiter $$
	create procedure sp_eliminarTelefonoProveedor (in codTelPro int)
    begin
		delete from TelefonoProveedor where TelefonoProveedor.codigoTelefonoProveedor = codTelPro;
    end$$
delimiter ;

call sp_eliminarTelefonoProveedor();

-- Entidad Empleados procedimientos almacenados

-- Agregar 

delimiter $$
	CREATE PROCEDURE sp_AgregarEmpleado(
    IN _codigoEmpleado  INT,
    IN _nombresEmpleado VARCHAR(50), 
    IN _apellidosEmpleado VARCHAR(50), 
    IN _sueldo DECIMAL(10,2), 
    IN _direccion VARCHAR(150), 
    IN _turno VARCHAR(15), 
    IN _codigoCargoEmpleado INT
)
BEGIN
delimiter ;

call sp_agregarEmpleados(1, 'Juan Jose', 'Pérez Lainez', 5200.00, 'Zona 6 Villa nueva', 'Matutina', 1);
call sp_agregarEmpleados(2, 'María Laura', 'García Veliz', 6500.00, 'zona 14', 'Matutina', 2);
call sp_agregarEmpleados(3, 'Pedro Rafael', 'López Hernandez', 9800.00, 'zona 10 las majaditas', 'Vespertina', 3);
call sp_agregarEmpleados(4, 'Ana Sofia', 'Ramírez Gaitan', 8000.00, 'Carretera Salvador', 'Vespertina', 4);
call sp_agregarEmpleados(5, 'Carlos Andres', 'Torres Socop', 10000.00, 'Cayala', 'Nocturna', 5);

-- Listar 

DELIMITER $$

CREATE PROCEDURE sp_ListarEmpleados()
BEGIN
    SELECT
        codigoEmpleado,
        nombresEmpleado,
        apellidosEmpleado,
        sueldo,
        direccion,
        turno,
        codigoCargoEmpleado
    FROM Empleados;
END $$

CREATE PROCEDURE sp_AgregarEmpleado(
	IN _codigoEmpleado  INT,
    IN _nombresEmpleado VARCHAR(50), 
    IN _apellidosEmpleado VARCHAR(50), 
    IN _sueldo DECIMAL(10,2), 
    IN _direccion VARCHAR(150), 
    IN _turno VARCHAR(15), 
    IN _codigoCargoEmpleado INT
)
BEGIN
    INSERT INTO Empleados(
        nombresEmpleado, 
        apellidosEmpleado, 
        sueldo, 
        direccion, 
        turno, 
        codigoCargoEmpleado
    ) VALUES (
        _nombresEmpleado, 
        _apellidosEmpleado, 
        _sueldo, 
        _direccion, 
        _turno, 
        _codigoCargoEmpleado
    );
END $$

CREATE PROCEDURE sp_BuscarEmpleado(IN _codigoEmpleado INT)
BEGIN
    SELECT
        codigoEmpleado,
        nombresEmpleado,
        apellidosEmpleado,
        sueldo,
        direccion,
        turno,
        codigoCargoEmpleado
    FROM Empleados
    WHERE codigoEmpleado = _codigoEmpleado;
END $$

CREATE PROCEDURE sp_EliminarEmpleado(IN _codigoEmpleado INT)
BEGIN
    DELETE FROM Empleados WHERE codigoEmpleado = _codigoEmpleado;
END $$

CREATE PROCEDURE sp_ActualizarEmpleado(
    IN _codigoEmpleado INT, 
    IN _nombresEmpleado VARCHAR(50), 
    IN _apellidosEmpleado VARCHAR(50), 
    IN _sueldo DECIMAL(10,2), 
    IN _direccion VARCHAR(150), 
    IN _turno VARCHAR(15), 
    IN _codigoCargoEmpleado INT
)
BEGIN
    UPDATE Empleados
    SET 
        nombresEmpleado = _nombresEmpleado,
        apellidosEmpleado = _apellidosEmpleado,
        sueldo = _sueldo,
        direccion = _direccion,
        turno = _turno,
        codigoCargoEmpleado = _codigoCargoEmpleado
    WHERE
        codigoEmpleado = _codigoEmpleado;
END $$

DELIMITER ;

-- Entidad EmailProveedor procedimientos almacenados

-- Agregar 

delimiter $$
create procedure sp_agregarEmailProveedor (in codEmPro int, in emaPro varchar(50), in descri varchar(100), in codPro int)
begin
	insert into EmailProveedor (EmailProveedor.codigoEmailProveedor, EmailProveedor.emailProveedor, EmailProveedor.descripcion,
						        EmailProveedor.codigoProveedor)
    values (codEmPro, emaPro, descri, codPro);
end$$
delimiter ;

call sp_agregarEmailProveedor(1, 'aguas12@gmail.com', 'Entregar las aguas', 1);
call sp_agregarEmailProveedor(2, 'cremasNIVEA@gmail.com', 'Nos ofrecen cremas', 2);
call sp_agregarEmailProveedor(3, 'gaseosamirados@gmail.com','Las mejor empresa de gaseosas', 3);
call sp_agregarEmailProveedor(4, 'filetesCarnes@gmail.com', 'De exportar las carnes y filetes', 4);
call sp_agregarEmailProveedor(5, 'colgate@gmail.com', 'Ofrecen productos dentales', 5);

-- Listar 

delimiter $$
	create procedure sp_listarEmailProveedor ()
    begin
		select EmailProveedor.codigoEmailProveedor, EmailProveedor.emailProveedor, EmailProveedor.descripcion,
			   EmailProveedor.codigoProveedor
        from EmailProveedor;
    end$$
delimiter ;

call sp_listarEmailProveedor();

-- Buscar 

delimiter $$
	create procedure sp_buscarEmailProveedor(in codEmPro int)
    begin
	select EmailProveedor.emailProveedor, EmailProveedor.descripcion, EmailProveedor.codigoProveedor from EmailProveedor 
    where EmailProveedor.codigoEmailProveedor = codEmPro;
	end$$
delimiter ;

call sp_buscarEmailProveedor(1);
call sp_buscarEmailProveedor(2);
call sp_buscarEmailProveedor(3);
call sp_buscarEmailProveedor(4);
call sp_buscarEmailProveedor(5);

-- Actualizar

delimiter $$
	create procedure sp_actualizarEmailProveedor(in codEmPro int, in emaPro varchar(50), in descri varchar(100), in codPro int)
    begin
		update EmailProveedor 
		set
        EmailProveedor.emailProveedor = emaPro, 
        EmailProveedor.descripcion = descri,
		EmailProveedor.codigoProveedor = codPro
        where 
        EmailProveedor.codigoEmailProveedor = codEmPro;
    end$$
delimiter ;

call sp_actualizarEmailProveedor(1, 'aguas12@gmail.com', 'Entregar el producto', 1);

-- Eliminar

delimiter $$
	create procedure sp_eliminarEmailProveedor (in codEmPro int)
    begin
		delete from EmailProveedor where  EmailProveedor.codigoEmailProveedor = codEmPro;
    end$$
delimiter ;

call sp_eliminarEmailProveedor();

-- Entidad Factura procedimientos almacenados

-- Agregar 

delimiter $$
create procedure sp_agregarFactura (in numFac int, in estadFac varchar(50), in totalFac decimal(10,2), in fecFac varchar(45),
									in codCliFac int, in codEmpleFac int)
	begin
	insert into Factura (Factura.numeroFactura, Factura.estado, Factura.totalFactura, Factura.fechaFactura,
						 Factura.codigoCliente, Factura.codigoEmpleado)
    values (numFac, estadFac, totalFac, fecFac, codCliFac, codEmpleFac);
	end$$
delimiter ;

call sp_agregarFactura(1, 'Pagado', 100.00, '2023-05-21', 123456789, 1 );
call sp_agregarFactura(2, 'Pagado', 50.00, '2023-02-14', 161481461, 2 );
call sp_agregarFactura(3, 'No Pagado', 250.00, '2023-02-14', 154664846, 3);
call sp_agregarFactura(4, 'No Pagado', 10.00, '2023-04-18', 564980398, 4 );
call sp_agregarFactura(5, 'Pagado', 100.00, '2023-06-20', 454894988, 5 );

-- Listar 

delimiter $$
	create procedure sp_listarFactura ()
    begin
		select Factura.numeroFactura, Factura.estado, Factura.totalFactura, Factura.fechaFactura,
			   Factura.codigoCliente, Factura.codigoEmpleado
        from Factura;
    end$$
delimiter ;

call sp_listarFactura();

-- Buscar 

delimiter $$
	create procedure sp_buscarFactura(in numFac int)
    begin
	select Factura.estado, Factura.totalFactura, Factura.fechaFactura,
		   Factura.codigoCliente, Factura.codigoEmpleado from Factura 
    where Factura.numeroFactura = numFac;
	end$$
delimiter ;

call sp_buscarFactura(1);
call sp_buscarFactura(2);
call sp_buscarFactura(3);
call sp_buscarFactura(4);
call sp_buscarFactura(5);

-- Actualizar

delimiter $$
	create procedure sp_actualizarFactura(in numFac int, in estadFac varchar(50), in totalFac decimal(10,2), in fecFac varchar(45),
									     in codCliFac int, in codEmpleFac int)
    begin
		update Factura 
		set
        Factura.estado = estadFac, 
        Factura.totalFactura = totalFac, 
        Factura.fechaFactura = fecFac,
		Factura.codigoCliente = codCliFac, 
        Factura.codigoEmpleado = codEmpleFac
        where 
        Factura.numeroFactura = numFac;
    end$$
delimiter ;

call sp_actualizarFactura(3, 'Pagado', 250.00, '2023-02-14', 154664846, 3);

-- Eliminar

delimiter $$
	create procedure sp_eliminarFactura (in numFac int)
    begin
		delete from Factura where Factura.numeroFactura = numFac;
    end$$
delimiter ;

call sp_eliminarFactura();

-- Entidad Productos procedimientos almacenados

-- Agregar 

delimiter $$
create procedure sp_agregarProductos (in codPro varchar(45), in desPro varchar(45), in precioUniPro decimal(10,2), in precioDocPro decimal(10,2),
									  in precioMaPro decimal(10,2), in existencia int, in codTipPro int,
                                      in codProvPro int )
	begin 
	insert into Productos (Productos.codigoProducto, Productos.descripcionProducto, Productos.precioUnitario, Productos.precioDocena,
						   Productos.precioMayor, Productos.existencia, Productos.codigoTipoProducto, 
                           Productos.codigoProveedor)
    values (codPro, desPro, precioUniPro, precioDocPro, precioMaPro, existencia, codTipPro, codProvPro);
	end$$
delimiter ;

call sp_agregarProductos('1', 'Agua Rica roja 400 ml', 4.00, 48.00, 60.00, 100, 1, 1);
call sp_agregarProductos('2', 'Crema NIVEA para protegernos del sol', 8.00, 96.00, 120.00, 100, 2, 2);
call sp_agregarProductos('3', 'Gaseosa CocaCola 2.5 litros', 18.00, 216.00, 250.00, 100, 3, 3);
call sp_agregarProductos('4', 'Filete de pechuga 3.20LB la bandeja', 15.00, 180.00, 210.00, 100, 4, 4 );
call sp_agregarProductos('5', 'Cepillo dental Colgate', 10.00, 120.00, 160.00, 100, 5, 5 );

-- Listar 

delimiter $$
	create procedure sp_listarProductos ()
    begin
		select Productos.codigoProducto, Productos.descripcionProducto, Productos.precioUnitario, Productos.precioDocena,
			   Productos.precioMayor, Productos.existencia, Productos.codigoTipoProducto, 
			   Productos.codigoProveedor
        from Productos;
    end$$
delimiter ;

call sp_listarProductos();

-- Buscar 

delimiter $$
	create procedure sp_buscarProductos(in codPro varchar(45))
    begin
	select Productos.descripcionProducto, Productos.precioUnitario, Productos.precioDocena,
		   Productos.precioMayor, Productos.existencia, Productos.codigoTipoProducto, 
		   Productos.codigoProveedor from Productos 
    where Productos.codigoProducto = codPro;
	end$$
delimiter ;

call sp_buscarProductos('1');
call sp_buscarProductos('2');
call sp_buscarProductos('3');
call sp_buscarProductos('4');
call sp_buscarProductos('5');

-- Actualizar

delimiter $$
	create procedure sp_actualizarProductos(in codPro varchar(45), in desPro varchar(45), in precioUniPro decimal(10,2), in precioDocPro decimal(10,2),
									        in precioMaPro decimal(10,2), in existencia int, in codTipPro int,
                                            in codProvPro int)
    begin
		update Productos
		set
        Productos.descripcionProducto = desPro, 
        Productos.precioUnitario = precioUniPro, 
        Productos.precioDocena = precioDocPro,
		Productos.precioMayor = precioMaPro, 
        Productos.existencia = existencia, 
        Productos.codigoTipoProducto = codTipPro, 
		Productos.codigoProveedor = codProvPro
        where 
        Productos.codigoProducto = codPro;
    end$$
delimiter ;

call sp_actualizarProductos('1', 'Agua Rica roja 400 ml', 6.00, 72.00, 90.00, 100, 1, 1);

-- Eliminar

delimiter $$
	create procedure sp_eliminarProductos (in codPro varchar(45))
    begin
		delete from Productos where Productos.codigoProducto = codPro;
    end$$
delimiter ;

call sp_eliminarProductos();

-- Entidad DetalleFactura procedimientos almacenados

-- Agregar 

delimiter $$
create procedure sp_agregarDetalleFactura (in codDetaFac int, in precioUniFac decimal(10,2), in cantiFac int, in numFac int, 
									       in codProFac varchar(15))
	begin 
	insert into DetalleFactura (DetalleFactura.codigoDetalleFactura, DetalleFactura.precioUnitario, DetalleFactura.cantidad,
						        DetalleFactura.numeroFactura, DetalleFactura.codigoProducto)
    values (codDetaFac, precioUniFac, cantiFac, numFac, codProFac);
	end$$
delimiter ;


call sp_agregarDetalleFactura(1, 4.00, 1, 1, 1);
call sp_agregarDetalleFactura(2, 8.00, 5, 2, 2);
call sp_agregarDetalleFactura(3, 18.00, 6, 3, 3);
call sp_agregarDetalleFactura(4, 15.00, 3, 4, 4 );
call sp_agregarDetalleFactura(5, 10.00, 10, 5, 5 );

-- Listar 

delimiter $$
	create procedure sp_listarDetalleFactura ()
    begin
		select DetalleFactura.codigoDetalleFactura, DetalleFactura.precioUnitario, DetalleFactura.cantidad,
			   DetalleFactura.numeroFactura, DetalleFactura.codigoProducto
        from DetalleFactura;
    end$$
delimiter ;

call sp_listarDetalleFactura();

-- Buscar 

delimiter $$
	create procedure sp_buscarDetalleFactura(in codDetaFac int)
    begin
	select DetalleFactura.precioUnitario, DetalleFactura.cantidad,
		   DetalleFactura.numeroFactura, DetalleFactura.codigoProducto from DetalleFactura 
    where DetalleFactura.codigoDetalleFactura = codDetaFac;
	end$$
delimiter ;

call sp_buscarDetalleFactura(1);
call sp_buscarDetalleFactura(2);
call sp_buscarDetalleFactura(3);
call sp_buscarDetalleFactura(4);
call sp_buscarDetalleFactura(5);

-- Actualizar

delimiter $$
	create procedure sp_actualizarDetalleFactura(in codDetaFac int, in precioUniFac decimal(10,2), in cantiFac int, in numFac int, 
									             in codProFac varchar(15))
    begin
		update DetalleFactura
		set
		   DetalleFactura.precioUnitario = precioUniFac, 
           DetalleFactura.cantidad = cantiFac,
		   DetalleFactura.numeroFactura = numFac, 
           DetalleFactura.codigoProducto = codProFac
        where 
        DetalleFactura.codigoDetalleFactura = codDetaFac;
    end$$
delimiter ;

call sp_actualizarDetalleFactura(1, 4.00, 4, 1, 1);

-- Eliminar

delimiter $$
	create procedure sp_eliminarDetalleFactura (in codDetaFac int)
    begin
		delete from DetalleFactura where DetalleFactura.codigoDetalleFactura = codDetaFac;
    end$$
delimiter ;

call sp_eliminarDetalleFactura();

-- Entidad DetalleCompra procedimientos almacenados

-- Agregar 

delimiter $$
create procedure sp_agregarDetalleCompra (in codDetaComp int, in cosUniDetaComp decimal(10,2), in cantDetaComp int,
									      in codProDetaComp varchar(15), in numDocDetaComp int)
	begin 
	insert into DetalleCompra (DetalleCompra.codigoDetalleCompra, DetalleCompra.costoUnitario, DetalleCompra.cantidad,
						       DetalleCompra.codigoProducto, DetalleCompra.numeroDocumento)
    values (codDetaComp, cosUniDetaComp, cantDetaComp, codProDetaComp, numDocDetaComp);
	end$$
delimiter ;

call sp_agregarDetalleCompra(1, 4.00, 4, 1, 1);
call sp_agregarDetalleCompra(2, 8.00, 100, 2, 2);
call sp_agregarDetalleCompra(3, 18.00, 100, 3, 3);
call sp_agregarDetalleCompra(4, 15.00, 100, 4, 4 );
call sp_agregarDetalleCompra(5, 10.00, 100, 5, 5 );

-- Listar 

delimiter $$
	create procedure sp_listarDetalleCompra ()
    begin
		select DetalleCompra.codigoDetalleCompra, DetalleCompra.costoUnitario, DetalleCompra.cantidad,
			   DetalleCompra.codigoProducto, DetalleCompra.numeroDocumento
        from DetalleCompra;
    end$$
delimiter ;

call sp_listarDetalleCompra();

-- Buscar 

delimiter $$
	create procedure sp_buscarDetalleCompra(in codDetaComp int)
    begin
	select DetalleCompra.costoUnitario, DetalleCompra.cantidad,
		   DetalleCompra.codigoProducto, DetalleCompra.numeroDocumento from DetalleCompra 
    where DetalleCompra.codigoDetalleCompra = codDetaComp;
	end$$
delimiter ;

call sp_buscarDetalleCompra(1);
call sp_buscarDetalleCompra(2);
call sp_buscarDetalleCompra(3);
call sp_buscarDetalleCompra(4);
call sp_buscarDetalleCompra(5);

-- Actualizar

delimiter $$
	create procedure sp_actualizarDetalleCompra(in codDetaComp int, in cosUniDetaComp decimal(10,2), in cantDetaComp int,
											in codProDetaComp varchar(15), in numDocDetaComp int)
    begin
		update DetalleCompra
		set
        DetalleCompra.costoUnitario = cosUniDetaComp, 
        DetalleCompra.cantidad = cantDetaComp,
		DetalleCompra.codigoProducto = codProDetaComp, 
        DetalleCompra.numeroDocumento = numDocDetaComp
        where 
        DetalleCompra.codigoDetalleCompra = codDetaComp;
    end$$
delimiter ;

call sp_actualizarDetalleCompra(5, 10.00, 5, 5, 5 );

-- Eliminar

delimiter $$
	create procedure sp_eliminarDetalleCompra (in codDetaComp int)
    begin
		delete from DetalleCompra where DetalleCompra.codigoDetalleCompra = codDetaComp;
    end$$
delimiter ;

call sp_eliminarDetalleCompra();