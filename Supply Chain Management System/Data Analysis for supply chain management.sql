use supplychain;

-- 1. Select all records from the Suppliers table:
SELECT * FROM Suppliers;

-- 2. Select product name and unit price from the Products table:
SELECT product_name, unit_price FROM Products;

-- 3. Select order IDs and order dates from the Orders table:
SELECT order_id, order_date FROM Orders;

-- 4. Select shipment IDs and shipment dates from the Shipments table:
SELECT shipment_id, shipment_date FROM Shipments;

-- 5. Count the total number of products in stock:
SELECT SUM(quantity_in_stock) AS total_stock FROM Products;

-- 6. Calculate the average unit price of products:
SELECT AVG(unit_price) AS average_price FROM Products;

-- 7. Find the maximum quantity ordered:
SELECT MAX(quantity_ordered) AS max_ordered FROM Orders;

-- 8. List suppliers along with their contact persons:
SELECT supplier_name, contact_person FROM Suppliers;

-- 9. List products with their descriptions:
SELECT product_name, description FROM Products;

-- 10. Display shipment details including the tracking number:
SELECT shipment_id, shipping_company, tracking_number FROM Shipments;

-- 11. List orders along with the associated supplier information:
SELECT o.order_id, o.order_date, s.supplier_name 
FROM Orders o
JOIN Suppliers s ON o.supplier_id = s.supplier_id;

-- 12. Display products that have a unit price greater than $15:
SELECT * FROM Products WHERE unit_price > 15.00;

-- 13. Count the number of orders per supplier:
SELECT supplier_id, COUNT(order_id) AS order_count 
FROM Orders 
GROUP BY supplier_id;

-- 14. Calculate the total quantity ordered for each product:
SELECT product_id, SUM(quantity_ordered) AS total_ordered 
FROM Orders 
GROUP BY product_id;

-- 15. List shipments along with the associated order information:
SELECT s.*, o.order_id, o.order_date 
FROM Shipments s
JOIN Orders o ON s.order_id = o.order_id;

-- 16. Find suppliers with more than 2 contacts:
SELECT supplier_id, COUNT(contact_person) AS contact_count 
FROM Suppliers 
GROUP BY supplier_id 
HAVING COUNT(contact_person) > 2;

SELECT * FROM Suppliers;

-- As we are getting zero data so insert some data
INSERT INTO Suppliers (supplier_id, supplier_name, contact_person, phone_number, email) VALUES
(21, 'Supplier A', 'John Smith', '123-456-7890', 'john@example.com'),
(22, 'Supplier A', 'Jane Doe', '456-789-0123', 'jane@example.com'),
(23, 'Supplier A', 'Michael Johnson', '789-123-4560', 'michael@example.com'),
(24, 'Supplier B', 'Alice Johnson', '987-654-3210', 'alice@example.com'),
(25, 'Supplier B', 'Bob Brown', '654-321-0987', 'bob@example.com'),
(26, 'Supplier C', 'Mark Brown', '456-789-0123', 'mark@example.com');

INSERT INTO Suppliers (supplier_id, supplier_name, contact_person, phone_number, email) VALUES
(27, 'Supplier A', 'Jane Doe', '456-789-0123', 'jane@example.com'),
(28, 'Supplier A', 'Michael Johnson', '789-123-4560', 'michael@example.com'),
(29, 'Supplier B', 'Bob Brown', '654-321-0987', 'bob@example.com'),
(30, 'Supplier C', 'Mark Brown', '456-789-0123', 'mark@example.com');
INSERT INTO Suppliers (supplier_id, supplier_name, contact_person, phone_number, email) VALUES
(31, 'Supplier C', 'Mark Brown', '456-789-0123', 'mark@example.com'),
(32, 'Supplier C', 'Mark Brown', '456-789-0123', 'mark@example.com');

-- 17. Calculate the average quantity ordered per order:
SELECT AVG(quantity_ordered) AS avg_quantity_ordered 
FROM Orders;

-- 13. List products along with the total number of orders they are associated with:
SELECT p.product_id, p.product_name, COUNT(o.order_id) AS order_count 
FROM Products p
LEFT JOIN Orders o ON p.product_id = o.product_id 
GROUP BY p.product_id;

-- 14. Display orders that are in progress (order_status = 'In Progress'):
SELECT * FROM Orders WHERE order_status = 'In Progress';

-- 15. Find the earliest and latest order dates:
SELECT MIN(order_date) AS earliest_order_date, MAX(order_date) AS latest_order_date 
FROM Orders;

-- 16. Calculate the total revenue generated from orders:
SELECT SUM(p.unit_price * o.quantity_ordered) AS total_revenue 
FROM Orders o
JOIN Products p ON o.product_id = p.product_id;

-- 17. List suppliers along with the total quantity ordered from them:
SELECT s.supplier_id, s.supplier_name, SUM(o.quantity_ordered) AS total_quantity_ordered 
FROM Suppliers s
JOIN Orders o ON s.supplier_id = o.supplier_id 
GROUP BY s.supplier_id;

-- 18. Find products with the highest unit price:
SELECT * FROM Products WHERE unit_price = (SELECT MAX(unit_price) FROM Products);

SELECt * FROM Products;

-- 19. List orders along with the associated supplier and product information:

SELECT o.order_id, o.order_date, s.supplier_name, p.product_name 
FROM Orders o
JOIN Suppliers s ON o.supplier_id = s.supplier_id
JOIN Products p ON o.product_id = p.product_id;

-- 20. Display the top 3 products with the highest quantity ordered:

SELECT product_id, quantity_ordered 
FROM Orders 
ORDER BY quantity_ordered DESC 
LIMIT 3;

SELECT * FROM Orders;

-- 21. Find the percentage of completed orders out of total orders:

SELECT (COUNT(CASE WHEN order_status = 'Completed' THEN 1 END) / COUNT(*)) * 100 AS completion_rate 
FROM Orders;

-- 22. Calculate the total number of shipments per shipping company:
SELECT shipping_company, COUNT(shipment_id) AS total_shipments 
FROM Shipments 
GROUP BY shipping_company;

-- 23. List suppliers who have not yet made any orders:
SELECT s.* 
FROM Suppliers s
LEFT JOIN Orders o ON s.supplier_id = o.supplier_id 
WHERE o.supplier_id IS NULL;

-- 24. Display orders along with the corresponding shipment details, if available:
SELECT o.order_id, o.order_date, s.shipment_date, s.delivery_date 
FROM Orders o
LEFT JOIN Shipments s ON o.order_id = s.order_id;

-- 25. Find the top 5 suppliers with the highest total quantity ordered:
SELECT s.supplier_id, s.supplier_name, SUM(o.quantity_ordered) AS total_quantity_ordered 
FROM Suppliers s
JOIN Orders o ON s.supplier_id = o.supplier_id 
GROUP BY s.supplier_id 
ORDER BY total_quantity_ordered DESC 
LIMIT 5;

-- 26. Find the total revenue generated by each supplier:
SELECT s.supplier_id, s.supplier_name, SUM(p.unit_price * o.quantity_ordered) AS total_revenue
FROM Suppliers s
JOIN Orders o ON s.supplier_id = o.supplier_id
JOIN Products p ON o.product_id = p.product_id
GROUP BY s.supplier_id, s.supplier_name;

-- 27. Calculate the average delivery time for each shipping company:

SELECT shipping_company, AVG(DATEDIFF(delivery_date, shipment_date)) AS average_delivery_time
FROM Shipments
GROUP BY shipping_company;

-- 28. Identify products that have never been ordered:
SELECT p.product_id, p.product_name
FROM Products p
LEFT JOIN Orders o ON p.product_id = o.product_id
WHERE o.product_id IS NULL;

-- 30. Find the top 3 shipping companies with the most shipments:
SELECT shipping_company, COUNT(shipment_id) AS shipment_count
FROM Shipments
GROUP BY shipping_company
ORDER BY shipment_count DESC
LIMIT 3;

-- 31. Calculate the percentage of orders that were completed for each supplier:
SELECT s.supplier_id, s.supplier_name, 
       SUM(CASE WHEN o.order_status = 'Completed' THEN 1 ELSE 0 END) / COUNT(*) * 100 AS completion_percentage
FROM Suppliers s
JOIN Orders o ON s.supplier_id = o.supplier_id
GROUP BY s.supplier_id, s.supplier_name;

-- 32. Identify products with low inventory levels (less than 50 in stock) that need restocking:
SELECT *
FROM Products
WHERE quantity_in_stock < 50;

-- 33. Find the top 5 suppliers with the highest total revenue:
SELECT s.supplier_id, s.supplier_name, SUM(p.unit_price * o.quantity_ordered) AS total_revenue
FROM Suppliers s
JOIN Orders o ON s.supplier_id = o.supplier_id
JOIN Products p ON o.product_id = p.product_id
GROUP BY s.supplier_id, s.supplier_name
ORDER BY total_revenue DESC
LIMIT 5;

-- 34. Calculate the total number of orders made each month:
SELECT DATE_FORMAT(order_date, '%Y-%m') AS month, COUNT(*) AS total_orders
FROM Orders
GROUP BY DATE_FORMAT(order_date, '%Y-%m');

-- 35. Identify suppliers with declining order trends over the past three months:
SELECT s.supplier_id, s.supplier_name
FROM Suppliers s
JOIN Orders o ON s.supplier_id = o.supplier_id
WHERE order_date >= DATE_SUB(CURRENT_DATE, INTERVAL 3 MONTH)
GROUP BY s.supplier_id, s.supplier_name
HAVING COUNT(DISTINCT DATE_FORMAT(order_date, '%Y-%m')) < 3;

-- 36. Calculate the average shipment duration for each supplier:
SELECT s.supplier_id, s.supplier_name, AVG(DATEDIFF(delivery_date, shipment_date)) AS avg_shipment_duration
FROM Suppliers s
JOIN Orders o ON s.supplier_id = o.supplier_id
JOIN Shipments sh ON o.order_id = sh.order_id
GROUP BY s.supplier_id, s.supplier_name;

-- 37. Identify Seasonal Demand Patterns:

SELECT 
    DATE_FORMAT(order_date, '%Y-%m') AS month,
    SUM(quantity_ordered) AS total_quantity_ordered
FROM 
    Orders
GROUP BY 
    DATE_FORMAT(order_date, '%Y-%m')
ORDER BY 
    month;

-- 38. Product Popularity Trends:

SELECT 
    p.product_id,
    p.product_name,
    COUNT(*) AS total_orders
FROM 
    Products p
JOIN 
    Orders o ON p.product_id = o.product_id
GROUP BY 
    p.product_id, p.product_name
ORDER BY 
    total_orders DESC;

-- 39. Correlation between Order Frequency, Product Categories, and Customer Demographics:

ALTER TABLE Products
ADD COLUMN category VARCHAR(255);

SELECT 
    p.category,
    COUNT(*) AS total_orders,
    AVG(o.quantity_ordered) AS avg_quantity_ordered,
    AVG(DATEDIFF(sh.delivery_date, sh.shipment_date)) AS avg_shipment_duration
FROM 
    Products p
JOIN 
    Orders o ON p.product_id = o.product_id
JOIN 
    Shipments sh ON o.order_id = sh.order_id
GROUP BY 
    p.category
ORDER BY 
    total_orders DESC;

-- 40. Forecast Future Demand: ( Assignment )
SELECT 
    DATE_FORMAT(order_date, '%Y-%m') AS month,
    SUM(quantity_ordered) AS total_quantity_ordered
FROM 
    Orders
WHERE 
    order_date BETWEEN CURDATE() AND DATE_ADD(CURDATE(), INTERVAL 6 MONTH)
GROUP BY 
    DATE_FORMAT(order_date, '%Y-%m')
ORDER BY 
    month;


