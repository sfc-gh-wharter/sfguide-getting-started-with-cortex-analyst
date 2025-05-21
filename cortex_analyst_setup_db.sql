/*--
• Database and warehouse creation
--*/

-- You don't need this to work in the hands on lab environment we created.
-- this is left over from the generic quickstart. The hands on lab
-- uses the database USER##_DB and the warehouse USER##_WH

USE ROLE SECURITYADMIN;

CREATE ROLE cortex_user_role;
GRANT DATABASE ROLE SNOWFLAKE.CORTEX_USER TO ROLE cortex_user_role;

-- TODO: Replace <your_user> with your username
GRANT ROLE cortex_user_role TO USER <your_user>;

USE ROLE sysadmin;

-- Create demo database
CREATE OR REPLACE DATABASE cortex_analyst_demo;

-- Create schema
CREATE OR REPLACE SCHEMA cortex_analyst_demo.revenue_timeseries;

-- Create warehouse
CREATE OR REPLACE WAREHOUSE cortex_analyst_wh
    WAREHOUSE_SIZE = 'large'
    WAREHOUSE_TYPE = 'standard'
    AUTO_SUSPEND = 60
    AUTO_RESUME = TRUE
    INITIALLY_SUSPENDED = TRUE
COMMENT = 'Warehouse for Cortex Analyst demo';

-- TODO: Replace <your_user> with your username
GRANT USAGE ON WAREHOUSE cortex_analyst_wh TO ROLE cortex_user_role;
-- TODO: Replace <your_user> with your username
GRANT OPERATE ON WAREHOUSE cortex_analyst_wh TO ROLE cortex_user_role;

-- TODO: Replace <your_user> with your username
GRANT OWNERSHIP ON SCHEMA cortex_analyst_demo.revenue_timeseries TO ROLE cortex_user_role;
-- TODO: Replace <your_user> with your username
GRANT OWNERSHIP ON DATABASE cortex_analyst_demo TO ROLE cortex_user_role;

USE ROLE cortex_user_role;
