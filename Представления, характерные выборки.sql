-- Создание единой таблицы с меню

DROP VIEW IF EXISTS all_menu;
CREATE VIEW all_menu as
SELECT * FROM breakfasts
UNION
SELECT * FROM main_dishes
UNION
SELECT * FROM desserts
UNION
SELECT * FROM coffee
UNION
SELECT * FROM additionally
UNION
SELECT * FROM tea_collection 
UNION
SELECT * FROM cold_drinks 
UNION
SELECT * FROM alcohol_drinks;

-- Вывод в таблице с заказами наименования раздела меню и цены

SELECT order_id, `name`,
(SELECT section FROM menu_sections WHERE id = menu_section) AS menu_section,
(SELECT price FROM all_menu WHERE menu_sections_id = menu_section AND id = dish_id) AS price
FROM orders;

-- Вывод наименований заказов по адресам
SELECT 
(SELECT address FROM ordering_persons WHERE id = ordering_person_id) AS address, 
`name` FROM orders;

-- Вся информация о заказах из таблиц orders и ordering_persons
DROP VIEW IF EXISTS orders_full;
CREATE VIEW orders_full as
SELECT
  op.first_name,
  op.last_name,
  op.address,
  op.phone_number,
  o.name,
  o.created_at
FROM
  ordering_persons AS op
JOIN
  orders AS o
WHERE
  op.id = o.ordering_person_id;

-- Номер заказа, id заказчика, цена - представление для подсчета общей стоимости каждого заказа

DROP VIEW IF EXISTS orders_and_price;
CREATE VIEW orders_and_price as
SELECT ordering_person_id, order_id, 
(SELECT price FROM all_menu WHERE menu_sections_id = menu_section AND id = dish_id) AS price,
`name`
FROM orders;

-- Представление для сбора заказов. Для каждого заказавшего приведены полное описание заказа, 
-- количество позиций в заказе и итоговая сумма

DROP VIEW IF EXISTS order_collecting;
CREATE VIEW order_collecting as
SELECT ordering_person_id,
GROUP_CONCAT(order_id SEPARATOR ' | ') as order_id,
COUNT(*) AS total, -- количество позиций в заказе
GROUP_CONCAT(`name` SEPARATOR ' | ') as `name`, -- наименование всех заказанных блюд
SUM(price) as total_price -- итоговая сумма заказа
FROM orders_and_price
GROUP BY ordering_person_id;