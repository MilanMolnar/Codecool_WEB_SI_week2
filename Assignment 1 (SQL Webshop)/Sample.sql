--Dropping table if it exists
DROP TABLE IF EXISTS CustomerOrderDetail;
DROP TABLE IF EXISTS CustomerOrder;
DROP TABLE IF EXISTS Customer;
DROP TABLE IF EXISTS Product;

--Creating Tables
CREATE TABLE Product(
	productID SERIAL PRIMARY KEY,
	productName TEXT,
	supplierID TEXT,
	categoryID TEXT,
	quantityPerUnit INT,
	unitPrice TEXT,
	unitsInStock BOOLEAN,
	unitsOnOrder BOOLEAN,
	reorderLevel INT,
	discounted BOOLEAN
);

CREATE TABLE Customer(
	customerID SERIAL PRIMARY KEY,
	companyName TEXT,
	contactName TEXT,
	contactTitle TEXT,
	address TEXT,
	city TEXT,
	region TEXT,
	postalCode TEXT,
	country TEXT,
	phone TEXT,
	fax TEXT
);

CREATE TABLE CustomerOrder(
	orderID SERIAL PRIMARY KEY,
	customerID INT,
	FOREIGN KEY (customerID) REFERENCES Customer(customerID),
	employeeID TEXT,
	orderDate TEXT,
	requiredDate TEXT,
	shippedDate TEXT,
	shipVia TEXT,
	freight BOOLEAN,
	shipAddress TEXT,
	shipCity TEXT,
	shipRegion TEXT,
	shipPostalCode INT,
	shipCountry TEXT
);

CREATE TABLE CustomerOrderDetail(
	orderID INT REFERENCES CustomerOrder(orderID),
	productID INT REFERENCES Product(productID),
	unitPrice TEXT,
	quantity INT,
	discount INT
);

--Insert mock data into tables
INSERT INTO Product (productName, supplierID, categoryID, quantityPerUnit, unitPrice, unitsInStock, unitsOnOrder, reorderLevel, discounted) values ('Yogurt - Plain', '1e47e5af-3368-4908-b9d7-db5f4eaf575b', '4b80651a-8d1a-4d13-9c5c-ef436ff20bf4', 87, '$3.93', true, false, 83, true);
INSERT INTO Product (productName, supplierID, categoryID, quantityPerUnit, unitPrice, unitsInStock, unitsOnOrder, reorderLevel, discounted) values ('Chicken - Whole', '4e4172c8-42fd-437f-b896-4745aeb739c9', '22deb7ff-dbd8-41dd-a8f4-7db8e725361e', 34, '$3.33', false, false, 54, false);
INSERT INTO Product (productName, supplierID, categoryID, quantityPerUnit, unitPrice, unitsInStock, unitsOnOrder, reorderLevel, discounted) values ('Wine - Red, Gamay Noir', 'd1b6071f-552f-470e-b5fe-69016ee7b4e1', '5959a7e7-c472-4547-9f77-f64eed05c535', 94, '$8.60', true, true, 70, true);
INSERT INTO Product (productName, supplierID, categoryID, quantityPerUnit, unitPrice, unitsInStock, unitsOnOrder, reorderLevel, discounted) values ('Wine - Gato Negro Cabernet', '9ab5878e-3058-4b49-ba38-168a7227c0a4', '9a476e00-49da-4d12-8eee-29ce724bbe87', 41, '$4.68', true, false, 60, false);
INSERT INTO Product (productName, supplierID, categoryID, quantityPerUnit, unitPrice, unitsInStock, unitsOnOrder, reorderLevel, discounted) values ('Pork - Shoulder', '8f569a1e-d529-47bd-ba81-e1f2ef4b1859', '6a839caf-2ec0-414d-9668-03c8d30c4b5f', 98, '$9.59', true, true, 48, true);
INSERT INTO Product (productName, supplierID, categoryID, quantityPerUnit, unitPrice, unitsInStock, unitsOnOrder, reorderLevel, discounted) values ('Creamers - 10%', 'f742a543-950b-4c5d-85c7-16d478056b00', '063eb8f8-9485-41d5-8d64-39633d1f08d8', 59, '$2.40', false, true, 51, false);
INSERT INTO Product (productName, supplierID, categoryID, quantityPerUnit, unitPrice, unitsInStock, unitsOnOrder, reorderLevel, discounted) values ('Lid - 0090 Clear', '8fb73b42-4343-46e0-9a6f-07afaf555bef', '2148111c-29bc-4827-a85b-8f75459c74d2', 52, '$3.54', false, false, 60, false);
INSERT INTO Product (productName, supplierID, categoryID, quantityPerUnit, unitPrice, unitsInStock, unitsOnOrder, reorderLevel, discounted) values ('Rum - Cream, Amarula', 'adce2463-58a2-4325-afd8-ff7c661146c5', '2a6b0e65-fd53-46a8-925d-dc63c58ba995', 80, '$4.85', false, true, 34, true);
INSERT INTO Product (productName, supplierID, categoryID, quantityPerUnit, unitPrice, unitsInStock, unitsOnOrder, reorderLevel, discounted) values ('Chilli Paste, Ginger Garlic', '22b1afc8-7243-4127-b87e-70f5c4290e74', '222e53ae-ca95-4c40-898b-1acef22ce6de', 84, '$5.37', true, false, 8, true);
INSERT INTO Product (productName, supplierID, categoryID, quantityPerUnit, unitPrice, unitsInStock, unitsOnOrder, reorderLevel, discounted) values ('Island Oasis - Cappucino Mix', '8efcc2e1-812a-4982-90c2-ee77268524fb', 'ccb69bfc-00fe-48b4-945f-ec52f524b0dc', 22, '$7.18', true, false, 31, true);

INSERT INTO Customer (companyName, contactName, contactTitle, address, city, region, postalCode, country, phone, fax) values ('Yakitri', 'Kristi Arnald', 'Help Desk Operator', '97 Twin Pines Court', 'Papër', 'AL', null, 'Albania', '655-355-8016', '7272199868');
INSERT INTO Customer (companyName, contactName, contactTitle, address, city, region, postalCode, country, phone, fax) values ('Dazzlesphere', 'Howie Byrde', 'Analog Circuit Design manager', '7307 Hermina Plaza', 'Tagkawayan Sabang', 'PH', '4321', 'Philippines', '500-578-8415', '6838299788');
INSERT INTO Customer (companyName, contactName, contactTitle, address, city, region, postalCode, country, phone, fax) values ('Yotz', 'Diarmid Howler', 'VP Sales', '70998 Steensland Road', 'Dalamdesa Kalapadua', 'ID', null, 'Indonesia', '797-351-8779', '4276271119');
INSERT INTO Customer (companyName, contactName, contactTitle, address, city, region, postalCode, country, phone, fax) values ('Gevee', 'Cherish Gowling', 'Librarian', '314 Claremont Point', 'Conde', 'PT', '4815-019', 'Portugal', '516-537-3427', '9924606944');
INSERT INTO Customer (companyName, contactName, contactTitle, address, city, region, postalCode, country, phone, fax) values ('Feedfire', 'Rochette Sargint', 'Environmental Tech', '34119 Pond Hill', 'Giade', 'NG', null, 'Nigeria', '647-365-5039', '7025672840');
INSERT INTO Customer (companyName, contactName, contactTitle, address, city, region, postalCode, country, phone, fax) values ('Linklinks', 'Steffi Plumstead', 'Technical Writer', '13364 Barnett Alley', 'Sotnikovskoye', 'RU', '356403', 'Russia', '242-773-0719', '2689626334');
INSERT INTO Customer (companyName, contactName, contactTitle, address, city, region, postalCode, country, phone, fax) values ('Skinder', 'Granthem Garfoot', 'Chemical Engineer', '311 Browning Hill', 'Blagoveshchensk', 'RU', '675029', 'Russia', '628-674-1608', '3149142511');

INSERT INTO CustomerOrder (employeeID, orderDate, requiredDate, shippedDate, shipVia, freight, shipAddress, shipCity, shipRegion, shipPostalCode, shipCountry) values ('a72e13c7-b207-4fbc-be81-5113da78c1cd', '7/1/2019', '10/26/2019', '12/29/2019', 'Cirrus', false, '9149 Packers Court', 'Prosyana', 'UA', null, 'Ukraine');
INSERT INTO CustomerOrder (employeeID, orderDate, requiredDate, shippedDate, shipVia, freight, shipAddress, shipCity, shipRegion, shipPostalCode, shipCountry) values ('f592f910-1bbd-4f42-8b33-b8fd87641ec6', '1/3/2020', '5/26/2019', '11/19/2019', 'SC', false, '90 Emmet Junction', 'Prachuap Khiri Khan', 'TH', '77120', 'Thailand');
INSERT INTO CustomerOrder (employeeID, orderDate, requiredDate, shippedDate, shipVia, freight, shipAddress, shipCity, shipRegion, shipPostalCode, shipCountry) values ('27299272-73e3-4769-9142-67e8a1edabcf', '8/6/2019', '12/27/2019', '1/13/2020', 'E-Class', false, '077 Londonderry Hill', 'Launceston', 'AU', '7904', 'Australia');
INSERT INTO CustomerOrder (employeeID, orderDate, requiredDate, shippedDate, shipVia, freight, shipAddress, shipCity, shipRegion, shipPostalCode, shipCountry) values ('b560eeed-0b42-4b19-adb2-9614ff744c88', '10/21/2019', '12/19/2019', '8/23/2019', 'Passport', true, '119 Bowman Center', 'Mulanje', 'MW', null, 'Malawi');
INSERT INTO CustomerOrder (employeeID, orderDate, requiredDate, shippedDate, shipVia, freight, shipAddress, shipCity, shipRegion, shipPostalCode, shipCountry) values ('62f35955-d0f3-4231-b20a-ee74d0f4b24b', '3/21/2020', '6/1/2019', '8/9/2019', 'Roadmaster', false, '17961 Mallard Trail', 'Moneague', 'JM', null, 'Jamaica');

INSERT INTO CustomerOrderDetail (unitPrice, quantity, discount) values ('$2.97', 100, 57);
INSERT INTO CustomerOrderDetail (unitPrice, quantity, discount) values ('$0.78', 25, 3);
INSERT INTO CustomerOrderDetail (unitPrice, quantity, discount) values ('$4.28', 78, 68);
INSERT INTO CustomerOrderDetail (unitPrice, quantity, discount) values ('$3.47', 24, 55);