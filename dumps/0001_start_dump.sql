-- professions
-- Структура
CREATE TABLE `professions` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

ALTER TABLE `professions`
  ADD PRIMARY KEY (`id`);
  
ALTER TABLE `professions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
-- Данные
INSERT INTO `professions`(`name`)
  VALUES
  ('бухгалтер'),('курьер'),('менеджер');
  
-- workers
-- Структура
CREATE TABLE `workers` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `surname` varchar(255) NOT NULL,
  `id_profession` int(11) NOT NULL,
  `pay` float NOT NULL,
  `photo` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

ALTER TABLE `workers`
  ADD PRIMARY KEY (`id`);
  
ALTER TABLE `workers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
ALTER TABLE `workers`  
  ADD FOREIGN KEY ( `id_profession` ) REFERENCES `professions` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;
-- Данные
INSERT INTO `workers`(`name`, `surname`, `id_profession`, `pay`, `photo`) VALUES 
('Иван', 'Колмыков', 2, ROUND(FLOOR(10000 + RAND() * (40000 - 10000))), 'nofoto.png'),
('Лидия ', 'Коренкова', 1, ROUND(FLOOR(10000 + RAND() * (40000 - 10000))), 'nofoto.png'),
('Василиса', 'Давыдова', 1, ROUND(FLOOR(10000 + RAND() * (40000 - 10000))), 'nofoto.png'),
('Владимир', 'Урмаков', 3, ROUND(FLOOR(10000 + RAND() * (40000 - 10000))), 'nofoto.png'),
('Григорий', 'Брунский', 2, ROUND(FLOOR(10000 + RAND() * (40000 - 10000))), 'nofoto.png'),
('Павел', 'Лысенков', 2, ROUND(FLOOR(10000 + RAND() * (40000 - 10000))), 'nofoto.png'),
('Ирина', 'Михайлова', 2, ROUND(FLOOR(10000 + RAND() * (40000 - 10000))), 'nofoto.png'),
('Любовь', 'Капранова', 2, ROUND(FLOOR(10000 + RAND() * (40000 - 10000))), 'nofoto.png'),
('Михаил', 'Прыгунов', 1, ROUND(FLOOR(10000 + RAND() * (40000 - 10000))), 'nofoto.png'),
('Константин', 'Матвиенко', 3, ROUND(FLOOR(10000 + RAND() * (40000 - 10000))), 'nofoto.png'),
('Вадим', 'Казаков', 3, ROUND(FLOOR(10000 + RAND() * (40000 - 10000))), 'nofoto.png'),
('Елена', 'Василькова', 1, ROUND(FLOOR(10000 + RAND() * (40000 - 10000))), 'nofoto.png'),
('Марина', 'Федорова', 3, ROUND(FLOOR(10000 + RAND() * (40000 - 10000))), 'nofoto.png'),
('Евгения', 'Коченкова', 1, ROUND(FLOOR(10000 + RAND() * (40000 - 10000))), 'nofoto.png'),
('Максим', 'Скачков', 2, ROUND(FLOOR(10000 + RAND() * (40000 - 10000))), 'nofoto.png');
  
-- payments  
-- Структура
CREATE TABLE `payments` (
  `id` int(11) NOT NULL,
  `id_worker` int(11) NOT NULL,
  `payment` float NOT NULL,
  `month` enum('1','2','3','4','5','6','7','8','9','10','11','12') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

ALTER TABLE `payments`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `payments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
ALTER TABLE `payments`  
  ADD FOREIGN KEY ( `id_worker` ) REFERENCES `workers` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;
-- Данные
INSERT INTO `payments`(`id_worker`, `payment`, `month`)
SELECT workers.id, workers.pay, MONTH(NOW())
FROM workers;
  
  
  

