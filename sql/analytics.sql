-- KPI summary
SELECT
  COUNT(*) AS total_claims,
  ROUND(SUM(Billed),2) AS billed_total,
  ROUND(SUM(Allowed),2) AS allowed_total,
  ROUND(SUM(Paid),2) AS paid_total,
  ROUND(AVG(CASE WHEN DeniedFlag THEN 1 ELSE 0 END)::numeric,4) AS denial_rate
FROM claims_header;

-- Denial $ by code
SELECT DenialCode,
       COUNT(*) AS claims,
       ROUND(SUM(Allowed - Paid),2) AS denied_dollars
FROM claims_header
WHERE DeniedFlag = TRUE
GROUP BY DenialCode
ORDER BY denied_dollars DESC;

-- Allowed & denial by ClaimType
SELECT ClaimType,
       COUNT(*) AS claims,
       ROUND(SUM(Allowed),2) AS allowed_total,
       ROUND(AVG(CASE WHEN DeniedFlag THEN 1 ELSE 0 END)::numeric,4) AS denial_rate
FROM claims_header
GROUP BY ClaimType
ORDER BY allowed_total DESC;
