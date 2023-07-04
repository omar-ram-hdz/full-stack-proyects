DELIMITER //
CREATE PROCEDURE sp_logout(
  IN correo_duenio VARCHAR(40),
  IN contrasenia_mascota VARCHAR(100),
  IN nombre_mascota VARCHAR(40),
  OUT _gson VARCHAR(100)
)
BEGIN 
  DECLARE auxiliar BLOB;
  DECLARE id_ VARCHAR(30);
  SELECT id INTO id_ FROM pets WHERE duenio_id = correo_duenio AND nombre= nombre_mascota ;
  SELECT contrasenia INTO auxiliar FROM pets WHERE id = id_;
  IF AES_DECRYPT(auxiliar,CONCAT(correo_duenio,id_)) = contrasenia_mascota THEN
    SELECT "{stat: 200}" INTO _gson;
  ELSE
    SELECT "{stat:404}" INTO _gson;
  END IF;
END //
DELIMITER ;