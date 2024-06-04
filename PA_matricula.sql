-- Usar la base de datos
USE universidad;
GO


-- Procedimiento almacenado para agregar una matr�cula
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
    -- L�gica de tu procedimiento aqu�
    -- Por ejemplo, insertar los datos en la tabla de matr�cula
    INSERT INTO matricula (periodo, promedio, CourseID, StudentID)
    VALUES (@periodo, @promedio, @CourseID, @StudentID);
END
GO

-- Procedimiento almacenado para eliminar una matr�cula
IF OBJECT_ID('spEliminarMatricula') IS NOT NULL
    DROP PROC spEliminarMatricula;
GO

CREATE PROC spEliminarMatricula
    @EnrollmentID INT
AS
BEGIN
    -- L�gica de tu procedimiento aqu�
    -- Por ejemplo, eliminar una matr�cula basada en el EnrollmentID
    DELETE FROM matricula WHERE EnrollmentID = @EnrollmentID;
END
GO

-- Procedimiento almacenado para actualizar la informaci�n de una matr�cula
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
    -- L�gica de tu procedimiento aqu�
    -- Por ejemplo, actualizar los datos de una matr�cula basada en el EnrollmentID
    UPDATE matricula 
    SET periodo = @periodo, promedio = @promedio, CourseID = @CourseID, StudentID = @StudentID 
    WHERE EnrollmentID = @EnrollmentID;
END
GO
