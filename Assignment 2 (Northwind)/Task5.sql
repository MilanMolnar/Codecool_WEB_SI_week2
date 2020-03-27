SELECT company_name, product_name, x.unit_price 
FROM suppliers
JOIN(SELECT MAX(unit_price) AS unit_price,supplier_id 
FROM products GROUP BY supplier_id) 
AS X ON suppliers.supplier_id = x.supplier_id
JOIN products ON x.supplier_id = products.supplier_id 
WHERE x.unit_price = products.unit_price