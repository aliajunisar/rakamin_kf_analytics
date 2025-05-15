CREATE TABLE kimia_farma.kf_aggregate AS
SELECT
  ft.transaction_id,
  ft.date,
  ft.customer_name,
  ft.rating AS rating_transaksi,
  
  kc.branch_id,
  kc.branch_name,
  kc.kota,
  kc.provinsi,
  kc.branch_category,
  kc.rating AS rating_cabang,
  
  p.product_id,
  p.product_name,
  p.price AS actual_price,
  
  ft.discount_percentage,
  ft.price - (ft.price * discount_percentage) AS nett_sales,
  
  CASE
    WHEN ft.price <= 50000 THEN 0.10
    WHEN ft.price > 50000 AND ft.price <= 100000 THEN 0.15
    WHEN ft.price > 100000 AND ft.price <= 300000 THEN 0.20
    WHEN ft.price > 300000 AND ft.price <= 500000 THEN 0.25
    ELSE 30
  END AS persentase_gross_laba,

FROM
  `kimia_farma.kf_final_transaction` AS ft
JOIN
  `kimia_farma.kf_product` AS p ON ft.product_id = p.product_id
JOIN
  `kimia_farma.kf_kantor_cabang` AS kc ON ft.branch_id = kc.branch_id;
