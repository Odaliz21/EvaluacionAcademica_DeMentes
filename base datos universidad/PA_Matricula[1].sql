-- Usar la base de datos
USE universidad;
GO

IF OBJECT_ID('spListarMatricula') IS NOT NULL
    DROP PROC spListarMatricula;
GO

CREATE PROC spListarMatricula
AS
BEGIN
    SELECT * FROM matricula;
END;
GO

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
    -- Verificar si ya existe una matrícula con el mismo periodo, CourseID y StudentID
    IF NOT EXISTS (SELECT * FROM matricula WHERE periodo = @periodo AND CourseID = @CourseID AND StudentID = @StudentID)
    BEGIN
        BEGIN TRY
            INSERT INTO matricula (periodo, promedio, CourseID, StudentID)
            VALUES (@periodo, @promedio, @CourseID, @StudentID);
            SELECT CodError = 0, Mensaje = 'Matrícula insertada correctamente';
        END TRY
        BEGIN CATCH
            SELECT CodError = 1, Mensaje = 'Error: No se pudo agregar la matrícula';
        END CATCH
    END
    ELSE
        SELECT CodError = 1, Mensaje = 'Error: Ya existe una matrícula con el mismo periodo, CourseID y StudentID';
END;
GO
-- Ejecutar el procedimiento almacenado spAgregarMatricula



IF OBJECT_ID('spEliminarMatricula') IS NOT NULL
    DROP PROC spEliminarMatricula;
GO


CREATE PROC spEliminarMatricula
@EnrollmentID INT
AS
BEGIN
    -- Verificar que el EnrollmentID existe en la tabla Matricula
    IF EXISTS (SELECT EnrollmentID FROM matricula WHERE EnrollmentID = @EnrollmentID)
    BEGIN
        BEGIN TRAN tranEliminar
        BEGIN TRY
            DELETE FROM matricula WHERE EnrollmentID = @EnrollmentID
            COMMIT TRAN tranEliminar
            SELECT CodError = 0, Mensaje = 'Matrícula eliminada correctamente'
        END TRY
        BEGIN CATCH
            ROLLBACK TRAN tranEliminar
            SELECT CodError = 1, Mensaje = 'Error: No se ejecutó la transacción'
        END CATCH
    END
    ELSE
        SELECT CodError = 1, Mensaje = 'Error: EnrollmentID no existe en la Matrícula'
END
GO


IF OBJECT_ID('spActualizarMatricula') IS NOT NULL
    DROP PROC spActualizarMatricula;
GO



CREATE PROCEDURE spActualizarMatricula
@EnrollmentID INT,
@periodo NVARCHAR(6),
@promedio INT,
@CourseID INT,
@StudentID INT
AS
BEGIN
    -- Verificar si la matrícula existe en la tabla Matricula
    IF EXISTS (SELECT * FROM matricula WHERE EnrollmentID = @EnrollmentID)
    BEGIN
        BEGIN TRY
            UPDATE Matricula 
            SET periodo = @periodo, 
                promedio = @promedio, 
                CourseID = @CourseID, 
                StudentID = @StudentID 
            WHERE EnrollmentID = @EnrollmentID;
            SELECT CodError = 0, Mensaje = 'Matrícula actualizada correctamente';
        END TRY
        BEGIN CATCH
            SELECT CodError = 1, Mensaje = 'Error: No se pudo actualizar la matrícula';
        END CATCH
    END
    ELSE
        SELECT CodError = 1, Mensaje = 'Error: La matrícula no existe en la tabla Matricula';
END;
GO



IF OBJECT_ID('sp_BuscarMatriculaPorParametros') IS NOT NULL
    DROP PROCEDURE sp_BuscarMatriculaPorParametros;
GO

CREATE PROCEDURE sp_BuscarMatriculaPorParametros
    @EnrollmentID INT,
    @CourseID INT,
    @StudentID INT
AS
BEGIN
    SELECT * 
    FROM matricula
    WHERE EnrollmentID = @EnrollmentID
      AND CourseID = @CourseID
      AND StudentID = @StudentID;
END;
GO


