-- Portfolio-safe SQL demo: no customer or company identifiers are included.
WITH ranked AS (
    SELECT
        seller_id,
        performance_index,
        network_share_pct,
        new_business_mix_pct,
        ROW_NUMBER() OVER (ORDER BY performance_index DESC) AS seller_rank
    FROM seller_performance
)
SELECT
    seller_id,
    performance_index,
    network_share_pct,
    new_business_mix_pct,
    seller_rank
FROM ranked
WHERE seller_rank <= 20
ORDER BY seller_rank;
