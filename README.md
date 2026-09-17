# Competitive 3x3 Speedcubing Improvement Analysis

An analysis of how competitive 3x3 speedcubers improve with experience, using official World Cube Association data from 2003–2026.

![Speedcubing improvement dashboard](tableau/Competitive%203x3%20Speedcubing%20Improvement%20Analysis.png)

## Key Findings

- Typical competition averages fell from 25.8 seconds at competition 1 to 14.0 seconds by competition 10.
- 91.8% reached sub-30, 76.8% reached sub-20, 54.9% reached sub-15, and 15.3% reached sub-10.
- Competitors with more competition experience generally showed higher average improvement.
- The United States had the largest competitor count in the dataset, with 11,770 competitors.

The experience result shows an association, not proof that attending more competitions causes improvement.

## Tools

- Python and Pandas for data cleaning and analysis
- SQLite and SQL for querying summarized competitor data
- Tableau for dashboard development and visualization
- Jupyter Notebook for documenting the analysis workflow

## Methodology

- Filtered the WCA results to valid 3x3 competition averages.
- Kept one valid average per competitor per competition.
- Included competitors with at least five valid competition averages.
- Tracked each competitor’s competition average and personal best over time.
- Calculated milestone achievement rates, improvement percentages, and competitor counts by country.

## Project Files

- [Data preparation notebook](notebooks/01_data_preparation.ipynb)
- [SQL analysis queries](sql/analysis_queries.sql)
- [Tableau workbook](tableau/speedcubing_dashboard.twbx)
- Processed datasets are stored in `data/processed/`

## Data Scope and Limitations

This project uses an official WCA results-export snapshot covering 2003–2026. The final analysis contains 48,696 competitors with at least five valid 3x3 competition averages.

- Competitors with fewer than five valid competitions are excluded.
- Invalid results such as DNF and DNS are excluded.
- The analysis describes patterns in the data and does not establish causation.
- Results reflect the dataset snapshot used for this project and may change as new competitions occur.