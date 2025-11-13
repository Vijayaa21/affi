-- Answer a: How many types of tigers can be found in the taxonomy table?
SELECT COUNT(DISTINCT tax_string) AS tiger_types_count
FROM taxonomy
WHERE tax_string LIKE '%tigris%';

-- What is the "ncbi_id" of the Sumatran Tiger (biological name: Panthera tigris sumatrae)?
SELECT ncbi_id
FROM taxonomy
WHERE tax_string LIKE '%Panthera tigris sumatrae%';


-- Answer b: Find all the columns that can be used to connect the tables in the database
SELECT TABLE_NAME, COLUMN_NAME
FROM information_schema.KEY_COLUMN_USAGE
WHERE TABLE_SCHEMA = 'Rfam'
AND REFERENCED_TABLE_NAME IS NOT NULL;


-- Answer c: Which type of rice has the longest DNA sequence?
SELECT tx.tax_string AS rice_type, rf.length
FROM rfamseq rf
JOIN taxonomy tx ON rf.ncbi_id = tx.ncbi_id
WHERE tx.tax_string LIKE '%rice%'
ORDER BY rf.length DESC
LIMIT 1;


-- Answer d: Paginate family names and their longest DNA sequence lengths where lengths > 1,000,000
-- Return the 9th page of results with 15 results per page, showing family accession ID, family name, max length
SELECT fam.rfam_acc, fam.name, MAX(rf.length) AS max_length
FROM family fam
JOIN rfamseq rf ON 1=1
JOIN full_region fr ON fr.rfamseq_acc = rf.rfamseq_acc AND fr.rfam_acc = fam.rfam_acc
GROUP BY fam.rfam_acc, fam.name
HAVING max_length > 1000000
ORDER BY max_length DESC
LIMIT 15 OFFSET 120; -- (9-1)*15 = 120 offset for the 9th page
