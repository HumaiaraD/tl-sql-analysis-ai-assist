Example : 
Identify active accounts where usage in the last 30 days dropped by 50% or more compared to the previous 30 days.

Requirements: 
- Use usage_events table
- Group by account_id
- Calculate:
  - last 30 days usage
  - previous 30 days usage
- Compare both time periods
- Define “significant drop” as a 50% or greater decrease
- Filter to active accounts using account_status = 'active'
- Use only valid schema columns

