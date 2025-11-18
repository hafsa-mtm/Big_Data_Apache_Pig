# Big_Data_Apache_Pig

## Project Overview

This project implements an end-to-end big-data analytics pipeline using Hadoop HDFS for distributed storage, Apache Pig for ETL and analytical processing, and Python (pandas/matplotlib) for visualization.
Raw e-commerce transaction data (300 rows) is ingested, stored in HDFS, processed through Pig Latin scripts, and transformed into analytics describing:

Top 5 products by revenue

Top 5 customers by spending

Revenue per product

Revenue per customer

Finally, the results are exported from HDFS and visualized using Python, with optional Excel report generation.

## Project Steps
1.Start Hadoop Services + Install/Run Pig:
Start HDFS & YARN
```bash
start-dfs.sh
start-yarn.sh
```
Check running services:
```bash
jps
```
Install Pig
```bash
sudo yum install pig -y
```
Verify Pig installation:
```bash
pig -v
```
If Pig is linked correctly with Hadoop, it will display Hadoop classpath info.

Run Pig in MapReduce Mode:
```bash
pig -x mapreduce
quit
```
2.Upload Dataset to HDFS(ecommerce.csv)

The dataset used in this project is included in the repository.

Create input folder:
```bash
hdfs dfs -mkdir /input
```
Upload the dataset:
```bash
hdfs dfs -put ecommerce.csv /input/
```
Verify:
```bash
hdfs dfs -ls /input
```
3.Run the Pig Script (analytics.pig):

Run the script:
```bash
pig -x mapreduce analytics.pig
```
Results stored in HDFS:

/output/top_products

/output/top_customers

/output/product_revenue

/output/customer_revenue
4.View or Download Results from HDFS:

display top products
```bash
hdfs dfs -cat /output/top_products/part-r-00000
```
Download to local machine:
```bash
hdfs dfs -get /output/top_products top_products/
```
Same applies for:
```bash
hdfs dfs -get /output/top_customers top_customers/
```
5.Visualize Results (Python):

Install Python 3:
```bash
sudo yum install python3 -y
```
Check version:
```bash
python3 --version
```
Install required Python packages
```bash
pip3 install pandas matplotlib
```
Run the script:
```bash
python3 visualize.py
```
Results:

top_products_pie.png

<img width="373" height="386" alt="image" src="https://github.com/user-attachments/assets/22187e0b-790e-4cd5-9c67-bde96265ab87" />

top_customers_bar.png

<img width="494" height="298" alt="image" src="https://github.com/user-attachments/assets/e1979fbf-8dde-4340-9b6f-27c94e86ce7f" />

Diagram: Full Data Pipeline

<img width="2861" height="2422" alt="deepseek_mermaid_20251118_da6631" src="https://github.com/user-attachments/assets/b14cbe25-4300-4f61-8f43-739dea4c5c91" />

## Learning Objective
✔ Use Pig Latin for ETL & analytics
✔ Store and process data in HDFS
✔ Build a complete big-data analytics pipeline
✔ Generate business insights from raw data
✔ Visualize results using Python
