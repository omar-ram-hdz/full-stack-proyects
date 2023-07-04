DELIMITER //
CREATE PROCEDURE sp_get_publications(
  IN mascota_id VARCHAR(25),
  IN num1 INT,
  IN num2 INT 
)
begin
    SELECT * FROM publications WHERE mascota_id = mascota_id LIMIT num1, num2;
END //
DELIMITER ;
