CREATE TABLE Reservas (
    reservation_id INT PRIMARY KEY,
    client_id INT,
    DateTimeReservation DATETIME,
    NumPeople INT,
    Observations TEXT,
    FOREIGN KEY (client_id) REFERENCES Clientes(client_id)
);
INSERT INTO Reservas (reservation_id, client_id, DateTimeReservation, NumPeople, Observations)
VALUES (1, 123, '2023-11-11 12:00:00', 4, 'Sin restricciones');

INSERT INTO Reservas (reservation_id, client_id, DateTimeReservation, NumPeople, Observations)
VALUES (2, 456, '2023-11-12 18:30:00', 2, 'Necesita mesa cerca de la ventana');

-- Eliminar un registro de la tabla Reservas
DELETE FROM Reservas WHERE reservation_id = 1;

-- Rollback
-- ROLLBACK;

-- Commit
-- COMMIT;

-- Sentencias para reinsertar el registro eliminado
INSERT INTO Reservas (reservation_id, client_id, DateTimeReservation, NumPeople, Observations)
VALUES (1, 123, '2023-11-11 12:00:00', 4, 'Sin restricciones');


BEGIN TRANSACTION;

INSERT INTO Pedidos (order_id, client_id, FechaHoraPedido, DateTime)
VALUES (1, 101, '2023-11-11 08:00:00', '...');
INSERT INTO Pedidos (order_id, client_id, FechaHoraPedido, DateTime)
VALUES (2, 102, '2023-11-11 09:30:00', '...');
INSERT INTO Pedidos (order_id, client_id, FechaHoraPedido, DateTime)
VALUES (3, 103, '2023-11-11 11:00:00', '...');
INSERT INTO Pedidos (order_id, client_id, FechaHoraPedido, DateTime)
VALUES (4, 104, '2023-11-11 12:30:00', '...');

SAVEPOINT Savepoint1;

INSERT INTO Pedidos (order_id, client_id, FechaHoraPedido, DateTime)
VALUES (5, 105, '2023-11-11 14:00:00', '...');
INSERT INTO Pedidos (order_id, client_id, FechaHoraPedido, DateTime)
VALUES (6, 106, '2023-11-11 15:30:00', '...');
INSERT INTO Pedidos (order_id, client_id, FechaHoraPedido, DateTime)
VALUES (7, 107, '2023-11-11 17:00:00', '...');
INSERT INTO Pedidos (order_id, client_id, FechaHoraPedido, DateTime)
VALUES (8, 108, '2023-11-11 18:30:00', '...');

SAVEPOINT Savepoint2;

-- RELEASE SAVEPOINT Savepoint1;

COMMIT;

