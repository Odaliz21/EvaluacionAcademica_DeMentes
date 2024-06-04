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

-- Procedure to get enrolled courses for a student
IF OBJECT_ID('spCursosMatriculadosEstudiante') IS NOT NULL
    DROP PROC spCursosMatriculadosEstudiante;
GO

CREATE PROC spCursosMatriculadosEstudiante
@cod_est NVARCHAR(4)
AS
BEGIN
    SELECT a.cod_asignatura, a.nomb_asignatura, m.periodo, m.promedio
    FROM matricula m
    JOIN asignatura a ON m.CourseID = a.CourseID
    JOIN estudiante e ON m.StudentID = e.StudentID
    WHERE e.cod_est = @cod_est;
END;
GO

-- Procedure to get student grades by period
IF OBJECT_ID('spNotasPorPeriodoEstudiante') IS NOT NULL
    DROP PROC spNotasPorPeriodoEstudiante;
GO

CREATE PROC spNotasPorPeriodoEstudiante
@cod_est NVARCHAR(4),
@periodo NVARCHAR(6)
AS
BEGIN
    SELECT a.cod_asignatura, a.nomb_asignatura, m.promedio
    FROM matricula m
    JOIN asignatura a ON m.CourseID = a.CourseID
    JOIN estudiante e ON m.StudentID = e.StudentID
    WHERE e.cod_est = @cod_est AND m.periodo = @periodo;
END;
GO

-- Procedure to get student academic history
IF OBJECT_ID('spHistorialNotasEstudiante') IS NOT NULL
    DROP PROC spHistorialNotasEstudiante;
GO

CREATE PROC spHistorialNotasEstudiante
@cod_est NVARCHAR(4)
AS
BEGIN
    SELECT a.cod_asignatura, a.nomb_asignatura, m.periodo, m.promedio
    FROM matricula m
    JOIN asignatura a ON m.CourseID = a.CourseID
    JOIN estudiante e ON m.StudentID = e.StudentID
    WHERE e.cod_est = @cod_est
    ORDER BY m.periodo;
END;
GO

-- Procedure to get student periods
IF OBJECT_ID('spObtenerPeriodosEstudiante') IS NOT NULL
    DROP PROC spObtenerPeriodosEstudiante;
GO

CREATE PROC spObtenerPeriodosEstudiante
@cod_est NVARCHAR(4)
AS
BEGIN
    SELECT DISTINCT m.periodo
    FROM matricula m
    JOIN estudiante e ON m.StudentID = e.StudentID
    WHERE e.cod_est = @cod_est
    ORDER BY m.periodo;
END;
GO

-- Procedure to get student by code
IF OBJECT_ID('spObtenerEstudiantePorCodigo') IS NOT NULL
    DROP PROC spObtenerEstudiantePorCodigo;
GO

CREATE PROC spObtenerEstudiantePorCodigo
@cod_est NVARCHAR(4)
AS
BEGIN
    SELECT StudentID, cod_est, nomb_est
    FROM estudiante
    WHERE cod_est = @cod_est;
END;
GO
