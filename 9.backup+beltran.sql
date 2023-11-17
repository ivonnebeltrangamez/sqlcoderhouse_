# Este script de comentarios describe el contenido del backup de la base de datos.
# Incluye únicamente las siguientes tablas:
# - Clientes
# - Reservas
# - Empleados
# - Menu
# - Ingredientes
# - Pedidos
# - Detalle_Pedidos
# - Facturas_ventas
# - Facturas_Compras
# - Mesa
# - Proveedores
# - Comentarios_Resenas

# Comando mysqldump para realizar el backup de las tablas seleccionadas
mysqldump -u [ibeltran] -p[contraseña] [base_de_datos_restaurante] Clientes Reservas Empleados Menu Ingredientes Pedidos Detalle_Pedidos Facturas_ventas Facturas_Compras Mesa Proveedores Comentarios_Resenas > backup.sql
