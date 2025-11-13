
# NAV Data Extraction PowerShell Script

## Overview
This PowerShell script downloads the latest mutual fund NAV data file (`NAVAll.txt`) from the AMFI India website. It extracts two important fields, **Scheme Name** and **Net Asset Value**, and saves them in a tab-separated value (TSV) file (`nav.tsv`) for easy processing.

## Why extract Scheme Name and Net Asset Value?
- These fields provide key insights into each mutual fund scheme and its market valuation.
- The output TSV file is simplified for reporting or further analysis.

## Script Details

### Script Name
`extract.ps1`

### What it does
- Downloads the NAV data file using `Invoke-WebRequest`.
- Parses the file to locate the header line.
- Extracts only **Scheme Name** and **Net Asset Value** columns from the data.
- Saves the results in a `nav.tsv` file with tab separation.

## How to use

1. Open PowerShell in the directory where you want to save the files.
2. Place the `extract.ps1` script in this directory.
3. Run the script using the command:

.\extract_nav.ps1

text

4. After completion, find the `nav.tsv` file in the same directory.
5. You can open `nav.tsv` with a text editor, Excel, or any tool that supports TSV format.

## Dependencies
- Internet connection to download the latest NAV data from the AMFI website.
- PowerShell environment (Windows PowerShell or PowerShell Core).

## Notes
- The script automatically detects the columns by name, so it works even if the column order changes in the source file.
- Blank or malformed lines are ignored.
- The output file uses UTF-8 encoding.

## Should this data be stored in JSON?
- **JSON** format is ideal for hierarchical or complex data and easier integration with modern applications.
- TSV/CSV is simpler, lighter, and suitable for tabular data and spreadsheet use.
- For advanced usage like API integration or programmatic consumption, converting to JSON is recommended.

## Contact
For questions or enhancements, feel free to reach out.

---

Thank you for using this script!