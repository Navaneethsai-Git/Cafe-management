
create database CafeSystem
use CafeSystem
--table for customer info 

create table Customer(
CustomerId int identity(1,1)primary key,
FullName varchar(15),
Email varchar(20),
Password varchar(10),
ContactNo varchar(11),
Username varchar(20),
);

--tabke for Inventory Manager
create table InventoryManager(
IManagerID int identity(1,1) primary key,
IManagerName varchar(20),
Username varchar(20),
IMContactno varchar(11),
Password varchar(10),
 Email VARCHAR(30);
);
ALTER TABLE InventoryManager
ADD Email VARCHAR(30);

--table for Cafe Manager
create table CafeManager(
CManagerID int identity(1,1) primary key,
CManagerName varchar(30),
Username varchar(20),
CManagerEmail varchar(20),
CManagerContactno varchar(11),
Password varchar(10),

);


--table for Orders
create table Orders(
OrderID int NOT NULL,
Customerid int NOT NULL,
IManagerId int NOT NULL,
primary key(OrderID),
foreign key (Customerid) references Customer(CustomerId),
foreign key (IManagerId) references InventoryManager(IManagerID)

);

--table for rating and reviews
create table RatingandReviews(
RatingID int NOT NULL,
Customerid int NOT NULL,
Rating int,
Review varchar(30),
primary key(RatingID),
foreign key (Customerid) references Customer(CustomerId),

);

--table for Cash Register
create table CashRegister(
RegisterID int not null,
field varchar(30),
primary key(RegisterID)
);

--table for Payment
create table Payment(
PaymentID int NOT NULL,
OrderId int NOT NULL,
StoredRegisterId int not null,
primary key(PaymentID),
foreign key (OrderId) references Orders(OrderID),
foreign key (StoredRegisterId) references CashRegister(RegisterID)
);

--table for shedule
create table Shedule(
SheduleID int not null,
shiftType varchar(10),
StartingTime time,
EndingTime time,
primary key(SheduleID),
);

--table for Cashier
create table Cashier(
CashierID int identity(1,1) primary key,
CashierName varchar(30),
Username varchar(10),
CashierContactno varchar(11),
Password varchar(10),
CashierEmail varchar(20),
--ControllerCashRegistered int not null,
--foreign key (ControllerCashRegistered) references CashRegister(RegisterID)
);

--table for Staff
create table Staff(
--SheduleId int not null,
CafeManagerId int not null,
InventoryManagerId int not null,
CashierId int not null,
--foreign key (SheduleId) references Shedule(SheduleID),
foreign key (CafeManagerId) references CafeManager(CManagerID),
foreign key (InventoryManagerId) references InventoryManager(IManagerID),
foreign key (CashierId) references Cashier(CashierID),
);



--table for menu
create table Menu(
MenuName varchar(20),
Description varchar(50),
primary key(MenuName),
CafeManagerId int not null,
foreign key (CafeManagerId) references CafeManager(CManagerID)
);

--table for Categories
create table Categories(
CategoryID int not null,
CategoryName varchar(30),
CategoryDes varchar(50),
menu varchar(20),
primary key(CategoryID),
foreign key (menu) references Menu(MenuName)
);

--table for MenuHasCategories
create table MenuHasCategories(
menu varchar(20),
categoryId int not null,
foreign key (menu) references Menu(MenuName),
foreign key (categoryId) references Categories(CategoryID)

);

--table for cafe
create table Cafe(
CafeID int not null,
CafeName varchar(30),
CafeLocation varchar(30),
CafeManagerId int not null,
InventoryManagerId int not null,
CashierId int not null,
ServeMenu varchar(20),
Description varchar(50),
primary key(CafeID),
foreign key (CafeManagerId) references CafeManager(CManagerID),
foreign key (InventoryManagerId) references InventoryManager(IManagerID),
foreign key (ServeMenu) references Menu(MenuName),
);

--table for pricing of item
create table Pricing(
PricingID int not null,
BasePrice int,
ControlBymanager int not null,
primary key(PricingID),
foreign key (ControlBymanager) references CafeManager(CManagerID)
);

--table for items in cafe
create table Items(
ItemID int not null,
ItemName varchar(15),
ItemDes varchar(30),
ItemAvailibility varchar(10),
priceid int not null,
primary key(ItemID),
foreign key (priceid) references Pricing(PricingID)


);
--table for Inventory
create table Inventory(
InventoryID int not null,
InventoryName varchar(30),
InventoryManagerid int not null,
MinimumStockLevel int,
QuantityInHand int,
ExpirationDate date,
primary key(InventoryID),
foreign key (InventoryManagerid) references InventoryManager(IManagerID)
);
INSERT INTO CafeManager VALUES ('Moeed Asif', 'moeed00', 'moeed@gmail.com', '03255146456', 'moeed123');
