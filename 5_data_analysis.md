### <u> Key Business Questions </u>

> 1. What are some of the possible reasons that could explain a difference in consumer behaviour and their effects on transaction orders and revenue;
> 2. What factors affect customer satisfaction and what can be done to improve customer satisfaction

### <u> Key Areas of Analysis </u>

To answer the identified business questions, our analysis has focused on these key areas:

> 1.**Analyze volume and value of transaction across different time periods**. This could help to identify when and why transactions could peak at certain timings. Promotion/marketing campagins can then be tailored accordingly. 
<br> 2. **Analyze customers reviews to extract sentiment and common themes**. This could help to improve product quality and customer service and boost sales.
<br> 3. **Analyze order fulfillment times, shipping delays, and delivery performance**. This could help to improve the customer experience and boost sales.
<br> 4. **Analyse data on customers and sellers** on location and impact on customer satisfaction.

### <u> Key Findings </u>

1. There is **scope for differentiation in terms of marketing campaigns/promotions during peak order months**. E.g. for months driven by online sale events vs gift-giving holidays. The former has more customers making mulitples orders and the latter has higher average value per order. Further granularity could possibly be by the **best-selling product categories in the different peak order months**.

Top 5 Months (Transactions)

| Month    | Transaction Value (BRL) | Number of Orders Made | Average Value per Order Made | Possible Reason                                                                                                                                         |
|----------|-------------------------|-----------------------|------------------------------|--------------------------------------------------------------------------------------------------------------------------------------------------------|
| 2017-11  | 1,126,507.38            | 7,217                 | 156.09                       | Black Friday - The biggest e-commerce event in Brazil, with massive discounts across all categories.                                                   |
|          |                         |                       |                              | Cyber Monday - Focuses mainly on tech and electronics deals, extending the shopping frenzy.                                                            |
| 2018-04  | 1,114,837.22            | 6,768                 | 164.72                       | Easter - Big festive occasion in Brazil, many consumers buy chocolates, gifts, and decorations online.                                                   |
| 2018-05  | 1,109,180.15            | 6,720                 | 165.06                       | Mother's Day - One of the biggest gift-giving holidays, prompting spikes in gifts like perfumes, fashion, and electronics.                               |
| 2018-03  | 1,104,494.96            | 6,973                 | 158.40                       | Consumer's Day - Smaller event focused on consumer rights with some promotions.                                                                         |
|          |                         |                       |                              | Carnival - Many online purchases for costumes, party supplies, and travel leading up to the festival.                                                   |
|          |                         |                       |                              | Back-to-school Sales - Seasonal sales on school supplies, uniforms, and electronics.                                                                  |
| 2018-01  | 1,060,824.35            | 7,010                 | 151.33                       | Post Christmas Sales - Retailers offer discounts to clear leftover inventory from holiday season.                                                      |


2. The **lower the review score is, the higher the proportion of non-null text comments provided by customers**. It is possible that customers may be more inclined to voice out what caused their dissatisfaction rathen than explain what made them satisfied. In future, perhaps the **review system could be revamped to encourage more detailed reviews in different categories** (e.g. delivery, product quality etc) so that we can gather more insights on what aspects of the transaction are the consumers are satisifed or disatisified with.

3. **Delivery times and later-than-expecected deliveries appear to have an impact on customer review scores**. Customers giving a 1 had to wait twice as long on average for their orders to be delivered, as compared to customers who gave a score of 5. **As a possible KPI we can set a standard to ensure most deliveries are delivered with 10-14 days from purchase**. (13 days was the 75% percentile for orders that scored 5 on reviews) Later-than-expected deliveries are also disproportionally higher for reviews that scored 1. Hence, the operations team could look into **providing more realistic estimated delivery times** while working on delivery efficiency and meeting the proposed KPI.

![Screenshot 2025-06-23 212821](https://github.com/user-attachments/assets/d8985fe9-2700-413f-807a-78da522ef22b)


4. **The customer-to-seller ratio in a state could have an impact on the average review score from customers within that state**. There is a negative correlation of around **-0.7** between the two. Hence having sellers in proximity of customers may be beneficial. We could consider onboarding more sellers in the state of Rio De Janeiro, which has a relatively lower average review score, and higher customer-to-seller ratio as compared to the other states that are in the top 5 for customer payments.

   ![Screenshot 2025-06-23 212303](https://github.com/user-attachments/assets/413db976-e1bf-4955-b6c9-ab3aa10fc966)

