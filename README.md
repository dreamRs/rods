
<!-- README.md is generated from README.Rmd. Please edit that file -->

# rods

<!-- badges: start -->
<!-- badges: end -->

Download datasets from [OpenDataSoft](https://www.opendatasoft.com/en/)
platforms.

## Installation

You can install the development version of rods from
[GitHub](https://github.com/dreamRs/rods) with:

``` r
# install.packages("pak")
pak::pak("dreamRs/rods")
```

## Example

Download a dataset from [ODRé](https://odre.opendatasoft.com) :

``` r
library(rods)
download_dataset(
  server = "https://odre.opendatasoft.com",
  dataset = "eco2mix-national-tr",
  select = "date_heure,consommation,taux_co2",
  where = "minute(date_heure) = 0 and month(date_heure) = 9 and year(date_heure) = 2024",
  order_by = "date_heure"
)
#>               date_heure consommation taux_co2
#>                   <POSc>        <int>    <int>
#>   1: 2024-09-01 00:00:00        35362       15
#>   2: 2024-09-01 01:00:00        33474       14
#>   3: 2024-09-01 02:00:00        32246       14
#>   4: 2024-09-01 03:00:00        31434       14
#>   5: 2024-09-01 04:00:00        31498       14
#>  ---                                          
#> 716: 2024-09-30 19:00:00        47028       20
#> 717: 2024-09-30 20:00:00        44026       19
#> 718: 2024-09-30 21:00:00        45283       19
#> 719: 2024-09-30 22:00:00        43789       18
#> 720: 2024-09-30 23:00:00        39661       19
```
