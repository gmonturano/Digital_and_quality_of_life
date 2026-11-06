# Main empirical specifications: digital infrastructure and quality-of-life outcomes
source('code/00_functions.R')
db <- as.data.frame(readRDS('db/pdata.rds'))
db$Anno <- suppressWarnings(as.numeric(as.character(db$Anno)))
for (v in c('PM10', 'Totale.Alberghi_pl', 'Campeggi.e.Villaggi.turistici_pl')) {
  if (v %in% names(db)) db[[v]] <- log1p(db[[v]])
}
models <- run_twfe_specs(db, 'code/meta_fusco.xlsx', id='Provincia', time='Anno')
