/* Соединение таблиц */
/* "Естественное" соединение таблиц customers и salepeople при помощи ссылки из поля `customers`.`snum` на первичный ключ `salespeaple`.`snum`*/
SELECT 
    cname as 'Фамилия покупателя', sname as 'Фамилия продавца'
FROM
    shop.customers,
    `shop`.`salespeaple`
WHERE
    `customers`.`snum` = `salespeaple`.`snum`;
    
    /*"Естественное" соединение трёх таблиц*/
SELECT 
    `customers`.`cname`,
    `salespeaple`.`sname`,
    `sales`.`sdate`,
    `sales`.`amount`
FROM
    shop.sales,
    shop.customers,
    `shop`.`salespeaple`
WHERE
    `sales`.`snum` = `salespeaple`.`snum` and sales.cnum=customers.cnum;

/* "Неестественное" соединение двух таблиц (без использования ключевых полей) */
SELECT 
    `customers`.`cname`,
    customers.city,
    `salespeaple`.`sname`,
    salespeaple.city
FROM
    customers,
    salespeaple
WHERE
    customers.city = salespeaple.city;
    
/* Составные условия при соединении */
SELECT 
    `customers`.`cname`,
    customers.city,
    `salespeaple`.`sname`,
    salespeaple.city
FROM
    customers,
    salespeaple
WHERE
    customers.city = salespeaple.city
        AND customers.city = 'Новосибирск';

	/* Составные условия при соединении */
SELECT 
    `customers`.`cname`,
    customers.city,
    `salespeaple`.`sname`,
    salespeaple.city
FROM
    customers,
    salespeaple
WHERE
    customers.city = salespeaple.city
        AND customers.city IN ('Новосибирск', 'Санкт-Петербург');
	        
	/* Использование неравенств при соединениях */
SELECT 
    `customers`.`cname`,
    customers.city,
    `salespeaple`.`sname`,
    salespeaple.city
FROM
    customers,
    salespeaple
WHERE
    customers.city < salespeaple.city
        AND rating = 200;
	        
	/* Использование псевдонимов (alias) для таблиц*/
/* Соединение одной таблицы с собой */
SELECT 
    `first`.cname, `second`.cname, `first`.rating
FROM
    customers `first`,
    customers `second`
WHERE
    `first`.rating = `second`.rating and `first`.cname < `second`.cname;

/* Псеводнимы для разных таблиц */    
  SELECT 
    b.cname as 'Покупатель', a.sname as 'Продавец', b.rating as 'Рейтинг покупателя'
FROM
    salespeaple a,
    customers b
WHERE
    a.snum = b.snum;  
    
/* Самосоединение для таблицы с циклической зависимостью */
SELECT 
    f.empno, f.empname, s.empname
FROM
    employee f,
    employee s
WHERE
    f.manager = s.empno;
