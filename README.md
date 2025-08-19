# Medical Claims Analysis 

## What’s here
- `data/claims_header.csv` – sample claims
- `sql/schema.sql` + `sql/analytics.sql` – create tables & run KPIs
- `dashboard/index.html` – interactive dashboard (no external libs)
- `src/summary.py` – simple analytics with pandas (no scikit-learn)

## How to use
1) Browse the dashboard in `dashboard/index.html` (works on GitHub Pages or locally).  
2) Load SQL into Postgres/MySQL (small and portable).  
3) Run `summary.py` locally with `python -m pip install pandas` then `python src/summary.py`.
