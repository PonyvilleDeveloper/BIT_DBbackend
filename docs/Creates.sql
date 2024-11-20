-- Таблица "Addresses" (Адреса)
CREATE TABLE Addresses (
    ID bigserial PRIMARY KEY,
	City varchar(50),
    Street varchar(50),
	House smallint,
    Special jsonb
);
-- Таблица "ObjectTypes" (Типы объектов)
CREATE TABLE ObjectTypes (
	ID bigserial PRIMARY KEY,
    Name varchar(100) NOT NULL,
	ServiceStarted date,
    ServiceEnded date,
	Special jsonb
);
-- Таблица "TaskTypes" (Типы задач)
CREATE TABLE TaskTypes (
    ID bigserial PRIMARY KEY,
	Target varchar(50) NOT NULL,
    Form xml,
	Special jsonb
);
-- Таблица "Results" (Результаты)
CREATE TABLE Results (
    ID bigserial PRIMARY KEY,
	Files text[],
    Form xml,
	Special jsonb
);
-- Таблица "Objects" (Объекты)
CREATE TABLE Objects (
    ID bigserial PRIMARY KEY,
    AddressID bigint NOT NULL REFERENCES Addresses(ID) ON DELETE CASCADE,
	TypeID bigint NOT NULL REFERENCES ObjectTypes(ID) ON DELETE CASCADE,
    ServiceStarted date,
	ServiceEnded date,
    Description text,
	Special jsonb
);
-- Таблица "Tasks" (Задачи)
CREATE TABLE Tasks ( 
    ID bigserial PRIMARY KEY,
	ObjectID bigint NOT NULL REFERENCES Objects(ID) ON DELETE CASCADE, 
    TypeID bigint NOT NULL REFERENCES TaskTypes(ID) ON DELETE CASCADE,
	ResultID bigint REFERENCES Results(ID) ON DELETE SET NULL, 
    Comment text,
	Closed boolean DEFAULT FALSE
);