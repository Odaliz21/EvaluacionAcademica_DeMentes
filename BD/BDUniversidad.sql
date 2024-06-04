create database universidad;

use universidad;

CREATE TABLE [dbo].[estudiante] (
    [StudentID]      INT           IDENTITY (1, 1) NOT NULL,
    [cod_est]       NVARCHAR (4) NOT NULL,
    [nomb_est]      NVARCHAR (40) NULL,
    PRIMARY KEY CLUSTERED ([StudentID] ASC)
);

CREATE TABLE [dbo].[asignatura] (
    [CourseID] INT           IDENTITY (1, 1) NOT NULL,
    [cod_asignatura] NVARCHAR (4) NOT NULL,
    [nomb_asignatura]    NVARCHAR (40) NULL,
    [creditos]  INT           NULL,
    PRIMARY KEY CLUSTERED ([CourseID] ASC)
);

CREATE TABLE [dbo].[matricula] (
    [EnrollmentID] INT IDENTITY (1, 1) NOT NULL,
    [periodo]       NVARCHAR (6) NULL,
    [promedio] 	   INT   NULL,
    [CourseID]     INT NOT NULL,
    [StudentID]    INT NOT NULL,
    PRIMARY KEY CLUSTERED ([EnrollmentID] ASC),
    CONSTRAINT [FK_dbo.Enrollment_dbo.Asignatura_CourseID] FOREIGN KEY ([CourseID]) 
        REFERENCES [dbo].[Asignatura] ([CourseID]) ON DELETE CASCADE,
    CONSTRAINT [FK_dbo.matricula_dbo.estudiante_StudentID] FOREIGN KEY ([StudentID]) 
        REFERENCES [dbo].[estudiante] ([StudentID]) ON DELETE CASCADE
);

-- Inserción de datos en la tabla estudiante
INSERT INTO estudiante (cod_est, nomb_est) VALUES 
    ('E001', 'Juan Perez'),
    ('E002', 'Maria Lopez'),
    ('E003', 'Carlos Martinez'),
    ('E004', 'Ana Garcia'),
    ('E005', 'Luis Rodriguez'),
    ('E006', 'Laura Fernandez'),
    ('E007', 'Pedro Sanchez'),
    ('E008', 'Sofia Ramirez'),
    ('E009', 'Diego Gonzalez'),
    ('E010', 'Lucia Diaz');

go

-- Inserción de datos en la tabla asignatura
INSERT INTO asignatura (cod_asignatura, nomb_asignatura, creditos) VALUES 
    ('A001', 'Matemáticas', 4),
    ('A002', 'Historia', 3),
    ('A003', 'Programación', 5),
    ('A004', 'Literatura', 3),
    ('A005', 'Física', 4),
    ('A006', 'Química', 4),
    ('A007', 'Biología', 4),
    ('A008', 'Inglés', 3),
    ('A009', 'Economía', 3),
    ('A010', 'Arte', 2);

go


-- Inserción de datos en la tabla matricula
INSERT INTO matricula (periodo, promedio, CourseID, StudentID) VALUES 
    ('2023A', 85, 1, 1),
    ('2023A', 78, 2, 1),
    ('2023A', 90, 1, 2),
    ('2023A', 82, 3, 2),
    ('2023A', 88, 1, 3),
    ('2023A', 75, 2, 3),
    ('2023A', 90, 1, 4),
    ('2023A', 85, 2, 4),
    ('2023A', 92, 3, 5),
    ('2023A', 79, 1, 5),
    ('2023A', 88, 2, 6),
    ('2023A', 91, 3, 6),
    ('2023A', 84, 1, 7),
    ('2023A', 87, 2, 7),
    ('2023A', 79, 3, 8),
    ('2023A', 93, 1, 8),
    ('2023A', 85, 2, 9),
    ('2023A', 90, 3, 9),
    ('2023A', 91, 1, 10),
    ('2023A', 80, 2, 10);

go

