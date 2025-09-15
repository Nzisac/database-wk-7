USE salesdb;
DROP TABLE orderdetails;
CREATE TABLE OrderDetails (
OrderID INT, 
CustomerName VARCHAR (100), 
Product VARCHAR (50)
);
INSERT INTO OrderDetails (OrderID, CustomerName, Product)
VALUES 
(101, 'John Doe', 'Laptop'), 
(101, 'John Doe', 'Mouse'),
(102, 'Jane Smith', 'Tablet'),
(102, 'Jane Smith', 'Keyboard'),
(102, 'Jane Smith', 'Mouse'), 
(103, 'Emily Clark', 'Phone');

CREATE TABLE ProductDetails(
ProductID INT AUTO_INCREMENT PRIMARY KEY, 
ProductName VARCHAR (100)
);
INSERT INTO ProductDetails(productName)
VALUES 
('Laptop'), 
('Mouse'), 
('Tablet'),
('Keyboard'), 
('Phone');

-- Question 2 Achieving 2NF (Second Normal Form) transforming table into **2NF** by removing partial dependencies. --
USE salesdb;

DROP TABLE IF EXISTS OrderItems;
DROP TABLE IF EXISTS Orders;

CREATE TABLE Orders (
  OrderID INT PRIMARY KEY,
  CustomerName VARCHAR(100) NOT NULL
);

CREATE TABLE OrderItems (
  OrderID INT NOT NULL,
  Product VARCHAR(100) NOT NULL,
  Quantity INT NOT NULL,
  PRIMARY KEY (OrderID, Product),
FOREIGN KEY (OrderID) REFERENCES Orders(OrderID)
);

INSERT INTO Orders (OrderID, CustomerName) VALUES
(101, 'John Doe'), 
(102, 'Jane Smith'), 
(103, 'Emily Clark');

INSERT INTO OrderItems (OrderID, Product, Quantity) VALUES 
(101, 'Laptop', 2 ), 
(101, 'Mouse', 1), 
(102, 'Tablet', 3),
(102, 'Keyboard', 1),
(102, 'Mouse', 2),
(103, 'Phone', 1);
