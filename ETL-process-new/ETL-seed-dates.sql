use hurtownie

DECLARE @startDate DATE = '1970-01-01'
DECLARE @endDate DATE = '2024-01-01'

WHILE @startDate <= @endDate
BEGIN
    IF DATEPART(WEEKDAY, @startDate) NOT IN (1, 7) -- Pomijamy niedziele (1) i sobote (7)
       AND NOT (
           MONTH(@startDate) = 12 AND DAY(@startDate) IN (25, 31) -- Boże Narodzenie i Sylwester
       )
    BEGIN
        INSERT INTO Date_ (Day_, Year_, Month_, MonthNo)
        SELECT
            DAY(@startDate) AS Day_,
            YEAR(@startDate) AS Year_,
            CASE MONTH(@startDate)
                WHEN 1 THEN 'Styczeń'
                WHEN 2 THEN 'Luty'
                WHEN 3 THEN 'Marzec'
                WHEN 4 THEN 'Kwiecień'
                WHEN 5 THEN 'Maj'
                WHEN 6 THEN 'Czerwiec'
                WHEN 7 THEN 'Lipiec'
                WHEN 8 THEN 'Sierpień'
                WHEN 9 THEN 'Wrzesień'
                WHEN 10 THEN 'Październik'
                WHEN 11 THEN 'Listopad'
                WHEN 12 THEN 'Grudzień'
            END AS Month_,
            MONTH(@startDate) AS MonthNo;
    END;

    -- Przejdź do następnego dnia
    SET @startDate = DATEADD(DAY, 1, @startDate);
END;
