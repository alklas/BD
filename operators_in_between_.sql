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
