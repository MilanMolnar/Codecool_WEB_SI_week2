SELECT company_name AS Company, COUNT(products.product_id) AS NumberOfProducts FROM suppliers, products
WHERE products.supplier_id = suppliers.supplier_id
GROUP BY company_name
ORDER BY NumberOfProducts DESC, company_name