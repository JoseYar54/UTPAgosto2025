-- Tipo_Usuario
CREATE TABLE IF NOT EXISTS Tipo_Usuario (
    id_tipousuario INT PRIMARY KEY AUTO_INCREMENT,
    nombre_tipo VARCHAR(30) NOT NULL,
    descrip_tipo VARCHAR(150)
);

-- Usuario
CREATE TABLE IF NOT EXISTS Usuario (
    id_usuario INT PRIMARY KEY AUTO_INCREMENT,
    nombre_user VARCHAR(30) NOT NULL,
    apaterno_user VARCHAR(50) NOT NULL,
    amaterno_user VARCHAR(50),
    correo_user VARCHAR(100) UNIQUE,
    password VARCHAR(30) NOT NULL,
    telefono_user VARCHAR(15),
    estado_user BOOLEAN DEFAULT 1,
    tipo_user INT,
    FOREIGN KEY (tipo_user) REFERENCES Tipo_Usuario(id_tipousuario)
);

-- Categoria
CREATE TABLE IF NOT EXISTS Categoria (
    id_categoria INT PRIMARY KEY AUTO_INCREMENT,
    nombre_cate VARCHAR(30) NOT NULL,
    descrip_cate VARCHAR(150)
);

-- Producto
CREATE TABLE IF NOT EXISTS Producto (
    id_producto INT PRIMARY KEY AUTO_INCREMENT,
    nombre_pro VARCHAR(100) NOT NULL,
    descrip_pro VARCHAR(150),
    categoria_pro INT,
    stock_pro INT DEFAULT 0,
    anio_pro INT,
    precio_pro DECIMAL(8,2) NOT NULL,
    url_pro VARCHAR(250),
    FOREIGN KEY (categoria_pro) REFERENCES Categoria(id_categoria)
);

-- Venta
CREATE TABLE IF NOT EXISTS Venta (
    id_venta INT PRIMARY KEY AUTO_INCREMENT,
    fecha_venta DATETIME DEFAULT NOW(),
    id_usuario INT,
    total_venta DECIMAL(8,2) NOT NULL,
    FOREIGN KEY (id_usuario) REFERENCES Usuario(id_usuario)
);

-- Detalle_Venta
CREATE TABLE IF NOT EXISTS Detalle_Venta (
    id_detalle INT PRIMARY KEY AUTO_INCREMENT,
    id_venta INT,
    id_producto INT,
    cantidad_det INT NOT NULL,
    subtotal_det DECIMAL(8,2) NOT NULL,
    FOREIGN KEY (id_venta) REFERENCES Venta(id_venta),
    FOREIGN KEY (id_producto) REFERENCES Producto(id_producto)
);
