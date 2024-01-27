-- Insertar registros en la tabla socio
INSERT INTO socio VALUES
(1, 'Gómez', 'Ana', '1234567890', '1990-03-10', 'F', 'S0000001', 'S0000001', 'TIT', 'MAY', 'Calle 123', '5432', '111-222-3333', 'ana.gomez@example.com', 'ACT'),
(2, 'Martínez', 'Carlos', '2345678901', '1985-08-22', 'M', 'S0000002', 'S0000001', 'HIJ', 'CAD', 'Avenida 456', '6789', '222-333-4444', 'carlos.martinez@example.com', 'ACT'),
(3, 'Rodríguez', 'Laura', '3456789012', '1992-11-05', 'F', 'S0000003', 'S0000001', 'HIJ', 'BEC', 'Calle Principal', '9876', '333-444-5555', 'laura.rodriguez@example.com', 'ACT'),
(4, 'Sánchez', 'Luis', '4567890123', '1988-06-18', 'M', 'S0000004', 'S0000001', 'HIJ', 'CAD', 'Calle Secundaria', '6543', '444-555-6666', 'luis.sanchez@example.com', 'ACT'),
(5, 'Fernández', 'Marcela', '5678901234', '1995-02-28', 'F', 'S0000005', 'S0000005', 'TIT', 'VIT', 'Avenida Central', '3210', '555-666-7777', 'marcela.fernandez@example.com', 'BAJ'),
(6, 'López', 'Javier', '6789012345', '1980-09-12', 'M', 'S0000006', 'S0000002', 'HIJ', 'MAY', 'Calle Transversal', '1357', '666-777-8888', 'javier.lopez@example.com', 'ACT'),
(7, 'Gómez', 'Silvia', '7890123456', '1998-04-15', 'F', 'S0000007', 'S0000001', 'CON', 'CAD', 'Avenida Este', '8642', '777-888-9999', 'silvia.gomez@example.com', 'BAJ'),
(8, 'Díaz', 'Ricardo', '8901234567', '1982-07-20', 'M', 'S0000008', 'S0000005', 'PAD', 'BEC', 'Calle Oeste', '2468', '888-999-0000', 'ricardo.diaz@example.com', 'ACT'),
(9, 'Pérez', 'Patricia', '9012345678', '1993-12-03', 'F', 'S0000009', 'S0000005', 'HIJ', 'VIT', 'Avenida Sur', '9753', '999-000-1111', 'patricia.perez@example.com', 'BAJ'),
(10, 'Ramírez', 'Gabriel', '0123456789', '1987-05-25', 'M', 'S0000010', 'S0000003', 'HIJ', 'CAD', 'Calle Poniente', '5312', '000-111-2222', 'gabriel.ramirez@example.com', 'ACT');

-- Insertar registros en la tabla adicionales_mensuales
INSERT INTO adicionales_mensuales VALUES
('FUT', 'Futbol Menores', 1300),
('BAS', 'Basquet Menores', 1300),
('FUN', 'Funcional', 1800),
('TEN', 'Tenis', 2000),
('GIM', 'Gimnasio', 1800),
('VOL', 'Voley Menores', 1300),
('CAS', 'Casillero', 800),
('NAT', 'Natacion', 1900);

-- Insertar registros en la tabla adicionales_mensuales_socio
INSERT INTO adicionales_mensuales_socio VALUES
('FUT', 'S0000001', 'ACT', GETDATE()),
('BAS', 'S0000002', 'ACT', GETDATE()),
('FUN', 'S0000003', 'ACT', GETDATE()),
('TEN', 'S0000004', 'ACT', GETDATE()),
('GIM', 'S0000005', 'BAJ', GETDATE()),
('VOL', 'S0000006', 'ACT', GETDATE()),
('CAS', 'S0000007', 'BAJ', GETDATE()),
('NAT', 'S0000008', 'ACT', GETDATE()),
('FUT', 'S0000009', 'BAJ', GETDATE()),
('BAS', 'S0000010', 'ACT', GETDATE());

