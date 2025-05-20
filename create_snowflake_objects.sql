/*--
• Database, schema, warehouse, and stage creation
--*/

USE ROLE SECURITYADMIN;

CREATE ROLE cortex_user_role;
GRANT DATABASE ROLE SNOWFLAKE.CORTEX_USER TO ROLE cortex_user_role;

-- TODO: Replace <your_user> with your username
GRANT ROLE cortex_user_role TO USER <your_user>;

USE ROLE sysadmin;

-- Create demo database
-- TODO: Replace <your_user> with your username
CREATE OR REPLACE DATABASE <your_user>_cortex_analyst_demo;

-- Create schema
CREATE OR REPLACE SCHEMA <your_user>_cortex_analyst_demo.revenue_timeseries;

-- Create warehouse
-- TODO: Replace <your_user> with your username
CREATE OR REPLACE WAREHOUSE <your_user>_cortex_analyst_wh
    WAREHOUSE_SIZE = 'large'
    WAREHOUSE_TYPE = 'standard'
    AUTO_SUSPEND = 60
    AUTO_RESUME = TRUE
    INITIALLY_SUSPENDED = TRUE
COMMENT = 'Warehouse for Cortex Analyst demo';

-- TODO: Replace <your_user> with your username
GRANT USAGE ON WAREHOUSE <your_user>_cortex_analyst_wh TO ROLE cortex_user_role;
-- TODO: Replace <your_user> with your username
GRANT OPERATE ON WAREHOUSE <your_user>_cortex_analyst_wh TO ROLE cortex_user_role;

-- TODO: Replace <your_user> with your username
GRANT OWNERSHIP ON SCHEMA <your_user>_cortex_analyst_demo.revenue_timeseries TO ROLE cortex_user_role;
-- TODO: Replace <your_user> with your username
GRANT OWNERSHIP ON DATABASE <your_user>_cortex_analyst_demo TO ROLE cortex_user_role;


USE ROLE cortex_user_role;

-- Use the created warehouse
-- TODO: Replace <your_user> with your username
USE WAREHOUSE <your_user>_cortex_analyst_wh;

-- TODO: Replace <your_user> with your username
USE DATABASE <your_user>_cortex_analyst_demo;
-- TODO: Replace <your_user> with your username
USE SCHEMA <your_user>_cortex_analyst_demo.revenue_timeseries;

-- Create stage for raw data
CREATE OR REPLACE STAGE raw_data DIRECTORY = (ENABLE = TRUE);

/*--
• Fact and Dimension Table Creation
--*/

-- Fact table: daily_revenue
-- TODO: Replace <your_user> with your username
CREATE OR REPLACE TABLE <your_user>_cortex_analyst_demo.revenue_timeseries.daily_revenue (
    date DATE,
    revenue FLOAT,
    cogs FLOAT,
    forecasted_revenue FLOAT,
    product_id INT,
    region_id INT
);

-- Dimension table: product_dim
-- TODO: Replace <your_user> with your username
CREATE OR REPLACE TABLE <your_user>_cortex_analyst_demo.revenue_timeseries.product_dim (
    product_id INT,
    product_line VARCHAR(16777216)
);

-- Dimension table: region_dim
-- TODO: Replace <your_user> with your username
CREATE OR REPLACE TABLE <your_user>_cortex_analyst_demo.revenue_timeseries.region_dim (
    region_id INT,
    sales_region VARCHAR(16777216),
    state VARCHAR(16777216)
);
