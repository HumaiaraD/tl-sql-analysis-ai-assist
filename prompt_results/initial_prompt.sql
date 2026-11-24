WITH usage_summary AS (
    SELECT
        account_id,
        SUM(CASE
            WHEN event_date >= DATE('now', '-30 days')
            AND event_date < DATE('now')
            THEN usage_amount
            ELSE 0
        END) AS last_30_days_usage,
        SUM(CASE
            WHEN event_date >= DATE('now', '-60 days')
            AND event_date < DATE('now', '-30 days')
            THEN usage_amount
            ELSE 0
        END) AS previous_30_days_usage
    FROM usage_events
    WHERE account_status = 'active'
    GROUP BY account_id
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