DELIMITER //

CREATE TRIGGER log_before_after_facturas_ventas
BEFORE INSERT, UPDATE, DELETE ON Facturas_ventas
FOR EACH ROW
BEGIN
    INSERT INTO Detalle_FacturasVentas (user, operation, fecha)
    VALUES (USER(), CONCAT('BEFORE ', IF(NEW.sell_id IS NULL, 'INSERT', IF(OLD.sell_id IS NULL, 'UPDATE', 'DELETE'))), NOW());
END;
//
CREATE TRIGGER log_after_after_facturas_ventas
AFTER INSERT, UPDATE, DELETE ON Facturas_ventas
FOR EACH ROW
BEGIN
    INSERT INTO Detalle_FacturasVentas (user, operation, fecha)
    VALUES (USER(), CONCAT('AFTER ', IF(NEW.sell_id IS NULL, 'INSERT', IF(OLD.sell_id IS NULL, 'UPDATE', 'DELETE'))), NOW());
END;
//

DELIMITER ;



DELIMITER //


CREATE TRIGGER log_before_after_pedidos 
BEFORE INSERT, UPDATE, DELETE ON Pedidos
FOR EACH ROW
BEGIN
    INSERT INTO Detalle_Pedidos (user, operation, fecha)
    VALUES (USER(), CONCAT('BEFORE ', IF(NEW.order_id IS NULL, 'INSERT', IF(OLD.order_id IS NULL, 'UPDATE', 'DELETE'))), NOW());
END;
//

CREATE TRIGGER log_after_after_pedidos
AFTER INSERT, UPDATE, DELETE ON Pedidos
FOR EACH ROW
BEGIN
    INSERT INTO Detalle_Pedidos (user, operation, fecha)
    VALUES (USER(), CONCAT('AFTER ', IF(NEW.order_id IS NULL, 'INSERT', IF(OLD.order_id IS NULL, 'UPDATE', 'DELETE'))), NOW());
END;
//

DELIMITER ;

Explicación:
Los triggers controla las operaciones en la tabla "Facturas_ventas" y "Pedidos" correspondientemente. Estos
registran la información antes y después de cada operación de venta del restaurante y de los pedidos realizados a el,
lo que te permite mantener un registro detallado de las acciones realizadas en la tabla, quién las realizó y cuándo 
se llevaron a cabo, me di cuenta que faltaba una tabla para detallar las facturas por lo que tuve que crear 
la tabla "Detalle_FacturasVentas" para almacerar los registros.

. 
