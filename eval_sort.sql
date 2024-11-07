/* Использование выражений в предложении SELECT */
SELECT 
    `salespeaple`.`sname`,
    `salespeaple`.`comm` * 100 AS 'Комм. в %'
FROM
    shop.salespeaple;
    
/* Добавление текста в результаты запроса */
SELECT 
    `salespeaple`.`sname`,
    `salespeaple`.`comm` * 100 AS 'Комм. в %', '%'
FROM
    shop.salespeaple;

/* Форматирование отчёта средствами SQL */    
SELECT 
'' as 'На дату', sdate as 'дата', 'обслужено', Count(*) as 'количество', 'заказов'
    FROM
    shop.sales
    group by sdate;
    
/* Выражение INTERVAL для вычисления дат*/
SELECT 
    sdate
FROM
    sales
WHERE
    sdate < '2024-09-01' + INTERVAL 14 DAY
        AND sdate > '2024-09-01' - INTERVAL 14 DAY;
	        
	/* Использование выражения INTERVAL для указания количества месяцев*/
SELECT 
    sdate
FROM
    sales
WHERE
    sdate > '2024-09-01' AND sdate < '2024-09-01' + INTERVAL 1 MONTH;
    
/* Сортировка значений */
SELECT 
    *
FROM
    sales
ORDER BY sdate DESC;

/* Сортировка по двум столбцам */
SELECT 
    *
FROM
    sales
ORDER BY sdate , amount DESC;

/* Сортировка столбцов с указанием их номера */
SELECT 
    *
FROM
    sales
ORDER BY 3 desc, 4;

/* Сортировка по агрегатным группам */
SELECT 
    snum, sdate, MAX(amount)
FROM
    sales
GROUP BY snum , sdate
ORDER BY snum, sdate;

/* Сортировка по значению, подсчитанному агрегатной функцией */
SELECT 
    snum, sdate, MAX(amount)
FROM
    sales
GROUP BY snum , sdate
ORDER BY snum, 3 desc;

/* NULL-значения и сортировка - MySQL выводит null-значения впереди остальных при сортировке по возрастанию*/
SELECT 
    *
FROM
    shop.customers
ORDER BY rating desc;
