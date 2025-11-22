-- 1. Load the raw CSV dataset
raw_data = LOAD '/user/pig/input/ecommerce.csv' USING PigStorage(',') 
    AS (
        order_id:int, 
        customer_id:int, 
        product_id:int,
        product_name:chararray, 
        category:chararray, 
        price:double, 
        quantity:int,
        order_date:chararray
    );

-- 2. Clean / Filter invalid rows
clean_data = FILTER raw_data BY 
    (price IS NOT NULL) AND 
    (quantity > 0) AND 
    (product_name IS NOT NULL);

-- 3. Compute revenue per row (price * quantity)
with_revenue = FOREACH clean_data GENERATE
    order_id, 
    customer_id, 
    product_id, 
    product_name, 
    category, 
    price, 
    quantity, 
    (price * quantity) AS revenue;

-- 4. Calculate total revenue and total quantity sold per product
product_group = GROUP with_revenue BY product_name;

product_revenue = FOREACH product_group GENERATE
    group AS product_name,
    SUM(with_revenue.revenue) AS total_revenue,
    SUM(with_revenue.quantity) AS total_quantity;

-- 5. Find top 5 selling products by revenue
ordered_products = ORDER product_revenue BY total_revenue DESC;

top5_products = LIMIT ordered_products 5;

-- 6. Calculate total revenue spent per customer
customer_group = GROUP with_revenue BY customer_id;

customer_revenue = FOREACH customer_group GENERATE
    group AS customer_id,
    SUM(with_revenue.revenue) AS total_spent;

-- 7. Find top 5 customers by total revenue spent
ordered_customers = ORDER customer_revenue BY total_spent DESC;

top5_customers = LIMIT ordered_customers 5;

-- 8. Store the results to output directories
STORE top5_products INTO '/user/pig/output/top_products' USING PigStorage(',');

STORE product_revenue INTO '/user/pig/output/product_revenue' USING PigStorage(',');

STORE customer_revenue INTO '/user/pig/output/customer_revenue' USING PigStorage(',');

STORE top5_customers INTO '/user/pig/output/top_customers' USING PigStorage(',');
