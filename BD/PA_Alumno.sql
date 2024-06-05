-- Procedure to list all students
IF OBJECT_ID('spListarEstudiante') IS NOT NULL
    DROP PROC spListarEstudiante;
GO

CREATE PROC spListarEstudiante
AS
BEGIN
    SELECT * FROM estudiante;
END;
GO

-- Procedure to add a student
IF OBJECT_ID('spAgregarEstudiante') IS NOT NULL
    DROP PROC spAgregarEstudiante;
GO

CREATE PROC spAgregarEstudiante
@cod_est NVARCHAR(4),
@nomb_est NVARCHAR(40)
AS
BEGIN
    IF NOT EXISTS (SELECT 1 FROM estudiante WHERE cod_est = @cod_est)
    BEGIN
        INSERT INTO estudiante (cod_est, nomb_est)
        VALUES (@cod_est, @nomb_est);

        SELECT CodError = 0, Mensaje = 'Estudiante insertado correctamente';
    END
    ELSE
    BEGIN
        SELECT CodError = 1, Mensaje = 'Error: Código de estudiante duplicado';
    END
END;
GO

-- Procedure to delete a student
IF OBJECT_ID('spEliminarEstudiante') IS NOT NULL
    DROP PROC spEliminarEstudiante;
GO

CREATE PROC spEliminarEstudiante
@cod_est NVARCHAR(4)
AS
BEGIN
    IF EXISTS (SELECT 1 FROM estudiante WHERE cod_est = @cod_est)
    BEGIN
        DELETE FROM estudiante WHERE cod_est = @cod_est;
        SELECT CodError = 0, Mensaje = 'Estudiante eliminado correctamente';
    END
    ELSE
    BEGIN
        SELECT CodError = 1, Mensaje = 'Error: Código de estudiante no existe';
    END
END;
GO

-- Procedure to update student information
IF OBJECT_ID('spActualizarEstudiante') IS NOT NULL
    DROP PROC spActualizarEstudiante;
GO

CREATE PROC spActualizarEstudiante
@cod_est NVARCHAR(4),
@nomb_est NVARCHAR(40)
AS
BEGIN
    IF EXISTS (SELECT 1 FROM estudiante WHERE cod_est = @cod_est)
    BEGIN
        UPDATE estudiante
        SET nomb_est = @nomb_est
        WHERE cod_est = @cod_est;

        SELECT CodError = 0, Mensaje = 'Estudiante actualizado correctamente';
    END
    ELSE
    BEGIN
        SELECT CodError = 1, Mensaje = 'Error: Código de estudiante no existe';
    END
END;
GO

-- Procedure to search students by last name
IF OBJECT_ID('spBuscarEstudiantePorNombre') IS NOT NULL
    DROP PROC spBuscarEstudiantePorNombre;
GO

CREATE PROC spBuscarEstudiantePorNombre
@nomb_est NVARCHAR(40)
AS
BEGIN
    SELECT * FROM estudiante WHERE nomb_est LIKE '%' + @nomb_est + '%';
END;
GO


