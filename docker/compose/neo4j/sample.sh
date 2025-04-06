# Download example dump: https://github.com/neo4j-graph-examples/pole/raw/main/data/pole-data-importer.zip
# unzip
# Copy to container: docker cp x.csv neo4j:/tmp/x.csv
# Import
# neo4j-admin import --ignore-missing-nodes --ignore-duplicate-nodes \
#  --nodes:CUSTOMER=import/northwind/customers.csv \
#  --nodes:PRODUCT=import/northwind/products.csv \
#  --nodes:SUPPLIER=import/northwind/suppliers.csv \
#  --nodes:EMPLOYEE=import/northwind/employees.csv \
#  --nodes:CATEGORY=import/northwind/categories.csv \
#  --nodes:ORDER=import/northwind/orders.csv \
#  --relationships:PRODUCT=import/northwind/orders_products.csv \
#  --relationships:SOLD=import/northwind/employee_sold.csv \
#  --relationships:PURCHASED=import/northwind/customer_orders.csv \
#  --relationships:SUPPLIES=import/northwind/supplier_products.csv \
#  --relationships:PART_OF=import/northwind/product_categories.csv \
#  --relationships:REPORTS_TO=import/northwind/employee_reports_to.csv 