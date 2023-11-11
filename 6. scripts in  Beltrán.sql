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



















