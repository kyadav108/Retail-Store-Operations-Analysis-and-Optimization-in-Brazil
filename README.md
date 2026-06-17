# Welcome to My Project! 🚀

# Target Brazil Business Case Study

## Overview

This project analyzes Target Brazil's order data from **2016 to 2018** to understand customer behavior, sales trends, delivery performance, payment preferences, and product category performance. The analysis was performed using **Google BigQuery (SQL)** on approximately **100,000 orders** across Brazil.

## Objectives

* Analyze customer distribution and purchasing patterns across states and cities.
* Identify order and revenue trends over time.
* Evaluate delivery performance and estimated delivery accuracy.
* Understand customer payment preferences and installment usage.
* Identify top-performing product categories based on sales and reviews.
* Generate actionable business insights and recommendations.

## Dataset

The analysis utilizes the following datasets:

* customers.csv
* geolocation.csv
* orders.csv
* order_items.csv
* payments.csv
* reviews.csv
* products.csv
* sellers.csv

## Tools Used

* Google BigQuery
* SQL
* GitHub

## Key Insights

* Target served **96,096 unique customers** across **27 states** and **4,119 cities**.
* **São Paulo (SP), Rio de Janeiro (RJ), and Minas Gerais (MG)** contribute the highest share of customers, orders, and revenue.
* Order volume increased by **19.76% in 2018 compared to 2017**, indicating visible growth in business activity.
* Order activity peaked between **November 2017 and March 2018**, highlighting a period of increased demand.
* Most orders were placed during the **afternoon and evening**.
* Delivery times vary considerably across states, with some regions experiencing significantly longer delivery periods.
* Several states received orders well before the estimated delivery date, suggesting conservative delivery estimates.
* **Credit cards** were the most preferred payment method, followed by **UPI**.
* More than **50% of orders** were paid in a single installment.
* **Bed Table Bath, Health Beauty, and Computer Accessories** were among the top-performing product categories in terms of sales and customer engagement.

## Business Recommendations

* Improve logistics performance in states with longer delivery times.
* Refine estimated delivery dates to better match actual delivery performance.
* Focus customer retention and marketing efforts on high-revenue states.
* Prepare inventory and operations for demand spikes during peak periods.
* Leverage top-performing categories for cross-selling and bundled promotions to increase sales of related products.

## Repository Structure

```text
Target-Brazil-Business-Case/
│
├── README.md
├── schema.sql
├── insights.md
│
├── data/
│   ├── customers.csv
│   ├── geolocation.csv
│   ├── orders.csv
│   ├── order_items.csv
│   ├── payments.csv
│   ├── reviews.csv
│   ├── products.csv
│   └── sellers.csv
│
└── sql/
    ├── customer_analysis.sql
    ├── sales_analysis.sql
    ├── state_revenue_and _pricing_analysis.sql
    ├── delivery_analysis.sql
    └── product_analysis.sql
    └── shopping_and_payment_analysis.sql 
```

## Conclusion

The analysis highlights key customer, operational, and financial trends across Target Brazil's business. The findings can support data-driven decisions related to logistics optimization, customer engagement, payment strategy, and product portfolio management.
