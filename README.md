# Revenue Loss Analysis with SQL

## Introduction 

The online retail market is highly competitive, with sales performance driven by product assortment, pricing strategies, and promotional discounts. Analyzing e-commerce transaction data can reveal patterns in customer behavior and purchasing trends, enabling businesses to make data-driven decisions to increase revenue and improve profitability.

For this project, I will examine a fictional company’s 2024 sales report to understand the factors contributing to revenue loss and to identify actionable strategies for improving performance in 2025.

## Goal 

The primary objective is to identify targeted strategies that can help the company increase revenue and optimize its pricing approach. Using SQLite, I will analyze the 2024 sales dataset to determine the factors contributing to the store’s underperformance. Specifically, this analysis will address two key questions:
- Which product categories contributed most to revenue over the past year?
- How did discounting affect revenue, and are these effects specific to particular products or discount levels?

## Data Collection 

The dataset is a synthetic collection of e-commerce transaction records, consisting of 3,660 rows representing individual online transactions over the course of one year. It includes 8 columns capturing key attributes of online shopping activities: product categories, prices, discounts, final purchase amounts, payment methods, and transaction dates. While the data is fictional, it was generated to realistically reflect typical e-commerce behavior, providing a solid foundation for analysis.

Learn more about the data [here](https://www.kaggle.com/datasets/steve1215rogg/e-commerce-dataset). 

## Data Preprocessing

First thing, I created a database for this project in DBeaver and imported the dataset. For demonstration purposes, I then broke the dataset into multiple tables according to the following schema. 

![image](schema image)

## Conclusion: Strategic Recommendations to Increase Revenue

The company’s 2024 sales data indicates significant revenue loss due to its discounting strategy. On average, items were sold at an 18.83% discount, reducing the mean sale price from $254.80 to $206.91. With over 86% of transactions involving discounted products, the company incurred a total revenue loss of $175,292.39. Notably, 50% discounts alone accounted for over $55,000 of this loss, representing more than 30% of the total revenue lost to discounts.

The company generated $757,278.08 in total revenue in 2024, with monthly earnings ranging between $51,915 and $76,034. Since revenue does not exhibit strong seasonal patterns, time-based discounting strategies are unlikely to yield significant benefits. Instead, a product-focused approach is recommended.

Analysis by product category reveals that clothing, books, and home & kitchen items contributed most to revenue. However, the largest revenue losses occurred in books and home & kitchen products. To preserve revenue while maintaining sales volume, the company should:
- **Reduce discount rates for books and home/kitchen products**: Limiting the maximum discount to 30% could significantly reduce revenue leakage from extreme discounts.
- **Decrease the proportion of discounted items in high-revenue categories**: Currently, 86% of all products are sold at a discount. I would recommend reducing discounting in categories with strong sales potential (books and home/kitchen).
- **Implement conditional discounts**: Rather than applying discounts generally, the company should offer them only when customers purchase multiple items or meet a minimum order threshold. This encourages larger purchases while protecting revenue on high-selling items.

## Insights in Action 

In 2024, the company lost over $17k just by selling book and home/kitchen products at a 50% discount. Had the company sold these products with a 30% discount instead of the 50%, they would have saved over $7k in revenue. With a 15% discount, they would have saved over $12k. 

Had the company sold all of their books and home/kitchen products at full price, they would have saved over $53k. 

View the full analysis [here]()