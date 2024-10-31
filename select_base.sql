/*Использование языка SQL для выборки информации из таблиц*/

/* Простая выборка из таблицы */
SELECT 
    `salespeaple`.`sname`,
    `salespeaple`.`city`,
    `salespeaple`.`comm`
FROM `shop`.`salespeaple`;

/* Отбор без повторяющихся значений */
SELECT distinct
`sales`.`sdate`, `sales`.`snum`
FROM `shop`.`sales`;

/* Отбор по условию (предложение where) */
/* Отбор продавцов из опредлённых городов */
SELECT 
    `salespeaple`.`sname`,
    `salespeaple`.`comm`
FROM
    `shop`.`salespeaple`
WHERE
    `salespeaple`.`city` = 'Новосибирск' OR `salespeaple`.`city` = 'Тверь';
    
/*Отбор покупателей по определённому рейтингу*/
SELECT 
    `customers`.`cname`,
    `customers`.`city`
FROM
    `shop`.`customers`
WHERE
   `customers`.`rating`>200;
   
SELECT 
    `customers`.`cname`,
    `customers`.`city`
FROM
    `shop`.`customers`
WHERE
   `customers`.`rating`>=200;
   
SELECT 
    `customers`.`cname`,
    `customers`.`city`
FROM
    `shop`.`customers`
WHERE
   `customers`.`rating`<> 200;
   
SELECT 
    `customers`.`cname`,
    `customers`.`city`
FROM
    `shop`.`customers`
WHERE
   NOT `customers`.`rating`=200;
   
/*Применение условий отбора для NULL-значений*/
SELECT 
    `customers`.`cname`,
    `customers`.`city`
FROM
    `shop`.`customers`
WHERE
   `customers`.`rating` <> 200 OR  `customers`.`rating` = 200;
/*NULL-значения (неизвестный результат сравнения) не выводятся в результат отбора*/

/*Составные условия с логическими операторами OR, AND, NOT*/
SELECT 
    `customers`.`cname`,
    `customers`.`city`
FROM
    `shop`.`customers`
WHERE
   `customers`.`city` = 'Санкт-Петербург' AND NOT `customers`.`rating` > 200;
   
SELECT 
    `customers`.`cname`,
    `customers`.`city`
FROM
    `shop`.`customers`
WHERE
   NOT `customers`.`city` = 'Санкт-Петербург' AND NOT `customers`.`rating` > 200;

SELECT 
    `customers`.`cname`,
    `customers`.`city`
FROM
    `shop`.`customers`
WHERE
   NOT (`customers`.`city` = 'Санкт-Петербург' AND `customers`.`rating` > 200);

/* Пример отбора по датам */
SELECT 
    `sales`.`snum`,
    `sales`.`cnum`,
    `sales`.`sdate`,
    `sales`.`amount`
FROM
    `shop`.`sales`
WHERE
    (`sales`.`sdate` > '2024-08-31'
	        AND `sales`.`sdate` < '2024-10-01')
	        AND (NOT (`sales`.`sdate` > '2024-09-12'
				        AND `sales`.`sdate` < '2024-09-16'))
			        AND NOT cnum = 203;
				        
				SELECT 
				    `sales`.`snum`,
				    `sales`.`cnum`,
				    `sales`.`sdate`,
				    `sales`.`amount`
				FROM
				    `shop`.`sales`
				WHERE
				    (`sales`.`sdate` > '2024-08-31'
					        AND `sales`.`sdate` < '2024-10-01')
					        AND (NOT (`sales`.`sdate` > '2024-09-12'
								        AND `sales`.`sdate` < '2024-09-16'))
							        AND NOT cnum = 203 OR (cnum=203) AND (`sales`.`sdate` > '2024-09-30'
									        AND `sales`.`sdate` <= '2024-10-31');

