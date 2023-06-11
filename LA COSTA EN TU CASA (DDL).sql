create database la_costa_en_tu_casa;
use la_costa_en_tu_casa;
-- -----------------------------------------------------
-- Tabla Tipo_Empleado
-- -----------------------------------------------------
CREATE Table  Tipo_Empleado (
  id_tipo_empleado INT NOT NULL AUTO_INCREMENT,
  descripcion VARCHAR(45) NOT NULL,
  salario_mensual DOUBLE NOT NULL,
  PRIMARY KEY (id_tipo_empleado)
  );

-- -----------------------------------------------------
-- Tabla ARL
-- -----------------------------------------------------
CREATE Table  ARL (
  id_ARL INT NOT NULL AUTO_INCREMENT,
  nit_arl VARCHAR(45) NOT NULL,
  nombre VARCHAR(45) NOT NULL,
  ubicacion VARCHAR(45) NOT NULL,
  numero_telefonico VARCHAR(45) NOT NULL,
  PRIMARY KEY (id_ARL)
  );


-- -----------------------------------------------------
-- Tabla EPS
-- -----------------------------------------------------
CREATE Table  EPS (
  id_EPS INT NOT NULL AUTO_INCREMENT,
  nit_eps VARCHAR(45) NOT NULL,
  nombre VARCHAR(45) NOT NULL,
  correo VARCHAR(45) NOT NULL,
  numero_telefonico VARCHAR(45) NOT NULL,
  PRIMARY KEY (id_EPS)
  );


-- -----------------------------------------------------
-- Tabla Fondo_Pension
-- -----------------------------------------------------
CREATE Table  Fondo_Pension (
  id_Fondo_Pension INT NOT NULL AUTO_INCREMENT,
  nit_Fondo_Pension VARCHAR(45) NOT NULL,
  nombre VARCHAR(45) NOT NULL,
  correo VARCHAR(45) NOT NULL,
  numero_telefonico VARCHAR(45) NOT NULL,
  PRIMARY KEY (id_Fondo_Pension)
  );


-- -----------------------------------------------------
-- Tabla Departamento
-- -----------------------------------------------------
CREATE Table  Departamento (
  id_Departamento INT NOT NULL AUTO_INCREMENT,
  nombre VARCHAR(45) NOT NULL,
  PRIMARY KEY (id_Departamento)
  );


-- -----------------------------------------------------
-- Tabla Ciudad
-- -----------------------------------------------------
CREATE Table  Ciudad (
  id_Ciudad INT NOT NULL AUTO_INCREMENT,
  nombre VARCHAR(45) NOT NULL,
  id_Departamento INT NOT NULL,
  PRIMARY KEY (id_Ciudad),
  CONSTRAINT fk_Ciudad_Departamento FOREIGN KEY (id_Departamento) REFERENCES Departamento (id_Departamento)
    );


-- -----------------------------------------------------
-- Tabla Producto
-- -----------------------------------------------------
CREATE Table  Producto (
  id_Producto INT NOT NULL AUTO_INCREMENT,
  nombre VARCHAR(45) NOT NULL,
  costo_unitario DOUBLE NOT NULL,
  PRIMARY KEY (id_Producto))
;


-- -----------------------------------------------------
-- Tabla Plato
-- -----------------------------------------------------
CREATE Table  Plato (
  id_Plato INT NOT NULL,
  nombre VARCHAR(45) NOT NULL,
  valor_unitario DOUBLE NOT NULL,
  PRIMARY KEY (id_Plato))
;


-- -----------------------------------------------------
-- Tabla Sucursal
-- -----------------------------------------------------
CREATE Table  Sucursal (
  id_Sucursal INT NOT NULL,
  nombre VARCHAR(45) NOT NULL,
  numero_empleados INT NOT NULL,
  id_Ciudad INT NOT NULL,
  PRIMARY KEY (id_Sucursal),
  CONSTRAINT fk_Sucursal_Ciudad1 FOREIGN KEY (id_Ciudad) REFERENCES Ciudad (id_Ciudad)
    );


-- -----------------------------------------------------
-- Tabla Sistema_social
-- -----------------------------------------------------
CREATE Table  Sistema_social (
  id_Sistema_social INT NOT NULL,
  id_Fondo_Pension INT NOT NULL,
  id_EPS INT NOT NULL,
  id_ARL INT NOT NULL,
  PRIMARY KEY (id_Sistema_social),
  CONSTRAINT fk_Sistema_social_Fondo_Pension1 FOREIGN KEY (id_Fondo_Pension) REFERENCES Fondo_Pension (id_Fondo_Pension),
  CONSTRAINT fk_Sistema_social_EPS1 FOREIGN KEY (id_EPS) REFERENCES EPS (id_EPS),
  CONSTRAINT fk_Sistema_social_ARL1 FOREIGN KEY (id_ARL) REFERENCES ARL (id_ARL)
    );


-- -----------------------------------------------------
-- Tabla Empleado_Laboral
-- -----------------------------------------------------
CREATE Table  Empleado_Laboral (
  doc_Empleado_laboral INT NOT NULL,
  nombres VARCHAR(45) NOT NULL,
  apellidos VARCHAR(45) NOT NULL,
  numero_telefonico VARCHAR(45) NOT NULL,
  direccion VARCHAR(45) NOT NULL,
  fecha_nacimiento DATE NOT NULL,
  email VARCHAR(45) NOT NULL,
  id_tipo_empleado INT NOT NULL,
  id_Sucursal INT NOT NULL,
  id_Sistema_social INT NOT NULL,
  PRIMARY KEY (doc_Empleado_laboral),
  CONSTRAINT fk_Empleado_Laboral_Tipo_Empleado1 FOREIGN KEY (id_tipo_empleado) REFERENCES Tipo_Empleado (id_tipo_empleado),
  CONSTRAINT fk_Empleado_Laboral_Sucursal1 FOREIGN KEY (id_Sucursal) REFERENCES Sucursal (id_Sucursal),
  CONSTRAINT fk_Empleado_Laboral_Sistema_social1 FOREIGN KEY (id_Sistema_social) REFERENCES Sistema_social (id_Sistema_social)
    );


-- -----------------------------------------------------
-- Tabla Subgerente
-- -----------------------------------------------------
CREATE Table  Subgerente (
  doc_Subgerente INT NOT NULL,
  nombres VARCHAR(45) NOT NULL,
  apellidos VARCHAR(45) NOT NULL,
  numero_telefonico VARCHAR(45) NOT NULL,
  correo_electronico VARCHAR(45) NOT NULL,
  fecha_nacimiento DATE NOT NULL,
  salario_mensual DOUBLE NOT NULL,
  id_Sucursal INT UNIQUE NOT NULL,
  id_Sistema_social INT NOT NULL,
  PRIMARY KEY (doc_Subgerente),
  CONSTRAINT fk_Empleado_Laboral_Sucursal10 FOREIGN KEY (id_Sucursal) REFERENCES Sucursal (id_Sucursal),
  CONSTRAINT fk_Subgerente_Sistema_social1 FOREIGN KEY (id_Sistema_social) REFERENCES Sistema_social (id_Sistema_social)
    );


-- -----------------------------------------------------
-- Tabla Ruta
-- -----------------------------------------------------
CREATE Table  Ruta (
  id_Ruta INT NOT NULL,
  id_Ciudad_partida INT NOT NULL,
  id_Sucursal_llegada INT NOT NULL,
  PRIMARY KEY (id_Ruta),
  CONSTRAINT fk_Ruta_Ciudad1 FOREIGN KEY (id_Ciudad_partida) REFERENCES Ciudad (id_Ciudad),
  CONSTRAINT fk_Ruta_Sucursal1 FOREIGN KEY (id_Sucursal_llegada) REFERENCES Sucursal (id_Sucursal)
    );


-- -----------------------------------------------------
-- Tabla Vehiculo
-- -----------------------------------------------------
CREATE Table  Vehiculo (
  id_Vehiculo INT NOT NULL,
  placa_vehiculo VARCHAR(45) NOT NULL,
  marca VARCHAR(45) NOT NULL,
  fecha_compra DATE NOT NULL,
  id_Ruta INT NOT NULL,
  PRIMARY KEY (id_Vehiculo),
  CONSTRAINT fk_Vehiculo_Ruta1 FOREIGN KEY (id_Ruta) REFERENCES Ruta (id_Ruta)
    );


-- -----------------------------------------------------
-- Tabla Viaje
-- -----------------------------------------------------
CREATE Table  Viaje (
  id_Viaje INT NOT NULL,
  fecha_partida DATE NOT NULL,
  fecha_llegada DATE NOT NULL,
  id_Vehiculo INT NOT NULL,
  PRIMARY KEY (id_Viaje),
  CONSTRAINT fk_Viaje_Vehiculo1 FOREIGN KEY (id_Vehiculo) REFERENCES Vehiculo (id_Vehiculo)
    );


-- -----------------------------------------------------
-- Tabla Transportador
-- -----------------------------------------------------
CREATE Table  Transportador (
  doc_Transportador INT NOT NULL,
  nombres VARCHAR(45) NOT NULL,
  numero_telefonico VARCHAR(45) NOT NULL,
  correo_electronico VARCHAR(45) NOT NULL,
  fecha_nacimiento DATE NOT NULL,
  salario_mensual DOUBLE NOT NULL,
  id_Vehiculo INT UNIQUE NOT NULL,
  id_Sistema_social INT NOT NULL,
  PRIMARY KEY (doc_Transportador),
  CONSTRAINT fk_Transportador_Vehiculo1 FOREIGN KEY (id_Vehiculo) REFERENCES Vehiculo (id_Vehiculo),
  CONSTRAINT fk_Transportador_Sistema_social1 FOREIGN KEY (id_Sistema_social) REFERENCES Sistema_social (id_Sistema_social)
    );


-- -----------------------------------------------------
-- Tabla Sucursal_has_Producto
-- -----------------------------------------------------
CREATE Table  Sucursal_has_Producto (
  id_Sucursal INT NOT NULL,
  id_Producto INT NOT NULL,
  canrtidad_disponible INT NOT NULL,
  PRIMARY KEY (id_Sucursal, id_Producto),
  CONSTRAINT fk_Sucursal_has_Producto_Sucursal1 FOREIGN KEY (id_Sucursal) REFERENCES Sucursal (id_Sucursal),
  CONSTRAINT fk_Sucursal_has_Producto_Producto1 FOREIGN KEY (id_Producto) REFERENCES Producto (id_Producto)
    );


-- -----------------------------------------------------
-- Tabla Viaje_has_Producto
-- -----------------------------------------------------
CREATE Table  Viaje_has_Producto (
  id_Viaje INT NOT NULL,
  id_Producto INT NOT NULL,
  cantidad_producto INT NOT NULL,
  PRIMARY KEY (id_Viaje, id_Producto),
  CONSTRAINT fk_Viaje_has_Producto_Viaje1 FOREIGN KEY (id_Viaje) REFERENCES Viaje (id_Viaje),
  CONSTRAINT fk_Viaje_has_Producto_Producto1 FOREIGN KEY (id_Producto) REFERENCES Producto (id_Producto)
    );


-- -----------------------------------------------------
-- Tabla Venta
-- -----------------------------------------------------
CREATE Table  Venta (
  id_Venta INT NOT NULL,
  fecha DATE NOT NULL,
  valor_ganancia DOUBLE NOT NULL,
  id_Sucursal INT NOT NULL,
  doc_Empleado_laboral INT NOT NULL,
  PRIMARY KEY (id_Venta),
  CONSTRAINT fk_Venta_Sucursal1 FOREIGN KEY (id_Sucursal) REFERENCES Sucursal (id_Sucursal),
  CONSTRAINT fk_Venta_Empleado_Laboral1 FOREIGN KEY (doc_Empleado_laboral) REFERENCES Empleado_Laboral (doc_Empleado_laboral)
    );


-- -----------------------------------------------------
-- Tabla Plato_has_Venta
-- -----------------------------------------------------
CREATE Table  Plato_has_Venta (
  id_Plato INT NOT NULL,
  id_Venta INT NOT NULL,
  cantidad INT NOT NULL,
  PRIMARY KEY (id_Plato, id_Venta),
  CONSTRAINT fk_Plato_has_Venta_Plato1 FOREIGN KEY (id_Plato) REFERENCES Plato (id_Plato),
  CONSTRAINT fk_Plato_has_Venta_Venta1 FOREIGN KEY (id_Venta) REFERENCES Venta (id_Venta)
    );

