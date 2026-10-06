-- 1) Top 20 sellers
SELECT seller_id, performance_index, network_share_pct
FROM seller_performance
ORDER BY performance_index DESC
LIMIT 20;

-- 2) High new-business mix
SELECT seller_id, performance_index, new_business_mix_pct
FROM seller_performance
WHERE new_business_mix_pct >= 70
ORDER BY performance_index DESC;

-- 3) Rank and cumulative contribution
WITH ranked AS (
  SELECT
    seller_id,
    performance_index,
    network_share_pct,
    ROW_NUMBER() OVER (ORDER BY performance_index DESC) AS seller_rank,
    SUM(network_share_pct) OVER (
      ORDER BY performance_index DESC
      ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
    ) AS cumulative_share_pct
  FROM seller_performance
)
SELECT *
FROM ranked
ORDER BY seller_rank;

-- 4) Sellers accounting for first 80% of network contribution
WITH ranked AS (
  SELECT
    seller_id,
    performance_index,
    network_share_pct,
    ROW_NUMBER() OVER (ORDER BY performance_index DESC) AS seller_rank,
    SUM(network_share_pct) OVER (
      ORDER BY performance_index DESC
      ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
    ) AS cumulative_share_pct
  FROM seller_performance
)
SELECT *
FROM ranked
WHERE cumulative_share_pct <= 80
ORDER BY seller_rank;

-- 5) Reconciliation pattern (adapt column names after importing branch table)
-- SELECT s.seller_id
-- FROM seller_performance s
-- LEFT JOIN branch_performance b ON s.branch_id = b.branch_id
-- WHERE b.branch_id IS NULL;
