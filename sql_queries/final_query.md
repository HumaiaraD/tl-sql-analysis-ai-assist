Example
Write a SQL query using the usage_events and accounts tables.

Requirements:
- Count usage events per account
- Calculate:
  - last 30 days
  - previous 30 days
- Compare both periods and apply the 50% drop threshold
- Return active accounts where usage dropped by 50% or more
- Use only schema-defined columns
- Only include accounts where account_status = 'active'

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
