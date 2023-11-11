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




