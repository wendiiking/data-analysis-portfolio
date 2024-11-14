Create table Value_customer
(Customer_ID int primary key,
Customer_name varchar(20),
Phone_number varchar(11),
Address varchar(20));

Alter table Value_customer
Add Date_birth varchar(20);

Create table Value_ledger
(Sales_ID int primary key,
Order_date varchar(15),
Item_type varchar(15),
Quantity int,
Amount varchar(15),
Total_amount varchar(15));

Alter table Value_ledger
Add Customer_ID int;

insert into Value_customer values
(2001,'Seun',09079864378,'2 Ogun Street','23 Sept'),
(2002,'Obi',07086655479,'13 Moore Road','11 Aug'),
(2003,'Nneka',09003337899,'15 Lekki Avenue','3 Jan'),
(2004,'Favour',08082289009,'2 Terra Street','30 Jun');

select * from Value_customer;


insert into Value_ledger values
(3151,'16 Aug','buckets',2,50000,10000,2004),
(3152,'16 Aug','buckets',12,50000,600000,2003),
(3153,'17 Aug','gallons',20,14000,280000,2004),
(3154,'17 Aug','buckets',25,50000,1250000,2002),
(3155,'18 Aug','gallons',30,14000,420000,2001);

select * from Value_ledger;

update Value_ledger
set Total_amount = 100000
where sales_ID = 3151;