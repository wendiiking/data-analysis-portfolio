create table customer_information
(customer_ID int primary key,
customer_name varchar(20),
address varchar(50),
phone_number varchar(11));

alter table customer_information
add column title varchar(5);

insert into customer_information values
(0034,'Nneka','2 Lekki peninsula',09078655368,'Miss'),
(0035,'Alfred','1321 Chevron drive',07909806637,'Mr'),
(0036,'Sunita','Z10 close 6 Avenue',08010086536,'Miss'),
(0037,'Bimbo','44 Zeeworld Boulevard',09095874380,'Mrs'),
(0038,'Abishag','010 Purple estate',08097263279,'Miss');

select * from customer_information;

create table sales_record
(sales_ID int primary key,
invoice_date varchar(20),
customer_name varchar(20),
item varchar(20),
quantity varchar(11),
price varchar(20),
total_amount varchar(20));

alter table sales_record
add column customer_ID int;

insert into sales_record values
(4276,'2024-08-12','Mrs Bimbo','Cupcake',6,500,30000,0037),
(4277,'2024-08-12','Mrs Bimbo','Ice cream',2,2000,400,0037),
(4278,'2024-08-15','Miss Nneka','Meatpie',6,1000,6000,0034),
(4279,'2024-08-17','Mr Alfred','Velvet Cake',1,50000,50000,0035),
(4280,'2024-08-17','Miss Sunita','Sharwama',3,2500,7500,0036);

select * from sales_record;

update sales_record
set Total_amount = 4000
where sales_ID = 4277;