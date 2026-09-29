# Engineering Project Feasibility & Cost Analysis


## 📌 Project Overview

This project uses **MySQL** to analyze an engineering project portfolio and identify patterns related to **project feasibility, cost, risk, resource allocation, environmental impact, and historical cost deviation**.

The goal is to transform raw engineering project data into actionable insights that could help project managers and decision-makers identify projects requiring additional review.

The analysis was performed using **MySQL 8.0+**.

---

## 🎯 Business Problem

Engineering organizations evaluate projects based on several factors including estimated cost, project risk, available resources, environmental impact, stakeholder priorities, project duration, and historical cost performance.

This project explores the following questions:

* What is the composition of the engineering project portfolio?
* Which project types have the highest estimated costs?
* How are projects distributed across feasibility outcomes?
* Which project types have the highest proportion of **Not Feasible** projects?
* How does risk vary across feasibility outcomes?
* How does resource allocation vary across feasibility outcomes?
* How does environmental impact vary across feasibility outcomes?
* Which project types have the highest historical cost deviation?
* Which projects have high historical cost deviation?
* Which projects simultaneously exhibit high risk, environmental impact, and cost deviation?
* How much estimated cost is associated with projects meeting the management-review criteria?

---

## 📊 Dataset

The dataset contains **3,245 engineering projects** across five project categories:

* Road
* Bridge
* Building
* Power Plant
* Water Infra

The dataset contains information related to project costs, complexity, risk, resource allocation, environmental impact, stakeholder priorities, project duration, historical cost deviation, and feasibility classification.

---

## 🛠️ Tools & Technologies

* **MySQL 8.0+**
* MySQL Workbench
* SQL
* Git
* GitHub

---

## 🔍 Analysis Performed

### 1. Portfolio Analysis

Analyzed the overall project portfolio by:

* Project type
* Project count
* Estimated cost
* Average project cost

### 2. Feasibility Analysis

Analyzed:

* Overall feasibility distribution
* Feasibility by project type
* Feasibility in relation to risk
* Feasibility in relation to resource allocation
* Feasibility in relation to environmental impact

### 3. Cost Analysis

Analyzed:

* Total estimated cost by project type
* Average project cost
* Cost exposure by feasibility outcome
* Highest-cost projects

### 4. Cost Deviation Analysis

Investigated:

* Average historical cost deviation
* Cost deviation by project type
* Projects with high historical cost deviation
* Percentage of projects with high cost deviation
* Cost deviation across feasibility outcomes

### 5. Risk Analysis

Identified projects and project categories associated with higher risk scores.

The analysis also examined combinations of:

* Risk
* Environmental impact
* Historical cost deviation

### 6. Management Review Analysis

Projects were flagged for additional review when they met all three criteria:



The analysis then calculated:

* Number of flagged projects
* Total estimated cost exposure
* Average cost of flagged projects
* Feasibility distribution of flagged projects

---

## How to Run the Project

### 1. Create the database

```sql
CREATE DATABASE engineering_project_analysis;

USE engineering_project_analysis;
```

### 2. Create the project table

Create the `engineering_projects` table using the SQL script included in the repository.

### 3. Import the CSV

Import:

```text
Engineering_Cost_Feasibility_Dataset.csv
```

into the `engineering_projects` table using MySQL Workbench's **Table Data Import Wizard**.

### 4. Run the analysis

Open the SQL analysis file and execute the queries in MySQL Workbench.

---

## 📈 Key Findings

The dataset contains:

* **3,245 total engineering projects**
* **1,931 Feasible projects**
* **491 Borderline projects**
* **823 Not Feasible projects**

The analysis further investigates differences in cost, risk, resource allocation, environmental impact, and historical cost deviation across these feasibility categories.

The final management-review analysis identifies projects that simultaneously meet the defined high-risk, high-environmental-impact, and high-cost-deviation thresholds.

> **Note:** These findings describe patterns within this dataset and should not be interpreted as causal relationships.

---

## 💡 Business Insights

The analysis is designed to help answer questions such as:

### Where is the largest financial exposure?

By comparing total and average estimated project costs across project types and feasibility categories.

### Which projects require additional review?

By identifying projects with multiple risk indicators rather than relying on a single score.

### Which project categories show greater historical cost deviation?

By comparing cost-deviation metrics across project types.

### How does feasibility differ across the portfolio?

By examining feasibility outcomes across project types and project characteristics.

---

## ⚠️ Analytical Limitations

This project is a **descriptive SQL analysis**.

The analysis identifies relationships and patterns within the dataset but does not establish causation.

For example, if Not Feasible projects have a higher average risk score, this does not prove that higher risk causes a project to become Not Feasible.

The management-review thresholds used in this project are analytical rules created for portfolio screening and should not be interpreted as industry-standard engineering thresholds.

---

## 🚀 Future Improvements

Possible extensions include:

* Building a Power BI/Tableau dashboard
* Creating additional normalized tables
* Adding project timeline data
* Performing statistical analysis
* Building a feasibility prediction model
* Comparing estimated versus actual project costs
* Adding geographic project information
* Automating data ingestion and reporting

---

## 👤 Author

**Amrit Raj**

Engineering / SQL Portfolio Project

---

## 📌 Resume Description

**Engineering Project Feasibility & Cost Analysis | MySQL**

> Developed a MySQL-based analysis of 3,245 engineering projects to evaluate project feasibility, cost exposure, risk, resource allocation, environmental impact, and historical cost deviation; performed portfolio segmentation and multi-factor management-review analysis.
