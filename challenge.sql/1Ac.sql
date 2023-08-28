UPDATE interest_metrics
SET month_year = TO_DATE(_year || '-' || LPAD(_month::text, 2, '0') || '-01', 'YYYY-MM-DD');
