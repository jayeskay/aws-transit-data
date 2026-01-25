# Transit Project

## Conventions

- Models should be pluralized--for example: `customers`, `orders`, `products`.
- Each model should have a primary key.
    - This key in any given model should be named `<object>_id`--for example: `account_id`.
    - This makes it easier to know what id is being referenced in downstream joined models.
    - Keys should be string data types.
- Underscores exclusively are used for spacing--no dots.
    - models_without_dots
- Name dbt staging models according to dbt convention: `stg_<source>__<subset>.sql`
    - If you need to specify cadence, then `stg_<source>__<subset>_<cadence>.sql`
    - If it's a source for a slowly-changing dimension ("SCD") table, then `stg_<source>__<subset>_historical.sql`
        - The destination SCD table should be named as: `stg_<source>__<subset>_scd.sql`
- Consistency is key! Use the same field names across models where possible.
    - For example, a key to the `customers` table should be named `customer_id` rather than `user_id` or `id`.
- **Do not use abbreviations or aliases**--for example: do not use `cust` for `customer` or `o` for `orders`.
    - Emphasize readability over brevity.
- Avoid reserved words as column names, but yes, it will happen.
- Event dates and times should be past tense: `created`, `updated`, or `deleted`.
- Schema, table and column names should be in snake_case.
- Naming specific column types:
    - Boolean: prefix with `is_` or `has_`.
    - Timestamp: use `<event>_at` convention (for example, `created_at`)
        - UTC by default, but if different timezone is used, **this should be indicated with a suffix** (`created_at_uspt`).
    - Date: use `<event>_date`.
    - Price/revenue: decimal currency (19.99 for $19.99; many app databases store prices as integers in cents)
        - If a non-decimal currency is used, **indicate this with a suffix** (`price_in_cents`).
- Use names based on the business terminology, rather than the source terminology.
    - For example, if the source database uses `user_id` but the business calls them `customer_id`, use `customer_id` in the model.
    - Versions of models should use the suffix `_v1`, `_v2`, etc. for consistency (so, `customers_v1` and `customers_v2`).
- Use a **consistent ordering of data types and consider grouping and labeling columns by type**, as in the example below.
    - This will minimize join errors and make it easier to read the model, as well as *help downstream consumers of the data understand the data types and scan models for the columns they need*.
    - Use the following order: identifiers, then strings, then numerics, then booleans, then dates and timestamps (this is less strict).

### Example Model

```sql
with

source as (

    select * from {{ source('ecom', 'raw_orders') }}

),

renamed as (

    select

        ----------  ids
        id as order_id,
        store_id as location_id,
        customer as customer_id,

        ---------- strings
        status as order_status,

        ---------- numerics
        (order_total / 100.0)::float as order_total,
        (tax_paid / 100.0)::float as tax_paid,

        ---------- booleans
        is_fulfilled,

        ---------- dates
        date(order_date) as ordered_date,

        ---------- timestamps
        ordered_at

    from
        source

)

select * from renamed
```

[Source](https://docs.getdbt.com/best-practices/how-we-style/1-how-we-style-our-dbt-models)

## dbt Resources

- Learn more about dbt [in the docs](https://docs.getdbt.com/docs/introduction)
- Check out [Discourse](https://discourse.getdbt.com/) for commonly asked questions and answers
- Join the [chat](https://community.getdbt.com/) on Slack for live discussions and support
- Find [dbt events](https://events.getdbt.com) near you
- Check out [the blog](https://blog.getdbt.com/) for the latest news on dbt's development and best practices
