CREATE TABLE Clientes (
    client_id INT PRIMARY KEY,
    name VARCHAR(255),
    last_name VARCHAR(255),
    email VARCHAR(255),
    password VARCHAR(255),
    address VARCHAR(255)
);

CREATE TABLE Reservas (
    reservation_id INT PRIMARY KEY,
    client_id INT,
    DateTimeReservation DATETIME,
    NumPeople INT,
    Observations TEXT,
    FOREIGN KEY (client_id) REFERENCES Clientes(client_id)
);

CREATE TABLE Empleados (
    employee_id INT PRIMARY KEY,
   name VARCHAR(255),
    last_name VARCHAR(255),
    job_title VARCHAR(100),
    HireDate DATE,
    salary DECIMAL(10, 2),
    Shift VARCHAR(100)
    );
CREATE TABLE Menu (
    dish_id INT PRIMARY KEY,
    name_dish VARCHAR(255),
    description TEXT,
    price DECIMAL(10, 2),
    category VARCHAR(100)
);

CREATE TABLE Ingredientes (
    indgredient_id INT PRIMARY KEY,
    name_ingredient VARCHAR(255),
    unit_measure VARCHAR(50),
    quant_avail DECIMAL(10, 2)
);

CREATE TABLE Pedidos (
    order_id INT PRIMARY KEY,
    client_id INT,
    FechaHoraPedido DATETIME,
    DateTime VARCHAR(50),
    FOREIGN KEY (client_id) REFERENCES Clientes(client_id)
);

CREATE TABLE Detalle_Pedidos (
    order_id INT,
    dish_id INT,
    quantity INT,
    price DECIMAL(10, 2),
    PRIMARY KEY (order_id, dish_id),
    FOREIGN KEY (order_id) REFERENCES Pedidos(order_id),
    FOREIGN KEY (dish_id) REFERENCES Menu(dish_id)
);

CREATE TABLE Facturas_ventas (
    sell_id INT PRIMARY KEY,
    order_id INT,
    subtotal DECIMAL(10, 2),
    tax DECIMAL(10, 2),
    tip DECIMAL(10, 2),
    total DECIMAL(10, 2),
    FOREIGN KEY (order_id) REFERENCES Pedidos(order_id)
);

CREATE TABLE Facturas_Compras (
    buy_id INT PRIMARY KEY,
    type VARCHAR(255),
    Date DATETIME,
    amount DECIMAL(10, 2)
);

CREATE TABLE Mesa (
    table_id INT PRIMARY KEY,
   capacity INT,
    status VARCHAR(50)
);

CREATE TABLE Proveedores (
    provid_id INT PRIMARY KEY,
   name_provid VARCHAR(255),
    contact VARCHAR(255),
    product VARCHAR(255)
);

CREATE TABLE Comentarios_Resenas (
    comment_id INT PRIMARY KEY,
    client_id INT,
    DateTime DATETIME,
    comment TEXT,
    FOREIGN KEY (client_id) REFERENCES Clientes(client_id)
);