-- Usar la base de datos
USE universidad;
GO


-- Procedimiento almacenado para agregar una matrícula
IF OBJECT_ID('spAgregarMatricula') IS NOT NULL
    DROP PROC spAgregarMatricula;
GO

CREATE PROC spAgregarMatricula
    @periodo NVARCHAR(6),
    @promedio INT,
    @CourseID INT,
    @StudentID INT
AS
BEGIN
    -- Lógica de tu procedimiento aquí
    -- Por ejemplo, insertar los datos en la tabla de matrícula
    INSERT INTO matricula (periodo, promedio, CourseID, StudentID)
    VALUES (@periodo, @promedio, @CourseID, @StudentID);
END
GO

-- Procedimiento almacenado para eliminar una matrícula
IF OBJECT_ID('spEliminarMatricula') IS NOT NULL
    DROP PROC spEliminarMatricula;
GO

CREATE PROC spEliminarMatricula
    @EnrollmentID INT
AS
BEGIN
    -- Lógica de tu procedimiento aquí
    -- Por ejemplo, eliminar una matrícula basada en el EnrollmentID
    DELETE FROM matricula WHERE EnrollmentID = @EnrollmentID;
END
GO

-- Procedimiento almacenado para actualizar la información de una matrícula
IF OBJECT_ID('spActualizarMatricula') IS NOT NULL
    DROP PROC spActualizarMatricula;
GO

CREATE PROC spActualizarMatricula
    @EnrollmentID INT,
    @periodo NVARCHAR(6),
    @promedio INT,
    @CourseID INT,
    @StudentID INT
AS
BEGIN
    -- Lógica de tu procedimiento aquí
    -- Por ejemplo, actualizar los datos de una matrícula basada en el EnrollmentID
    UPDATE matricula 
    SET periodo = @periodo, promedio = @promedio, CourseID = @CourseID, StudentID = @StudentID 
    WHERE EnrollmentID = @EnrollmentID;
END
GO
