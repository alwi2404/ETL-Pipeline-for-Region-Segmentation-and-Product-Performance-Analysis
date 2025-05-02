# ETL Pipeline for Region Segmentation and Product Performance Analysis (SSIS + SQL Server)

This repository contains an ETL pipeline project built using **SQL Server Integration Services (SSIS)** and **SQL Server**. The pipeline performs Region segmentation and product performance analysis by processing sales data from an Excel source and loading it into structured tables.

## Project Overview

The ETL process is designed to categorize:
- **Regions** into segments: High, Medium, Low based on total sales
- **Products** into ranks: Top Performer, Low Performer based on sales performance

## Technologies Used
- SQL Server Integration Services (SSIS)
- SQL Server Management Studio (SSMS)
- Excel (as data source)

---

## SSIS Package Structure

### Control Flow
The SSIS package consists of two main Data Flow tasks:
- **Load DimRegionSegment (Region Segmentation)**
- **Load FactSalesPerformance (Sales Performance Fact Load)**


![DataFlowTasks](https://github.com/user-attachments/assets/308bfaa2-617c-43a8-ba38-35122dfc36d3)



### Destination Tables
- `DimRegionSegment`
- `FactSalesPerformance`


![DestinationTables](https://github.com/user-attachments/assets/cac85a17-6a71-43de-a0e3-6f01ed1ef77e)




## ETL Pipelines

### DimRegionSegment (Region Segmentation)

#### Logic
- Aggregates total sales per region
- Classifies regions into High, Medium, Low segments based on sales thresholds

#### ETL Design
![ETL_Pipeline_For_Loading_DimRegionSegment](https://github.com/user-attachments/assets/57ed6a94-6e54-4901-b971-4ab65cccea63)


#### Execution Result
![ETL_Pipeline_Completed_Of_DimRegionSegment](https://github.com/user-attachments/assets/dd26cdbf-7712-4607-bffd-adbe7b43e676)


---

### FactSalesPerformance (Sales Performance Fact Load)

#### Logic
- Categorizes products into Top Performer and Low Performer based on sales amount

#### ETL Design
![ETL_Pipeline_For_Loading_FactSalesPerformance](https://github.com/user-attachments/assets/5df682e6-27eb-4548-90a2-d764e07a6435)


#### Execution Result
![ETL_Pipeline_Completed_Of_FactSalesPerformance](https://github.com/user-attachments/assets/f9effef2-7225-4e0b-af2e-f7059a9cee1b)


---

## Data Validation and Analysis

### Product Rank Distribution

```sql
SELECT ProductRank, COUNT(*) AS ProductCount
FROM FactSalesPerformance
GROUP BY ProductRank;
```

![ProductRank_Top_vs_Low_SSMS](https://github.com/user-attachments/assets/263aa79b-c8bf-4015-951a-d29505ff4f9b)


---

### Top 10 FactSalesPerformance Records

```sql
SELECT TOP 10 *
FROM FactSalesPerformance;
```

![FactSalesPerformance](https://github.com/user-attachments/assets/01934894-46fa-40ae-92f9-a9af2d0974cb)


---

## Key Features Implemented
- Automated data load from Excel source to SQL Server
- Conditional data splits based on business rules
- Region segmentation based on total sales
- Product ranking based on sales performance
- Error handling using SSIS OLE DB Destination configuration

---

## How to Use
1. Open `Package.dtsx` in SQL Server Data Tools (SSDT).
2. Configure the Excel source file path if needed.
3. Execute the SSIS package to perform ETL and load data into SQL tables.
4. Run the SQL validation queries to verify segmentation and ranking results.

---

## Project Status
- ETL pipeline execution: Completed Successfully
- Data validation queries: Executed Successfully

The project demonstrates the implementation of segmentation logic using ETL techniques and SQL queries, making it suitable for data analytics and reporting use cases.

---

## Author
Chaitanya Khot
