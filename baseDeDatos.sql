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

INSERT INTO registro_objeto (
    descripcion, categoria, tipo_reporte, fecha_registro,
    estado, solicitud_recuperacion, fecha_solicitud, id_propietario, id_ubicacion
) VALUES
('Carnet universitario y cedula', 'Documentos', 'encontrado', '2026-11-10', 'entregado', 'Verificado con matricula', '2026-11-11', 1, 1),
('Mochila negra con cuadernos', 'Mochilas', 'extraviado', '2026-11-12', 'reportado', NULL, NULL, 2, 3),
('Cargador de laptop negro', 'Dispositivos electronicos', 'encontrado', '2026-11-13', 'reclamado', 'Tiene etiqueta con iniciales D.R.', '2026-11-14', 3, 2),
('Llavero con tres llaves y cinta', 'Llaves y accesorios', 'encontrado', '2026-11-15', 'encontrado', NULL, NULL, 4, 1),
('Agenda estudiantil azul', 'Documentos', 'extraviado', '2026-11-16', 'reportado', NULL, NULL, 5, 7),
('Audifonos inalambricos blancos', 'Dispositivos electronicos', 'encontrado', '2026-11-17', 'entregado', 'Coincide serie y funda', '2026-11-18', 6, 5),
('Botella termica metalica verde', 'Accesorios', 'encontrado', '2026-11-18', 'encontrado', NULL, NULL, 7, 4),
('Calculadora cientifica gris', 'Dispositivos electronicos', 'extraviado', '2026-11-19', 'reclamado', 'Solicito devolucion con carnet', '2026-11-20', 8, 8),
('Folder con apuntes de calculo', 'Documentos', 'encontrado', '2026-11-20', 'entregado', 'Entregado a su duena', '2026-11-21', 9, 1),
('Chaqueta deportiva azul marino', 'Ropa', 'encontrado', '2026-11-21', 'reportado', NULL, NULL, 10, 10);

/*consultas*/

INSERT INTO registro_objeto (
    descripcion, categoria, tipo_reporte,fecha_registro, estado, solicitud_recuperacion,fecha_solicitud, id_propietario, id_ubicacion
) VALUES (
    'Paraguas negro pegable',
    'Accesorios',
    'encontrado',
    '2026-11-22',
    'encontrado',
    NULL.
    null,
    1,
    9
);

SELECT r.id_objeto, r.descripcion, r.categoria, r.tipo_reporte,
       r.fecha_registro, r.estado, u.nombre_lugar AS ubicacion
FROM registro_objeto
JOIN ubicacion u ON r.id_ubicacion = u.id_ubicacion
WHERE r.categoria = 'Documentos';

SELECT r.id_objeto, r.descripcion, r.categoria, r.tipo_reporte,
       r.fecha_registro, r.estado, u.nombre_lugar AS ubicacion
FROM registro_objeto r
JOIN ubicacion u ON r.id_ubicacion = u.id_ubicacion
Where r.fecha_registro = '2026-11-18';

SELECT r.id_objeto, r.descripcion, r.categoria, r.tipo_reporte,
       r.fecha_registro, r.estado, u.nombre_lugar AS ubicacion
FROM registro_objeto r
JOIN ubicacion u ON r.id_ubicacion = u.id_ubicacion
WHERE u.nombre_lugar = 'Biblioteca Central';

UPDATE registro_objeto 
SET solicitud_recuperacion = 'Presento documento de identidad para reclamo',
    fecha_solicitud = '2026-11-23',
    estado = 'reclamado'
WHERE id_objeto = 2;