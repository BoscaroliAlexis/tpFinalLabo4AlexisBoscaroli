USE finalLabo4;
GO

CREATE TABLE socio (
    nro_socio_int INT PRIMARY KEY,
    apellido CHAR(40),
    nombre CHAR(40),
    nro_documento CHAR(10),
    fecha_nacimiento DATE,
    sexo CHAR(1),
    nro_socio CHAR(8),
    nro_socio_titular CHAR(8),
    parentesco CHAR(3),
    categoria CHAR(4),
    direccion VARCHAR(80),
    cp CHAR(4),
    telefonos CHAR(40),
    mail CHAR(60),
    estado CHAR(3)
);

USE finalLabo4;
GO

CREATE TABLE adicionales_mensuales (
    cod_adicional CHAR(4) PRIMARY KEY,
    descripcion CHAR(40),
    costo_mensual MONEY
);

USE finalLabo4;
GO

CREATE TABLE adicionales_mensuales_socio (
    cod_adicional CHAR(4),
    nro_socio CHAR(8),
    estado CHAR(3),
    fecha_ult_modif DATETIME,
    PRIMARY KEY (cod_adicional, nro_socio)
);

