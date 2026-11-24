-- Creacion de la base de datos "objetos_perdidos_db"
CREATE DATABASE objetos_perdidos_db;
USE objetos_perdidos_db;
CREATE TABLE propietario (
    id_propietario INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    apellido VARCHAR(100) NOT NULL,
    correo VARCHAR(120) NOT NULL UNIQUE,
    telefono VARCHAR(30)
);

CREATE TABLE ubicacion (
    id_ubicacion INT AUTO_INCREMENT PRIMARY KEY,
    nombre_lugar VARCHAR(150) NOT NULL UNIQUE,
    referencia VARCHAR(200)
);
CREATE TABLE registro_objeto (
    id_objeto INT AUTO_INCREMENT PRIMARY KEY,
    descripcion VARCHAR(255) NOT NULL,
    categoria VARCHAR(100) NOT NULL,
    tipo_reporte ENUM('extraviado', 'encontrado') NOT NULL,
    fecha_registro DATE NOT NULL,
    estado ENUM('reportado', 'encontrado', 'reclamado', 'entregado') NOT NULL DEFAULT 'reportado',
    solicitud_recuperacion VARCHAR(255) NULL,
    fecha_solicitud DATE NULL,
    id_propietario INT NOT NULL,
    id_ubicacion INT NOT NULL,
    FOREIGN KEY (id_propietario) REFERENCES propietario(id_propietario),
    FOREIGN KEY (id_ubicacion) REFERENCES ubicacion(id_ubicacion)
);