# Life Insurance Sales Performance & Incentive Analytics

Portfolio-safe case study derived from a real multi-source life-insurance sales analytics workflow.

## What is safe to share
- All seller and branch identifiers are anonymized.
- Customer names, national IDs, policy numbers, contracts, and source-system identifiers are excluded.
- Monetary amounts are not published.
- Public measures are normalized indices, percentages, ranks, and distribution statistics.

## Portfolio scope
- Source systems: 2 operational sales datasets
- Current-period sales rows reviewed: 59,584
- Adjustment rows represented in source workflow: 6,395
- Network master rows: 5,380
- Active sellers after portfolio filters: 1,512
- Branch entities represented: 71

## Business logic represented
- New-business contribution weight: 80%
- Existing-portfolio contribution weight: 20%
- Payment activity restricted to the campaign window
- Document-date cutoff applied
- Withdrawal / cancellation / surrender adjustments are part of the full production workflow

## Files
- `index.html`: interactive case study
- `synthetic_seller_performance.csv`: safe public seller-level data
- `synthetic_branch_performance.csv`: safe public branch-level data
- `league_portfolio_demo.sqlite`: demo database
- `portfolio_query.sql`: SQL example

## Important
This is a portfolio demonstration, not an official company report. Normalized public measures intentionally prevent reconstruction of confidential business figures.
