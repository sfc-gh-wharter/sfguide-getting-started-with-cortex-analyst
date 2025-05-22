
USE ROLE HOL_ROLE;

-- Use the created warehouse for your username
-- TODO: Replace <your_user> with your username
-- EXAMPLE:  USER50_WH
USE WAREHOUSE <your_user>_WH;
-- TODO: Replace <your_user> with your username
USE DATABASE <your_user>_DB;

-- TODO: Replace <your_user> with your username
CREATE OR REPLACE SCHEMA <your_user>_DB.revenue_timeseries;
USE SCHEMA <your_user>_DB.revenue_timeseries;

-- Create stage for raw data
CREATE OR REPLACE STAGE raw_data DIRECTORY = (ENABLE = TRUE);

/*--
• Fact and Dimension Table Creation
--*/

-- Fact table: daily_revenue
-- TODO: Replace <your_user> with your username
CREATE OR REPLACE TABLE <your_user>_DB.revenue_timeseries.daily_revenue (
    date DATE,
    revenue FLOAT,
    cogs FLOAT,
    forecasted_revenue FLOAT,
    product_id INT,
    region_id INT
);

-- Dimension table: product_dim
-- TODO: Replace <your_user> with your username
CREATE OR REPLACE TABLE <your_user>_DB.revenue_timeseries.product_dim (
    product_id INT,
    product_line VARCHAR(16777216)
);

-- Dimension table: region_dim
-- TODO: Replace <your_user> with your username
CREATE OR REPLACE TABLE <your_user>_DB.revenue_timeseries.region_dim (
    region_id INT,
    sales_region VARCHAR(16777216),
    state VARCHAR(16777216)
);
