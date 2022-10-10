-- Выводит содержание заказа для каждого конкретного заказавшего:

DROP PROCEDURE IF EXISTS order_for_person;
DELIMITER //
CREATE PROCEDURE order_for_person(in ordering_person INT)
	BEGIN
		SELECT order_id, total, `name`, total_price 
        FROM order_collecting oc
		WHERE oc.ordering_person_id = ordering_person;
	END//
    
DELIMITER ;

-- Выводит полную информацию о каждом блюде

DROP PROCEDURE IF EXISTS dish_info;
DELIMITER //
CREATE PROCEDURE dish_info(IN menu_section INT, dish INT)
	BEGIN
		SELECT `name`, `weight\volume`, price, energy_value
        FROM all_menu am
		WHERE am.menu_sections_id = menu_section AND am.id = dish;
	END//
    
DELIMITER ;

-- Выводит информацию о заказе по номеру телефона:

DROP PROCEDURE IF EXISTS order_by_phone;
DELIMITER //
CREATE PROCEDURE order_by_phone(in phone CHAR(50))
	BEGIN
		SELECT first_name, last_name, address, `name`, created_at
        FROM orders_full
		WHERE orders_full.phone_number = phone;
	END//
    
DELIMITER ;

-- В случае, если поле с ценой не заполняется, выдается сообщение об ошибке:

DROP TRIGGER IF EXISTS check_price_before_insert;

DELIMITER //

CREATE TRIGGER check_price_before_insert BEFORE INSERT ON breakfasts
FOR EACH ROW
BEGIN
    IF NEW.price IS NULL THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'NULL в полях name и description. Отмена операции.';
    END IF;
END//

DELIMITER ;

-- В случае, если поле с ценой не заполняется, цена вставляется автоматически:

DROP TRIGGER IF EXISTS check_price_before_insert;

DELIMITER //

CREATE TRIGGER check_price_before_insert BEFORE INSERT ON breakfasts
FOR EACH ROW
BEGIN
    IF NEW.price IS NULL THEN
		SET NEW.price = 100;
    END IF;
END//

DELIMITER ;


