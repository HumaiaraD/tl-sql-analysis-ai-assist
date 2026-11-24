WITH usage_summary AS (
    SELECT
        u.account_id,
        SUM(CASE
            WHEN u.event_date >= r.recent_30_day_start
            AND u.event_date <= r.reporting_date
            THEN 1 ELSE 0
        END) AS last_30_days_usage,
        SUM(CASE
            WHEN u.event_date >= r.recent_60_day_start
            AND u.event_date < r.recent_30_day_start
            THEN 1 ELSE 0
        END) AS previous_30_days_usage
    FROM usage_events AS u
    JOIN accounts AS a
        ON u.account_id = a.account_id
    CROSS JOIN reporting_context AS r
    WHERE a.account_status = 'active'
    GROUP BY u.account_id
)
SELECT
    account_id,
    last_30_days_usage,
    previous_30_days_usage,
    ROUND(
        100.0 * (previous_30_days_usage - last_30_days_usage)
        / previous_30_days_usage, 2
    ) AS percentage_drop
FROM usage_summary
WHERE previous_30_days_usage > 0
    AND last_30_days_usage <= previous_30_days_usage * 0.5
ORDER BY percentage_drop DESC;
