DROP DATABASE IF EXISTS shokoladnitsa;
CREATE DATABASE shokoladnitsa;
USE shokoladnitsa;

DROP TABLE IF EXISTS menu_sections;
CREATE TABLE menu_sections (
	id SERIAL primary key,
    section VARCHAR(50) NOT NULL,
    subsection VARCHAR(50) NULL,
    INDEX section_idx(section, subsection)
    );
INSERT INTO menu_sections (section, subsection) VALUES 
('Завтраки',NULL),
('Основные блюда','Салаты'),
('Основные блюда', 'Супы'),
('Основные блюда', 'Блинчики'),
('Основные блюда', 'Сэндвичи'),
('Основные блюда', 'Роллы'),
('Основные блюда', 'Бургеры'),
('Основные блюда', 'Мясо'),
('Основные блюда', 'Рыба'),
('Основные блюда', 'Птица'),
('Основные блюда', 'Паста'),
('Основные блюда', 'Пицца'),
('Десерты',NULL),
('Кофе',NULL),
('Дополнительно',NULL),
('Чайная коллекция',NULL),
('Холодные напитки', NULL),
('Алкогольные напитки',NULL);

DROP TABLE IF EXISTS breakfasts;
CREATE TABLE breakfasts (
	id SERIAL primary key,
	`name` VARCHAR(150) COLLATE utf8_unicode_ci NOT NULL,
    `weight\volume` VARCHAR(50) COLLATE utf8_unicode_ci NOT NULL,
    price INT NOT NULL,
	energy_value INT NULL,
    menu_sections_id bigint(20) unsigned DEFAULT NULL,
    CONSTRAINT `breakfasts_ibfk` FOREIGN KEY (`menu_sections_id`) REFERENCES `menu_sections` (`id`)
    );
    
INSERT INTO breakfasts (`name`, `weight\volume`, price, energy_value, menu_sections_id) VALUES
('Свежевыжатый апельсиновый сок','200 мл','150','76','1'),
('Свежевыжатый грейпфрутовый сок','200 мл','150','61','1'),
('Свежевыжатый морковный сок','200 мл','150','69','1'),
('Свежевыжатый яблочный сок','200 мл','150','89','1'),
('Каша овсяная','250 гр','130','328','1'),
('Каша рисовая','250 гр','130','533','1'),
('Каша пшенная с ягодами','215 гр','160','256','1'),
('Круассан с беконом бенедикт,','140 гр','250','467','1'),
('Круассан с лососем бенедикт','1,40 гр','290','400','1'),
('Круассан "Скандинавия" с крем-сыром и семгой','150 гр','290','384','1'),
('Круассан с беконом и голландским соусом','130 гр','290','494','1'),
('Круассан с лососем и голландским соусом','130 гр','290','427','1'),
('Глазунья (2-х яиц)','95 гр','110','233','1'),
('Глазунья (3-х яиц)','140 гр','150','305','1'),
('Омлет с сыром, томатами и беконом','280 гр','190','718','1'),
('Шакшука по-мароккански','180/40 гр','190','339','1'),
('Белковый омлет по-бейрутски с греческим йогуртом и авокадо','280 гр','270','251','1'),
('Сырники с малиновым вареньем','200 гр','230','481','1'),
('Запеканка творожная с изюмом','125 гр','230','372','1'),
('Куриная колбаска с хашбрауном и яйцом пашот','310 гр','330','589','1'),
('Битый авокадо с лаймовым дрессингом на срезе домашнего хлеба','100 гр','290','197','1');
 
DROP TABLE IF EXISTS main_dishes;
CREATE TABLE main_dishes (
	id SERIAL primary key,
	`name` VARCHAR(150) COLLATE utf8_unicode_ci NOT NULL,
    `weight\volume` VARCHAR(50) COLLATE utf8_unicode_ci NOT NULL,
    price INT NOT NULL,
	energy_value INT NULL,
    menu_sections_id bigint(20) unsigned DEFAULT NULL,
    CONSTRAINT `main_dishes_ibfk` FOREIGN KEY (`menu_sections_id`) REFERENCES `menu_sections` (`id`)
    );
    
INSERT INTO main_dishes (`name`, `weight\volume`, price, energy_value, menu_sections_id) VALUES
('Фитнес-салат','110 гр','330','87','2'),
('Салат Греческий','240 гр','330','324','2'),
('Салат Цезарь с курицей','220 гр','370','537','2'),
('Салат Цезарь с креветками','240 гр','390','576','2'),
('Вегетарианский поке боул','260 гр','370','420','2'),
('Поке Боул с креветками','300 гр','430','607','2'),
('Китайский салат с курицей терияки','210 гр','370','336','2'),
('Салат с говядиной брезаола','110 гр','390','126','2'),
('Салат Ницца с копченым лососем','180 гр','430','369','2'),
('Оливье с курицей','200 гр','290','403','2'),
('Хумус с жареной тортильей','175 гр','190','748','2'),
('Суп тыквенный','250/40 гр','230','293','3'),
('Блинчики с вишневым вареньем','200 гр','49','439','4'),
('Блинчики с малиновым вареньем','200 гр','49','439','4'),
('Блинчики с клубничным вареньем','200 гр','49','433','4'),
('Блинчики с черничным вареньем','200 гр','49','435','4'),
('Блинчики с медом','200 гр','49','462','4'),
('Блинчики со сметаной','200 гр','49','401','4'),
('Блинчики с творогом','240 гр','210','467','4'),
('Блинчики Легендарные с шоколадом','185 гр','230','612','4'),
('Блинчики с маком','200 гр','230','580','4'),
('Блинчики с сулугуни и шпинатом','210 гр','250','480','4'),
('Блинчики с мясом','210 гр','250','454','4'),
('Блинчики с семгой','150 гр','250','300','4'),
('Блинчики с сыром и ветчиной','170 гр','210','480','4'),
('Блинчики с икрой','140 гр','390','355','4'),
('Бейгл с семгой','190 гр','290','554','5'),
('Большой сэндвич с яйцом и беконом "Торонто"','280 гр','290','632','5'),
('Пита с курицей терияки','220 гр','290','482','5'),
('Клаб-сэндвич','340 гр','330','997','5'),
('Гирос с курицей','260/20 гр','270','539','5'),
('Ролл фалафель Каир','190 гр','270','475','6'),
('Ролл Цезарь','190 гр','250','555','6'),
('Ролл Филадельфия','160 гр','270','346','6'),
('Ролл с ветчиной и яйцом','220 гр','270','618','6'),
('Баварский бургер с сочной говяжьей котлетой и беконом','310 гр','390','827','7'),
('Бургер с куриным шницелем на булке брезел','300 гр','390','698','7'),
('Бифштекс из говядины с овощами гриль','250 гр','390','715','8'),
('Бифштекс из говядины с рисом','240 гр','390','733','8'),
('Бифштекс из говядины с картофельным пюре','250 гр','390','764','8'),
('Бифштекс из говядины с гречкой','240 гр','390','1021','8'),
('Говядина по-португальски','230 гр','390','445','8'),
('Розовый лосось с овощами гриль','220/30 гр','570','317','9'),
('Куриные котлеты с овощами гриль','230 гр','290','476','10'),
('Куриные котлеты с рисом','230 гр','290','501','10'),
('Куриные котлеты с картофельным пюре','230 гр','290','508','10'),
('Куриные котлеты с гречкой','230 гр','290','769','10'),
('Куриная грудка с овощами гриль','200 гр','290','412','10'),
('Куриная грудка с рисом','220 гр','290','431','10'),
('Куриная грудка с картофельным пюре','200 гр','290','462','10'),
('Куриная грудка с гречкой','220 гр','290','698','10'),
('Куриный шницель с вялеными помидорами черри и соусом пармезан с овощами-гриль','250/30 гр','370','391','10'),
('Куриный шницель с вялеными помидорами черри и соусом пармезан с рисом','260/30 гр','370','409','10'),
('Куриный шницель с вялеными помидорами черри и соусом пармезан с картофельным пюре','250/30 гр','370','416','10'),
('Куриный шницель с вялеными помидорами черри и соусом пармезан с гречкой','260/30 гр','370','655','10'),
('Биточки с томленой уткой','200 гр','310','577','10'),
('Паста альфредо с курицей','220 гр','330','552','11'),
('Паста карбонара','200 гр','330','660','11'),
('Паста Mac&Cheese','230 гр','340','664','11'),
('Тальятелле с копченым лососем','260 гр','440','497','11'),
('Мясная лазанья','290 гр','330','525','11'),
('Фрегола с грибами','200 гр','330','470','11'),
('Пельмени с мраморной говядиной и зеленью','180 гр','330','538','11'),
('Вреники ручной лепки с картофелем, грибами и зеленью','180 гр','330','634','11'),
('Пицца Маргарита','390 гр','385','775','12'),
('Пицца 4 сыра','300 гр','490','742','12'),
('Пицца с пепперони','410 гр','490','902','12');

DROP TABLE IF EXISTS desserts;
CREATE TABLE desserts (
	id SERIAL primary key,
	`name` VARCHAR(150) COLLATE utf8_unicode_ci NOT NULL,
    `weight\volume` VARCHAR(50) COLLATE utf8_unicode_ci NOT NULL,
    price INT NOT NULL,
	energy_value INT NULL,
    menu_sections_id bigint(20) unsigned DEFAULT NULL,
    CONSTRAINT `desserts_ibfk` FOREIGN KEY (`menu_sections_id`) REFERENCES `menu_sections` (`id`)
    );

INSERT INTO desserts (`name`, `weight\volume`, price, energy_value, menu_sections_id) VALUES
('Торт Малиновый бархат','90 гр','270','373','13'),
('Пирожное Японская фисташка','100 гр','290','440','13'),
('Чизкейк Два шоколада','130 гр','290','494','13'),
('Наполеон с клубникой','150 гр','270','652','13'),
('Торт Опера','100 гр','290','573','13'),
('Торт Медовик','115 гр','270','537','13'),
('Торт Москва','90 гр','270','594','13'),
('Пирожное Баунти','135 гр','290','644','13'),
('Тарталетка Пекан','95/50 гр','290','682','13'),
('Чизкейк с ягодами','160 гр','290','448','13'),
('Венский штрудель','110/50/25 гр','270','525','13'),
('Десерт с семенами Чиа','150 гр','270','221','13'),
('Тирамису','100 гр','270','287','13'),
('Эклер лаванда','70 гр','150','376','13'),
('Эклер фисташка','70 гр','150','362','13'),
('Маффин апельсиновый','120 гр','130','496','13'),
('Маффин зерновой','120 гр','130','588','13'),
('Мороженое ванильное','50 гр','130','100','13'),
('Мороженое клубничное','50 гр','130','100','13'),
('Мороженое пломбир','50 гр','130','115','13'),
('Мороженое шоколадное','50 гр','130','115','13'),
('Чизкейк Два шоколада','1300 гр (130 грх10 кусков)','2030','4940','13'),
('Наполеон с клубникой','1200 гр (150 х 8 кусков)','1790','5216','13'),
('Торт Опера','1000 гр (100 гр х 10 кусков)','2030','5730','13'),
('Торт Медовик','1035 гр (115 х 9 кусков)','1790','4833','13'),
('Торт Москва','900 гр (90 х 10 кусков)','2030','5940','13'),
('Домашний пирог с лесными ягодами','1000 гр','950','2440','13'),
('Домашний пирог с яблоками и корицей','1000 гр','950','2540','13'),
('Домашний пирог с капустой и яйцом','1000 гр','950','2600','13');

DROP TABLE IF EXISTS coffee;
CREATE TABLE coffee (
	id SERIAL primary key,
	`name` VARCHAR(150) COLLATE utf8_unicode_ci NOT NULL,
    `weight\volume` VARCHAR(50) COLLATE utf8_unicode_ci NOT NULL,
    price INT NOT NULL,
	energy_value INT NULL,
    menu_sections_id bigint(20) unsigned DEFAULT NULL,
    CONSTRAINT `coffee_ibfk` FOREIGN KEY (`menu_sections_id`) REFERENCES `menu_sections` (`id`)
    );
 
INSERT INTO coffee (`name`, `weight\volume`, price, energy_value, menu_sections_id) VALUES
('Эспрессо классик','30 мл','90','32','14'),
('Эспрессо двойной','60 мл','170','57','14'),
('Американо станд','150 мл','190','57','14'),
('Американо мега','300 мл','230','57','14'),
('Капучино станд','200 мл','230','100','14'),
('Капучино Мега','360 мл','290','137','14'),
('Латте','270 мл','270','126','14'),
('Латте мега','390 мл','290','168','14'),
('Латте Фисташковый','270 мл','270','278','14'),
('Латте Фисташковый Мега','390 мл','290','374','14'),
('Латте Крем-брюле с маршмеллоу','270 мл','270','250','14'),
('Латте Крем-брюле с маршмеллоу Мега','390 мл','290','324','14'),
('Латте Лаванда-роза','270 мл','270','231','14'),
('Латте Лаванда-роза Мега','390 мл','290','324','14'),
('Латте Халва','270 мл','270','362','14'),
('Латте Халва Мега','390 мл','290','492','14'),
('Латте Миндальный','270 мл','270','175','14'),
('Латте Миндальный Мега','390 мл','290','231','14'),
('Раф кофе','290 мл','290','261','14'),
('Раф Инжир-орхидея','290 мл','290','295','14'),
('Раф Кокосовый десерт','290 мл','290','318','14'),
('Раф Масала','290 мл','290','256','14'),
('Флэт Уайт','200 мл','270','125','14'),
('Аффогато','130 мл','190','199','14'),
('Фильтр-кофе','300 мл','170','51','14'),
('Пуровер','350 мл','190','50','14'),
('Миндальная матча','270 мл','270','106','14'),
('Миндальная матча Мега','390 мл','290','143','14'),
('Черный чай латте','390 мл','340','178','14');

DROP TABLE IF EXISTS additionally;
CREATE TABLE additionally (
	id SERIAL primary key,
	`name` VARCHAR(150) COLLATE utf8_unicode_ci NOT NULL,
    `weight\volume` VARCHAR(50) COLLATE utf8_unicode_ci NOT NULL,
    price INT NOT NULL,
	energy_value INT NULL,
    menu_sections_id bigint(20) unsigned DEFAULT NULL,
    CONSTRAINT `additionally_ibfk` FOREIGN KEY (`menu_sections_id`) REFERENCES `menu_sections` (`id`)
    );
 
INSERT INTO additionally (`name`, `weight\volume`, price, energy_value, menu_sections_id) VALUES
('Авокадо','40 гр','70','24','15'),
('Бекон','20 гр','50','57','15'),
('Варенье вишня','50 гр','50','122','15'),
('Варенье клубника','50 гр','50','134','15'),
('Варенье малина','50 гр','50','136','15'),
('Варенье черника','50 гр','50','136','15'),
('Ветчина','20 гр','50','65','15'),
('Взбитые сливки','20 гр','15','26','15'),
('Голубика свежая','50 гр','130','16','15'),
('Горчица зернистая','20 гр','25','38','15'),
('Горчица сладкая','20 гр','25','29','15'),
('Горячий шоколад','10 гр','30','47','15'),
('Гренки','10 гр','10','40','15'),
('Гречка','130 гр','120','418','15'),
('Грецкие орехи','15 гр','50','106','15'),
('Изюм','15 гр','50','40','15'),
('Имбирь свежий','10 гр','30','36','15'),
('Картофельное пюре','100 гр','120','131','15'),
('Кетчуп','30 гр','25','28','15'),
('Клубника свежая','50 гр','110','12','15'),
('Креветки жареные','60 гр','80','121','15'),
('Крутоны','10 гр','10','40','15'),
('Курица','20 гр','55','38','15'),
('Ликер бейлис (к десерту)','30 мл','130','69','15'),
('Майонез','30 гр','25','220','15'),
('Маршмеллоу','15 гр','20','20','15'),
('Масло оливковое','20 мл','50','180','15'),
('Масло сливочное','10 гр','50','72','15'),
('Мед','50 гр','50','160','15'),
('Молоко питьевое','45 мл','10','24','15'),
('Молоко питьевое','250 мл','50','131','15'),
('Молоко кокосовое','45 мл','50','14','15'),
('Молоко обезжиренное Лайт','45 мл','10','16','15'),
('Молоко обезжиренное Лайт','250 мл','50','86','15'),
('"Молоко миндальное"','45 мл','50','13','15'),
('Молоко соевое','45 мл','50','17','15'),
('Мята','1 гр','50','1','15'),
('Овощи-гриль','100 гр','120','122','15'),
('Пепперони','20 гр','55','77','15'),
('Перец болгарский','20 гр','55','48','15'),
('Пита','40 гр','15','95','15'),
('Пита','80 гр','25','189','15'),
('Помидоры','20 гр','50','67','15'),
('Рис с овощами','120 гр','120','149','15'),
('Свежие ягоды','30 гр','90','9','15'),
('Семга','30 гр','90','69','15'),
('Сливки питьевые','45 мл','10','57','15'),
('Сметана','50 гр','50','102','15'),
('Соус ванильный','50 гр','30','177','15'),
('Соус горчично-сливочный','20 гр','30','81','15'),
('Соус йогуртовый с петрушкой','40 гр','30','75','15'),
('Соус терияки','25 гр','30','38','15'),
('Соус цезарь','40 гр','30','336','15'),
('Соус шоколадный','50 гр','30','230','15'),
('Сыр Гауда','20 гр','50','74','15'),
('Сыр моцарелла','20 гр','50','51','15'),
('Сыр Пармезан','20 гр','50','82','15'),
('Топпинг карамельный','10 гр','20','24','15'),
('Тост (хлеб белый)','50 гр','30','197','15'),
('Тост (хлеб злаковый)','40 гр','30','114','15'),
('Чабрец','2 гр','50',NULL,'15'),
('Шампиньоны','20 гр','50','35','15'),
('Эспрессо (дополнит)','30 мл','50','4','15'),
('Яйцо пашот','1 шт','50','71','15');

DROP TABLE IF EXISTS tea_collection;
CREATE TABLE tea_collection (
	id SERIAL primary key,
	`name` VARCHAR(150) COLLATE utf8_unicode_ci NOT NULL,
    `weight\volume` VARCHAR(50) COLLATE utf8_unicode_ci NOT NULL,
    price INT NOT NULL,
	energy_value INT NULL,
    menu_sections_id bigint(20) unsigned DEFAULT NULL,
    CONSTRAINT `tea_collection_ibfk` FOREIGN KEY (`menu_sections_id`) REFERENCES `menu_sections` (`id`)
    );
    
INSERT INTO tea_collection (`name`, `weight\volume`, price, energy_value, menu_sections_id) VALUES
('Классический сенча','450 мл','230',NULL,'16'),
('Китайский жасмин','450 мл','230',NULL,'16'),
('Молочный Улун','450 мл','230',NULL,'16'),
('Эрл грей','450 мл','230',NULL,'16'),
('Ассам','450 мл','230',NULL,'16'),
('Чай имбирно-лимонный','450 мл','290','240','16'),
('Чай облепиховый','450 мл','290','176','16'),
('Чай Грейпфрут-базилик','450 мл','290','193','16'),
('Чай Пьяная вишня','450 мл','290','197','16'),
('Чай Клюква-апельсин','450 мл','290','223','16'),
('Чай Глинтвейн','290 мл','290','219','16');

DROP TABLE IF EXISTS cold_drinks;
CREATE TABLE cold_drinks (
	id SERIAL primary key,
	`name` VARCHAR(150) COLLATE utf8_unicode_ci NOT NULL,
    `weight\volume` VARCHAR(50) COLLATE utf8_unicode_ci NOT NULL,
    price INT NOT NULL,
	energy_value INT NULL,
    menu_sections_id bigint(20) unsigned DEFAULT NULL,
    CONSTRAINT `cold_drinks_ibfk` FOREIGN KEY (`menu_sections_id`) REFERENCES `menu_sections` (`id`)
    );
    
INSERT INTO cold_drinks (`name`, `weight\volume`, price, energy_value, menu_sections_id) VALUES
('Айс латте классический','460 мл','270','110','17'),
('Мохито б/а','460 мл','330','84','17'),
('Лимонад домашний','460 мл','270','90','17'),
('Тоник Маракуйя-апельсин','460 мл','330','143','17'),
('Смузи Витаминный заряд','460 мл','330','193','17'),
('Шейк Радужный единорог','460 мл','330','494','17'),
('Пепси','250 мл','150','108','17'),
('Пепси лайт','250 мл','150','1','17'),
('Миринда оранж','250 мл','150','124','17'),
('7 АП','250 мл','150','108','17'),
('Аква минерале с газом','500 мл','150',NULL,'17'),
('Аква минерале без газа','500 мл','150',NULL,'17'),
('Тоник Эвервесс','250 мл','170','100','17'),
('Адреналин Раш','250 мл','190','125','17'),
('Эвиан б/г','330 мл','190',NULL,'17'),
('Бадуа с/г','330 мл','230',NULL,'17'),
('Сок яблочный','200 мл','150','88','17'),
('Сок апельсиновый','200 мл','150','88','17'),
('Сок вишневый','200 мл','150','112','17'),
('Свежевыжатый апельсиновый сок','200 мл','270','76','17'),
('Свежевыжатый апельсиновый сок Мега','400 мл','330','151','17'),
('Свежевыжатый грейпфрутовый сок','200 мл','270','61','17'),
('Свежевыжатый грейпфрутовый сок Мега','400 мл','330','122','17'),
('Свежевыжатый морковный сок','200 мл','270','69','17'),
('Свежевыжатый морковный сок Мега','400 мл','330','138','17'),
('Свежевыжатый яблочный сок','200 мл','270','89','17'),
('Свежевыжатый яблочный сок Мега','400 мл','330','178','17');

DROP TABLE IF EXISTS alcohol_drinks; 
CREATE TABLE alcohol_drinks (
	id SERIAL primary key,
	`name` VARCHAR(150) COLLATE utf8_unicode_ci NOT NULL,
    `weight\volume` VARCHAR(50) COLLATE utf8_unicode_ci NOT NULL,
    price INT NOT NULL,
	energy_value INT NULL,
    menu_sections_id bigint(20) unsigned DEFAULT NULL,
    CONSTRAINT `alcohol_drinks_ibfk` FOREIGN KEY (`menu_sections_id`) REFERENCES `menu_sections` (`id`)
    );
    
INSERT INTO alcohol_drinks (`name`, `weight\volume`, price, energy_value, menu_sections_id) VALUES
('Сидр Кокрель брют','330 мл','390','122','18'),
('Сидр Кокрель брют','750 мл','690','277','18'),
('Бад','330 мл','230','42','18'),
('Бад безалкогольное','330 мл','230','33','18'),
('Корона Экстра','355 мл','290','42','18'),
('Хугарден','470 мл','330','45','18'),
('Шпатен Дункель','500 мл','330','49','18'),
('Грушево-яблочный пунш','310 мл','390','101','18'),
('Глинтвейн красный','290 мл','390','118','18'),
('Глинтвейн белый','290 мл','390','107','18'),
('Мартини Фиеро-Тоник','340 мл','390','80','18'),
('Мартини Бьянко-Тоник','345 мл','390','81','18'),
('Мартини Рояле','404 мл','390','74','18'),
('Barrister Basil Smash','460 мл','390','76','18'),
('Апероль спритц','380 мл','390','43','18'),
('Курвуазье эспрессо','150 мл','390','60','18'),
('Раф Бейлис','250 мл','390','228','18'),
('Латте Бейлис','390 мл','390','252','18'),
('Мохито','460 мл','470','81','18'),
('Лонг Аленд Айс Ти','460 мл','470','20','18'),
('Мартини Просекко','187 мл','390','160','18'),
('Мартини Просекко','750 мл','1600','150','18'),
('Мартини Асти','187 мл','510','160','18'),
('Мартини Асти','750 мл','1950','600','18'),
('Шоколадница Брют','200 мл','290','150','18'),
('Шоколадница Брют','750 мл','990','562','18'),
('Винью Верде Эшпираль','150 мл','330','83','18'),
('Пино Гриджио','150 мл','330','100','18'),
('Совиньон Блан','150 мл','330','105','18'),
('Темпранильо Росадо Калиса','150 мл','330','117','18'),
('Каберне Совиньон и Мерло, Шато Декаталонь, Бордо','150 мл','330','105','18'),
('Кьянти Кастельсина','150 мл','330','109','18'),
('Куне Крианца, Риоха','150 мл','390','113','18'),
('Мальбек, Финка Фличман','150 мл','390','105','18'),
('Джемесон','50 мл','330','110','18'),
('Джек Дениелс','50 мл','330','110','18'),
('Макаллан 12 лет','50 мл','630','110','18'),
('Бакарди Карта Бланка','50 мл','390','110','18'),
('Бакарди Карта Нэгра','50 мл','390','110','18'),
('Арарат 5*','50 мл','330','118','18'),
('Курвуазье V.S','50 мл','430','110','18'),
('Курвуазье V.S.O.P','50 мл','630','112','18'),
('Царская','50 мл','190',NULL,'18'),
('Русский стандарт','50 мл','230','112','18'),
('Финляндия','50 мл','270','111','18'),
('Мартини Бьянко','100 мл','430','148','18'),
('Мартини Фьеро','100 мл','430',NULL,'18'),
('Ликер Бейлис','50 мл','330','115','18'),
('Джемесон','0,7 л','4620',NULL,'18'),
('Джек Дениелс','0,75 л','4950',NULL,'18'),
('Макаллан 12 лет','0,7 л','8820',NULL,'18'),
('Бакарди Карта бланка','0,7 л','5460',NULL,'18'),
('Бакарди Карта Нэгра','0,7 л','5460',NULL,'18'),
('Арарат 5*','0,5 л','3300',NULL,'18'),
('Арарат 5*','0,7 л','4620',NULL,'18'),
('Царская','0,5 л','1900',NULL,'18'),
('Русский стандарт','0,5 л','2300',NULL,'18'),
('Финляндия','0,5 л','2700',NULL,'18'),
('Финляндия','0,7 л','3780',NULL,'18'),
('Мартини Бьянко','1,0 л','4300',NULL,'18'),
('Мартини Фьеро','1,0 л','4300',NULL,'18'),
('Ликер Бейлис','0,5 л','3300',NULL,'18'),
('Винью Верде Эшпираль','0,75 л','1500',NULL,'18'),
('Пино Гриджо Венето Вилла','0,75 л','1500',NULL,'18'),
('Совиньон Блан','0,75 л','1500',NULL,'18'),
('Темпранильо Росадо Калиса Ла Манча','0,75 л','1500',NULL,'18'),
('Каберне Совиньон и Мерло, Шато Декаталонь','0,75 л','1500',NULL,'18'),
('Кьянти Кастельсина','0,75 л','1500',NULL,'18'),
('Куне Крианца Риоха','0,75 л','1900',NULL,'18'),
('Мальбек, Финка Фличман','0,75 л','1900',NULL,'18');

DROP TABLE IF EXISTS ordering_persons;
CREATE TABLE ordering_persons (
	id SERIAL primary key,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NULL,
    address VARCHAR(255) NOT NULL,
    phone_number CHAR(50) NOT NULL);
    
INSERT INTO ordering_persons (first_name, last_name, address, phone_number) VALUES
('Киселёва','Регина','ул. Мясницкая, 15','+7 (915) 034-31-39'),
('Сысоева','Наталья','ул. Автозаводская, 23, корп.2','+7 (931) 566-47-62'),
('Фокина','Екатерина','ул. Новослободская, 23','+7 (909) 182-41-27'),
('Лыткина','Жаклин','ул. Кабельная 2-я, 2','+7 (950) 462-31-86'),
('Семочко','Елизавета','3-й Марьиной Рощи пр-д, 40','+7 (993) 301-86-41'),
('Бородай','Юна','ул. Красноказарменная, 12/45','+7 (943) 115-96-35'),
('Журавлёва','Борислава','ул. Жерновская 5-я, дом 73, квартира 40','+7 (994) 935-54-97'),
('Ершова','Шанетта','ул. Юннатов, дом 71','+7 (963) 257-21-41'),
('Петровска','Злата','ул. Прохладная, дом 78, квартира 234','+7 (918) 598-48-58'),
('Некрасова','Чеслава','ул. Радиальная 1-я, дом 28','+7 (906) 282-51-48'),
('Сусаренко','Наталья','ул. Железногорская 6-я, дом 39, квартира 225','+7 (958) 820-79-95'),
('Никифорова','Олеся','ул. Серебряный пер, дом 78, квартира 452','+7 (997) 470-17-44'),
('Кондратьева','Лилия','ул. Челюскинская, дом 93','+7 (942) 630-33-50'),
('Петрова','Беатриса','ул. Приовражная, дом 41, квартира 471','+7 (969) 979-79-65'),
('Авдеева','Рената','ул. Песчаная 3-я, дом 97','+7 (900) 552-25-38'),
('Романова','Раиса','ул. Боевская 1-я, дом 41, квартира 169','+7 (903) 483-54-54'),
('Колесник','Раиса','ул. Вокзальная, дом 37, квартира 257','+7 (962) 754-12-50'),
('Евсеева','Алёна','ул. Нежинская, дом 9, квартира 218','+7 (987) 369-54-95'),
('Скоропадска','Прасковья','ул. Осипенко, дом 3, квартира 42','+7 (986) 279-92-63'),
('Шкраба','Христина','ул. Заусадебная, дом 97, квартира 151','+7 (958) 587-41-74');

DROP TABLE IF EXISTS orders;
CREATE TABLE orders (
	order_id SERIAL primary key,
    ordering_person_id BIGINT UNSIGNED NOT NULL,
    `name` VARCHAR(150) COLLATE utf8_unicode_ci NOT NULL,
    menu_section INT NOT NULL,
    dish_id INT NOT NULL,
    created_at DATETIME DEFAULT NOW(),
    updated_at DATETIME DEFAULT NOW(),
    FOREIGN KEY (ordering_person_id) REFERENCES ordering_persons(id)
    );

INSERT INTO orders (ordering_person_id, `name`, menu_section, dish_id) VALUES
('1', 'Пирожное Японская фисташка', '13', '2'),
('2', 'Вегетарианский поке боул', '2', '5'),
('3', 'Круассан с беконом бенедикт,', '1', '8'),
('4', 'Пирожное Баунти', '13', '8'),
('5', 'Тирамису', '13', '13'),
('5', 'Мороженое клубничное', '13', '19'),
('5', 'Варенье вишня', '15', '3'),
('6', 'Клаб-сэндвич', '5', '30'),
('7', 'Бургер с куриным шницелем на булке брезел', '7', '37'),
('8', 'Бифштекс из говядины с картофельным пюре', '8', '40'),
('9', 'Куриные котлеты с картофельным пюре', '10', '46'),
('10', 'Паста карбонара', '11', '58'),
('11', 'Мясная лазанья', '11', '61'),
('12', 'Круассан \"Скандинавия\" с крем-сыром и семгой', '1', '10'),
('12', 'Горячий шоколад', '15', '12'),
('13', 'Торт Медовик', '13', '25'),
('14', 'Домашний пирог с яблоками и корицей', '13', '28'),
('15', 'Пицца 4 сыра', '12', '66'),
('16', 'Маффин зерновой', '13', '17'),
('16', 'Голубика свежая', '15', '9'),
('17', 'Каша пшенная с ягодами', '1', '7'),
('18', 'Круассан с лососем и голландским соусом', '1', '12'),
('19', 'Ролл Филадельфия', '6', '34'),
('20', 'Мороженое пломбир', '13', '20');
