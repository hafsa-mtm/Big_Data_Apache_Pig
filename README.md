# Big Data Analytics with Apache Pig & Hadoop

---

## Project Overview

This project demonstrates a complete **big‑data analytics pipeline** using:

* **Hadoop HDFS** → Distributed data storage
* **Apache Pig** → ETL + analytical processing
* **Python (pandas/matplotlib)** → Data visualization

The pipeline processes a 300‑row e‑commerce dataset to extract insights:

* Top 5 products by revenue
* Top 5 customers by total spending
* Revenue per product
* Revenue per customer

The results are stored in HDFS, processed with Pig, exported, and visualized using Python.

---

## Project Steps

---

## **1. Start Hadoop Services + Install & Run Pig**

### **Install Pig** (downloads and extracts Pig):

```bash
curl -O https://downloads.apache.org/pig/pig-0.17.0/pig-0.17.0.tar.gz
```

```bash
tar -xzf pig-0.17.0.tar.gz
```

```bash
mv pig-0.17.0 pig
```

### **Configure Environment Variables** (adds Pig to system PATH):

```bash
vi ~/.bashrc
```

```bash
export PIG_HOME=/home/hadoop/pig
export PATH=$PATH:$PIG_HOME/bin
export PIG_CLASSPATH=$HADOOP_HOME/conf
```
### **reloads bash configuration**
```bash
source ~/.bashrc
```
### **Verify Pig installation** (checks Hadoop integration):

```bash
pig -version
```

### **Start Hadoop Services** (enables HDFS + YARN execution):

```bash
start-dfs.sh
start-yarn.sh
```

### **Check running Hadoop components**:

```bash
jps
```

---

## **2. Upload Dataset to HDFS (ecommerce.csv)**

The dataset must be stored **inside HDFS** so Pig can process it.

### **Create input directory inside HDFS**:

```bash
hdfs dfs -mkdir /user/pig/input/
```

### **Upload dataset to HDFS**:

```bash
hdfs dfs -put ecommerce.csv /user/pig/input
```

### **Verify upload**:

```bash
hdfs dfs -ls /user/pig/input
```

---

## **3. Run Apache Pig Script (analytics.pig)**

Runs the ETL + analytics job using MapReduce.

### **Execute Pig script**:

```bash
pig -x mapreduce analytics.pig
```

### **Generated Output in HDFS:**

* `/user/pig/output/top_products`
* `/user/pig/output/top_customers`
* `/user/pig/output/product_revenue`
* `/user/pig/output/customer_revenue`

---

## **4. View or Download Results from HDFS**

### **View results directly in terminal:**

```bash
hdfs dfs -cat /user/pig/output/top_products/part-r-00000
```

### **Download results to local machine:**

```bash
hdfs dfs -get /user/pig/output/top_products top_products.csv
```

```bash
hdfs dfs -get /user/pig/output/top_customers top_customers.csv
```

---

## **5. Visualize Results with Python**

### **Install Python 3**:

```bash
yum install python3 -y
```

### **Verify Python installation**:

```bash
python3 --version
```

### **Install pip**:

```bash
curl -O https://bootstrap.pypa.io/get-pip.py
```

```bash
python3 get-pip.py --user
```

### **Check pip installation**:

```bash
pip3 --version
```

### **Install required Python libraries**:

```bash
pip3 install pandas matplotlib seaborn
```

### **Run visualization script**:

```bash
python3 visualize.py
```

### **Generated Visuals:**

* `top_products_pie.png`

<img width="373" height="386" alt="image" src="https://github.com/user-attachments/assets/22187e0b-790e-4cd5-9c67-bde96265ab87" />
  
* `top_customers_bar.png`

<img width="494" height="298" alt="image" src="https://github.com/user-attachments/assets/e1979fbf-8dde-4340-9b6f-27c94e86ce7f" />

---

## Full Data Pipeline Diagram

<img width="2861" height="2422" alt="deepseek_mermaid_20251118_da6631" src="https://github.com/user-attachments/assets/b14cbe25-4300-4f61-8f43-739dea4c5c91" />

---

## Learning Objectives

✔ Use Pig Latin for ETL & analytics
✔ Store and process data in HDFS
✔ Build a complete big‑data processing pipeline
✔ Extract business insights from raw data
✔ Visualize analytics using Python

---
