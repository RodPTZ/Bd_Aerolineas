USE 5to_AerolineasArgentinas;

CREATE PROCEDURE AsignarAHangar(
 IN p_matricula VARCHAR(10),
 IN p_ubicacion VARCHAR(100)
)
BEGIN
 DECLARE v_id_avion INT;
 DECLARE v_id_hangar INT;
 DECLARE ocupados INT;
 DECLARE capacidad INT;


 SELECT id_avion INTO v_id_avion FROM Matriculas WHERE codigo_matricula = p_matricula;
 SELECT id_hangar, capacidad INTO v_id_hangar, capacidad FROM Hangares WHERE ubicacion = p_ubicacion LIMIT 1;
 SELECT COUNT(*) INTO ocupados FROM AsignacionesHangar WHERE id_hangar = v_id_hangar;


 IF ocupados < capacidad THEN
   INSERT INTO AsignacionesHangar (id_hangar, id_avion, codigo_matricula)
   VALUES (v_id_hangar, v_id_avion, p_matricula);
 ELSE
   SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'No hay espacio';
 END IF;
END;
