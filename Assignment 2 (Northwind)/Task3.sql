SELECT company_name AS Company, COUNT(products.product_id) AS NumberOfProducts FROM suppliers, products
WHERE products.supplier_id = suppliers.supplier_id
GROUP BY company_name
HAVING COUNT(products.product_id) = 5
ORDER BY company_name