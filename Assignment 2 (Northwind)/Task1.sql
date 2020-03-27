SELECT products.product_name AS Product, suppliers.company_name AS Company
FROM products
JOIN suppliers ON products.supplier_id = suppliers.supplier_id
ORDER BY product_name, company_name