DELIMITER //
CREATE PROCEDURE sp_login(
  IN correo VARCHAR(60),
  IN nombre VARCHAR(40),
  IN apellidos VARCHAR(40),
  IN contrasenia VARCHAR(50),
  IN res VARCHAR(80),
  OUT _json NVARCHAR(250)
)
BEGIN
  DECLARE aux INT DEFAULT 0;
  DECLARE pass BLOB;
  SELECT COUNT(*) INTO aux FROM alumnos WHERE correo = correo;
  
  IF aux > 0 THEN
    SET _json = JSON_OBJECT('status', JSON_OBJECT('has_alumno', true, 'stage_consult', false));
  ELSE
    SELECT AES_ENCRYPT(contrasenia,CONCAT(correo,nombre)) INTO pass;
    INSERT INTO alumnos (correo, nombre, apellidos,response,contrasenia) VALUES (correo, nombre, apellidos, res, pass);
    SET _json = JSON_OBJECT('status', JSON_OBJECT('has_alumno', false, 'stage_consult', true));
  END IF;
END //
DELIMITER ;


call sp_login("omarramhdz16@gmail.com","Omar","Ramirez Hernandez","Omega","TLAXCALA", @res);
select @res as resultado;