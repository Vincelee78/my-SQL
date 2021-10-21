/* q1 */
select FirstName, LastName, Title from Employee
where Title = "Sales Support Agent";

/* q2 */
SELECT LastName, FirstName, HireDate FROM
 Employee
WHERE YEAR(HireDate) BETWEEN 2002 AND 2003;

/* q3 */
SELECT * from Artist WHERE
Name LIKE "%metal%";

/* q4 */
SELECT * FROM Employee WHERE Title LIKE "%sales%";

/* q5 */
SELECT Track.Name, Genre.Name FROM Track
    JOIN Genre ON Track.GenreId = Genre.GenreId
    WHERE Genre.Name = "Easy Listening";

/* q6 */
SELECT Track.Name, Album.Title, Genre.Name FROM
    Track JOIN Album ON Track.AlbumId = Album.AlbumId
          JOIN Genre ON Track.GenreId = Genre.GenreId
          LIMIT 10 OFFSET 10;

/* q7 */
SELECT BillingCountry, AVG(Total) FROM Invoice
GROUP BY BillingCountry;

/* q8 */
SELECT BillingCountry, AVG(Total) as "AverageTotal" FROM Invoice
GROUP BY BillingCountry
HAVING AverageTotal > 5.5;

/* q9 */
SELECT AVG(Total), CustomerId FROM Invoice WHERE
    CustomerId IN (SELECT CustomerId FROM Invoice  
                   GROUP BY CustomerId
                   HAVING SUM(Total) > 10) AND
    BillingCountry LIKE "%Germany%"
    GROUP BY CustomerId;

SELECT CustomerId, BillingCountry, AVG(Total)
FROM Invoice
WHERE BillingCountry = "Germany"
GROUP BY CustomerId
HAVING SUM(Total) > 10;

/* Q10 */
SELECT Album.AlbumId, Album.Title, AVG(Track.MilliSeconds), Genre.Name
FROM Track JOIN Album ON Track.AlbumId = Album.AlbumId
           JOIN Genre ON Track.GenreId = Genre.GenreId
WHERE Genre.Name = "Jazz"
GROUP BY Album.AlbumId, Album.Title, Genre.Name;

/* FYI, only_full_group_by */
/* https://stackoverflow.com/questions/41887460/select-list-is-not-in-group-by-clause-and-contains-nonaggregated-column-inc */


create table parents (
    parent_id int unsigned auto_increment primary key,
    first_name varchar(200) not null,
    last_name varchar(200) not null
) engine = innodb;


insert into parents (first_name, last_name) values ('Lin', 'James');


insert into parents (first_name, last_name) values 
    ('Lin', 'James'),
    ('Lee', 'Larry');
    

-- select from <table name>
select * from parents;

update parents set first_name='bond', last_name='james' where parent_id=1;

delete from parents where parent_id=1;

create table stylists (
    stylists_id smallint unsigned auto_increment primary key,
    stylist_name varchar(80) not null,
    designation varchar(30) not null
) engine = innodb;

show tables;

create table appointments (
    appointment_id int unsigned auto_increment primary key,
    date_time datetime not null,
    venue varchar(100) not null,
    points mediumint not null
) engine = innodb;

create database hair_saloon;

describe stylists;

insert into stylists (stylist_name, designation) values 
    ('James', 'Senior stylist'),
    ('Larry', 'Junior stylist');


    select * from stylists;
    select * from appointments;


    insert into appointments (date_time, venue, points) values 
    ('2021-09-21', 'Tanglin', 21),
    ('2021-03-21', 'Orachard', 200);


    SELECT city, phone, country FROM offices;

    SELECT * FROM orders where comments like '%FedEx%';

    SELECT contactFirstName,contactLastName,customerName FROM customers order by customerName DESC;

    SELECT * FROM employees where jobTitle='sales rep' and officeCode in (1,2,3) and (firstName like "%son%" or LastName like "%son%");

    SELECT customerName,contactFirstName,contactLastName,customerNumber FROM customers where customerNumber=124;

    SELECT productName,PriceEach, orderNumber,quantityOrdered FROM orderdetails join products on orderdetails.productCode=products.productCode;

    SELECT amount,customerName,country FROM customers join payments on customers.customerNumber=payments.customerNumber where country='USA';

SELECT state,country,count(employeeNumber) FROM employees join offices on employees.officeCode=offices.officeCode where country='USA' group by state;

mysql -u root

SELECT FirstName, LastName from Employee where Title='Sales Support Agent';

-- SELECT Title from Employee;

-- SELECT HireDate from Employee;

SELECT FirstName, LastName,HireDate from Employee where Year(HireDate)>=2002 and Year(HireDate)<=2003;

SELECT * from Artist where Name like '%Metal%';

SELECT * from Employee where Title like '%sales%';

SELECT Name from Genre where Name like '%easy listening%';(change)

offset 10 is to skip the first 10() 

SELECT Album.Title,Track.Name,Genre.Name from Genre join Track on Genre.GenreId=Track.GenreId join Album on Album.AlbumId=Track.AlbumId limit 10;

SELECT Title from Album;

describe Album;
describe Track;
describe Invoice;
show tables;
describe Customer;

SELECT AVG(Total),BillingCountry from Invoice group by BillingCountry;
SELECT AVG(Total) ,BillingCountry from Invoice group by BillingCountry having AVG(Total)>5.5;
SELECT AVG(Total),customerId,BillingCountry,SUM(Total) from Invoice where BillingCountry='Germany' group by customerId having SUM(Total)>10;

-- whenever if use (group by) need to include the section who used group by after select
-- whnever if use group by is used in aggregate section such as AVG or SUM

-- importing the database sakila table
mysql -u root< sakila-table.mysql
