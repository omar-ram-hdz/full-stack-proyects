DELIMITER //
CREATE PROCEDURE sp_sign_out(
  IN correo VARCHAR(60),
  IN nombre VARCHAR(40),
  IN contrasenia VARCHAR(80),
  OUT _json NVARCHAR(250)
)
BEGIN
  DECLARE pass BLOB;
  SELECT contrasenia INTO pass FROM alumnos WHERE correo = correo;

  IF CONVERT(AES_DECRYPT(pass, CONCAT(correo,nombre)) USING utf8mb4) = contrasenia THEN
    SET _json = JSON_OBJECT('status', JSON_OBJECT('has_correct', true));
  ELSE 
    SET _json = JSON_OBJECT('status', JSON_OBJECT('has_correct', false));
  END IF;

END //
DELIMITER ;