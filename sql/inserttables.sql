-- Вставка данных в таблицу Classes (Классы)
INSERT INTO Classes (Name) VALUES 
('Млекопитающие'),
('Птицы'),
('Рыбы'),
('Рептилии'),
('Амфибии'),
('Насекомые'),
('Паукообразные'),
('Моллюски'),
('Ракообразные'),
('Членистоногие'),
('Кольчатые черви'),
('Плоские черви'),
('Кишечнополостные'),
('Иглокожие'),
('Медузы');

-- Вставка данных в таблицу Orders (Отряды)
INSERT INTO Orders (Name, ClassCode) VALUES 
('Приматы', 1),
('Хищные', 1),
('Грызуны', 1),
('Воробьинообразные', 2),
('Хищные птицы', 2),
('Лососевые', 3),
('Карпообразные', 3),
('Черепахи', 4),
('Ящерицы', 4),
('Лягушки', 5),
('Саламандры', 5),
('Жуки', 6),
('Бабочки', 6),
('Скорпионы', 7),
('Пауки', 7);

-- Вставка данных в таблицу Families (Семейства)
INSERT INTO Families (Name, OrderCode) VALUES 
('Гоминиды', 1),
('Кошачьи', 2),
('Псовые', 2),
('Беличьи', 3),
('Воробьиные', 4),
('Ястребиные', 5),
('Лососевые рыбы', 6),
('Карповые рыбы', 7),
('Сухопутные черепахи', 8),
('Ящерицы обыкновенные', 9),
('Настоящие лягушки', 10),
('Настоящие саламандры', 11),
('Жужелицы', 12),
('Нимфалиды', 13),
('Скорпионы обыкновенные', 14);

-- Вставка данных в таблицу Files (Файлы)
INSERT INTO Files (File) VALUES 
('https://avatars.mds.yandex.net/i?id=0c9434c92cd83fc118e9c40a62baf39bf08023b2-7742796-images-thumbs&n=13'),
('https://avatars.mds.yandex.net/i?id=22467fef09071012480e7d1f32a7dc44b8ba2358-8287363-images-thumbs&n=13'),
('https://avatars.mds.yandex.net/i?id=7f275447b87bea61862ae168b3a1166e412ea18f-8790138-images-thumbs&n=13'),
('https://avatars.mds.yandex.net/i?id=8a485dfb5d5c851587d50369052491d9193d8dbb-8538767-images-thumbs&n=13'),
('https://avatars.mds.yandex.net/i?id=ccf18cbbec69f3a9af52c5cf2ff44a9203710dfd69025fab-12422594-images-thumbs&n=13'),
('https://avatars.mds.yandex.net/i?id=a1cbd695d70fa89355326bd1f53c5def9ee4e861-5485957-images-thumbs&n=13'),
('https://avatars.mds.yandex.net/i?id=e48bdcfd2ac21e73a1de1a84fa6f906b-5591092-images-thumbs&n=13'),
('https://avatars.mds.yandex.net/i?id=225e2fc95f4580e46013e22e60ba80bb6cea03bed736f8aa-10250781-images-thumbs&n=13'),
('https://avatars.mds.yandex.net/i?id=b9e48d96aa0c45e2d43ff05a5b4118465dc22b0e-12472486-images-thumbs&n=13'),
('https://avatars.mds.yandex.net/i?id=92d46f8ae18d9b70a5046cbb60c5dd523b755831adbed48b-4033040-images-thumbs&n=13'),
('https://avatars.mds.yandex.net/i?id=8b0fc38e02002151c09e42b2ca21dc5290031d25-4567732-images-thumbs&n=13'),
('https://avatars.mds.yandex.net/i?id=672fa89202bc7e1c1c11bed6f6d62c37587ad227-9238775-images-thumbs&n=13'),
('https://avatars.mds.yandex.net/i?id=496446877f91d67c0186f1117065d7572fcf1c15-8340505-images-thumbs&n=13'),
('https://avatars.mds.yandex.net/i?id=f1436c3c054e86b99e573d43496ffc44cb8487b2-12471588-images-thumbs&n=13'),
('https://avatars.mds.yandex.net/i?id=86488efa0fed4925b31ad4d2b23b2cc46ae973be-10749046-images-thumbs&n=13');

-- Вставка данных в таблицу Countries (Страны)
INSERT INTO Countries (Name) VALUES 
('Россия'),
('США'),
('Канада'),
('Китай'),
('Япония'),
('Германия'),
('Франция'),
('Италия'),
('Испания'),
('Великобритания'),
('Австралия'),
('Бразилия'),
('Индия'),
('Мексика'),
('Аргентина');

-- Вставка данных в таблицу Cities (Города)
INSERT INTO Cities (Name, CountryCode) VALUES 
('Москва', 1),
('Нью-Йорк', 2),
('Торонто', 3),
('Пекин', 4),
('Токио', 5),
('Берлин', 6),
('Париж', 7),
('Рим', 8),
('Мадрид', 9),
('Лондон', 10),
('Сидней', 11),
('Рио-де-Жанейро', 12),
('Мумбаи', 13),
('Мехико', 14),
('Буэнос-Айрес', 15);

-- Вставка данных в таблицу Zoos (Зоопарки)
INSERT INTO Zoos (Name, CityCode) VALUES 
('Московский зоопарк', 1),
('Центральный парк зоопарк', 2),
('Торонто зоопарк', 3),
('Пекинский зоопарк', 4),
('Уэно зоопарк', 5),
('Берлинский зоопарк', 6),
('Парижский зоопарк', 7),
('Зоопарк Рима', 8),
('Мадридский зоопарк', 9),
('Лондонский зоопарк', 10),
('Таронга зоопарк', 11),
('Зоопарк Рио', 12),
('Зоопарк Мумбаи', 13),
('Зоопарк Чапультепек', 14),
('Буэнос-Айрес зоопарк', 15);

-- Вставка данных в таблицу AnimalSpecies (Виды животных)
INSERT INTO AnimalSpecies (Name, FamilyCode, Mass, BodyLength, Height, MovementSpeed, Wingspan, HabitatArea, Comments, Image) VALUES 
('Горилла', 1, 70.0, 1.75, 1.75, 4.5, NULL, 'Центральная Африка', 'Общепринятый вид', 1),
('Тигр', 2, 300.0, 2.8, 1.0, 60.0, NULL, 'Юго-Восточная Азия, Индия', 'Хищник', 2),
('Волк', 3, 50.0, 1.5, 0.8, 40.0, NULL, 'Северная Америка, Европа, Азия', 'Плотоядный', 3),
('Белка', 4, 0.5, 0.4, 0.25, 12.0, NULL, 'Европа, Азия, Северная Америка', 'Грызун', 4),
('Воробей', 5, 0.02, 0.15, 0.1, 10.0, 0.25, 'Европа, Азия, Северная Америка', 'Птица', 5),
('Ястреб', 6, 1.5, 0.6, 0.4, 30.0, 1.2, 'Северная Америка, Европа, Азия', 'Хищник', 6),
('Лосось', 7, 25.0, 1.2, NULL, 2.0, NULL, 'Северная Атлантика', 'Миграционная рыба', 7),
('Карп', 8, 15.0, 1.0, NULL, 1.0, NULL, 'Пресные воды Евразии', 'Крупная пресноводная рыба', 8),
('Средиземноморская черепаха', 9, 2.5, 0.3, 0.2, 0.3, NULL, 'Южная Европа, Северная Африка', 'Рептилия', 9),
('Обыкновенная ящерица', 10, 0.02, 0.2, 0.05, 2.0, NULL, 'Европа, Азия', 'Рептилия', 10),
('Обыкновенная лягушка', 11, 0.03, 0.1, 0.07, 0.2, NULL, 'Европа, Азия', 'Амфибия', 11),
('Обыкновенная саламандра', 12, 0.15, 0.3, 0.1, 0.5, NULL, 'Южная и Центральная Европа', 'Амфибия', 12),
('Жужелица лесная', 13, 0.01, 0.05, 0.01, 0.01, NULL, 'Европа, Азия', 'Жук', 13),
('Павлиний глаз', 14, 0.001, 0.03, 0.01, 0.02, 0.07, 'Европа, Азия', 'Бабочка', 14),
('Скорпион', 15, 0.05, 0.1, 0.03, 0.2, NULL, 'Южная Америка, Африка, Азия', 'Ядовитый членистоногий', 15);

-- Вставка данных в таблицу Animals (Животные)
INSERT INTO Animals (Name, Gender, SpeciesCode, ArrivalDate, BirthDate, Price, AdditionalInfo) VALUES 
('Макс', 'Самец', 16, '2022-01-15', '2018-05-05', 5000.00, 'Привезён из другого зоопарка'),
('Люси', 'Самка', 16, '2023-03-20', '2019-07-12', 4500.00, 'Подарок от другого зоопарка'),
('Шерхан', 'Самец', 17, '2021-09-30', '2017-11-21', 8000.00, 'Прибыл в рамках обмена'),
('Альфа', 'Самка', 18, '2020-06-11', '2015-08-08', 3500.00, 'Отловлена в дикой природе'),
('Белочка', 'Самка', 19, '2023-07-07', '2021-04-18', 150.00, 'Родилась в зоопарке'),
('Чирик', 'Самец', 20, '2022-02-25', '2020-06-14', 50.00, 'Подарок от школьников'),
('Гарри', 'Самец', 21, '2023-01-10', '2019-05-15', 1200.00, 'Спасён из дикой природы'),
('Рыбка', 'Самка', 22, '2021-08-22', '2018-03-05', 200.00, 'Разведение в аквариуме'),
('Карпик', 'Самец', 23, '2020-12-15', '2017-10-10', 180.00, 'Родился в пруду зоопарка'),
('Черепашка', 'Самка', 24, '2019-04-05', '2015-11-01', 400.00, 'Передана владельцем'),
('Лиза', 'Самка', 25, '2022-11-13', '2018-09-23', 120.00, 'Спасена в городском парке'),
('Фроги', 'Самец', 26, '2023-05-20', '2021-08-14', 70.00, 'Разведение в неволе'),
('Салли', 'Самка', 27, '2021-03-30', '2018-06-12', 90.00, 'Передана в дар зоопарку'),
('Жучок', 'Самец', 28, '2020-09-17', '2019-05-05', 10.00, 'Подарок от коллекционера'),
('Бабочка', 'Самка', 29, '2019-08-19', '2018-03-10', 15.00, 'Разведение в террариуме');

-- Вставка данных в таблицу DepartureReasons (Причины выбытия)
INSERT INTO DepartureReasons (Name) VALUES 
('Смерть от старости'),
('Переезд в другой зоопарк'),
('Продажа частному лицу'),
('Отпуск на волю'),
('Уход в дикую природу'),
('Передача в исследовательский центр'),
('Передача в другой зоопарк по обмену'),
('Болезнь'),
('Травма, не совместимая с жизнью'),
('Естественные причины'),
('Передача в заповедник'),
('Программа реинтродукции в природу'),
('Гибель при несчастном случае'),
('Передача в питомник'),
('Завершение контракта о содержании');
