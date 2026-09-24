-- Health Insurance Claims Analysis & Fraud Detection
-- Essential SQL Business Analysis Queries

CREATE DATABASE IF NOT EXISTS health_insurance;
USE health_insurance;

-- 1. Basic overview
SELECT COUNT(*) AS total_claims,
       SUM(Is_Fraudulent = TRUE) AS fraudulent_claims,
       ROUND(100 * AVG(Is_Fraudulent = TRUE), 2) AS fraud_rate
FROM health_insurance_claims;

-- 2. Total and average claim amount
SELECT COUNT(*) AS total_claims,
       ROUND(SUM(Claim_Amount), 2) AS total_claim_amount,
       ROUND(AVG(Claim_Amount), 2) AS average_claim_amount
FROM health_insurance_claims;

-- 3. Fraud rate by provider type
SELECT Provider_Type, COUNT(*) AS total_claims,
       SUM(Is_Fraudulent = TRUE) AS fraudulent_claims,
       ROUND(100 * AVG(Is_Fraudulent = TRUE), 2) AS fraud_rate
FROM health_insurance_claims
GROUP BY Provider_Type ORDER BY fraud_rate DESC;

-- 4. Fraud rate by provider specialty
SELECT Provider_Specialty, COUNT(*) AS total_claims,
       SUM(Is_Fraudulent = TRUE) AS fraudulent_claims,
       ROUND(100 * AVG(Is_Fraudulent = TRUE), 2) AS fraud_rate
FROM health_insurance_claims
GROUP BY Provider_Specialty ORDER BY fraud_rate DESC;

-- 5. Fraud rate by service type
SELECT Service_Type, COUNT(*) AS total_claims,
       SUM(Is_Fraudulent = TRUE) AS fraudulent_claims,
       ROUND(100 * AVG(Is_Fraudulent = TRUE), 2) AS fraud_rate
FROM health_insurance_claims
GROUP BY Service_Type ORDER BY fraud_rate DESC;

-- 6. Monthly fraud trend
SELECT YEAR(Claim_Date) AS claim_year, MONTH(Claim_Date) AS claim_month,
       COUNT(*) AS total_claims,
       SUM(Is_Fraudulent = TRUE) AS fraudulent_claims,
       ROUND(100 * AVG(Is_Fraudulent = TRUE), 2) AS fraud_rate
FROM health_insurance_claims
GROUP BY YEAR(Claim_Date), MONTH(Claim_Date)
ORDER BY claim_year, claim_month;

-- 7. Top 10 high-value claims
SELECT Claim_ID, Patient_ID, Claim_Amount, Provider_Type,
       Provider_Specialty, Is_Fraudulent
FROM health_insurance_claims
ORDER BY Claim_Amount DESC LIMIT 10;

-- 8. Provider-level analysis
SELECT Hospital_ID, COUNT(*) AS total_claims,
       SUM(Is_Fraudulent = TRUE) AS fraudulent_claims,
       ROUND(AVG(Claim_Amount), 2) AS average_claim_amount,
       ROUND(100 * AVG(Is_Fraudulent = TRUE), 2) AS fraud_rate
FROM health_insurance_claims
GROUP BY Hospital_ID
HAVING COUNT(*) >= 10
ORDER BY fraud_rate DESC;

-- 9. Fraud by admission type
SELECT Admission_Type, COUNT(*) AS total_claims,
       SUM(Is_Fraudulent = TRUE) AS fraudulent_claims,
       ROUND(100 * AVG(Is_Fraudulent = TRUE), 2) AS fraud_rate
FROM health_insurance_claims
GROUP BY Admission_Type ORDER BY fraud_rate DESC;

-- 10. Fraud by provider state
SELECT Provider_State, COUNT(*) AS total_claims,
       SUM(Is_Fraudulent = TRUE) AS fraudulent_claims,
       ROUND(100 * AVG(Is_Fraudulent = TRUE), 2) AS fraud_rate
FROM health_insurance_claims
GROUP BY Provider_State ORDER BY fraud_rate DESC;
