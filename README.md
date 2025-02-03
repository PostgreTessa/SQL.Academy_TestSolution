# SQL.Academy_TestSolution

Задание 1: Вывести имена всех когда-либо обслуживаемых пассажиров авиакомпаний
SELECT name from Passenger;

Задание 2: Вывести названия всеx авиакомпаний
SELECT name FROM Company;

Задание 3: Вывести все рейсы, совершенные из Москвы
SELECT * FROM Trip
WHERE town_from = 'Moscow';

Задание 4: Вывести имена людей, которые заканчиваются на "man"
SELECT name FROM Passenger
WHERE name LIKE '%man';

