# Myntra-Menswear-Sales-Analysis

📌 **Overview**
<br>
This project analyzes the men’s bottomwear category on Myntra to understand how pricing, discounts, customer ratings, and product demand influence sales performance. The goal is to help brands and online retailers make better decisions around pricing strategy, promotions, and inventory planning.

The analysis follows an end-to-end workflow using MySQL for data cleaning, Python for feature engineering and EDA, and Power BI for visualization and dashboarding.

<br>

📂 **Dataset Summary**

- Rows: 52,120
- Columns: 7
  
<br>

⭐ **Key Feature Groups:**

- Brand and product details: brand_name, pants_description

- Pricing: MRP, price, discount_percent

- Customer signals: ratings, number_of_ratings

This dataset was enhanced with additional engineered features to uncover deeper behavioral patterns and value drivers.

<br>

🛠️ **Tools and Technologies**

- Python: pandas, numpy, matplotlib, seaborn

- SQL: MySQL

- Visualization: Power BI

- Environment: Jupyter Notebook

<br>

🧪 **Feature Engineering**

To move beyond basic sales metrics, four key features were created:

- 1. Effective Discount Percent
  Helps measure how discount depth relates to demand and price sensitivity.

- 2. Rating Weighted
  Balances rating score with number of reviews to identify trustworthy products.

- 3. Value for Money Score (VFM)
  Captures perceived affordability relative to customer feedback.

- 4. Popularity Index
  Measures demand momentum using ratings, review count, and engagement signals.

These features serve as the backbone for all downstream analysis.

<br>

🔍 **Exploratory Data Analysis**

After engineering the enriched dataset, EDA was conducted to explore:

- Brand performance
- Product demand patterns
 Discount elasticity
- Rating reliability
- Pricing strategy opportunities
- Promotion-ready product segments

The refined dataset was validated, standardized, and exported to Power BI for interactive reporting.

<br>

❓ **Answered Business Questions in Python**

  1. Which brands offer the best value-for-money?
  2. Which products are high-demand despite low discounts?
  3. Which products have high ratings but low trust?
  4. What discount range maximizes popularity?
  5. Which products should be promoted during sales campaigns?
  6. Are there any underpriced hidden gems?
  7. Which brands rely on discounts vs. quality and popularity?

Each question is supported by targeted visualizations and insights inside the report.

<br>

❓ **Answered Business Questions in SQL**

1. How does the discount percentage correlate with product ratings and number of ratings across brands?
2. Which brands experience the largest change in sales volume (proxy: number_of_ratings) when prices drop or discounts increase?
3. What is the ideal discount range that maximizes both customer engagement (ratings, reviews) and minimizes profit loss for each brand?
4. Are premium brands (like Levi’s, Calvin Klein, etc.) offering steeper discounts leading to dilution of brand equity compared to mid-range brands?
5. How do similar product types (e.g., “Men Slim Fit Jeans”) differ in average price and discount across brands, and which pricing strategies outperform in ratings?
6. Which brands consistently achieve high ratings and engagement despite higher pricing, indicating strong perceived value?
7. Which product categories (e.g., Cotton Pants, Slim Fit Jeans, Joggers) perform best for specific brands in terms of both user feedback and pricing balance?
8. Which brands or product types receive consistently low ratings or very few reviews, suggesting low market traction?
9. Which combinations of price range and rating trends suggest products that should be restocked frequently due to high demand and customer satisfaction?
10. Are there brands or categories where customer engagement (number_of_ratings) grows steadily over time, signaling potential for long-term retention and repeat purchases?

<br>

💡 **Business Insights and Recommendations**

- Prioritize value-strong brands like LINARIA and COMFITS for visibility and partnerships.
- Promote brands like WROGN and Flying Machine, which maintain demand even without heavy discounting.
- Avoid relying on products with high ratings but low review volume when planning promotions.
- Use deeper discount ranges during sale campaigns to maximize traffic and conversions.
- Highlight high-performing products with strong popularity and VFM scores in promotional banners.
- Feature underpriced high-quality items in curated “Best Value” or budget-friendly collections.
- Tailor discount strategy by identifying which brands compete on price versus brand strength.

<br>

📘 **Key Findings**

- Strong value-driven brands deliver consistent performance and should be leveraged for growth.
- Deep discounting remains the most powerful driver of demand in this category.
- Products with high ratings but low review volume should be treated carefully due to rating instability.
- Some brands enjoy high demand independent of discounts, allowing for margin-focused strategies.

<br>

🚀 **Growth Perspective**

Through this project, I strengthened my ability to turn raw ecommerce data into actionable insights using SQL, Python, and Power BI. I learned how to engineer meaningful metrics, analyze pricing and discount patterns, evaluate brand performance, and identify high-value products. The project helped me connect data patterns to real business decisions in merchandising, pricing strategy, and campaign planning.
