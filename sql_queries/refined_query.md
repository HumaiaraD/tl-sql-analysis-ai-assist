Example : Identify active accounts where usage in the last 30 days dropped by 50% or more compared to the previous 30 days.

Schema: Table: accounts
	▪	account_id
	▪	account_name
	▪	plan_type
	▪	industry
	▪	account_status
	▪	created_date
Table: usage_events
	▪	event_id
	▪	account_id
	▪	event_date
	▪	event_type
	▪	user_id
	▪	feature_name
Table: subscriptions
	▪	subscription_id
	▪	account_id
	▪	start_date
	▪	renewal_date
	▪	monthly_recurring_revenue
	▪	subscription_status
Table: support_tickets
	▪	ticket_id
	▪	account_id
	▪	created_date
	▪	ticket_status
	▪	priority
	▪	issue_category
Table: reporting_context
	▪	context_id
	▪	reporting_date
	▪	data_start_date
	▪	data_end_date
	▪	recent_30_day_start
	▪	recent_60_day_start
	▪	recent_3_month_start
	▪	recent_6_month_start
	▪	date_column
	▪	notes



Requirements: - Use usage_events table
- Group by account_id
- Calculate:
  - last 30 days usage
  - previous 30 days usage
- Compare both time periods
- Define “significant drop” as a 50% or greater decrease
- Filter to active accounts using account_status = 'active'
- Use only valid schema columns
- usage_score does not exist
- Only last 30 days included
- No comparison between time periods


