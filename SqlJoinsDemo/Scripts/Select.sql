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

SELECT c2.[name]
FROM (SELECT * FROM [Cities] AS c WHERE c.id < 3) AS c2;

/* EXISTS */

SELECT c.[name] AS 'Город'
FROM [Cities] AS c
WHERE NOT EXISTS (
	SELECT 'X'
	FROM [Suppliers] AS s
	WHERE c.id = s.city_id
);

/*SELECT 'Without suppliers', COUNT(c.[name])
FROM [Cities] AS c
WHERE NOT EXISTS (
	SELECT 'X'
	FROM [Suppliers] AS s
	WHERE c.id = s.city_id
)
UNION
SELECT 'With suppliers', COUNT(c.[name])
FROM [Cities] AS c
WHERE EXISTS (
	SELECT 'X'
	FROM [Suppliers] AS s
	WHERE c.id = s.city_id
);*/

SELECT 'Without suppliers', c.[name], c.[id]
FROM [Cities] AS c
WHERE NOT EXISTS (
	SELECT 'X'
	FROM [Suppliers] AS s
	WHERE c.id = s.city_id
)
UNION
SELECT 'With suppliers', c.[name], '0'
FROM [Cities] AS c
WHERE EXISTS (
	SELECT 'X'
	FROM [Suppliers] AS s
	WHERE c.id = s.city_id
);

SELECT c.[name], COUNT(s.[name])
FROM [Cities] AS c INNER JOIN [Suppliers] AS s ON (c.id = s.city_id)
GROUP BY c.[name];

ALTER TABLE [dbo].[Suppliers]
	ADD [balance] DECIMAL(10,2);

SELECT * FROM Cities

UPDATE [Suppliers]
SET balance = 700
WHERE id = 3;

SELECT c.[name], SUM(s.[balance])
FROM [Cities] AS c INNER JOIN [Suppliers] AS s ON (c.id = s.city_id)
--WHERE c.id < 10
WHERE c.id > 1
GROUP BY c.[name]
HAVING SUM(s.[balance]) <> 1000;