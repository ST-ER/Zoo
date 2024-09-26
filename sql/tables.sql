-- Справочник Классы
CREATE TABLE Classes (
    Code SERIAL PRIMARY KEY,
    Name VARCHAR(255) NOT NULL
);

-- Справочник Отряды
CREATE TABLE Orders (
    Code SERIAL PRIMARY KEY,
    Name VARCHAR(255) NOT NULL,
    ClassCode INT,
    FOREIGN KEY (ClassCode) REFERENCES Classes(Code)
);

-- Справочник Семейства
CREATE TABLE Families (
    Code SERIAL PRIMARY KEY,
    Name VARCHAR(255) NOT NULL,
    OrderCode INT,
    FOREIGN KEY (OrderCode) REFERENCES Orders(Code)
);


-- Справочник Файлы
CREATE TABLE Files (
    Code SERIAL PRIMARY KEY,
    File TEXT
);

-- Справочник Страны
CREATE TABLE Countries (
    Code SERIAL PRIMARY KEY,
    Name VARCHAR(255) NOT NULL
);

-- Справочник Города
CREATE TABLE Cities (
    Code SERIAL PRIMARY KEY,
    Name VARCHAR(255) NOT NULL,
    CountryCode INT,
    FOREIGN KEY (CountryCode) REFERENCES Countries(Code)
);

-- Справочник Зоопарки
CREATE TABLE Zoos (
    Code SERIAL PRIMARY KEY,
    Name VARCHAR(255) NOT NULL,
    CityCode INT,
    FOREIGN KEY (CityCode) REFERENCES Cities(Code)
);


-- Справочник Виды животных
CREATE TABLE AnimalSpecies (
    Code SERIAL PRIMARY KEY,
    Name VARCHAR(255) NOT NULL,
    FamilyCode INT,
    Mass DECIMAL(10, 2),
    BodyLength DECIMAL(10, 2),
    Height DECIMAL(10, 2),
    MovementSpeed DECIMAL(10, 2),
    Wingspan DECIMAL(10, 2),
    HabitatArea VARCHAR(255),
    Comments TEXT,
    Image INT,
    FOREIGN KEY (FamilyCode) REFERENCES Families(Code),
	FOREIGN KEY (Image) REFERENCES Files(Code)
);

-- Справочник Животные
CREATE TABLE Animals (
    Code SERIAL PRIMARY KEY,
    Name VARCHAR(255) NOT NULL,
    Gender VARCHAR(10) CHECK (Gender IN ('Самец', 'Самка')), -- Ограничение на пол животного
    SpeciesCode INT,
    ArrivalDate DATE,
    BirthDate DATE,
    Price DECIMAL(10, 2),
    AdditionalInfo TEXT,
	
    FOREIGN KEY (SpeciesCode) REFERENCES AnimalSpecies(Code)
);

-- Документ Прибытие животных
CREATE TABLE AnimalArrival (
    Number SERIAL PRIMARY KEY,
    Date DATE NOT NULL,
    Organization VARCHAR(255),
    ZooCode INT,
    AnimalSpeciesCode INT,
    Quantity INT,  -- Общее количество животных
    Price DECIMAL(10, 2),
    Cost DECIMAL(10, 2),
    FOREIGN KEY (ZooCode) REFERENCES Zoos(Code),
    FOREIGN KEY (AnimalSpeciesCode) REFERENCES AnimalSpecies(Code)
);

 ------- Животных можно будет отправлять только пачками по видам, также и для убытия --------

--Дополнительная таблица для учёта прибывших животных
CREATE TABLE AnimalArrivalDetails (
    ArrivalNumber INT,
    AnimalCode INT,                 -- Связь с таблицей "Animals"
    FOREIGN KEY (ArrivalNumber) REFERENCES AnimalArrival(Number) ON DELETE CASCADE,
    FOREIGN KEY (AnimalCode) REFERENCES Animals(Code) ON DELETE CASCADE,
    PRIMARY KEY (ArrivalNumber, AnimalCode)
);
-- Документ Выбытие животных
CREATE TABLE AnimalDeparture (
    Number SERIAL PRIMARY KEY,
    Date DATE NOT NULL,
    Organization VARCHAR(255),
    AnimalSpeciesCode INT,
    DepartureReasonCode INT,
    Quantity INT,  -- Общее количество животных
    Price DECIMAL(10, 2),
    FOREIGN KEY (AnimalSpeciesCode) REFERENCES AnimalSpecies(Code),
    FOREIGN KEY (DepartureReasonCode) REFERENCES DepartureReasons(Code)
);

--Дополнительная таблица для учёта выбывших животных
CREATE TABLE AnimalDepartureDetails (
    DepartureNumber INT,
    AnimalCode INT,                 -- Связь с таблицей "Animals"
    FOREIGN KEY (DepartureNumber) REFERENCES AnimalDeparture(Number) ON DELETE CASCADE,
    FOREIGN KEY (AnimalCode) REFERENCES Animals(Code) ON DELETE CASCADE,
    PRIMARY KEY (DepartureNumber, AnimalCode)
);


-- Справочник Причины выбытия
CREATE TABLE DepartureReasons (
    Code SERIAL PRIMARY KEY,
    Name VARCHAR(255) NOT NULL
);

