CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_create_payment_data`(totalItems int)
BEGIN
	declare p_customer_id, p_staff_id, p_rental_id, counter int;
    declare amount decimal(5,2);
    declare payment_date timestamp;
    
    # Generate data!
    set counter = 0;
    WHILE counter < totalItems DO
    
	set p_customer_id = (SELECT customer_id FROM customer ORDER BY RAND() LIMIT 1) ;
    set p_staff_id = (SELECT staff_id FROM staff ORDER BY RAND() LIMIT 1) ;
    set p_rental_id = (SELECT rental_id from rental ORDER BY RAND() LIMIT 1);
    set amount = (SELECT FLOOR((RAND() * (999.99-9.00+1))+9.00));
    set payment_date = ( Select FROM_UNIXTIME(
        UNIX_TIMESTAMP('2017-01-01 14:53:27') + FLOOR(0 + (RAND() * 63072000)) )
        );
    insert into tmp_payment values (p_customer_id, p_staff_id, p_rental_id, payment_date, Now());
    set counter = counter + 1;
    END WHILE;
    
END