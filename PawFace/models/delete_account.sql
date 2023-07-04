DELIMITER //
CREATE PROCEDURE sp_delete_count(
  IN correo_duenio VARCHAR(40),
  IN mascota_id VARCHAR(25),
  IN contrasenia_mascota VARCHAR(50),
  OUT _gson VARCHAR(100)
)
BEGIN 
  DECLARE mascotas INT DEFAULT 0;
  DECLARE auxiliar BLOB;
  SELECT contrasenia INTO auxiliar FROM pets WHERE id = mascota_id;
  IF AES_DECRYPT(auxiliar,CONCAT(correo_duenio,mascota_id)) = contrasenia_mascota THEN
    DELETE FROM pets WHERE id = mascota_id;
    SELECT COUNT(*) INTO mascotas FROM pets WHERE duenio_id = correo_duenio;
    IF mascotas = 0 THEN
      DELETE FROM users WHERE correo = correo_duenio;
      DELETE FROM publications WHERE mascota_id = mascota_id;
      SELECT "{stat: 200,code_delete:2}" INTO _gson;
    ELSE
      SELECT "{stat: 200, code_delete:1}" INTO _gson;
    END IF;
  ELSE 
    SELECT "{password: false}" INTO _gson;
  END IF;
END //
DELIMITER ;