# AI-Assisted SQL Analysis

## Overview

This project explores how AI can assist with writing, debugging, and improving SQL queries. The objective is to identify active SaaS accounts whose usage decreased by 50% or more in the last 30 days compared to the previous 30 days.

The project emphasizes prompt engineering, schema validation, SQL accuracy, and responsible use of AI-generated code.

## Technologies Used

- Python
- SQLite
- Pandas
- Jupyter Notebook
- Visual Studio Code
- Generative AI

## Database Schema

The `saas_usage.db` database contains five tables:

| Table | Description |
|---|---|
| `accounts` | Account information and status |
| `usage_events` | Account activity and feature usage |
| `subscriptions` | Subscription and revenue information |
| `support_tickets` | Customer support records |
| `reporting_context` | Reporting dates and time boundaries |

## Project Objectives

- Inspect and validate the database schema.
- Generate SQL queries using AI-assisted prompting.
- Identify and correct errors in AI-generated SQL.
- Count usage events for two consecutive 30-day periods.
- Identify active accounts with a usage decrease of 50% or more.
- Improve the reliability of AI-assisted SQL workflows.

## Workflow

1. Connect to the SQLite database.
2. Inspect table schemas, sample records, and row counts.
3. Generate an initial SQL query using AI.
4. Execute the query and identify errors.
5. Refine the prompt with schema information and explicit requirements.
6. Generate and execute the corrected query.
7. Validate the results against the business requirements.

## Query Results

The final query identified five active accounts with significant usage decreases.

| Account ID | Last 30 Days | Previous 30 Days | Percentage Drop |
|---:|---:|---:|---:|
| 3 | 25 | 75 | 66.67% |
| 7 | 20 | 60 | 66.67% |
| 1 | 30 | 80 | 62.50% |
| 9 | 20 | 50 | 60.00% |
| 11 | 20 | 40 | 50.00% |

These accounts may require further investigation to understand declining engagement and potential customer retention risks.

## Improvements and Validation

The original AI-generated query referenced invalid columns and failed to compare both time periods correctly.

The improved query uses schema-defined columns, conditional aggregation, explicit reporting date boundaries, and a 50% decrease threshold. It also excludes accounts with zero previous-period usage to avoid division-by-zero errors.

Providing the database schema and clearer requirements in the prompt reduced errors and improved the reliability of the generated SQL.

## Getting Started

Install the required dependency:

```bash
pip install pandas
```

Connect to the database:

```python
import sqlite3
import pandas as pd

conn = sqlite3.connect("saas_usage.db")
```

Run the SQL queries against the database using the project notebook.

## Key Takeaways

AI can accelerate SQL development, but generated queries must be reviewed, tested, and validated. Providing accurate schema information, clear business requirements, and explicit constraints leads to more reliable results.

This project demonstrates the importance of combining AI-assisted development with human reasoning and data validation.