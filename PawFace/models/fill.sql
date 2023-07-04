USE face;


-- ESPECIES
INSERT INTO especies VALUES(0, "perro");
INSERT INTO especies VALUES(0, "gato");
INSERT INTO especies VALUES(0, "Cuyo");
INSERT INTO especies VALUES(0, "Pez");
INSERT INTO especies VALUES(0, "Loro");

-- PAISES (MEXICO)
INSERT INTO paises VALUES(0,"Mexico");







-- USUARIOS (prueba)
INSERT INTO users VALUES("omarramhdz16@gmail.com","Omar", "Ramírez Hernández",1);
INSERT INTO users VALUES("dalia@gmail.com","Dalia", "Odette Garcia",1);

-- Mascotas (prueba)

INSERT INTO pets VALUES("dev1","omarramhdz16@gmail.com","Nagini",'2021-06-18',2,AES_ENCRYPT("nagini123","secreto"));
INSERT INTO pets VALUES("dev2", "omarramhdz16@gmail.com","Mitens",'2022-06-18',2,AES_ENCRYPT("mitens123","secreto"));
INSERT INTO pets VALUES("dev3","dalia@gmail.com","Spay",'2022-06-18',1,AES_ENCRYPT("spay123","secreto"));



-- Publicaciones (prueba)
INSERT INTO publications(id,mascota_id,fecha,content,img_url) VALUES(0,"dev2",CURRENT_TIMESTAMP,"Hace mucho calor", "false");

