CREATE TABLE kimia_farma.kf_aggregate_final AS
SELECT
  *,
  nett_sales * persentase_gross_laba AS nett_profit,
FROM
  `kimia_farma.kf_aggregate`;
