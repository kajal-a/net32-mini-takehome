Welcome to your net32_mini_takehome dbt project!

### Resources:
- Learn more about dbt [in the docs](https://docs.getdbt.com/docs/introduction)
- Check out [Discourse](https://discourse.getdbt.com/) for commonly asked questions and answers
- Join the [chat](https://community.getdbt.com/) on Slack for live discussions and support
- Find [dbt events](https://events.getdbt.com) near you
- Check out [the blog](https://blog.getdbt.com/) for the latest news on dbt's development and best practices


## Steps to run the project:
Copy the target profile from sample_profile.yml to your profiles.yml 
Run the following commands:
    dbt deps
    dbt seed
    dbt run
    dbt test

The Part A of the assignment is materialized as tables in the project itself
To get the results of these queries, you would need to download DuckDB CLI from here https://duckdb.org/install/?platform=macos&environment=cli

Once installed open the CLI in projects terminal
Run the following commands:
    ./duckdb(Windows) --> To start DuckDB CLI 
    .open dev.duckdb
    select * from dev.main_net32_marts.daily_revenue;
    select * from dev.main_net32_marts.top_customers;
    select * from dev.main_net32_marts.product_performance;
    .exit