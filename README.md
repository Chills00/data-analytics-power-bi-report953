# E-Commerce Power BI Report: Business Intelligence
<p align="center">
    <img src="https://dasceq.com/wp-content/uploads/2022/04/business-analytics.gif" width="400" />
</p>

<p style="text-align: center; font-size:8pt;">
Image by Dasceq https://dasceq.com/wp-content/uploads/2022/04/business-analytics.gif
</p>

## Description
This Power BI project was part of AiCore's training for their Data Analysis course. The purpose is to provide real-world experience of data analysis by exploring data from a medium-sized international retailer. The goal is to use Microsoft Power BI to design a comprehensive quarterly report. This will involve extracting and transforming data from various origins, designing a robust data model rooted in a star-based schema, and then constructing a multi-page report.

![section_break](https://github.com/Chills00/exploratory-data-analysis---online-shopping-in-retail917/blob/main/rainbow.png)

## Table of Contents
1. [Description](#description)
1. [Introduction](#introduction)
    - [The Dataset](#the-dataset)
    - [Data Model](#data-model)
    - [The Report](#the-report)
1. [Installation](#installation)
1. [File structure](#file-structure)
1. [Usage](#usage)
1. [Licence](#licence)

![section_break](https://github.com/Chills00/exploratory-data-analysis---online-shopping-in-retail917/blob/main/rainbow.png)

## Introduction
The report will present a high-level business summary tailored for C-suite executives, providing insights into their highest value customers segmented by sales region. It will also provide a detailed analysis of top-performing products categorised by type against their sales targets, and a map visual that spotlights the performance metrics of their retail outlets across different territories.

### The Dataset
With operations spanning across different regions, the company has accumulated large amounts of sales from disparate sources over the years. The data contains 120,000 records divided across 4 files which requires extraction from Azure Storage and Azure SQL Database accounts. 

### Data Extraction 
1. Orders Table  
The orders table was extracted from an Azure SQL Database and imported into Power BI. Power Query Editor was used to delete customer sensitive information (e.g. credit card numbers), remove null values, and split date and time columns. 
1. Products Table  
The products table was extracted from a csv file. Transformation steps included, removal of duplicate product codes, renaming of columns to aid reporting. 
1. Stores Table  
The stores table was extracted from an Azure Blob Storage container. Transformation steps included, renaming of columns to ensure clarity and consistency across the report.
1. Customers Table  
The customers table was created by combining data across 3 csv files. Transformation steps included, removal of index columns, inserting a new column which concatenated the first name and last name of each customer. 

### Data Model
1. Date Table  
    - Continuous date table created covering entire time period of the dataset.
    - DAX formulas used to add columns for:
        - ``` Day of Week = WEEKDAY(Dates[Date], 2) ```
        - ``` Month Number = MONTH(Dates[Date]) ```
        - ``` Month Name = FORMAT(Dates[Date], "mmm") ```
        - ``` Quarter = QUARTER(Dates[Date]) ```
        - ``` Year = YEAR(Dates[Date]) ```
        - ``` Start of Year = STARTOFYEAR(Dates[Date]) ```
        - ``` Start of Quarter = STARTOFQUARTER(Dates[Date]) ```
        - ``` Start of Month = STARTOFMONTH(Dates[Date]) ```
        - ``` Start of Week = Dates[Date] - WEEKDAY(Dates[Date], 2) + 1 ```
2. Data Model  
    - Star Schema Data Model built by assigning appropraite relationships between the tables.
    - Representation of the model:
<p align="center">
    <img src="https://github.com/Chills00/data-analytics-power-bi-report953/blob/main/ModelSchema.PNG" width="500" />
</p>

3. Measures Table  
    - Power Query Editor used to generate measures table containing key measures:
        - ``` Total Orders = COUNT(Orders[Order Date]) ```
        - ``` Total Revenue = SUMX(Orders, Orders[Product Quantity] * RELATED(Products[Sale Price])) ```
        - ``` Total Profit = SUMX(Orders, (RELATED(Products[Sale Price]) - RELATED(Products[Cost Price])) * Orders[Product Quantity]) ```
        - ``` Total Customers = DISTINCTCOUNT(Orders[User ID]) ```
        - ``` Total Quantity = SUM(Orders[Product Quantity]) ```
        - ``` Profit YTD = TOTALYTD(SUMX(Orders, (RELATED(Products[Sale Price]) - RELATED(Products[Cost Price])) * Orders[Product Quantity]), Dates[Date]) ```
        - ``` Revenue YTD = TOTALYTD(SUMX(Orders, Orders[Product Quantity] * RELATED(Products[Sale Price])), Dates[Date]) ```
4. Hierarchies
    - Date hierarchy created enabling user to drill down into data by filtering by:
        - Start of Year
        - Start of Quarter
        - Start of Month
        - Start of Week
        - Date
    - Geography hierarchy created enabling user to drill down into data by filtering by:
        - World Region (category: Continent)
        - Country (category: Country)
        - Country Region (category: State or Province)

### The Report  
1. Executive Summary Page
This report page provides an overview of the company's performance as a whole, enabling senior stakeholders to quickly obtain insights and check outcomes against key targets. It contains the following visuals:
    - Card visuals for total revenue, total profit and total orders.
    - A line chart of revenue against time. The chart includes a trendline and forecasts the next 10 periods based on a 95% confidence limit.
    - Two donut charts showing revenue by country and revenue by store type. 
    - A bar chart of orders by product category.
    - Three KPI's for quarterly revenue, orders and profit. 
    - A table of the top 10 products based on revenue.  
An example of the report page is:
<p align="center">
    <img src="https://github.com/Chills00/data-analytics-power-bi-report953/blob/main/ExecSummary.PNG" width="500" />
</p>

2. Customer Detail Page  
This report page focuses on customer-level analysis. It contains the following visuals:
    - Card visuals for total distinct customers and revenue per customer.
    - A line chart of weekly distinct customers. Chart includes trendline and forecasts the next 10 periods based on a 95% confidence limit.
    - A table displaying the top 20 customers by total revenue, including the revenue per customer and total orders per customer.
    - A set of three card visuals displaying the name, revenue and total number of orders for the top customer by revenue.
    - A donut chart showing the number of customers by country, and a bar chart showing the number of customers by product category. 
    - A slicer to set the date period.  
An example of the report page is:
<p align="center">
    <img src="https://github.com/Chills00/data-analytics-power-bi-report953/blob/main/CustomerDetails.PNG" width="500" />
</p>

3. Product Details Page  
This report page highlights the key insights on product performance. It contains the following visuals and features:
    - A slicer toolbar to filter by Product Category and Country.
    - Card visuals to display current filter selection.
    - Guage visuals showing how the selected categories revenue, orders and profit are performing against a quarterly target. 
    - An area chart displaying the relative revenue performance of each product category over time. 
    - A table showing the top 10 products by revenue for the selected filters, and card visuals showing the top product by revenue and orders. 
    - A scatter graph displaying the quantity ordered against profit per item for the products in the current context.  
An example of the report page is:
<p align="center">
    <img src="https://github.com/Chills00/data-analytics-power-bi-report953/blob/main/ProductDetails.PNG" width="500" />
</p>
An example page to demonstrate the slicer bookmark:
<p align="center">
    <img src="https://github.com/Chills00/data-analytics-power-bi-report953/blob/main/ProductDetailsSlicer.PNG" width="500" />
</p>

4. Stores Map Page  
This report page enables the store performance to be visualised. The profitability of each store, country region, country or world region can be assessed. The page contains the following visuals and features:
    - A map visual showing the profit YTD against a geography hierarchy that allows the data to be drilldowned based on location. 
    - A slicer that allows the user to filter by country. 
    - A tooltip page to highlight the profit and target of any selected store. 
The stores map page looks like this:
<p align="center">
    <img src="https://github.com/Chills00/data-analytics-power-bi-report953/blob/main/StoresMap.PNG" width="500" />
</p>  

5. Stores Map Drillthrough Page
    - A stores drillthrough page that enables the user to analyse key insights for any given store. These include a guage displaying the YTD profit and target, YTD revenue and target, bar chart showing total orders by product category and a table of top 5 products by revenue. 
An example of the drillthrough page is:
<p align="center">
    <img src="https://github.com/Chills00/data-analytics-power-bi-report953/blob/main/StoresMapDrillthrough.PNG" width="500" />
</p>  


![section_break](https://github.com/Chills00/exploratory-data-analysis---online-shopping-in-retail917/blob/main/rainbow.png)

## Installation
1. Clone repo:
    ```
    git clone https://github.com/Chills00/data-analytics-power-bi-report953.git
    ```  

1. Using a CLI install conda environment on your local machine:
    ```
    conda env create -f environment.yaml 
    ```  


Note: Database access limited to those with login credentials.

![section_break](https://github.com/Chills00/exploratory-data-analysis---online-shopping-in-retail917/blob/main/rainbow.png)

## File structure



![section_break](https://github.com/Chills00/exploratory-data-analysis---online-shopping-in-retail917/blob/main/rainbow.png)

## Usage


![section_break](https://github.com/Chills00/exploratory-data-analysis---online-shopping-in-retail917/blob/main/rainbow.png)

## Licence
None
