
## Queries Explanation

### a) Tiger Taxonomy and Sumatran Tiger NCBI ID
- This query counts the distinct tiger types found in the taxonomy table by filtering scientific names containing "tigris".
- It also retrieves the NCBI taxonomy ID (`ncbi_id`) for the Sumatran tiger using its full biological name "Panthera tigris sumatrae".
- Useful for taxonomic classification research and identification.

### b) Identifying Join Columns
- Lists all foreign key columns in the Rfam database.
- Reveals how tables are interconnected, aiding in building complex join queries.
- Uses `information_schema.KEY_COLUMN_USAGE` to find columns with foreign key constraints.

### c) Rice Type with Longest DNA Sequence
- Joins `rfamseq` (sequence metadata) with `taxonomy` tables.
- Filters for rows where the taxonomy string contains "rice".
- Orders by DNA sequence length descending and limits to the longest sequence.

### d) Pagination of Families with Long DNA sequences
- Retrieves RNA families (`family` table) with the longest DNA sequences (`rfamseq` and `full_region` tables).
- Only includes families with max DNA sequence lengths greater than 1,000,000.
- Results are ordered by max length descending.
- Uses `LIMIT` and `OFFSET` to paginate results.
- Demonstrates practical pagination for large biological dataset queries.

## Running the Queries
1. Connect to the Rfam MySQL database using the credentials above.
2. Load the `rfam_queries.sql` file in your MySQL client or paste the SQL commands individually.
3. Execute the queries to view results in your client or terminal.

## Notes
- Taxonomy string searching with `LIKE` depends on how taxonomic names are stored; adjust as needed.
- Pagination offset = (page number - 1) * results per page.
- The database schema and relationships are subject to updates, so verify foreign keys if encountering join issues.

## Further Information
Visit [Rfam Documentation](https://docs.rfam.org/en/latest/database.html) for more details on the database schema and usage.

---

This completes the SQL queries and usage documentation for working with the Rfam database to solve the given problems.
