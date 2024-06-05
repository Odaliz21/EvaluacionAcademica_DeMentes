USE universidad
GO

-- Procedimiento almacenado para listar Asignaturas
IF OBJECT_ID('spListarAsignatura') IS NOT NULL
    DROP PROC spListarAsignatura
GO
CREATE PROC spListarAsignatura
AS
BEGIN
    SELECT * FROM Asignatura
END
GO

EXEC spListarAsignatura
GO

-- Procedimiento almacenado para agregar Asignatura
IF OBJECT_ID('spAgregarAsignatura') IS NOT NULL
    DROP PROC spAgregarAsignatura
GO
CREATE PROC spAgregarAsignatura
@cod_asignatura CHAR(4),
@nomb_asignatura VARCHAR(40),
@creditos INT
AS
BEGIN
    -- Verificar que el cod_asignatura no se duplique
    IF NOT EXISTS (SELECT cod_asignatura FROM Asignatura WHERE cod_asignatura = @cod_asignatura)
    BEGIN
        BEGIN TRAN tranAgregar
        BEGIN TRY
            INSERT INTO Asignatura (cod_asignatura, nomb_asignatura, creditos) 
            VALUES (@cod_asignatura, @nomb_asignatura, @creditos)
            COMMIT TRAN tranAgregar
            SELECT CodError = 0, Mensaje = 'Asignatura insertada correctamente'
        END TRY
        BEGIN CATCH
            ROLLBACK TRAN tranAgregar
            SELECT CodError = 1, Mensaje = 'Error: No se ejecutó la transacción'
        END CATCH
    END
    ELSE
        SELECT CodError = 1, Mensaje = 'Error: Código de Asignatura duplicado en la Asignatura'
END
GO

EXEC spAgregarAsignatura 'A011', 'Estadistica', 4
GO

-- Procedimiento almacenado para eliminar Asignatura
IF OBJECT_ID('spEliminarAsignatura') IS NOT NULL
    DROP PROC spEliminarAsignatura
GO
CREATE PROC spEliminarAsignatura
@cod_asignatura CHAR(4)
AS
BEGIN
    -- Verificar que el cod_asignatura existe en la tabla Asignatura
    IF EXISTS (SELECT cod_asignatura FROM Asignatura WHERE cod_asignatura = @cod_asignatura)
    BEGIN
        BEGIN TRAN tranEliminar
        BEGIN TRY
            DELETE FROM Asignatura WHERE cod_asignatura = @cod_asignatura
            COMMIT TRAN tranEliminar
            SELECT CodError = 0, Mensaje = 'Asignatura eliminada correctamente'
        END TRY
        BEGIN CATCH
            ROLLBACK TRAN tranEliminar
            SELECT CodError = 1, Mensaje = 'Error: No se ejecutó la transacción'
        END CATCH
    END
    ELSE
        SELECT CodError = 1, Mensaje = 'Error: Código de Asignatura no existe en la Asignatura'
END
GO

EXEC spEliminarAsignatura 'A011'
GO

-- Procedimiento almacenado para actualizar información de una asignatura
IF OBJECT_ID('spActualizarAsignatura') IS NOT NULL
    DROP PROC spActualizarAsignatura
GO
CREATE PROC spActualizarAsignatura
@cod_asignatura CHAR(4),
@nomb_asignatura VARCHAR(40),
@creditos INT
AS
BEGIN
    -- Verificar que el cod_asignatura existe en la tabla Asignatura
    IF EXISTS (SELECT cod_asignatura FROM Asignatura WHERE cod_asignatura = @cod_asignatura)
    BEGIN
        BEGIN TRAN tranActualizar
        BEGIN TRY
            UPDATE Asignatura
            SET nomb_asignatura = @nomb_asignatura,
                creditos = @creditos
            WHERE cod_asignatura = @cod_asignatura
            COMMIT TRAN tranActualizar
            SELECT CodError = 0, Mensaje = 'Asignatura actualizada correctamente'
        END TRY
        BEGIN CATCH
            ROLLBACK TRAN tranActualizar
            SELECT CodError = 1, Mensaje = 'Error: No se ejecutó la transacción'
        END CATCH
    END
    ELSE
        SELECT CodError = 1, Mensaje = 'Error: Código de Asignatura no existe en la Asignatura'
END
GO

EXEC spActualizarAsignatura 'A011', 'Matemáticas Avanzadas', 5
GO

-- Procedimiento almacenado para buscar una asignatura por código
IF OBJECT_ID('sp_BuscarAsignatura') IS NOT NULL
    DROP PROCEDURE sp_BuscarAsignatura
GO

CREATE PROCEDURE sp_BuscarAsignatura
    @nomb_asignatura VARCHAR(50)
AS
BEGIN
    SELECT cod_asignatura, nomb_asignatura, creditos 
    FROM asignatura
    WHERE nomb_asignatura LIKE '%' + @nomb_asignatura + '%'
END
GO

EXEC sp_BuscarAsignatura 'Matematicas'
GO
