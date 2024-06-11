use DBSupermarket;
set global time_zone = '-6:00';

DELIMITER $$

-- Procedimiento almacenado para listar registros de la tabla Clientes
CREATE PROCEDURE sp_ListarClientes()
BEGIN
    SELECT * FROM Clientes;
END $$

-- Procedimiento almacenado para buscar un cliente por ID
CREATE PROCEDURE sp_BuscarCliente(IN id INT)
BEGIN
    SELECT * FROM Clientes WHERE clienteID = id;
END $$

-- Procedimiento almacenado para agregar un nuevo cliente


-- Procedimiento almacenado para agregar un nuevo cliente
CREATE PROCEDURE sp_AgregarCliente(
    IN clienteID INT,
    IN nombre VARCHAR(45),
    IN apellido VARCHAR(45),
    IN direccion VARCHAR(128),
    IN nit VARCHAR(13),
    IN telefono VARCHAR(13),
    IN correo VARCHAR(128)
)
BEGIN
    INSERT INTO Clientes (clienteID, nombreClientes, apellidosClientes, direccionClientes, NIT, telefonoClientes, correoClientes)
    VALUES (clienteID, nombre, apellido, direccion, nit, telefono, correo);
END $$



-- Procedimiento almacenado para editar información de un cliente
CREATE PROCEDURE sp_EditarCliente(
    IN id INT,
    IN nuevo_nombre VARCHAR(45),
    IN nuevo_apellido VARCHAR(45),
    IN nueva_direccion VARCHAR(128),
    IN nuevo_nit VARCHAR(13),
    IN nuevo_telefono VARCHAR(13),
    IN nuevo_correo VARCHAR(128)
)
BEGIN
    UPDATE Clientes SET
        nombreClientes = nuevo_nombre,
        apellidosClientes = nuevo_apellido,
        direccionClientes = nueva_direccion,
        NIT = nuevo_nit,
        telefonoClientes = nuevo_telefono,
        correoClientes = nuevo_correo
    WHERE clienteID = id;
END $$

-- Procedimiento almacenado para eliminar un cliente por ID
CREATE PROCEDURE sp_EliminarCliente(IN id INT)
BEGIN
    DELETE FROM Clientes WHERE clienteID = id;
END $$

DELIMITER ;

CALL sp_AgregarCliente(
    1,
    'Juan',
    'Pérez',
    'Calle Falsa 123',
    '1234567890123',
    '555-1234',
    'juan.perez@example.com'
);

-- Ejemplo 2
CALL sp_AgregarCliente(
    2,
    'María',
    'González',
    'Avenida Siempre Viva 742',
    '2345678901234',
    '555-5678',
    'maria.gonzalez@example.com'
);

-- Ejemplo 3
CALL sp_AgregarCliente(
    3,
    'Carlos',
    'Rodríguez',
    'Boulevard de los Sueños 456',
    '3456789012345',
    '555-8765',
    'carlos.rodriguez@example.com'
);

CALL sp_AgregarCliente(
    4,
    'Ramon',
    'Perez',
    'Boulevard de los Sueños 456',
    '3456789012345',
    '555-8765',
    'ramon.perez@example.com'
);

CALL sp_AgregarCliente(
    5,
    'Angie',
    'S',
    'Boulevard de los Sueños 456',
    '3456789012345',
    '555-8765',
    'andie.s@example.com'
);
-- -----------------------------------------------------------------------------------------Tabla Proveedores
DELIMITER $$

-- Procedimiento almacenado para listar registros de la tabla Proveedores
CREATE PROCEDURE sp_ListarProveedores()
BEGIN
    SELECT * FROM Proveedores;
END $$

-- Procedimiento almacenado para buscar un proveedor por ID
CREATE PROCEDURE sp_BuscarProveedor(IN id INT)
BEGIN
    SELECT * FROM Proveedores WHERE codigoProveedor = id;
END $$

-- Procedimiento almacenado para agregar un nuevo proveedor
CREATE PROCEDURE sp_AgregarProveedor(
    IN codigo INT,
    IN nit VARCHAR(10),
    IN nombres VARCHAR(60),
    IN apellidos VARCHAR(60),
    IN direccion VARCHAR(150),
    IN razonSocial VARCHAR(60),
    IN contacto VARCHAR(100),
    IN paginaWeb VARCHAR(50)
)
BEGIN
    INSERT INTO Proveedores (codigoProveedor, NitProveedor, nombresProveedor, apellidosProveedor, direccionProveedor, razonSocial, contactoPrincipal, paginaWeb)
    VALUES (codigo, nit, nombres, apellidos, direccion, razonSocial, contacto, paginaWeb);
END $$

-- Procedimiento almacenado para editar información de un proveedor
CREATE PROCEDURE sp_EditarProveedor(
    IN id INT,
    IN nuevo_nit VARCHAR(10),
    IN nuevos_nombres VARCHAR(60),
    IN nuevos_apellidos VARCHAR(60),
    IN nueva_direccion VARCHAR(150),
    IN nueva_razonSocial VARCHAR(60),
    IN nuevo_contacto VARCHAR(100),
    IN nueva_paginaWeb VARCHAR(50)
)
BEGIN
    UPDATE Proveedores SET
        NitProveedor = nuevo_nit,
        nombresProveedor = nuevos_nombres,
        apellidosProveedor = nuevos_apellidos,
        direccionProveedor = nueva_direccion,
        razonSocial = nueva_razonSocial,
        contactoPrincipal = nuevo_contacto,
        paginaWeb = nueva_paginaWeb
    WHERE codigoProveedor = id;
END $$

-- Procedimiento almacenado para eliminar un proveedor por ID
CREATE PROCEDURE sp_EliminarProveedor(IN id INT)
BEGIN
    DELETE FROM Proveedores WHERE codigoProveedor = id;
END $$

DELIMITER ;

-- Ejemplo 1
CALL sp_AgregarProveedor(
    1,
    '1234567890',
    'Juan',
    'Pérez',
    'Calle Falsa 123',
    'Perez S.A.',
    'juan.perez@example.com',
    'www.perezsa.com'
);

-- Ejemplo 2
CALL sp_AgregarProveedor(
    2,
    '2345678901',
    'María',
    'González',
    'Avenida Siempre Viva 742',
    'González y Asociados',
    'maria.gonzalez@example.com',
    'www.gonzalezasociados.com'
);

-- Ejemplo 3
CALL sp_AgregarProveedor(
    3,
    '3456789012',
    'Carlos',
    'Rodríguez',
    'Boulevard de los Sueños 456',
    'Rodríguez Corp.',
    'carlos.rodriguez@example.com',
    'www.rodriguezcorp.com'
);

-- -------------------------------------------------------------------------------------------------TABLA COMPRAS 
DELIMITER $$

-- Procedimiento almacenado para listar registros de la tabla Compras
CREATE PROCEDURE sp_ListarCompras()
BEGIN
    SELECT * FROM Compras;
END $$

-- Procedimiento almacenado para buscar una compra por número de documento
CREATE PROCEDURE sp_BuscarCompra(IN numDocumento INT)
BEGIN
    SELECT * FROM Compras WHERE numeroDocumento = numDocumento;
END $$

-- Procedimiento almacenado para agregar una nueva compra
CREATE PROCEDURE sp_AgregarCompra(
    IN numDocumento INT,
    IN fecha DATE,
    IN descripcion VARCHAR(60),
    IN total DECIMAL(10,2)
)
BEGIN
    INSERT INTO Compras (numeroDocumento, fechaDocumento, descripcion, totalDocumento)
    VALUES (numDocumento, fecha, descripcion, total);
END $$

-- Procedimiento almacenado para editar información de una compra
CREATE PROCEDURE sp_EditarCompra(
    IN numDocumento INT,
    IN nueva_fecha DATE,
    IN nueva_descripcion VARCHAR(60),
    IN nuevo_total DECIMAL(10,2)
)
BEGIN
    UPDATE Compras SET
        fechaDocumento = nueva_fecha,
        descripcion = nueva_descripcion,
        totalDocumento = nuevo_total
    WHERE numeroDocumento = numDocumento;
END $$

-- Procedimiento almacenado para eliminar una compra por número de documento
CREATE PROCEDURE sp_EliminarCompra(IN numDocumento INT)
BEGIN
    DELETE FROM Compras WHERE numeroDocumento = numDocumento;
END $$

DELIMITER ;

-- Ejemplo 1
CALL sp_AgregarCompra(
    1001,
    '2024-01-15',
    'Compra de material de oficina',
    150.75
);

-- Ejemplo 2
CALL sp_AgregarCompra(
    1002,
    '2024-02-10',
    'Compra de equipos de computación',
    1200.00
);

-- Ejemplo 3
CALL sp_AgregarCompra(
    1003,
    '2024-03-05',
    'Compra de muebles de oficina',
    850.50
);

-- ---------------------------------------------------------------------------------------Tabla TipoProducto
DELIMITER $$

-- Procedimiento almacenado para listar registros de la tabla TipoProducto
CREATE PROCEDURE sp_ListarTipoProducto()
BEGIN
    SELECT * FROM TipoProducto;
END $$
delimiter ;
call sp_ListarTipoProducto();

delimiter $$
-- Procedimiento almacenado para buscar un tipo de producto por código
CREATE PROCEDURE sp_BuscarTipoProducto(IN codigo INT)
BEGIN
    SELECT * FROM TipoProducto WHERE codigoTipoProducto = codigo;
END $$
delimiter ; 

delimiter $$
-- Procedimiento almacenado para agregar un nuevo tipo de producto
CREATE PROCEDURE sp_AgregarTipoProducto(
    IN codigo INT,
    IN descripcion VARCHAR(45)
)
BEGIN
    INSERT INTO TipoProducto (codigoTipoProducto, descripcion)
    VALUES (codigo, descripcion);
END $$
delimiter ;

call sp_AgregarTipoProducto(9,"2");
delimiter $$
-- Procedimiento almacenado para editar información de un tipo de producto
CREATE PROCEDURE sp_EditarTipoProducto(
    IN codigo INT,
    IN nueva_descripcion VARCHAR(45)
)
BEGIN
    UPDATE TipoProducto SET
        descripcion = nueva_descripcion
    WHERE codigoTipoProducto = codigo;
END $$
delimiter ;
delimiter $$
-- Procedimiento almacenado para eliminar un tipo de producto por código
CREATE PROCEDURE sp_EliminarTipoProducto(IN codigo INT)
BEGIN
    DELETE FROM TipoProducto WHERE codigoTipoProducto = codigo;
END $$

DELIMITER ;

-- Ejemplo 1
CALL sp_AgregarTipoProducto(
    1,
    'Electrónica'
);

-- Ejemplo 2
CALL sp_AgregarTipoProducto(
    2,
    'Muebles'
);

-- Ejemplo 3
CALL sp_AgregarTipoProducto(
    3,
    'Ropa'
);

-- ---------------------------------------------------------------------------------TABLA CARGODEEMPLEADO
DELIMITER $$

-- Procedimiento almacenado para listar registros de la tabla CargoDeEmpleado
CREATE PROCEDURE sp_ListarCargoDeEmpleado()
BEGIN
    SELECT * FROM CargoDeEmpleado;
END $$

-- Procedimiento almacenado para buscar un cargo de empleado por código
CREATE PROCEDURE sp_BuscarCargoDeEmpleado(IN codigo INT)
BEGIN
    SELECT * FROM CargoDeEmpleado WHERE codigoCargoEmpleado = codigo;
END $$

-- Procedimiento almacenado para agregar un nuevo cargo de empleado
CREATE PROCEDURE sp_AgregarCargoDeEmpleado(
    IN codigo INT,
    IN nombre VARCHAR(50),
    IN descripcion VARCHAR(45)
)
BEGIN
    INSERT INTO CargoDeEmpleado (codigoCargoEmpleado, nombreCargo, descripcionCargo)
    VALUES (codigo, nombre, descripcion);
END $$

-- Procedimiento almacenado para editar información de un cargo de empleado
CREATE PROCEDURE sp_EditarCargoDeEmpleado(
    IN codigo INT,
    IN nuevo_nombre VARCHAR(50),
    IN nueva_descripcion VARCHAR(45)
)
BEGIN
    UPDATE CargoDeEmpleado SET
        nombreCargo = nuevo_nombre,
        descripcionCargo = nueva_descripcion
    WHERE codigoCargoEmpleado = codigo;
END $$

-- Procedimiento almacenado para eliminar un cargo de empleado por código
CREATE PROCEDURE sp_EliminarCargoDeEmpleado(IN codigo INT)
BEGIN
    DELETE FROM CargoDeEmpleado WHERE codigoCargoEmpleado = codigo;
END $$

DELIMITER ;

-- Ejemplo 1
CALL sp_AgregarCargoDeEmpleado(
    1,
    'Gerente General',
    'Responsable de la gestión'
);

-- Ejemplo 2
CALL sp_AgregarCargoDeEmpleado(
    2,
    'Jefe de Ventas',
    'Encargado del departamento de ventas'
);

-- Ejemplo 3
CALL sp_AgregarCargoDeEmpleado(
    3,
    'Analista de Sistemas',
    'Analiza y diseña sistemas informáticos'
);

-- -----------------------------------------------------------------------------------------------------TelefonoProveedor
DELIMITER $$

-- Procedimiento almacenado para listar registros de la tabla TelefonoProveedor
CREATE PROCEDURE sp_ListarTelefonoProveedor()
BEGIN
    SELECT * FROM TelefonoProveedor;
END $$

-- Procedimiento almacenado para buscar un teléfono de proveedor por código
CREATE PROCEDURE sp_BuscarTelefonoProveedor(IN codigo INT)
BEGIN
    SELECT * FROM TelefonoProveedor WHERE codigoTelefonoProveedor = codigo;
END $$

-- Procedimiento almacenado para agregar un nuevo teléfono de proveedor
CREATE PROCEDURE sp_AgregarTelefonoProveedor(
    IN codigo INT,
    IN numeroPrincipal VARCHAR(8),
    IN numeroSecundario VARCHAR(8),
    IN observaciones VARCHAR(45),
    IN codigoProveedor INT
)
BEGIN
    INSERT INTO TelefonoProveedor (codigoTelefonoProveedor, numeroPrincipal, numeroSecundario, observaciones, codigoProveedor)
    VALUES (codigo, numeroPrincipal, numeroSecundario, observaciones, codigoProveedor);
END $$

-- Procedimiento almacenado para editar información de un teléfono de proveedor
CREATE PROCEDURE sp_EditarTelefonoProveedor(
    IN codigo INT,
    IN nuevo_numeroPrincipal VARCHAR(8),
    IN nuevo_numeroSecundario VARCHAR(8),
    IN nuevas_observaciones VARCHAR(45),
    IN nuevo_codigoProveedor INT
)
BEGIN
    UPDATE TelefonoProveedor SET
        numeroPrincipal = nuevo_numeroPrincipal,
        numeroSecundario = nuevo_numeroSecundario,
        observaciones = nuevas_observaciones,
        codigoProveedor = nuevo_codigoProveedor
    WHERE codigoTelefonoProveedor = codigo;
END $$

-- Procedimiento almacenado para eliminar un teléfono de proveedor por código
CREATE PROCEDURE sp_EliminarTelefonoProveedor(IN codigo INT)
BEGIN
    DELETE FROM TelefonoProveedor WHERE codigoTelefonoProveedor = codigo;
END $$

DELIMITER ;

-- Ejemplo 1
CALL sp_AgregarTelefonoProveedor(
    1,
    '12345678',
    '87654321',
    'Principal y Secundario',
    1
);

-- Ejemplo 2
CALL sp_AgregarTelefonoProveedor(
    2,
    '23456789',
    '',
    'Solo Principal',
    2
);

-- Ejemplo 3
CALL sp_AgregarTelefonoProveedor(
    3,
    '34567890',
    '98765432',
    'Secundario',
    3
);

-- ----------------------------------------------------------------------------------------------------Empleados 
DELIMITER $$

-- Procedimiento almacenado para listar registros de la tabla Empleados
CREATE PROCEDURE sp_ListarEmpleados()
BEGIN
    SELECT * FROM Empleados;
END $$

-- Procedimiento almacenado para buscar un empleado por código
CREATE PROCEDURE sp_BuscarEmpleado(IN codigo INT)
BEGIN
    SELECT * FROM Empleados WHERE codigoEmpleado = codigo;
END $$

-- Procedimiento almacenado para agregar un nuevo empleado
CREATE PROCEDURE sp_AgregarEmpleado(
    IN codigo INT,
    IN nombres VARCHAR(50),
    IN apellidos VARCHAR(50),
    IN sueldo DECIMAL(10,2),
    IN direccion VARCHAR(150),
    IN turno VARCHAR(15),
    IN codigoCargoEmpleado INT
)
BEGIN
    INSERT INTO Empleados (codigoEmpleado, nombresEmpleado, apellidosEmpleado, sueldo, direccion, turno, codigoCargoEmpleado)
    VALUES (codigo, nombres, apellidos, sueldo, direccion, turno, codigoCargoEmpleado);
END $$

-- Procedimiento almacenado para editar información de un empleado
CREATE PROCEDURE sp_EditarEmpleado(
    IN codigo INT,
    IN nuevos_nombres VARCHAR(50),
    IN nuevos_apellidos VARCHAR(50),
    IN nuevo_sueldo DECIMAL(10,2),
    IN nueva_direccion VARCHAR(150),
    IN nuevo_turno VARCHAR(15),
    IN nuevo_codigoCargoEmpleado INT
)
BEGIN
    UPDATE Empleados SET
        nombresEmpleado = nuevos_nombres,
        apellidosEmpleado = nuevos_apellidos,
        sueldo = nuevo_sueldo,
        direccion = nueva_direccion,
        turno = nuevo_turno,
        codigoCargoEmpleado = nuevo_codigoCargoEmpleado
    WHERE codigoEmpleado = codigo;
END $$

-- Procedimiento almacenado para eliminar un empleado por código
CREATE PROCEDURE sp_EliminarEmpleado(IN codigo INT)
BEGIN
    DELETE FROM Empleados WHERE codigoEmpleado = codigo;
END $$

DELIMITER ;

-- Ejemplo 1
CALL sp_AgregarEmpleado(
    1,
    'Juan',
    'Pérez',
    1500.00,
    'Calle Falsa 123',
    'Mañana',
    1
);

-- Ejemplo 2
CALL sp_AgregarEmpleado(
    2,
    'María',
    'González',
    1800.00,
    'Avenida Siempre Viva 742',
    'Tarde',
    2
);

-- Ejemplo 3
CALL sp_AgregarEmpleado(
    3,
    'Carlos',
    'Rodríguez',
    1600.00,
    'Boulevard de los Sueños 456',
    'Noche',
    3
);


-- -------------------------------------------------------------------------------------------------------------------EmailProveedor
DELIMITER $$

-- Procedimiento almacenado para listar registros de la tabla EmailProveedor
CREATE PROCEDURE sp_ListarEmailProveedor()
BEGIN
    SELECT * FROM EmailProveedor;
END $$

-- Procedimiento almacenado para buscar un correo de proveedor por código
CREATE PROCEDURE sp_BuscarEmailProveedor(IN codigo INT)
BEGIN
    SELECT * FROM EmailProveedor WHERE codigoEmailProveedor = codigo;
END $$

-- Procedimiento almacenado para agregar un nuevo correo de proveedor
CREATE PROCEDURE sp_AgregarEmailProveedor(
    IN codigo INT,
    IN email VARCHAR(50),
    IN descripcion VARCHAR(100),
    IN codigoProveedor INT
)
BEGIN
    INSERT INTO EmailProveedor (codigoEmailProveedor, emailProveedor, descripcion, codigoProveedor)
    VALUES (codigo, email, descripcion, codigoProveedor);
END $$

-- Procedimiento almacenado para editar información de un correo de proveedor
CREATE PROCEDURE sp_EditarEmailProveedor(
    IN codigo INT,
    IN nuevo_email VARCHAR(50),
    IN nueva_descripcion VARCHAR(100),
    IN nuevo_codigoProveedor INT
)
BEGIN
    UPDATE EmailProveedor SET
        emailProveedor = nuevo_email,
        descripcion = nueva_descripcion,
        codigoProveedor = nuevo_codigoProveedor
    WHERE codigoEmailProveedor = codigo;
END $$

-- Procedimiento almacenado para eliminar un correo de proveedor por código
CREATE PROCEDURE sp_EliminarEmailProveedor(IN codigo INT)
BEGIN
    DELETE FROM EmailProveedor WHERE codigoEmailProveedor = codigo;
END $$

DELIMITER ;

-- Ejemplo 1
CALL sp_AgregarEmailProveedor(
    1,
    'info@proveedor1.com',
    'Correo principal',
    1
);

-- Ejemplo 2
CALL sp_AgregarEmailProveedor(
    2,
    'ventas@proveedor2.com',
    'Correo de ventas',
    2
);

-- Ejemplo 3
CALL sp_AgregarEmailProveedor(
    3,
    'contacto@proveedor3.com',
    'Correo de contacto',
    3
);

-- ----------------------------------------------------------------------------------------------------Factura 
DELIMITER $$

-- Procedimiento almacenado para listar registros de la tabla Factura
CREATE PROCEDURE sp_ListarFacturas()
BEGIN
    SELECT * FROM Factura;
END $$

-- Procedimiento almacenado para buscar una factura por número
CREATE PROCEDURE sp_BuscarFactura(IN numero INT)
BEGIN
    SELECT * FROM Factura WHERE numeroFactura = numero;
END $$

-- Procedimiento almacenado para agregar una nueva factura
CREATE PROCEDURE sp_AgregarFactura(
    IN numero INT,
    IN estado VARCHAR(50),
    IN total DECIMAL(10,2),
    IN fecha VARCHAR(45),
    IN cliente INT,
    IN empleado INT
)
BEGIN
    INSERT INTO Factura (numeroFactura, estado, totalFactura, fechaFactura, clienteID, codigoEmpleado)
    VALUES (numero, estado, total, fecha, cliente, empleado);
END $$

-- Procedimiento almacenado para editar información de una factura
CREATE PROCEDURE sp_EditarFactura(
    IN numero INT,
    IN nuevo_estado VARCHAR(50),
    IN nuevo_total DECIMAL(10,2),
    IN nueva_fecha VARCHAR(45),
    IN nuevo_cliente INT,
    IN nuevo_empleado INT
)
BEGIN
    UPDATE Factura SET
        estado = nuevo_estado,
        totalFactura = nuevo_total,
        fechaFactura = nueva_fecha,
        clienteID = nuevo_cliente,
        codigoEmpleado = nuevo_empleado
    WHERE numeroFactura = numero;
END $$

-- Procedimiento almacenado para eliminar una factura por número
CREATE PROCEDURE sp_EliminarFactura(IN numero INT)
BEGIN
    DELETE FROM Factura WHERE numeroFactura = numero;
END $$

DELIMITER ;

-- Ejemplo 1
CALL sp_AgregarFactura(
    1001,
    'Pagada',
    2500.00,
    '2024-05-01',
    1, -- ID del cliente
    1 -- ID del empleado
);

-- Ejemplo 2
CALL sp_AgregarFactura(
    1002,
    'Pendiente',
    1500.50,
    '2024-05-02',
    2, -- ID del cliente
    2 -- ID del empleado
);

-- Ejemplo 3
CALL sp_AgregarFactura(
    1003,
    'Pagada',
    3500.75,
    '2024-05-03',
    3, -- ID del cliente
    3 -- ID del empleado
);

-- ----------------------------------------------------------------------------------------------------Productos 
DELIMITER $$

-- Procedimiento almacenado para listar registros de la tabla Productos
CREATE PROCEDURE sp_ListarProductos()
BEGIN
    SELECT * FROM Productos;
END $$

-- Procedimiento almacenado para buscar un producto por código
CREATE PROCEDURE sp_BuscarProducto(IN codigo VARCHAR(15))
BEGIN
    SELECT * FROM Productos WHERE codigoProducto = codigo;
END $$

-- Procedimiento almacenado para agregar un nuevo producto
CREATE PROCEDURE sp_AgregarProducto(
    IN codigo VARCHAR(15),
    IN descripcion VARCHAR(45),
    IN precioUnitario DECIMAL(10,2),
    IN precioDocena DECIMAL(10,2),
    IN precioMayor DECIMAL(10,2),
    IN existencia INT,
    IN codigoTipoProducto INT,
    IN codigoProveedor INT
)
BEGIN
    INSERT INTO Productos (codigoProducto, descripcionProducto, precioUnitario, precioDocena, precioMayor, existencia, codigoTipoProducto, codigoProveedor)
    VALUES (codigo, descripcion, precioUnitario, precioDocena, precioMayor, existencia, codigoTipoProducto, codigoProveedor);
END $$

-- Procedimiento almacenado para editar información de un producto
CREATE PROCEDURE sp_EditarProducto(
    IN codigo VARCHAR(15),
    IN nueva_descripcion VARCHAR(45),
    IN nuevo_precioUnitario DECIMAL(10,2),
    IN nuevo_precioDocena DECIMAL(10,2),
    IN nuevo_precioMayor DECIMAL(10,2),
    IN nueva_existencia INT,
    IN nuevo_codigoTipoProducto INT,
    IN nuevo_codigoProveedor INT
)
BEGIN
    UPDATE Productos SET
        descripcionProducto = nueva_descripcion,
        precioUnitario = nuevo_precioUnitario,
        precioDocena = nuevo_precioDocena,
        precioMayor = nuevo_precioMayor,
        existencia = nueva_existencia,
        codigoTipoProducto = nuevo_codigoTipoProducto,
        codigoProveedor = nuevo_codigoProveedor
    WHERE codigoProducto = codigo;
END $$

-- Procedimiento almacenado para eliminar un producto por código
CREATE PROCEDURE sp_EliminarProducto(IN codigo VARCHAR(15))
BEGIN
    DELETE FROM Productos WHERE codigoProducto = codigo;
END $$

DELIMITER ;

-- Ejemplo 1
CALL sp_AgregarProducto(
    'PROD1',
    'Laptop HP',
    1500.00,
    1700.00,
    1400.00,
    10,
    1, -- Código del tipo de producto
    1 -- Código del proveedor
);

-- Ejemplo 2
CALL sp_AgregarProducto(
    'PROD2',
    'Silla de Oficina',
    100.00,
    110.00,
    90.00,
    20,
    2, -- Código del tipo de producto
    2 -- Código del proveedor
);

-- Ejemplo 3
CALL sp_AgregarProducto(
    'PROD3',
    'Camisa Polo',
    25.00,
    280.00,
    20.00,
    50,
    3, -- Código del tipo de producto
    3 -- Código del proveedor
);

-- ----------------------------------------------------------------------------------------------------------------DETALLEFACTURA 
DELIMITER $$

-- Procedimiento almacenado para listar registros de la tabla DetalleFactura
CREATE PROCEDURE sp_ListarDetalleFactura()
BEGIN
    SELECT * FROM DetalleFactura;
END $$

-- Procedimiento almacenado para buscar un detalle de factura por código
CREATE PROCEDURE sp_BuscarDetalleFactura(IN codigo INT)
BEGIN
    SELECT * FROM DetalleFactura WHERE codigoDetalleFactura = codigo;
END $$

-- Procedimiento almacenado para agregar un nuevo detalle de factura
CREATE PROCEDURE sp_AgregarDetalleFactura(
    IN codigo INT,
    IN precioUnitario DECIMAL(10,2),
    IN cantidad INT,
    IN numeroFactura INT,
    IN codigoProducto VARCHAR(15)
)
BEGIN
    INSERT INTO DetalleFactura (codigoDetalleFactura, precioUnitario, cantidad, numeroFactura, codigoProducto)
    VALUES (codigo, precioUnitario, cantidad, numeroFactura, codigoProducto);
END $$

-- Procedimiento almacenado para editar información de un detalle de factura
CREATE PROCEDURE sp_EditarDetalleFactura(
    IN codigo INT,
    IN nuevo_precioUnitario DECIMAL(10,2),
    IN nueva_cantidad INT,
    IN nuevo_numeroFactura INT,
    IN nuevo_codigoProducto VARCHAR(15)
)
BEGIN
    UPDATE DetalleFactura SET
        precioUnitario = nuevo_precioUnitario,
        cantidad = nueva_cantidad,
        numeroFactura = nuevo_numeroFactura,
        codigoProducto = nuevo_codigoProducto
    WHERE codigoDetalleFactura = codigo;
END $$

-- Procedimiento almacenado para eliminar un detalle de factura por código
CREATE PROCEDURE sp_EliminarDetalleFactura(IN codigo INT)
BEGIN
    DELETE FROM DetalleFactura WHERE codigoDetalleFactura = codigo;
END $$

DELIMITER ;

-- Ejemplo 1
CALL sp_AgregarProducto(
    '1', -- Cambia este código a uno nuevo, por ejemplo 'PROD006'
    'Laptop HP',
    1500.00,
    1700.00,
    1400.00,
    10,
    1, -- Código del tipo de producto
    1 -- Código del proveedor
);


-- Ejemplo 2
CALL sp_AgregarProducto(
    '2',
    'Silla de Oficina',
    100.00,
    110.00,
    90.00,
    20,
    2, -- Código del tipo de producto
    2 -- Código del proveedor
);

-- Ejemplo 3
CALL sp_AgregarProducto(
    '3',
    'Camisa Polo',
    25.00,
    280.00,
    20.00,
    50,
    3, -- Código del tipo de producto
    3 -- Código del proveedor
);

-- --------------------------------------------------------------------------------------------------------------DetalleCompra
DELIMITER $$

-- Procedimiento almacenado para listar registros de la tabla DetalleCompra
CREATE PROCEDURE sp_ListarDetalleCompra()
BEGIN
    SELECT * FROM DetalleCompra;
END $$

-- Procedimiento almacenado para buscar un detalle de compra por código
CREATE PROCEDURE sp_BuscarDetalleCompra(IN codigo INT)
BEGIN
    SELECT * FROM DetalleCompra WHERE codigoDetalleCompra = codigo;
END $$

-- Procedimiento almacenado para agregar un nuevo detalle de compra
CREATE PROCEDURE sp_AgregarDetalleCompra(
    IN codigo INT,
    IN costoUnitario DECIMAL(10,2),
    IN cantidad INT,
    IN codigoProducto VARCHAR(15),
    IN numeroDocumento INT
)
BEGIN
    INSERT INTO DetalleCompra (codigoDetalleCompra, costoUnitario, cantidad, codigoProducto, numeroDocumento)
    VALUES (codigo, costoUnitario, cantidad, codigoProducto, numeroDocumento);
END $$

-- Procedimiento almacenado para editar información de un detalle de compra
CREATE PROCEDURE sp_EditarDetalleCompra(
    IN codigo INT,
    IN nuevo_costoUnitario DECIMAL(10,2),
    IN nueva_cantidad INT,
    IN nuevo_codigoProducto VARCHAR(15),
    IN nuevo_numeroDocumento INT
)
BEGIN
    UPDATE DetalleCompra SET
        costoUnitario = nuevo_costoUnitario,
        cantidad = nueva_cantidad,
        codigoProducto = nuevo_codigoProducto,
        numeroDocumento = nuevo_numeroDocumento
    WHERE codigoDetalleCompra = codigo;
END $$

-- Procedimiento almacenado para eliminar un detalle de compra por código
CREATE PROCEDURE sp_EliminarDetalleCompra(IN codigo INT)
BEGIN
    DELETE FROM DetalleCompra WHERE codigoDetalleCompra = codigo;
END $$

DELIMITER ;

-- Ejemplo 1
CALL sp_AgregarDetalleCompra(
    1,
    50.00,
    2,
    '1', -- Código del producto existente en tu base de datos
    1001 -- Número de documento existente en tu base de datos
);

-- Ejemplo 2
CALL sp_AgregarDetalleCompra(
    2,
    30.00,
    5,
    '2', -- Código del producto existente en tu base de datos
    1001 -- Número de documento existente en tu base de datos
);

-- Ejemplo 3
CALL sp_AgregarDetalleCompra(
    3,
    15.00,
    10,
    '3', -- Código del producto existente en tu base de datos
    1002 -- Número de documento existente en tu base de datos
);

-- -----------------------------------------------------------------------------------------------------------------------------------------------------
-- trigger

delimiter $$

create trigger tr_PrecioProductos_After_Insert
after insert on DetalleCompra
for each row 
begin
	declare total decimal(10,2);
    declare cantidad int;
    
    set total = NEW.costoUnitario * NEW.cantidad;

	update Productos
	set precioUnitario = total * 0.40,
		precioDocena  = total * 0.35 * 12,
        precioMayor = total * 0.25
    where Productos.codigoProducto = NEW.codigoProducto;
    
	update Productos
    set Productos.existencia = Productos.existencia - NEW.cantidad
	where Productos.codigoProducto = NEW.codigoProducto;

end $$
delimiter ;

delimiter $$

create trigger tr_TotalDocumento_After_Insert
after insert on DetalleCompra
for each row
begin
    declare total decimal(10,2);
    
    select sum(costoUnitario * cantidad) into total from DetalleCompra 
    where numeroDocumento = NEW.numeroDocumento;
    
    update Compras 
		set totalDocumento = total 
	where numeroDocumento = NEW.numeroDocumento;
end $$
delimiter ;

delimiter $$

create trigger tr_PrecioUnitario_After_Upd
after update on DetalleCompra
for each row
begin

	declare precioP decimal(10,2);
    
    set precioP = (select precioUnitario from Productos where codigoProducto = NEW.codigoProducto);
    
    update DetalleFactura
    set DetalleFactura.precioUnitario = precioP
    where DetalleFactura.codigoProducto = NEW.codigoProducto;
end $$
delimiter ;


delimiter $$

create trigger tr_TotalFactura_Aftr_U
after update on DetalleFactura
for each row
begin
	declare totalFactura decimal(10,2);
    
    select sum(precioUnitario * cantidad) into totalFactura from DetalleFactura
    where numeroFactura = NEW.numeroFactura;
    
    update Factura
		set Factura.totalFactura = totalFactura
	where Factura.numeroFactura = NEW.numeroFactura;
end $$
delimiter ;

ALTER USER '2019272_IN5BM'@'localhost' identified with mysql_native_password by 'abc123**';
-- alter user 'root'@'localhost' identified with mysql_native_password by 'abc123**';