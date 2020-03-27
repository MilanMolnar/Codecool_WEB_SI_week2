SELECT company_name AS Company, (SELECT STRING_AGG(CAST(order_id AS varchar(11)), ', ')
	FROM Orders
	WHERE customers.customer_id = orders.customer_id)
	FROM customers,orders
WHERE customers.customer_id = orders.customer_id
ORDER BY company_name