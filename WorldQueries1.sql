-- Institution: A&K Akademia
-- Subject: MySQL basics practise
-- Student: Kovács Tibor Zsolt
-- Source: world data base
-- Naming limit: max 5 records / SELECT

-- 1.
-- records: 10
	SELECT * FROM city WHERE CountryCode = 'CZE';

-- 2.
	-- a
	-- records: 18
		SELECT * FROM city WHERE CountryCode = 'USA' AND Population >= 600000;
    
	-- b
	-- records: 18
		SELECT Name, District, Population FROM city WHERE CountryCode = 'USA' AND Population >= 600000;
        
-- 3.
	-- a
	-- records: 14
		SELECT * FROM country WHERE Region = 'South America';
	
    -- b
    -- records: 14
		SELECT Name, Code, SurfaceArea, Population FROM country WHERE region = 'South America';
        
-- 4.
-- records: 16
	SELECT DISTINCT District FROM city WHERE CountryCode = 'DEU' ORDER BY District;

-- 5.alter
	-- a
	-- records: 239
		SELECT * FROM country ORDER BY (Population / SurfaceArea) DESC;
	
    -- b
	-- records: 239
		SELECT Name, SurfaceArea, Population, (Population / SurfaceArea) AS PopulationDensity  FROM country ORDER BY PopulationDensity DESC;

-- 6.
	-- a
	-- records: 5; Bhutan, Qatar, Saudi Arabia, Swaziland and Tonga
        SELECT Name, Continent, Population FROM country WHERE GovernmentForm = 'Monarchy'; 
        
	-- b
	-- records: 5
        SELECT Name, Continent, Population, GovernmentForm FROM country WHERE GovernmentForm LIKE 'Monarchy'; 
        
	-- c
	-- records: 234
        SELECT Name, Continent, Population, GovernmentForm FROM country WHERE GovernmentForm NOT LIKE 'Monarchy'; 
        
	-- d
	-- records: 122
        SELECT Name, Continent, Population, GovernmentForm FROM country WHERE GovernmentForm LIKE 'Republic'; 
        
	-- e
	-- records: 117
		SELECT Name, Continent, Population, GovernmentForm FROM country WHERE GovernmentForm NOT LIKE 'Republic' OR 'Monarchy'; 
        
-- 7.
-- records: 2; Sudan and Iran
	SELECT * FROM country WHERE GovernmentForm = 'Islamic Republic';
    
-- 8.
-- records: 1000 
	SELECT Name, CountryCode FROM city ORDER BY Name;
   
-- 9.
-- records: 1, result: 31881005 km²
	SELECT * FROM country;
    SELECT CONCAT(ROUND(SUM(SurfaceArea)), ' km²') AS SumOfAsiaSurface FROM country WHERE Continent = 'Asia';

-- 10.
-- records: 14
	SELECT Population FROM country WHERE Continent = 'South America';
    
-- 11.
-- records: 1, result: 769
	SELECT ROUND(AVG(Population / SurfaceArea)) AS AveragePopulationDensity FROM country WHERE Continent = 'Europe';
    
-- 12.
	-- a
	-- records: 1, result: 28
		SELECT COUNT(DISTINCT CountryCode) AS SpeakSpanishLanguage FROM countrylanguage WHERE Language = 'Spanish';
        
	-- b
	-- records: 1, result: 20
		SELECT COUNT(DISTINCT CountryCode) AS SpeakSpanishLanguageAsNativ FROM countrylanguage WHERE Language = 'Spanish' AND IsOfficial = 'T';
        
-- 13.
	-- a
	-- records: 24 
		SELECT * FROM country WHERE (Population / SurfaceArea) < 5;
        
	-- b
	-- records: 24, 
		SELECT Name, (Population / SurfaceArea) AS 'PopulationDensity < 5 km²'  FROM country WHERE (Population / SurfaceArea) < 5;
		
-- 14.
	-- a
	-- records: 5; Bangladesh, South Korea, Puerto Rico, Palestine, Taiwan
		SELECT * FROM country WHERE (Population / SurfaceArea) > 400 AND SurfaceArea > 5000;
	
    -- a
	-- records: 5; Bangladesh, South Korea, Puerto Rico, Palestine, Taiwan
		SELECT Name, Code, (Population / SurfaceArea) AS 'PopulationDensity > 400 km²'  FROM country WHERE (Population / SurfaceArea) > 400 AND SurfaceArea > 5000;
        
-- 15.
-- record: 1; 1994
	SELECT MAX(IndepYear) AS LatestYearOfIndep FROM country;
    
-- 16.
	-- a
	-- records: 1; 83.5
		SELECT Name, MAX(LifeExpectancy) AS MaxLifeExpectancyn FROM country;
	
    -- a
	-- records: 1; 37.2
		SELECT MIN(LifeExpectancy) AS MinLifeExpectancy FROM country;
        
-- 17.
	-- a
	-- records: 21
		  SELECT 
			name, 
			LifeExpectancy
		FROM
			(SELECT 
				name, LifeExpectancy
			FROM
				country
			WHERE
				Continent = 'Europe') xx
		WHERE LifeExpectancy > (SELECT AVG(LifeExpectancy) FROM country WHERE Continent = 'Europe') + 2 ORDER BY LifeExpectancy DESC;

    -- b
	-- records: 31
		 SELECT 
			name, 
			LifeExpectancy
		FROM
			(SELECT 
				Name, LifeExpectancy
			FROM
				country
			WHERE
				Continent = 'Europe') xx
		WHERE LifeExpectancy > (SELECT AVG(LifeExpectancy) FROM country WHERE Continent = 'Europe') - 2 ORDER BY LifeExpectancy DESC;
        
        
-- 18.
	-- a
    -- records: 9
		SELECT 
			Name,
			GNP / population AS GNP_per_capita
		FROM 
			country
		WHERE 
			Continent = 'Africa' AND
			GNP / population > (SELECT AVG(GNP / population) * 1.5 FROM country WHERE Continent = 'Africa')
		ORDER BY 
			GNP_per_capita DESC;
            
	-- b
    -- records: 15
		SELECT 
			Name,
			GNP / population AS GNP_per_capita
		FROM 
			country
		WHERE 
			Continent = 'Africa' AND
			GNP / population > (SELECT AVG(GNP / population) / 1.5 FROM country WHERE Continent = 'Africa')
		ORDER BY 
			GNP_per_capita DESC;
        
	
	
	