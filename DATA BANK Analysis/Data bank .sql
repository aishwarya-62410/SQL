--1.	How many different nodes make up the Data Bank network?
SELECT count(DISTINCT node_id) AS unique_nodes
FROM customer_nodes;

--2.	How many nodes are there in each region?
SELECT regions.region_id,
       regions.region_name,
       COUNT(customer_nodes.node_id) AS node_count
FROM customer_nodes
INNER JOIN regions ON customer_nodes.region_id = regions.region_id
GROUP BY regions.region_id, regions.region_name;

--3.	How many customers are divided among the regions?
SELECT regions.region_id,
       regions.region_name,
       COUNT(DISTINCT customer_nodes.customer_id) AS customer_count
FROM customer_nodes
INNER JOIN regions ON customer_nodes.region_id = regions.region_id
GROUP BY regions.region_id, regions.region_name;


--4.	Determine the total amount of transactions for each region name.
select region_name, sum(txn_amount) as total_transaction_amount from regions,customer_nodes,customer_transactions 
where regions.region_id=customer_nodes.region_id and customer_nodes.customer_id=customer_transactions.customer_id 
group by region_name;

--5.	What is the unique count and total amount for each transaction type?
SELECT txn_type,
       count(*) AS unique_count,
       sum(txn_amount) AS total_amont
FROM customer_transactions
GROUP BY txn_type;

--6.	What is the average number and size of past deposits across all customers?
SELECT round(count(customer_id)/
               (SELECT count(DISTINCT customer_id)
                FROM customer_transactions)) AS average_deposit_count,
       concat('$', round(avg(txn_amount), 2)) AS average_deposit_amount
FROM customer_transactions
WHERE txn_type = "deposit";

