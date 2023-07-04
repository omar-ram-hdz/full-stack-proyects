DELIMITER //
CREATE PROCEDURE sp_set_publication(
  IN mascota_id VARCHAR(30),
  IN content VARCHAR(50),
  IN fecha DATETIME,
  IN img_url VARCHAR(250),
  OUT _gson VARCHAR(100)
)
BEGIN 
  DECLARE auxiliar INT DEFAULT 0;
  SELECT COUNT(*) INTO auxiliar FROM pets WHERE id=mascota_id;
  IF auxiliar = 0 THEN 
    SELECT "{stat:404, user: false}" INTO _gson;
  ELSE
    INSERT INTO publications VALUES(0,mascota_id,fecha,content,img_url);
    SELECT "{stat:200, user: true}" INTO _gson;
  END IF;
END //
DELIMITER ;