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

INSERT INTO propietario (nombre, apellido, correo, telefono) VALUES
('Ana', 'Mamani', 'ana.mamani@umsa.bo', '71234501'),
('Carlos', 'Quispe', 'carlos.quispe@umsa.bo', '71234502'),
('Maria', 'Flores', 'maria.flores@umsa.bo', '71234503'),
('Jorge', 'Condori', 'jorge.condori@umsa.bo', '71234504'),
('Lucia', 'Choque', 'lucia.choque@umsa.bo', '71234505'),
('Diego', 'Rojas', 'diego.rojas@umsa.bo', '71234506'),
('Sofia', 'Apaza', 'sofia.apaza@umsa.bo', '71234507'),
('Miguel', 'Vargas', 'miguel.vargas@umsa.bo', '71234508'),
('Valeria', 'Ticona', 'valeria.ticona@umsa.bo', '71234509'),
('Luis', 'Paredes', 'luis.paredes@umsa.bo', '71234510');

INSERT INTO ubicacion (nombre_lugar, referencia) VALUES
('Biblioteca Central', 'Planta baja - sala de lectura'),
('Edificio de Laboratorios', 'Piso 2 - laboratorio de computacion'),
('Monoblock Central', 'Patio principal'),
('Coliseo Universitario', 'Ingreso lateral derecho'),
('Cafeteria Central', 'Mesas del sector norte'),
('Auditorio Principal', 'Fila central'),
('Bloque de Aulas A', 'Piso 1 - aula A102'),
('Bloque de Aulas B', 'Piso 3 - aula B305'),
('Porteria Principal', 'Caseta de control'),
('Canchas Deportivas', 'Graderias este');