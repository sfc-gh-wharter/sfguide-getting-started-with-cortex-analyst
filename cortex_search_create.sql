USE DATABASE cortex_analyst_demo;
USE SCHEMA revenue_timeseries;

  CREATE OR REPLACE CORTEX SEARCH SERVICE product_line_search_service
  ON product_dimension
-- TODO: Replace <your_user> with your username
  WAREHOUSE = <your_user>_cortex_analyst_wh
  TARGET_LAG = '1 hour'
  AS (
      SELECT DISTINCT product_line AS product_dimension FROM product_dim
  );