INSERT INTO Clientes (client_id, name, last_name, email, password, address)
VALUES
    (1, 'Juan', 'Pérez', 'juan@email.com', 'contraseña123', '123 Calle Principal'),
    (2, 'Ana', 'López', 'ana@email.com', 'clave456', '456 Avenida Secundaria'),
    (3, 'Luis', 'García', 'luis@email.com', 'password789', '789 Calle Residencial');
INSERT INTO Reservas (reservation_id, client_id, DateTimeReservation, NumPeople, Observations)
VALUES
    (1, 1, '2023-10-21 18:00:00', 4, 'Necesitamos una mesa cerca de la ventana.'),
    (2, 2, '2023-10-22 19:30:00', 6, 'Sin restricciones especiales.'),
    (3, 3, '2023-10-23 20:00:00', 2, 'Celebración de aniversario');
INSERT INTO Empleados (employee_id, name, last_name, job_title, HireDate, salary, shift)
VALUES
    (1, 'Juan', 'Pérez', 'Camarero', '2023-10-15', 2500.00, 'Mañana'),
    (2, 'Ana', 'López', 'Chef', '2023-09-05', 3500.00, 'Noche'),
    (3, 'Luis', 'García', 'Recepcionista', '2023-11-02', 2200.00, 'Tarde');
INSERT INTO Menú (dish_id, name_dish, description, price, category)
VALUES
    (1, 'Spaghetti a la Bolognesa', 'Spaghetti con salsa de carne, tomate y hierbas.', 12.99, 'Plato fuerte'),
    (2, 'Ensalada César', 'Lechuga romana, crutones, aderezo César.', 7.99, 'Entrada'),
    (3, 'Tarta de Chocolate', 'Tarta de chocolate con ganache y nueces.', 5.99, 'Postre'),
    (4, 'Salmón a la Parrilla', 'Filete de salmón con salsa de limón y hierbas.', 16.99, 'Plato fuerte'),
    (5, 'Margarita', 'Cóctel de tequila, triple sec y jugo de limón.', 8.99, 'Bebidas/bebestibles');
INSERT INTO Ingredientes (ingredient_id, name_ingredient, unit_measure, quant_avail)
VALUES
    (1, 'Harina', 'Gramos', 5000.00),
    (2, 'Carne de Res', 'Kilogramos', 200.50),
    (3, 'Tomates', 'Unidades', 100),
    (4, 'Aceite de Oliva', 'Mililitros', 750.25),
    (5, 'Sal', 'Gramos', 1000.00);
INSERT INTO Pedidos (order_id, client_id, DateTime, status)
VALUES
    (1, 1, '2023-10-21 18:30:00', 'recibido'),
    (2, 2, '2023-10-22 20:15:00', 'en preparación'),
    (3, 3, '2023-10-23 21:00:00', 'entregado');
INSERT INTO `Detalle pedidos` (order_id, dish_id, quantity, price)
VALUES
    (1, 1, 2, 25.00),
    (1, 3, 1, 10.00),
    (2, 2, 3, 21.00),
    (3, 4, 1, 16.99),
    (3, 5, 2, 17.98);
INSERT INTO `Facturas Ventas` (sell_id, order_id, subtotal, tax, tip, total)
VALUES
    (1, 1, '37.00', 3.00, 5.00, 45.00),
    (2, 2, '28.00', 2.50, 4.00, 34.50),
    (3, 3, '32.99', 2.00, 4.50, 39.49);
INSERT INTO `Facturas Compras` (buy_id, type, Date, amount)
VALUES
    (1, 'Ingredientes', '2023-10-15 10:30:00', 750.00),
    (2, 'Bebidas', '2023-10-16 15:45:00', 450.50),
    (3, 'Suministros de Cocina', '2023-10-17 14:20:00', 1200.25);
INSERT INTO Mesa (table_id, capacity, status)
VALUES
    (1, 4, 'disponible'),
    (2, 6, 'ocupada'),
    (3, 2, 'reservada'),
    (4, 8, 'disponible'),
    (5, 5, 'disponible');
INSERT INTO Proveedores (provid_id, name_provid, contact, product)
VALUES
    (1, 'Proveedor1', 'proveedor1@gmail.com', 'Ingredientes para la cocina'),
    (2, 'Proveedor2', 'proveedor2@gmail.com', 'Bebidas y licores'),
    (3, 'Proveedor3', 'proveedor3@gmail.com', 'Suministros de limpieza'),
    (4, 'Proveedor4', 'proveedor4@gmail.com', 'Carne y pescado');
INSERT INTO `Comentarios y Reseñas` (comment_id, client_id, DateTime, comment)
VALUES
    (1, 1, '2023-10-21 14:30:00', 'Excelente servicio y comida deliciosa.'),
    (2, 2, '2023-10-22 20:45:00', 'Buena experiencia, pero la espera fue un poco larga.'),
    (3, 3, '2023-10-23 11:15:00', 'Muy satisfecho con la atención y el ambiente.');
CREATE VIEW VistaReservasClientes AS
SELECT R.reservation_id, R.DateTimeReservation, R.NumPeople, R.Observations, C.name AS NombreCliente, C.last_name AS ApellidoCliente, C.email AS CorreoCliente
FROM Reservas R
JOIN Clientes C ON R.client_id = C.client_id;
CREATE VIEW VistaMenuPorCategoria AS
SELECT M.dish_id, M.name_dish, M.description, M.price, M.category
FROM Menu M
ORDER BY M.category, M.name_dish;
CREATE VIEW VistaDetallePedidos AS
SELECT P.order_id, P.FechaHoraPedido, C.name AS NombreCliente, DP.dish_id, DP.quantity, DP.price, M.name_dish AS NombrePlatillo
FROM Pedidos P
JOIN Clientes C ON P.client_id = C.client_id
JOIN Detalle_Pedidos DP ON P.order_id = DP.order_id
JOIN Menu M ON DP.dish_id = M.dish_id;
CREATE VIEW VistaFacturasVentasClientes AS
SELECT F.sell_id, F.subtotal, F.tax, F.tip, F.total, P.FechaHoraPedido, C.name AS NombreCliente, C.last_name AS ApellidoCliente, C.email AS CorreoCliente
FROM Facturas_ventas F
JOIN Pedidos P ON F.order_id = P.order_id
JOIN Clientes C ON P.client_id = C.client_id;
CREATE VIEW Vista_Clientes_Reservas_Facturas AS
SELECT
    C.client_id,
    C.name AS client_name,
    C.last_name AS client_last_name,
    R.reservation_id,
    R.DateTimeReservation,
    R.NumPeople,
    F.sell_id AS factura_id,
    F.subtotal,
    F.tax,
    F.tip,
    F.total
FROM
    Clientes C
LEFT JOIN Reservas R ON C.client_id = R.client_id
LEFT JOIN Facturas_ventas F ON R.reservation_id = F.order_id;
CREATE VIEW InformacionClientes AS
SELECT c.client_id, c.name, c.last_name, c.email, r.reservation_id, r.DateTimeReservation, r.NumPeople, e.employee_id, e.job_title, m.name_dish, m.price, i.name_ingredient, i.quant_avail, p.order_id, p.FechaHoraPedido, d.quantity, d.price AS dish_price, f.subtotal, f.tax, f.tip, f.total, me.capacity, me.status
FROM Clientes c
LEFT JOIN Reservas r ON c.client_id = r.client_id
LEFT JOIN Pedidos p ON c.client_id = p.client_id
LEFT JOIN Detalle_Pedidos d ON p.order_id = d.order_id
LEFT JOIN Empleados e ON d.employee_id = e.employee_id
LEFT JOIN Menu m ON d.dish_id = m.dish_id
LEFT JOIN Ingredientes i ON m.dish_id = i.dish_id
LEFT JOIN Facturas_ventas f ON p.order_id = f.order_id
LEFT JOIN Mesa me ON p.table_id = me.table_id
LEFT JOIN Proveedores pr ON d.provid_id = pr.provid_id
LEFT JOIN Comentarios_Resenas cr ON c.client_id = cr.client_id;
CREATE VIEW InformacionClientesReservas AS
SELECT
    C.client_id,
    C.name AS nombre_cliente,
    C.last_name AS apellido_cliente,
    R.reservation_id,
    R.DateTimeReservation,
    R.NumPeople,
    R.Observations,
    E.name AS nombre_empleado,
    E.last_name AS apellido_empleado,
    E.job_title,
    E.HireDate
FROM Clientes C
INNER JOIN Reservas R ON C.client_id = R.client_id
INNER JOIN Empleados E ON E.employee_id = R.employee_id;
CREATE VIEW Vista_Clientes_Reservas_Mesa AS
SELECT
    C.client_id,
    C.name,
    C.last_name,
    C.email,
    R.reservation_id,
    R.DateTimeReservation,
    M.table_id,
    M.capacity,
    M.status
FROM Clientes C
LEFT JOIN Reservas R ON C.client_id = R.client_id
LEFT JOIN Mesa M ON R.reservation_id = M.table_id;
CREATE VIEW InformacionClientesReservas AS
SELECT
    c.client_id,
    c.name,
    c.last_name,
    c.email,
    r.reservation_id,
    r.DateTimeReservation,
    r.NumPeople,
    r.Observations
FROM
    Clientes c
    JOIN Reservas r ON c.client_id = r.client_id;
    DELIMITER //
CREATE PROCEDURE AgregarCliente(
    IN p_nombre VARCHAR(255),
    IN p_apellido VARCHAR(255),
    IN p_correo VARCHAR(255),
    IN p_contrasena VARCHAR(255),
    IN p_direccion VARCHAR(255)
)
BEGIN
    INSERT INTO Clientes (name, last_name, email, password, address)
    VALUES (p_nombre, p_apellido, p_correo, p_contrasena, p_direccion);
END;
//
CREATE PROCEDURE ActualizarCliente(
    IN p_cliente_id INT,
    IN p_nombre VARCHAR(255),
    IN p_apellido VARCHAR(255),
    IN p_correo VARCHAR(255),
    IN p_contrasena VARCHAR(255),
    IN p_direccion VARCHAR(255)
)
BEGIN
    UPDATE Clientes
    SET name = p_nombre, last_name = p_apellido, email = p_correo, password = p_contrasena, address = p_direccion
    WHERE client_id = p_cliente_id;
END;
//
CREATE PROCEDURE EliminarCliente(
    IN p_cliente_id INT
)
BEGIN
    DELETE FROM Clientes
    WHERE client_id = p_cliente_id;
END;
//

DELIMITER ;
DELIMITER //

CREATE PROCEDURE AgregarReserva(
    IN p_cliente_id INT,
    IN p_fecha_hora DATETIME,
    IN p_num_personas INT,
    IN p_observaciones TEXT
)
BEGIN
    INSERT INTO Reservas (client_id, DateTimeReservation, NumPeople, Observations)
    VALUES (p_cliente_id, p_fecha_hora, p_num_personas, p_observaciones);
END;
//
CREATE PROCEDURE ActualizarReserva(
    IN p_reserva_id INT,
    IN p_cliente_id INT,
    IN p_fecha_hora DATETIME,
    IN p_num_personas INT,
    IN p_observaciones TEXT
)
BEGIN
    UPDATE Reservas
    SET client_id = p_cliente_id, DateTimeReservation = p_fecha_hora, NumPeople = p_num_personas, Observations = p_observaciones
    WHERE reservation_id = p_reserva_id;
END;
//
CREATE PROCEDURE EliminarReserva(
    IN p_reserva_id INT
)
BEGIN
    DELETE FROM Reservas
    WHERE reservation_id = p_reserva_id;
END;
//

DELIMITER ;

DELIMITER //

CREATE PROCEDURE AgregarEmpleado(
    IN p_nombre VARCHAR(255),
    IN p_apellido VARCHAR(255),
    IN p_puesto VARCHAR(100),
    IN p_fecha_contratacion DATE,
    IN p_salario DECIMAL(10, 2),
    IN p_turno VARCHAR(100)
)
BEGIN
    INSERT INTO Empleados (name, last_name, job_title, HireDate, salary, Shift)
    VALUES (p_nombre, p_apellido, p_puesto, p_fecha_contratacion, p_salario, p_turno);
END;
//

CREATE PROCEDURE ActualizarEmpleado(
    IN p_empleado_id INT,
    IN p_nombre VARCHAR(255),
    IN p_apellido VARCHAR(255),
    IN p_puesto VARCHAR(100),
    IN p_fecha_contratacion DATE,
    IN p_salario DECIMAL(10, 2),
    IN p_turno VARCHAR(100)
)
BEGIN
    UPDATE Empleados
    SET name = p_nombre, last_name = p_apellido, job_title = p_puesto, HireDate = p_fecha_contratacion, salary = p_salario, Shift = p_turno
    WHERE employee_id = p_empleado_id;
END;
//

CREATE PROCEDURE EliminarEmpleado(
    IN p_empleado_id INT
)
BEGIN
    DELETE FROM Empleados
    WHERE employee_id = p_empleado_id;
END;
//

DELIMITER ;
DELIMITER //

CREATE PROCEDURE AgregarPlatoAlMenu(
    IN p_nombre_plato VARCHAR(255),
    IN p_descripcion TEXT,
    IN p_precio DECIMAL(10, 2),
    IN p_categoria VARCHAR(100)
)
BEGIN
    INSERT INTO Menu (name_dish, description, price, category)
    VALUES (p_nombre_plato, p_descripcion, p_precio, p_categoria);
END;
//

CREATE PROCEDURE ActualizarPlatoEnMenu(
    IN p_plato_id INT,
    IN p_nombre_plato VARCHAR(255),
    IN p_descripcion TEXT,
    IN p_precio DECIMAL(10, 2),
    IN p_categoria VARCHAR(100)
)
BEGIN
    UPDATE Menu
    SET name_dish = p_nombre_plato, description = p_descripcion, price = p_precio, category = p_categoria
    WHERE dish_id = p_plato_id;
END;
//

CREATE PROCEDURE EliminarPlatoDelMenu(
    IN p_plato_id INT
)
BEGIN
    DELETE FROM Menu
    WHERE dish_id = p_plato_id;
END;
//

DELIMITER ;
DELIMITER //
CREATE PROCEDURE AgregarCliente(
    IN p_nombre VARCHAR(255),
    IN p_apellido VARCHAR(255),
    IN p_correo VARCHAR(255),
    IN p_contrasena VARCHAR(255),
    IN p_direccion VARCHAR(255)
)
BEGIN
    INSERT INTO Clientes (name, last_name, email, password, address)
    VALUES (p_nombre, p_apellido, p_correo, p_contrasena, p_direccion);
END;
//
CREATE PROCEDURE ActualizarCliente(
    IN p_cliente_id INT,
    IN p_nombre VARCHAR(255),
    IN p_apellido VARCHAR(255),
    IN p_correo VARCHAR(255),
    IN p_contrasena VARCHAR(255),
    IN p_direccion VARCHAR(255)
)
BEGIN
    UPDATE Clientes
    SET name = p_nombre, last_name = p_apellido, email = p_correo, password = p_contrasena, address = p_direccion
    WHERE client_id = p_cliente_id;
END;
//
CREATE PROCEDURE EliminarCliente(
    IN p_cliente_id INT
)
BEGIN
    DELETE FROM Clientes
    WHERE client_id = p_cliente_id;
END;
//

DELIMITER ;
DELIMITER //

DELIMITER //

CREATE PROCEDURE AgregarIngrediente(
    IN p_nombre_ingrediente VARCHAR(255),
    IN p_unidad_medida VARCHAR(50),
    IN p_cantidad_disponible DECIMAL(10, 2)
)
BEGIN
    INSERT INTO Ingredientes (name_ingredient, unit_measure, quant_avail)
    VALUES (p_nombre_ingrediente, p_unidad_medida, p_cantidad_disponible);
END;
//

CREATE PROCEDURE ActualizarIngrediente(
    IN p_ingrediente_id INT,
    IN p_nombre_ingrediente VARCHAR(255),
    IN p_unidad_medida VARCHAR(50),
    IN p_cantidad_disponible DECIMAL(10, 2)
)
BEGIN
    UPDATE Ingredientes
    SET name_ingredient = p_nombre_ingrediente, unit_measure = p_unidad_medida, quant_avail = p_cantidad_disponible
    WHERE indgredient_id = p_ingrediente_id;
END;
//

CREATE PROCEDURE EliminarIngrediente(
    IN p_ingrediente_id INT
)
BEGIN
    DELETE FROM Ingredientes
    WHERE indgredient_id = p_ingrediente_id;
END;
//

DELIMITER ;
DELIMITER //

CREATE PROCEDURE AgregarPedido(
    IN p_client_id INT,
    IN p_fecha_hora_pedido DATETIME,
    IN p_date_time VARCHAR(50)
)
BEGIN

    IF (SELECT COUNT(*) FROM Clientes WHERE client_id = p_client_id) > 0 THEN
        INSERT INTO Pedidos (client_id, FechaHoraPedido, DateTime)
        VALUES (p_client_id, p_fecha_hora_pedido, p_date_time);
    ELSE
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'El cliente especificado no existe.';
    END IF;
END;
//

CREATE PROCEDURE ActualizarPedido(
    IN p_order_id INT,
    IN p_client_id INT,
    IN p_fecha_hora_pedido DATETIME,
    IN p_date_time VARCHAR(50)
)
BEGIN

    IF (SELECT COUNT(*) FROM Clientes WHERE client_id = p_client_id) > 0 THEN
        UPDATE Pedidos
        SET client_id = p_client_id, FechaHoraPedido = p_fecha_hora_pedido, DateTime = p_date_time
        WHERE order_id = p_order_id;
    ELSE
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'El cliente especificado no existe.';
    END IF;
END;
//

CREATE PROCEDURE EliminarPedido(
    IN p_order_id INT
)
BEGIN
    DELETE FROM Pedidos
    WHERE order_id = p_order_id;
END;
//

DELIMITER ;
DELIMITER //

CREATE PROCEDURE AgregarDetallePedido(
    IN p_order_id INT,
    IN p_dish_id INT,
    IN p_quantity INT,
    IN p_price DECIMAL(10, 2)
)
BEGIN
    IF (SELECT COUNT(*) FROM Pedidos WHERE order_id = p_order_id) > 0 AND
       (SELECT COUNT(*) FROM Menu WHERE dish_id = p_dish_id) > 0 THEN
        INSERT INTO Detalle_Pedidos (order_id, dish_id, quantity, price)
        VALUES (p_order_id, p_dish_id, p_quantity, p_price);
    ELSE
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'El pedido o el plato especificado no existe.';
    END IF;
END;
//

CREATE PROCEDURE ActualizarDetallePedido(
    IN p_order_id INT,
    IN p_dish_id INT,
    IN p_quantity INT,
    IN p_price DECIMAL(10, 2)
)
BEGIN
    IF (SELECT COUNT(*) FROM Pedidos WHERE order_id = p_order_id) > 0 AND
       (SELECT COUNT(*) FROM Menu WHERE dish_id = p_dish_id) > 0 THEN
        UPDATE Detalle_Pedidos
        SET quantity = p_quantity, price = p_price
        WHERE order_id = p_order_id AND dish_id = p_dish_id;
    ELSE
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'El pedido o el plato especificado no existe.';
    END IF;
END;
//

CREATE PROCEDURE EliminarDetallePedido(
    IN p_order_id INT,
    IN p_dish_id INT
)
BEGIN
    DELETE FROM Detalle_Pedidos
    WHERE order_id = p_order_id AND dish_id = p_dish_id;
END;
//

DELIMITER ;
DELIMITER //

CREATE PROCEDURE AgregarFacturaVenta(
    IN p_order_id INT,
    IN p_subtotal DECIMAL(10, 2),
    IN p_tax DECIMAL(10, 2),
    IN p_tip DECIMAL(10, 2),
    IN p_total DECIMAL(10, 2)
)
BEGIN
    IF (SELECT COUNT(*) FROM Pedidos WHERE order_id = p_order_id) > 0 THEN
        INSERT INTO Facturas_ventas (order_id, subtotal, tax, tip, total)
        VALUES (p_order_id, p_subtotal, p_tax, p_tip, p_total);
    ELSE
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'El pedido especificado no existe.';
    END IF;
END;
//

CREATE PROCEDURE ActualizarFacturaVenta(
    IN p_sell_id INT,
    IN p_subtotal DECIMAL(10, 2),
    IN p_tax DECIMAL(10, 2),
    IN p_tip DECIMAL(10, 2),
    IN p_total DECIMAL(10, 2)
)
BEGIN
    IF (SELECT COUNT(*) FROM Facturas_ventas WHERE sell_id = p_sell_id) > 0 THEN
        UPDATE Facturas_ventas
        SET subtotal = p_subtotal, tax = p_tax, tip = p_tip, total = p_total
        WHERE sell_id = p_sell_id;
    ELSE
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'La factura de venta especificada no existe.';
    END IF;
END;
//

CREATE PROCEDURE EliminarFacturaVenta(
    IN p_sell_id INT
)
BEGIN
    DELETE FROM Facturas_ventas
    WHERE sell_id = p_sell_id;
END;
//

DELIMITER ;

DELIMITER //

CREATE PROCEDURE AgregarFacturaCompra(
    IN p_type VARCHAR(255),
    IN p_date DATETIME,
    IN p_amount DECIMAL(10, 2)
)
BEGIN
    INSERT INTO Facturas_Compras (type, Date, amount)
    VALUES (p_type, p_date, p_amount);
END;
//

CREATE PROCEDURE ActualizarFacturaCompra(
    IN p_buy_id INT,
    IN p_type VARCHAR(255),
    IN p_date DATETIME,
    IN p_amount DECIMAL(10, 2)
)
BEGIN
    UPDATE Facturas_Compras
    SET type = p_type, Date = p_date, amount = p_amount
    WHERE buy_id = p_buy_id;
END;
//

CREATE PROCEDURE EliminarFacturaCompra(
    IN p_buy_id INT
)
BEGIN
    DELETE FROM Facturas_Compras
    WHERE buy_id = p_buy_id;
END;
//

DELIMITER ;
DELIMITER //

CREATE PROCEDURE AgregarMesa(
    IN p_capacity INT,
    IN p_status VARCHAR(50)
)
BEGIN
    INSERT INTO Mesa (capacity, status)
    VALUES (p_capacity, p_status);
END;
//

CREATE PROCEDURE ActualizarMesa(
    IN p_table_id INT,
    IN p_capacity INT,
    IN p_status VARCHAR(50)
)
BEGIN
    UPDATE Mesa
    SET capacity = p_capacity, status = p_status
    WHERE table_id = p_table_id;
END;
//

CREATE PROCEDURE EliminarMesa(
    IN p_table_id INT
)
BEGIN
    DELETE FROM Mesa
    WHERE table_id = p_table_id;
END;
//

DELIMITER ;
DELIMITER //

CREATE PROCEDURE AgregarProveedor(
    IN p_name_provid VARCHAR(255),
    IN p_contact VARCHAR(255),
    IN p_product VARCHAR(255)
)
BEGIN
    INSERT INTO Proveedores (name_provid, contact, product)
    VALUES (p_name_provid, p_contact, p_product);
END;
//

CREATE PROCEDURE ActualizarProveedor(
    IN p_provid_id INT,
    IN p_name_provid VARCHAR(255),
    IN p_contact VARCHAR(255),
    IN p_product VARCHAR(255)
)
BEGIN
    UPDATE Proveedores
    SET name_provid = p_name_provid, contact = p_contact, product = p_product
    WHERE provid_id = p_provid_id;
END;
//

CREATE PROCEDURE EliminarProveedor(
    IN p_provid_id INT
)
BEGIN
    DELETE FROM Proveedores
    WHERE provid_id = p_provid_id;
END;
//

DELIMITER ;
DELIMITER //

CREATE PROCEDURE AgregarComentarioResena(
    IN p_client_id INT,
    IN p_comment TEXT,
    IN p_datetime DATETIME
)
BEGIN
    INSERT INTO Comentarios_Resenas (client_id, comment, DateTime)
    VALUES (p_client_id, p_comment, p_datetime);
END;
//

CREATE PROCEDURE ActualizarComentarioResena(
    IN p_comment_id INT,
    IN p_comment TEXT
)
BEGIN
    UPDATE Comentarios_Resenas
    SET comment = p_comment
    WHERE comment_id = p_comment_id;
END;
//

CREATE PROCEDURE EliminarComentarioResena(
    IN p_comment_id INT
)
BEGIN
    DELETE FROM Comentarios_Resenas
    WHERE comment_id = p_comment_id;
END;
//

DELIMITER ;











