SELECT c.[name] AS 'Город', s.[name] AS 'Поставщик 1', s2.[name] AS 'Поставщик 2'
FROM [Cities] AS c
	JOIN [Suppliers] AS s ON (c.id = s.city_id)
	JOIN [Suppliers] AS s2 ON (s.city_id = s2.city_id)
WHERE s.id > s2.id;

SELECT * FROM [Cities]
SELECT * FROM [Suppliers]

SELECT c.[name] AS 'Город', s.[name] AS 'Поставщик'
FROM [Cities] AS c
	INNER JOIN [Suppliers] AS s ON (c.id = s.city_id);

SELECT c.[name] AS 'Город', s.[name] AS 'Поставщик'
FROM [Cities] AS c
	LEFT JOIN [Suppliers] AS s ON (c.id = s.city_id);

SELECT c.[name] AS 'Город', s.[name] AS 'Поставщик'
FROM [Cities] AS c
	RIGHT JOIN [Suppliers] AS s ON (c.id = s.city_id);

SELECT c.[name] AS 'Город', s.[name] AS 'Поставщик'
FROM [Cities] AS c
	FULL JOIN [Suppliers] AS s ON (c.id = s.city_id);