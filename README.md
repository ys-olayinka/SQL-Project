# 📊 Learner Enrolment Analysis Using SQL

## 📌 Executive Summary

This project showcases a practical use case of SQL for analyzing learner enrolment and progression data within an educational institution. The database includes student demographics and enrolment history. Through a series of SQL queries, the project answers key business questions around learner retention, funding, enrolment activity, and program effectiveness.

---

## 🧩 Business Problem

The institution wants to better understand learner activity patterns, including:
- Identifying students still in programs but past their expected end dates
- Tracking enrolment and withdrawal trends for the academic year `23/24`
- Analyzing the impact of funding types on enrolment volume
- Determining learners who transferred but never re-enrolled

These insights are essential for improving student support services, resource allocation, and retention strategies.

---

## 🧪 Methodology

1. **Database Schema Design**:  
   Created two tables  `StudentDetail` and `Enrolment`  representing student information and enrolment records.

2. **Data Analysis Using SQL**:  
   Wrote targeted SQL queries to address real-world business questions.  
   - Used `JOINs`, `WHERE` filters, `GROUP BY`, `CASE`, and `WINDOW FUNCTIONS`
   - Incorporated `CURRENT_DATE` to calculate overdue durations
   - Leveraged `NOT EXISTS` to detect missing re-enrolments after transfers

3. **Query Breakdown**:  
   - Q1–Q7 each address a unique scenario related to student progression or funding insights.

---

## 🧠 Skills Demonstrated

- Relational Database Design  
- SQL Query Writing  
- Filtering and Aggregation  
- Analytical Functions (e.g., `ROW_NUMBER()`, `DATEDIFF`)  
- Business Logic Implementation in SQL  
- Data Auditing and Validation  

---

## 📈 Results & Business Recommendations

- **Learner Monitoring**: Identified students continuing in 2023/24 who are overdue past their expected end dates.
- **Retention Alerting**: Detected learners marked as transferred but never re-enrolled prompting investigation.
- **Funding Optimization**: Revealed enrolment volume distribution by Funding ID, helping in future budgeting.
- **Data Quality Checks**: Ensured learners have complete and updated enrolment trails, reducing gaps in academic records.

**Recommendations:**
- Implement an automated SQL job to flag overdue learners weekly.
- Notify student services of transfer cases with no new enrolments.
- Reassess funding allocations based on enrolment data grouped by `FundingID`.

---

## 🚀 Next Steps

- Integrate this SQL logic into a BI dashboard (e.g., Power BI or Tableau)
- Automate reporting via stored procedures or scheduled tasks (SQL Agent or cron)
- Expand the schema to include course level data and outcomes
- Apply Python for additional ETL and data validation workflows

---

💡 *This project is a demonstration of how SQL can be used for real world educational data analytics and operational decision making.*











