
<!-- README.md is generated from README.Rmd. Please edit that file -->

# rods

<!-- badges: start -->

[![R-CMD-check](https://github.com/dreamRs/rods/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/dreamRs/rods/actions/workflows/R-CMD-check.yaml)
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
# Donwload entire dataset
download_dataset(
  server = "https://odre.opendatasoft.com",
  dataset = "eco2mix-national-tr"
)
#>        perimetre             nature       date  heure          date_heure
#>           <char>             <char>     <IDat> <char>              <POSc>
#>     1:    France Données temps réel 2023-05-16  04:45 2023-05-16 02:45:00
#>     2:    France Données temps réel 2023-05-16  06:30 2023-05-16 04:30:00
#>     3:    France Données temps réel 2023-05-16  09:15 2023-05-16 07:15:00
#>     4:    France Données temps réel 2023-05-16  11:45 2023-05-16 09:45:00
#>     5:    France Données temps réel 2023-05-16  12:30 2023-05-16 10:30:00
#>    ---                                                                   
#> 68828:    France Données temps réel 2024-07-05  15:15 2024-07-05 13:15:00
#> 68829:    France Données temps réel 2024-07-05  16:45 2024-07-05 14:45:00
#> 68830:    France Données temps réel 2024-07-05  17:15 2024-07-05 15:15:00
#> 68831:    France Données temps réel 2024-07-05  17:30 2024-07-05 15:30:00
#> 68832:    France Données temps réel 2024-07-05  19:15 2024-07-05 17:15:00
#>        consommation prevision_j1 prevision_j fioul charbon   gaz nucleaire
#>               <int>        <int>       <int> <int>   <int> <int>     <int>
#>     1:        36134        36650       36550   146      41   964     35276
#>     2:        41771        42500       41800   146      38  1559     35207
#>     3:        48872        50700       49100   145      39  1676     36003
#>     4:        50111        50800       50600   143      37  1157     33919
#>     5:        50975        50500       50500   141      35  1190     33878
#>    ---                                                                    
#> 68828:        45680        45500       45750   123       0   419     30626
#> 68829:        44250        43900       44000   123       0   437     32542
#> 68830:        44069        43650       43850   123       0   422     34302
#> 68831:        44434        43900       44200   123       0   418     35325
#> 68832:        45657        45300       45450   123       0   464     37422
#>        eolien eolien_terrestre eolien_offshore solaire hydraulique pompage
#>         <int>           <char>          <char>   <int>       <int>   <int>
#>     1:   6861               ND              ND       0        5932    -967
#>     2:   7079               ND              ND     278        6836    -448
#>     3:   6858               ND              ND    4233        8489       0
#>     4:   7764               ND              ND    9089        6895       0
#>     5:   7707               ND              ND   10126        6717     -51
#>    ---                                                                    
#> 68828:   4536             3749             787   11911        7584   -1388
#> 68829:   4001             3422             579   10166        7878      -3
#> 68830:   3688             3271             416    9355        8254     -47
#> 68831:   3645             3256             389    8994        8963     -14
#> 68832:   3272             2998             274    4203       10025     -14
#>        bioenergies ech_physiques taux_co2 ech_comm_angleterre ech_comm_espagne
#>              <int>         <int>    <int>               <int>            <int>
#>     1:         715        -12834       19                  NA               NA
#>     2:         715         -9639       23               -2425             2300
#>     3:         709         -9280       21                  NA               NA
#>     4:         703         -9596       17                  NA               NA
#>     5:         706         -9474       17               -4028             2300
#>    ---                                                                        
#> 68828:         807         -8929       12               -3028            -2200
#> 68829:         816        -11706       12               -3028            -1856
#> 68830:         820        -12845       12               -3028             -647
#> 68831:         833        -13852       12               -3028             -647
#> 68832:         829        -10663       13               -4028             2100
#>        ech_comm_italie ech_comm_suisse ech_comm_allemagne_belgique fioul_tac
#>                  <int>           <int>                       <int>     <int>
#>     1:              NA              NA                          NA         2
#>     2:           -2617           -2029                       -4459         2
#>     3:              NA              NA                          NA         1
#>     4:              NA              NA                          NA         2
#>     5:           -2929           -2227                       -2731         2
#>    ---                                                                      
#> 68828:           -2344            -621                       -1955         1
#> 68829:           -2344            -510                       -4251         1
#> 68830:           -2344            -191                       -6985         1
#> 68831:           -2344            -389                       -7131         1
#> 68832:           -3077             900                       -5978         1
#>        fioul_cogen fioul_autres gaz_tac gaz_cogen gaz_ccg gaz_autres
#>              <int>        <int>   <int>     <int>   <int>      <int>
#>     1:          31          113       0       490     475          0
#>     2:          31          113       0       519    1041          0
#>     3:          31          113       0       608    1069          0
#>     4:          31          110       0       575     583          0
#>     5:          31          108       0       570     621          0
#>    ---                                                              
#> 68828:         122            0       0       312     108          0
#> 68829:         122            0       0       327     112          0
#> 68830:         122            0       0       311     112          0
#> 68831:         122            0       0       311     109          0
#> 68832:         122            0       0       357     108          0
#>        hydraulique_fil_eau_eclusee hydraulique_lacs hydraulique_step_turbinage
#>                              <int>            <int>                      <int>
#>     1:                        5164              552                        216
#>     2:                        5596             1041                        199
#>     3:                        6019             1519                        951
#>     4:                        5576              832                        487
#>     5:                        5364              697                        656
#>    ---                                                                        
#> 68828:                        5428             1782                        375
#> 68829:                        5358             1904                        616
#> 68830:                        5540             2068                        645
#> 68831:                        5559             2054                       1350
#> 68832:                        5868             2292                       1866
#>        bioenergies_dechets bioenergies_biomasse bioenergies_biogaz
#>                      <int>                <int>              <int>
#>     1:                  93                  374                245
#>     2:                  94                  373                245
#>     3:                  93                  377                245
#>     4:                  87                  370                245
#>     5:                  95                  371                245
#>    ---                                                            
#> 68828:                 248                  311                248
#> 68829:                 244                  323                248
#> 68830:                 248                  324                248
#> 68831:                 249                  336                248
#> 68832:                 248                  333                248
#>        stockage_batterie destockage_batterie
#>                   <char>              <char>
#>     1:                 4                   7
#>     2:                 3                   6
#>     3:                 7                   1
#>     4:                 3                   4
#>     5:                 7                   2
#>    ---                                      
#> 68828:                -8                   0
#> 68829:                -4                   1
#> 68830:                -2                   0
#> 68831:                -1                   0
#> 68832:                -3                   0

# Advanced request to select and filter data
download_dataset(
  server = "https://odre.opendatasoft.com",
  dataset = "eco2mix-national-tr",
  select = "date_heure,consommation,taux_co2",
  where = "minute(date_heure) = 0 and date_heure >= '2024-09-01' and date_heure < '2024-10-01'",
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
