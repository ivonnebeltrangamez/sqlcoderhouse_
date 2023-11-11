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