CREATE DEFINER=`root`@`localhost` FUNCTION `include_vat`(amount decimal(10,2)) RETURNS decimal(10,2)
    READS SQL DATA
    DETERMINISTIC
BEGIN
declare result decimal(10,2);
set result = (amount * 100) / 7;
RETURN result;

END