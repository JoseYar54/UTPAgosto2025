-- Tipo_Usuario
CREATE TABLE IF NOT EXISTS Tipo_Usuario (
    id_tipousuario INT PRIMARY KEY AUTO_INCREMENT,
    nombre_tipo VARCHAR(30) NOT NULL,
    descrip_tipo VARCHAR(150),
    estado_tipo BOOLEAN DEFAULT 1
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
    descrip_cate VARCHAR(150),
    estado_cate BOOLEAN DEFAULT 1
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
    estado_pro BOOLEAN DEFAULT 1,
    FOREIGN KEY (categoria_pro) REFERENCES Categoria(id_categoria)
);

CREATE TABLE Venta (
  id_venta INT AUTO_INCREMENT PRIMARY KEY,
  id_usuario INT NOT NULL,
  fecha_venta DATE NOT NULL,
  total_venta DECIMAL(10,2) DEFAULT 0,
  estado_venta BOOLEAN DEFAULT 1,
  FOREIGN KEY (id_usuario) REFERENCES Usuario(id_usuario)
);

CREATE TABLE Detalle_Venta (
  id_detalle INT AUTO_INCREMENT PRIMARY KEY,
  id_venta INT NOT NULL,
  id_producto INT NOT NULL,
  cantidad_det INT NOT NULL,
  subtotal_det DECIMAL(10,2) NOT NULL,
  FOREIGN KEY (id_venta) REFERENCES Venta(id_venta),
  FOREIGN KEY (id_producto) REFERENCES Producto(id_producto)
);
