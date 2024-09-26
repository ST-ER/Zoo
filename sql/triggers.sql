CREATE OR REPLACE FUNCTION update_arrival_quantity() 
RETURNS TRIGGER AS $$
BEGIN
    -- Обновляем поле Quantity в таблице AnimalArrival, подсчитывая уникальные AnimalCode в AnimalArrivalDetails
    UPDATE AnimalArrival
    SET Quantity = (SELECT COUNT(DISTINCT AnimalCode) 
                    FROM AnimalArrivalDetails 
                    WHERE ArrivalNumber = NEW.ArrivalNumber)
    WHERE Number = NEW.ArrivalNumber;
    
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trg_animal_arrival_insert_delete
AFTER INSERT OR DELETE ON AnimalArrivalDetails
FOR EACH ROW
EXECUTE FUNCTION update_arrival_quantity();

-- Триггер, который обновляет количество выбывших животных
CREATE OR REPLACE FUNCTION update_departure_quantity() 
RETURNS TRIGGER AS $$
BEGIN
    -- Обновляем поле Quantity в таблице AnimalDeparture, подсчитывая уникальные AnimalCode в AnimalDepartureDetails
    UPDATE AnimalDeparture
    SET Quantity = (SELECT COUNT(DISTINCT AnimalCode) 
                    FROM AnimalDepartureDetails 
                    WHERE DepartureNumber = NEW.DepartureNumber)
    WHERE Number = NEW.DepartureNumber;
    
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- Триггер на вставку или удаление в таблице AnimalDepartureDetails
CREATE TRIGGER trg_animal_departure_insert_delete
AFTER INSERT OR DELETE ON AnimalDepartureDetails
FOR EACH ROW
EXECUTE FUNCTION update_departure_quantity();