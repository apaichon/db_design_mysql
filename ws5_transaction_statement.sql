CREATE TABLE ` tickets` (
  `ticket_id` int(11) NOT NULL AUTO_INCREMENT,
  `event_id` int(11) NOT NULL,
  `location_id` int(11) DEFAULT NULL,
  `seatNo` varchar(45) DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `booked_by` varchar(45) DEFAULT NULL,
  `status` varchar(45) DEFAULT NULL,
  `created_date` timestamp NULL DEFAULT NULL,
  `last_update` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`ticket_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_BookTicket`(p_ticket_id int, p_booked_by varchar(45), p_status varchar(20))
BEGIN

	# Declare Flag for Error
	DECLARE errorStatus BOOLEAN DEFAULT FALSE;
 
	START TRANSACTION;
    BEGIN
	DECLARE EXIT HANDLER FOR SQLEXCEPTION SET errorStatus = TRUE;
    UPDATE sakila.tickets
    SET booked_by = p_booked_by
		, `status` = p_status
		, last_update = now()
    Where ticket_id = p_ticket_id ;
    END;
    
    # Case error in HANDLER
	IF errorStatus = TRUE THEN
	ROLLBACK;
	ELSE
	COMMIT;
	END IF;
    select errorStatus;

END