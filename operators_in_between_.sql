/*Операторы IN, BETWEEN, LIKE, IS NULL и агрегатные функции*/
/*IN - выборка из множества значений*/

SELECT 
    `customers`.`cname`,
    `customers`.`city`,
    `customers`.`rating`,
    `customers`.`snum`
FROM
    `shop`.`customers`
WHERE
    `customers`.`city` IN ('Новосибирск' , 'Омск');
    
SELECT 
    `sales`.`sdate`, `sales`.`amount`
FROM
    `shop`.`sales`
WHERE
    `sales`.`sdate` IN ('2024-09-12' , '2024-09-13', '2024-09-17');
    
/*BETWEEN - выборка из диапазона значений*/
SELECT 
    `sales`.`sdate`, `sales`.`amount`
FROM
    `shop`.`sales`
WHERE
    `sales`.`sdate` BETWEEN '2024-09-12' AND '2024-09-17';
    
SELECT 
    `salespeaple`.`sname`,
    `salespeaple`.`city`,
    `salespeaple`.`comm`
FROM
    `shop`.`salespeaple`
WHERE
    `salespeaple`.`comm` BETWEEN 0.09 AND 0.11;

/*Исключение границ диапазона при помощи комбинации BETWEEN и IN*/ 

SELECT 
    `salespeaple`.`sname`,
    `salespeaple`.`city`,
    `salespeaple`.`comm`
FROM
    `shop`.`salespeaple`
WHERE
    `salespeaple`.`comm` BETWEEN 0.09 AND 0.11
        AND NOT `salespeaple`.`comm` IN (0.09 , 0.11);  

	SELECT 
	    `customers`.`cname`,
	    `customers`.`city`,
	    `customers`.`rating`,
	    `customers`.`snum`
	FROM
	    `shop`.`customers`
	WHERE
	    `customers`.`city` BETWEEN 'Н' AND 'Омск';
	    
	/* Оператор LIKE */
/* '%' - любое количество любых символов, '_' - один любой символ*/

SELECT 
    `customers`.`cnum`,
    `customers`.`cname`,
    `customers`.`city`,
    `customers`.`rating`,
    `customers`.`snum`
FROM
    `shop`.`customers`
WHERE
    city LIKE 'Н%';

SELECT 
    `customers`.`cnum`,
    `customers`.`cname`,
    `customers`.`city`,
    `customers`.`rating`,
    `customers`.`snum`
FROM
    `shop`.`customers`
WHERE
    city LIKE 'Нов_%';

SELECT 
    `customers`.`cnum`,
    `customers`.`cname`,
    `customers`.`city`,
    `customers`.`rating`,
    `customers`.`snum`
FROM
    `shop`.`customers`
WHERE
    cname LIKE '%ул%';   

/* Применение символов исключения при помощи escape */    
SELECT 
    `customers`.`cnum`,
    `customers`.`cname`,
    `customers`.`city`,
    `customers`.`rating`,
    `customers`.`snum`
FROM
    `shop`.`customers`
WHERE
    cname LIKE '%/%%' escape '/';  

/* Применение символов исключения при помощи escape */    
SELECT 
    `customers`.`cnum`,
    `customers`.`cname`,
    `customers`.`city`,
    `customers`.`rating`,
    `customers`.`snum`
FROM
    `shop`.`customers`
WHERE
    cname LIKE '%#%' escape '#';   
    
/* Оператор IS NULL */
SELECT 
    `customers`.`cnum`,
    `customers`.`cname`,
    `customers`.`city`,
    `customers`.`rating`,
    `customers`.`snum`
FROM
    `shop`.`customers`
WHERE
    snum IS NULL;   
    
SELECT 
    `customers`.`cnum`,
    `customers`.`cname`,
    `customers`.`city`,
    `customers`.`rating`,
    `customers`.`snum`
FROM
    `shop`.`customers`
WHERE
    snum IS NOT NULL;
 
/* В MySQL не выполняется эквивалентный предыдущему запрос с условием NOT IS NULL 
SELECT 
    `customers`.`cnum`,
    `customers`.`cname`,
    `customers`.`city`,
    `customers`.`rating`,
    `customers`.`snum`
FROM
    `shop`.`customers`
WHERE
    snum  NOT IS NULL;   
*/

SELECT 
    `customers`.`cnum`,
    `customers`.`cname`,
    `customers`.`city`,
    `customers`.`rating`,
    `customers`.`snum`
FROM
    `shop`.`customers`
WHERE
    NOT snum IS NULL;   
    
/* NOT с IN */
SELECT 
    `customers`.`cname`,
    `customers`.`city`,
    `customers`.`rating`,
    `customers`.`snum`
FROM
    `shop`.`customers`
WHERE
    `customers`.`city` NOT IN ('Новосибирск' , 'Омск');
    
SELECT 
    `customers`.`cname`,
    `customers`.`city`,
    `customers`.`rating`,
    `customers`.`snum`
FROM
    `shop`.`customers`
WHERE
    NOT `customers`.`city` IN ('Новосибирск' , 'Омск');

/* Комбинирование IS NULL с другими операторами отбора */
SELECT 
    `customers`.`cname`,
    `customers`.`city`,
    `customers`.`rating`,
    `customers`.`snum`
FROM
    `shop`.`customers`
WHERE
   (NOT city LIKE 'Нов%') OR (NOT `customers`.`rating` IS NULL);
    
SELECT 
    `customers`.`cname`,
    `customers`.`city`,
    `customers`.`rating`,
    `customers`.`snum`
FROM
    `shop`.`customers`
WHERE
    NOT (city LIKE 'Нов%' AND `customers`.`rating` IS NULL);
    
/* Агрегатные функции */
/* COUNT(), SUM(), AVG(), MAX(), MIN() */

/* Подсчёт суммы чисел по определённому столбцу */
SELECT 
    SUM(amount)
FROM
    sales;
    
   /* Подсчёт количества строк за определённый период*/ 
SELECT 
    COUNT(*)
FROM
    sales
WHERE
    sdate > '2024-09-01'
        AND sdate <= '2024-09-30';

	/* Вычисление среднего значения за определённый период*/
SELECT 
    AVG(amount)
FROM
    sales
WHERE
    sdate > '2024-09-01'
        AND sdate <= '2024-09-30';
	        
	SELECT 
	    AVG(sdate)
	FROM
	    sales
	WHERE
	    sdate > '2024-09-15'
	        AND sdate < '2024-10-01';

		/* При использовании distinct внутри функции count() подсчитываются только уникальные значения в столбце*/
SELECT 
    COUNT(distinct city)
FROM
    customers;

/*NULL-значения игнорируются при подсчёте значений по одному столбцу*/
SELECT 
    COUNT(rating)
FROM
    customers;    

/*Функции MAX() и MIN() работают со строковыми значениями, ориентируясь на алфавитный порядок*/
SELECT 
    MIN(cname)
FROM
    customers;

/*Группировка максимальных значений продаж по каждому продавцу*/    
SELECT 
    snum, MAX(amount)
FROM
    sales
GROUP BY snum;

/*Группировка значений по нескольким столбцам*/
SELECT 
    snum, sdate, MAX(amount)
FROM
    sales
GROUP BY snum , sdate;

/* Отбор значений после группировки осуществляется с помощью специального выражения HAVING*/
/* WHERE отбирает строки до группировки и не может содержать агрегатные функции */
SELECT 
    snum, sdate, MAX(amount)
FROM
    sales
GROUP BY snum, sdate
HAVING MAX(amount) > 1000;

/* HAVING можно использовать только для сгруппированных столбцов.*/
SELECT 
    snum, sdate, MAX(amount)
FROM
    sales
GROUP BY snum, sdate
HAVING sdate > '2024-09-15';

/* Если в группировке не используется поле, по которому нужно сделать отбор, то используется только выражение WHERE */
SELECT 
    snum, MAX(amount)
FROM
    sales
WHERE
    sdate > '2024-09-15'
GROUP BY snum;

/* Использование IN с HAVING */
SELECT 
    snum, MAX(amount)
FROM
    sales
WHERE
    sdate > '2024-09-15'
GROUP BY snum
HAVING snum IN (101 , 106);
