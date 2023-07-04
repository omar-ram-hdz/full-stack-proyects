DELIMITER //
CREATE PROCEDURE sp_login(
  IN nombre_mascota VARCHAR(40),
  IN id_especie INT,
  IN fecha_nacimiento DATE,
  IN correo_duenio VARCHAR(40),
  IN nombre_duenio VARCHAR(40),
  IN apellidos_duenio VARCHAR(60),
  IN pais_duenio INT UNSIGNED,
  IN contrasenia VARCHAR(20),
  OUT _gson VARCHAR(100)
)
BEGIN 
  DECLARE auxiliar INT DEFAULT 0;
  DECLARE stat INT DEFAULT 0;
  DECLARE user_bol INT DEFAULT 0;
  DECLARE especie VARCHAR(40);
  DECLARE id_pet VARCHAR(50);



  SELECT COUNT(*) INTO auxiliar FROM users WHERE correo = correo_duenio;
  IF auxiliar > 0 THEN 
    SELECT nombre INTO especie FROM especies WHERE id = id_especie;
    SELECT CONCAT(LOWER(CONCAT(LEFT(nombre_mascota, 5),YEAR(fecha_nacimiento),RIGHT(correo_duenio,3),MONTH(fecha_nacimiento),LEFT(especie,4),DAY(fecha_nacimiento)))) INTO id_pet; 
    INSERT INTO pets(id,duenio_id,nombre,fecha_nacimiento,especie_id,contrasenia) VALUES(id_pet,correo_duenio,nombre_mascota,fecha_nacimiento,id_especie,AES_ENCRYPT(contrasenia,CONCAT(correo_duenio,id_pet)));
    SELECT COUNT(*) INTO stat FROM pets WHERE id = id_pet;
    IF stat = 0 THEN
      SELECT "{stat: 404, code_insert:0}" INTO _gson;
    ELSE 
      SELECT "{stat:200, code_insert:1}" INTO _gson;
    END IF;
  ELSE
    INSERT INTO users(correo,nombre,apellidos,pais_id) VALUES(correo_duenio,nombre_duenio,apellidos_duenio,pais_duenio);
    SELECT nombre INTO especie FROM especies WHERE id = id_especie;
    SELECT CONCAT(LOWER(CONCAT(LEFT(nombre_mascota, 5),YEAR(fecha_nacimiento),RIGHT(correo_duenio,3),MONTH(fecha_nacimiento),LEFT(especie,4),DAY(fecha_nacimiento)))) INTO id_pet;
    INSERT INTO pets(id,duenio_id,nombre,fecha_nacimiento,especie_id,contrasenia) VALUES(id_pet,correo_duenio,nombre_mascota,fecha_nacimiento,id_especie,AES_ENCRYPT(contrasenia,CONCAT(correo_duenio,id_pet)));
    SELECT COUNT(*) INTO stat FROM pets WHERE id = id_pet;
    SELECT COUNT(*) INTO user_bol FROM users WHERE correo = correo_duenio;
    IF stat = 0 THEN 
      SELECT "{stat: 404, code_insert:0}" INTO _gson;
    ELSE 
      SELECT "{stat: 200, code_insert:2}" INTO _gson;
    END IF;
  END IF;
END //
DELIMITER ;
