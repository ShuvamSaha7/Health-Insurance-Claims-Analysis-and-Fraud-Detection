# Health Insurance Claims Analysis and Fraud Detection

An end-to-end Machine Learning project for analyzing health insurance claims and detecting potentially fraudulent claims using Python, Pandas, NumPy, Scikit-learn, and SQL.

## Project Objective

The objective of this project is to analyze health insurance claim data, identify patterns associated with fraudulent claims, and develop Machine Learning models that can classify claims as **Fraudulent** or **Genuine**.

The project also applies clustering and regression techniques to gain additional insights into claim behavior and claim amounts.

---

## Machine Learning Approach

The project uses three major Machine Learning approaches:

### 1. Fraud Classification

A supervised learning approach is used to predict whether an insurance claim is fraudulent.

**Target Variable:**

`Is_Fraudulent`

**Models implemented:**

* Logistic Regression
* K-Nearest Neighbors (KNN)
* Decision Tree
* Random Forest

The models are evaluated using:

* Accuracy
* Precision
* Recall
* F1-Score
* ROC-AUC
* Confusion Matrix

Since fraud detection is a classification problem, **Precision and Recall** are particularly important for evaluating model performance.

---

### 2. Customer/Claim Pattern Clustering

K-Means Clustering is used to identify groups of insurance claims with similar characteristics.

Features include:

* Claim Amount
* Patient Age
* Number of Procedures
* Length of Stay
* Deductible Amount
* CoPay Amount
* Previous Provider Claims
* Provider-Patient Distance

The **Elbow Method** and **Silhouette Score** are used to analyze the appropriate number of clusters.

After clustering, the observed fraud rate of each cluster is analyzed to understand whether certain claim groups contain a higher proportion of fraudulent claims.

---

### 3. Claim Amount Prediction

Linear Regression is used to predict the expected **Claim Amount** based on available claim and patient characteristics.

The regression model is evaluated using:

* MAE
* MSE
* RMSE
* R² Score

This provides an additional Machine Learning perspective on the financial characteristics of insurance claims.

---

## Machine Learning Pipeline

```text
Raw Insurance Claims Dataset
          ↓
Data Understanding
          ↓
Data Cleaning
          ↓
Feature Engineering
          ↓
Statistical Analysis
          ↓
Exploratory Data Analysis
          ↓
Train-Test Split
          ↓
Data Preprocessing
          ↓
Encoding + Scaling
          ↓
Machine Learning
     ┌────┴──────────────┐
     ↓                   ↓
Classification       Clustering
     ↓                   ↓
Logistic Regression   K-Means
KNN
Decision Tree
Random Forest
     ↓
Fraud Prediction
     ↓
Model Evaluation
     ↓
Business Insights
```

---

## Data Processing

The dataset is processed using Python before applying Machine Learning.

### Data Cleaning

The following steps are performed:

* Checking missing values
* Removing duplicate records
* Checking data types
* Converting date columns
* Detecting invalid values
* Identifying potential outliers
* Checking categorical values
* Checking numerical distributions

### Feature Engineering

Additional features are created to improve analysis and Machine Learning:

* Claim Year
* Claim Month
* Claim Day
* Days Between Service and Claim
* Days to Policy Expiry
* Claim Amount per Procedure
* Total Previous Claims
* Patient Claim Frequency
* Provider Claim Frequency
* High Value Claim Indicator
* Multiple Procedure Indicator
* Age Validation Indicator

---

## Model Preprocessing

Before training the models:

1. Numerical features are handled using median imputation and scaling.
2. Categorical features are handled using most-frequent imputation and one-hot encoding.
3. Identifier columns that do not provide meaningful predictive information are excluded.
4. The dataset is divided into training and testing sets.
5. Stratified splitting is used for the fraud classification problem.

---

## Classification Results

| Model               | Accuracy | Precision | Recall | F1-Score | ROC-AUC |
| ------------------- | -------: | --------: | -----: | -------: | ------: |
| Logistic Regression |   74.74% |    49.41% | 71.51% |   58.44% |   0.816 |
| KNN                 |   79.25% |    59.98% | 49.45% |   54.21% |   0.758 |
| Decision Tree       |   81.67% |    59.75% | 80.24% |   68.49% |   0.844 |
| Random Forest       |   85.60% |    76.29% | 60.98% |   67.78% |   0.871 |

The comparison demonstrates the trade-off between **fraud detection recall and precision** across different classification algorithms.

---

## Clustering Results

K-Means clustering is used to segment claims into groups based on their numerical characteristics.

The resulting clusters are then analyzed using:

* Average claim amount
* Average patient age
* Procedure count
* Length of stay
* Provider distance
* Fraud rate

This helps identify claim segments with different behavioral and financial patterns.

---

## Regression Results

Linear Regression is used to estimate claim amounts.

**Evaluation metrics:**

* MAE: `454,677.93`
* RMSE: `543,413.70`
* R²: `0.379`

The regression model is treated as a supplementary analysis to understand the factors associated with claim amounts.

---

## SQL Business Analysis

SQL is used alongside Machine Learning to analyze the business side of the insurance data.

Examples include:

* Total number of claims
* Fraudulent claim count
* Fraud rate
* Fraud by provider type
* Fraud by medical specialty
* Fraud by service type
* Fraud by state
* Monthly fraud trends
* High-value claims
* Provider-level claim analysis

---

## Key Insights

The analysis identifies several patterns in the dataset, including differences in fraud rates across:

* Provider types
* Provider specialties
* Admission types
* Service types
* Claim characteristics
* Number of procedures
* Provider-patient distance

For example, the observed fraud rate varies considerably between provider categories, showing why categorical and behavioral features can be useful in fraud classification.

---

## Technologies Used

* **Python**
* **Pandas**
* **NumPy**
* **Matplotlib**
* **Seaborn**
* **Scikit-learn**
* **MySQL**
* **Jupyter Notebook**

---

## Project Structure

```text
Health-Insurance-Claims-Analysis-and-Fraud-Detection/
│
├── data/
│   └── health_insurance_claims.csv
│
├── notebooks/
│   ├── 01_data_understanding.ipynb
│   ├── 02_data_cleaning.ipynb
│   ├── 03_feature_engineering.ipynb
│   ├── 04_statistical_analysis.ipynb
│   ├── 05_eda_visualization.ipynb
│   ├── 06_fraud_classification.ipynb
│   ├── 07_kmeans_clustering.ipynb
│   └── 08_claim_amount_regression.ipynb
│
├── sql/
│   └── health_insurance_business_analysis.sql
│
├── reports/
│   └── business_insights.md
│
├── requirements.txt
├── README.md
└── .gitignore
```

---

## Conclusion

This project demonstrates how Machine Learning can be applied to a real-world insurance problem by combining:

**Data Cleaning → Feature Engineering → Statistical Analysis → EDA → Classification → Clustering → Regression → Model Evaluation → Business Insights**

The primary Machine Learning objective is to build models capable of identifying potentially fraudulent insurance claims while comparing different algorithms and evaluation metrics.
