--Lynn Tran & Shanklein Maruzandi Maninang
--041102082 & 

--create table for customers
CREATE TABLE customers
(
	CustomerID	INTEGER			CONSTRAINT pk_customerid	PRIMARY KEY,
	FirstName	VARCHAR(45)		CONSTRAINT nn_firstname		NOT NULL,
	LastName	VARCHAR(45)		CONSTRAINT nn_lastname		NOT NULL,
	Phone		VARCHAR(45)		CONSTRAINT nn_phone			NOT NULL,
	Address		VARCHAR(45)		CONSTRAINT nn_address		NOT NULL,
	City		VARCHAR(45)		CONSTRAINT nn_city			NOT NULL,
	Province	CHAR(3)			CONSTRAINT nn_province		NOT NULL,
	PostalCode	CHAR(6)			CONSTRAINT nn_postalcode	NOT NULL
);

--create table for orders
CREATE TABLE orders
(
	OrderID		INTEGER			CONSTRAINT pk_orderid		PRIMARY KEY,
	OrderDate 	TIMESTAMP		CONSTRAINT nn_timestamp		NOT NULL,
	PickUpMethod VARCHAR(15)	CONSTRAINT nn_pickupmethod	NOT NULL,
	PaymentType VARCHAR(15)		CONSTRAINT nn_paymenttype	NOT NULL,
	Quantity	INT 			CONSTRAINT nn_quantity		NOT NULL,
	TotalPrice	INT 			CONSTRAINT nn_totalprice	NOT NULL,
	CustomerID	INTEGER			CONSTRAINT fk_customerID	REFERENCES customers(CustomerID)
);

--create table for pizza
CREATE TABLE pizza
(
	PizzaID		INTEGER			CONSTRAINT pk_pizzaid		PRIMARY KEY,
	PizzaName	VARCHAR(45)		CONSTRAINT nn_pizzaname		NOT NULL,
	PizzaSize	VARCHAR(10)		CONSTRAINT nn_pizzasize		NOT NULL,
	Price		INT				CONSTRAINT nn_price			NOT NULL,
	IngredientsID	INTEGER		CONSTRAINT fk_ingredientsid	REFERENCES Ingredients(IngredientsID)
);

--create table for pasta
CREATE TABLE pasta
(
	PastaID		INTEGER			CONSTRAINT pk_pastaid		PRIMARY KEY,
	PastaName	VARCHAR(45)		CONSTRAINT nn_pastaname		NOT NULL,
	Price		INT				CONSTRAINT nn_price			NOT NULL,
	IngredientsID	INTEGER		CONSTRAINT fk_ingredientsid	REFERENCES Ingredients(IngredientsID)
);

--create table for chicken
CREATE TABLE chicken
(
	ChickenID	INTEGER			CONSTRAINT pk_chickenid		PRIMARY KEY,
	ChickenName	VARCHAR(45)		CONSTRAINT nn_chickenname 	NOT NULL,
	Price		INT				CONSTRAINT nn_price			NOT NULL
);

--create table for sandwiches
CREATE TABLE sandwiches
(
	SandwichID	INTEGER			CONSTRAINT pk_sandwichid	PRIMARY KEY,
	SandwichName	VARCHAR(45)	CONSTRAINT nn_sandwichname	NOT NULL,
	Price		INT 			CONSTRAINT nn_price			NOT NULL
);

--create table for subs
CREATE TABLE subs
(
	SubID		INTEGER			CONSTRAINT pk_subid			PRIMARY KEY,
	SubName		VARCHAR(45)		CONSTRAINT nn_subname		NOT NULL,
	SubSize		VARCHAR(10)		CONSTRAINT nn_subsize		NOT NULL,
	Price		INT				CONSTRAINT nn_price			NOT NULL
);

--create table for salads
CREATE TABLE salads
(
	SaladID		INTEGER			CONSTRAINT pk_saladid		PRIMARY KEY,
	SaladName	VARCHAR(45)		CONSTRAINT nn_saladname		NOT NULL,
	SaladSize	VARCHAR(10)		CONSTRAINT nn_saladsize		NOT NULL,
	Price		INT				CONSTRAINT nn_price			NOT NULL,
	IngredientsID	INTEGER		CONSTRAINT fk_ingredientsid	REFERENCES Ingredients(IngredientsID)
);
--create table for side orders
CREATE TABLE sideorders
(
	SidesID		INTEGER			CONSTRAINT pk_sidesid		PRIMARY KEY,
	SidesName	VARCHAR(45)		CONSTRAINT nn_sidesname		NOT NULL,
	SidesSize	VARCHAR(10)		CONSTRAINT nn_sidessize		NOT NULL,
	Price		INT				CONSTRAINT nn_price			NOT NULL
);

--create table for ingredients
CREATE TABLE ingredients
(
	IngredientsID	INTEGER		CONSTRAINT pk_ingredientsid PRIMARY KEY,
	Ingredients		VARCHAR(45)	CONSTRAINT nn_ingredients	NOT NULL,
	Price			INT			CONSTRAINT nn_price			NOT NULL
);

--create table for total price
CREATE TABLE totalPrice
(
	Tax			INTEGER		CONSTRAINT 	nn_tax		NOT NULL,
	PizzaID	INTEGER		CONSTRAINT fk_ingredientsid	REFERENCES Ingredients(IngredientsID),
	SaladID	INTEGER		CONSTRAINT fk_ingredientsid	REFERENCES Ingredients(IngredientsID),
	SidesID	INTEGER		CONSTRAINT fk_ingredientsid	REFERENCES Ingredients(IngredientsID),
	SubID	INTEGER		CONSTRAINT fk_ingredientsid	REFERENCES Ingredients(IngredientsID),
	PastaID	INTEGER		CONSTRAINT fk_ingredientsid	REFERENCES Ingredients(IngredientsID)
	ChickenID	INTEGER		CONSTRAINT fk_ingredientsid	REFERENCES Ingredients(IngredientsID)
	SandwichID	INTEGER		CONSTRAINT fk_ingredientsid	REFERENCES Ingredients(IngredientsID)
	IngredientsID	INTEGER		CONSTRAINT fk_ingredientsid	REFERENCES Ingredients(IngredientsID),
	
	Description	VARCHAR(45)	CONSTRAINT	nn_description 		NOT NULL,
	Price		INTEGER		,
	PTypeID		INTEGER		CONSTRAINT 	fk_ptypeID		REFERENCES ProductType(PTypeID)
);

--Data Manipulation

--insert customer data
SELECT * FROM customers;

INSERT INTO customers(CustomerID, CName, Email, Phone, Address, City, Province, PostalCode) VALUES (0001, 'Lynn Tran', 'ltran36@gmail.com', '613-894-8058', '10 Deerfield Dr.', 'Nepean', 'ON', 'K2G3R7');
INSERT INTO customers(CustomerID, CName, Email, Phone, Address, City, Province, PostalCode) VALUES (0002, 'Shan Maninang', 'shanmaninag@gmail.com', '613-854-0058', '11 Deerfield Dr.', 'Nepean', 'ON', 'K2G3R7');
INSERT INTO customers(CustomerID, CName, Email, Phone, Address, City, Province, PostalCode) VALUES (0003, 'Emmanuel Hermanez', 'emanhermanez@gmail.com', '613-854-8758', '16 Deerfield Dr.', 'Nepean', 'ON', 'K2G3R7');
INSERT INTO customers(CustomerID, CName, Email, Phone, Address, City, Province, PostalCode) VALUES (0004, 'Lena Thang', 'lthang@gmail.com', '613-854-8050', '17 Deerfield Dr.', 'Nepean', 'ON', 'K2G3R7');
INSERT INTO customers(CustomerID, CName, Email, Phone, Address, City, Province, PostalCode) VALUES (0005, 'Diana Yu', 'dianay@gmail.com', '613-856-8058', '13 Deerfield Dr.', 'Nepean', 'ON', 'K2G3R7');

--insert data for product types
SELECT * FROM productType;

INSERT INTO productType VALUES (1,'Software');
INSERT INTO productType VALUES (2,'Hardware');
INSERT INTO productType VALUES (3,'Service');

--insert product data
SELECT * FROM products;

INSERT INTO products(ProdID, PName, Description, PTypeID) VALUES (100,'Windows', 'used on most computers', 1);
INSERT INTO products(ProdID, PName, Description, PTypeID) VALUES (101, 'Visual Studio', 'a software', 1);
INSERT INTO products(ProdID, PName, Description, PTypeID) VALUES (102,'Mouse', 'used to click things on your computer', 2);
INSERT INTO products(ProdID, PName, Description, PTypeID) VALUES (103,'Laptop Clean Up', 'cleaning service', 3);
INSERT INTO products(ProdID, PName, Description, PTypeID) VALUES (104, 'Rosy', 'a booking software', 1);
INSERT INTO products(ProdID, PName, Description, PTypeID) VALUES (105,'Keyboard', 'used to type things onto your computer', 2);

--update customer phone and postal code
SELECT * FROM customers;

UPDATE customers
SET Phone = '647-284-6899', PostalCode = 'L6R0K5' 
WHERE CustomerID = 0001;

SELECT * FROM customers;

Update customers
SET Phone = '647-284-6800', PostalCode = 'L0P1B9'
WHERE CustomerID = 0003;

--Update PTypeID
SELECT * FROM products;

Update products
SET PTypeID = 3
WHERE ProdID = 100;

SELECT * FROM products;

Update products
SET PTypeID = 3
WHERE ProdID = 101;

SELECT * FROM products;

Update products
SET PTypeID = 3
WHERE ProdID = 104;

--delete product type 'software'
SELECT * FROM productType;

DELETE from productType WHERE PTypeID = 1;