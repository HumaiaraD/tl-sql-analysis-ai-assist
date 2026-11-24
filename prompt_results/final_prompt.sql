WITH usage_summary AS (
    SELECT
        u.account_id,
        SUM(CASE
            WHEN u.event_date >= r.recent_30_day_start
            AND u.event_date <= r.reporting_date
            THEN 1 ELSE 0
        END) AS last_30_days,
        SUM(CASE
            WHEN u.event_date >= r.recent_60_day_start
            AND u.event_date < r.recent_30_day_start
            THEN 1 ELSE 0
        END) AS previous_30_days
    FROM usage_events AS u
    CROSS JOIN reporting_context AS r
    GROUP BY u.account_id
)
SELECT
    a.account_id,
    a.account_name,
    u.last_30_days,
    u.previous_30_days,
    u.previous_30_days - u.last_30_days AS usage_drop,
    ROUND(
        100.0 * (u.previous_30_days - u.last_30_days)
        / u.previous_30_days, 2
    ) AS percentage_drop
FROM usage_summary AS u
JOIN accounts AS a
    ON u.account_id = a.account_id
WHERE a.account_status = 'active'
    AND u.previous_30_days > 0
    AND u.last_30_days <= u.previous_30_days * 0.5
ORDER BY percentage_drop DESC, usage_drop DESC;