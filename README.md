# Big_Data_Apache_Pig

---

## Project Overview

This project implements an end-to-end big-data analytics pipeline using Hadoop HDFS for distributed storage, Apache Pig for ETL and analytical processing, and Python (pandas/matplotlib) for visualization. Raw e-commerce transaction data (300 rows) is ingested, stored in HDFS, processed through Pig Latin scripts, and transformed into analytics describing:

* Top 5 products by revenue
* Top 5 customers by spending
* Revenue per product
* Revenue per customer

Finally, the results are exported from HDFS and visualized using Python, with optional Excel report generation.

---

## Project Steps

### 1. Start Hadoop Services + Install/Run Pig:

Explanation: These steps install Apache Pig, configure environment variables, and start Hadoop services so Pig can run on top of HDFS.

* Install Pig

```bash
curl -O https://downloads.apache.org/pig/pig-0.17.0/pig-0.17.0.tar.gz
```

Downloads the Pig installation archive.

```bash
tar -xzf pig-0.17.0.tar.gz
```

Extracts the Pig files.

```bash
mv pig-0.17.0 pig
```

Renames the extracted folder for convenience.

```bash
vi ~/.bashrc
```

Opens your environment configuration file.

```bash
export PIG_HOME=/home/hadoop/pig
export PATH=$PATH:$PIG_HOME/bin
export PIG_CLASSPATH=$HADOOP_HOME/conf
```

Adds Pig to the system PATH so you can run it globally.

* Verify Pig installation:

```bash
pig -version
```

Ensures Pig is installed and linked with Hadoop.

* Start HDFS & YARN

```bash
start-dfs.sh
start-yarn.sh
```

Starts Hadoop's storage layer (HDFS) and execution layer (YARN).

* Check running services:

```bash
jps
```

Shows active Hadoop-related processes.

### 2. Upload Dataset to HDFS (ecommerce.csv)

Explanation: The dataset must be stored inside HDFS before Pig can process it.

* Create input folder:

```bash
hdfs dfs -mkdir /user/pig/input/
```

Creates the directory structure in HDFS.

* Upload the dataset:

```bash
hdfs dfs -put ecommerce.csv /user/pig/input
```

Uploads the local CSV file to HDFS.

* Verify:

```bash
hdfs dfs -ls /user/pig/input
```

Confirms that the file exists in HDFS.

### 3. Run the Pig Script (analytics.pig):

Explanation: Executes the Pig Latin script that performs ETL and analytics on the data.

Run the script:

```bash
pig -x mapreduce analytics.pig
```

Runs Pig in MapReduce mode, using the Hadoop cluster.

Results stored in HDFS:

* /user/pig/output/top_products
* /user/pig/output/top_customers
* /user/pig/output/product_revenue
* /user/pig/output/customer_revenue

### 4. View or Download Results from HDFS:

Explanation: Displays analytics output or downloads it for local use.

display top products

```bash
hdfs dfs -cat /user/pig/output/top_products/part-r-00000
```

Prints results of the "top products" analysis.

Download to local machine:

```bash
hdfs dfs -get /user/pig/output/top_products top_products.csv
```

Downloads results into a CSV file locally.

Same applies for:

```bash
hdfs dfs -get /user/pig/output/top_customers top_customers.csv
```

Downloads top customers results.

### 5. Visualize Results (Python):

Explanation: Installs Python tools and generates visualizations.

Install Python 3:

```bash
yum install python3 -y
```

Installs Python 3 on CentOS.

Check version:

```bash
python3 --version
```

Confirms installation.

Install pip:

```bash
curl -O https://bootstrap.pypa.io/get-pip.py
```

Downloads pip installer.

```bash
python3 get-pip.py --user
```

Installs pip locally for the user.

verify version:

```bash
pip3 --version
```

Checks installation.

Install required Python packages

```bash
pip3 install pandas matplotlib seaborn
```

Installs packages needed for visualization.

Run the script:

```bash
python3 visualize.py
```

Generates plots using processed data.

Results:

* top_products_pie.png

  <img width="373" height="386" alt="image" src="https://github.com/user-attachments/assets/22187e0b-790e-4cd5-9c67-bde96265ab87" />
  
* top_customers_bar.png
  
  <img width="494" height="298" alt="image" src="https://github.com/user-attachments/assets/e1979fbf-8dde-4340-9b6f-27c94e86ce7f" />

### Diagram: Full Data Pipeline

  <img width="2861" height="2422" alt="deepseek_mermaid_20251118_da6631" src="https://github.com/user-attachments/assets/b14cbe25-4300-4f61-8f43-739dea4c5c91" />

## Learning Objective

* Use Pig Latin for ETL & analytics
* Store and process data in HDFS
* Build a complete big-data analytics pipeline
* Generate business insights from raw data
* Visualize results using Python
