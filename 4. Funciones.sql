DELIMITER //

CREATE FUNCTION CalcularTotalVenta(order_id INT) RETURNS DECIMAL(10, 2)
BEGIN
    DECLARE total DECIMAL(10, 2);
    SELECT SUM(subtotal + tax + tip) INTO total FROM Facturas_ventas WHERE order_id = order_id;
    RETURN total;
END;
//
DELIMITER ;
DELIMITER //

CREATE FUNCTION ObtenerNombreCompletoCliente(client_id INT) RETURNS VARCHAR(255)
BEGIN
    DECLARE full_name VARCHAR(255);
    SELECT CONCAT(name, ' ', last_name) INTO full_name FROM Clientes WHERE client_id = client_id;
    RETURN full_name;
END;
//
DELIMITER ;
DELIMITER //

CREATE FUNCTION ListarIngredientesDisponibles() RETURNS TABLE
AS
RETURN (
    SELECT name_ingredient, unit_measure, quant_avail FROM Ingredientes WHERE quant_avail > 0;
);
//
DELIMITER ;
DELIMITER //
CREATE FUNCTION CalcularTotalPedido(order_id INT) RETURNS DECIMAL(10, 2)
BEGIN
    DECLARE total DECIMAL(10, 2);
    SELECT SUM(quantity * price) INTO total
    FROM Detalle_Pedidos
    WHERE order_id = order_id;
    RETURN total;
END;
//
DELIMITER ;
DELIMITER //
CREATE FUNCTION ListarPlatosPorCategoria(categoria VARCHAR(100)) RETURNS TABLE
RETURN (
    SELECT dish_id, name_dish, description, price
    FROM Menu
    WHERE category = categoria;
)
//
DELIMITER ;
DELIMITER //
CREATE FUNCTION ObtenerComentarioRecienteCliente(client_id INT) RETURNS TEXT
BEGIN
    DECLARE comentario TEXT;
    SELECT comment INTO comentario
    FROM Comentarios_Resenas
    WHERE client_id = client_id
    ORDER BY DateTime DESC
    LIMIT 1;
    RETURN comentario;
END;
//
DELIMITER ;
DELIMITER //
CREATE FUNCTION CalcularTotalComprasProveedor(provid_id INT) RETURNS DECIMAL(10, 2)
BEGIN
    DECLARE total DECIMAL(10, 2);
    SELECT SUM(amount) INTO total
    FROM Facturas_Compras
    WHERE provid_id = provid_id;
    RETURN total;
END;
//
DELIMITER ;
