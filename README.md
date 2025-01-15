
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
#> 68828:    France Données temps réel 2024-10-17  20:30 2024-10-17 18:30:00
#> 68829:    France Données temps réel 2024-10-17  21:00 2024-10-17 19:00:00
#> 68830:    France Données temps réel 2024-10-17  22:15 2024-10-17 20:15:00
#> 68831:    France Données temps réel 2024-10-17  22:30 2024-10-17 20:30:00
#> 68832:    France Données temps réel 2024-10-17  23:30 2024-10-17 21:30:00
#>        consommation prevision_j1 prevision_j fioul charbon   gaz nucleaire
#>               <int>        <int>       <int> <int>   <int> <int>     <int>
#>     1:        36134        36650       36550   146      41   964     35276
#>     2:        41771        42500       41800   146      38  1559     35207
#>     3:        48872        50700       49100   145      39  1676     36003
#>     4:        50111        50800       50600   143      37  1157     33919
#>     5:        50975        50500       50500   141      35  1190     33878
#>    ---                                                                    
#> 68828:        48375        49100       49300    81       0   983     40731
#> 68829:        46535        47300       47400    81       0  1019     40574
#> 68830:        45183        45000       44950    81       0   665     40869
#> 68831:        45188        45600       45500    81       0   668     40598
#> 68832:        44821        45600       45300    80       0   642     40144
#>        eolien eolien_terrestre eolien_offshore solaire hydraulique pompage
#>         <int>           <char>          <char>   <int>       <int>   <int>
#>     1:   6861               ND              ND       0        5932    -967
#>     2:   7079               ND              ND     278        6836    -448
#>     3:   6858               ND              ND    4233        8489       0
#>     4:   7764               ND              ND    9089        6895       0
#>     5:   7707               ND              ND   10126        6717     -51
#>    ---                                                                    
#> 68828:   3865             3443             422       0       11013      -2
#> 68829:   4219             3775             444       0       10236       0
#> 68830:   4672             4215             458       0        9997       0
#> 68831:   4554             4120             434       0        9561      -1
#> 68832:   4821             4418             403       0        9835       0
#>        bioenergies ech_physiques taux_co2 ech_comm_angleterre ech_comm_espagne
#>              <int>         <int>    <int>               <int>            <int>
#>     1:         715        -12834       19                  NA               NA
#>     2:         715         -9639       23               -2425             2300
#>     3:         709         -9280       21                  NA               NA
#>     4:         703         -9596       17                  NA               NA
#>     5:         706         -9474       17               -4028             2300
#>    ---                                                                        
#> 68828:         897         -9229       16                -991             2249
#> 68829:         901        -10530       16               -1000             -466
#> 68830:         901        -12033       14               -1000              577
#> 68831:         904        -11174       14               -1000              577
#> 68832:         901        -11634       14               -1000              827
#>        ech_comm_italie ech_comm_suisse ech_comm_allemagne_belgique fioul_tac
#>                  <int>           <int>                       <int>     <int>
#>     1:              NA              NA                          NA         2
#>     2:           -2617           -2029                       -4459         2
#>     3:              NA              NA                          NA         1
#>     4:              NA              NA                          NA         2
#>     5:           -2929           -2227                       -2731         2
#>    ---                                                                      
#> 68828:           -2248           -2950                       -5096         1
#> 68829:           -2041           -3200                       -5198         1
#> 68830:           -2041           -2100                       -6097         1
#> 68831:           -2041           -2088                       -6039         1
#> 68832:           -1986           -3173                       -5835         0
#>        fioul_cogen fioul_autres gaz_tac gaz_cogen gaz_ccg gaz_autres
#>              <int>        <int>   <int>     <int>   <int>      <int>
#>     1:          31          113       0       490     475          0
#>     2:          31          113       0       519    1041          0
#>     3:          31          113       0       608    1069          0
#>     4:          31          110       0       575     583          0
#>     5:          31          108       0       570     621          0
#>    ---                                                              
#> 68828:          80            0     328       523     132          0
#> 68829:          80            0     329       526     163          0
#> 68830:          80            0       0       526     139          0
#> 68831:          80            0       0       527     142          0
#> 68832:          80            0       0       500     142          0
#>        hydraulique_fil_eau_eclusee hydraulique_lacs hydraulique_step_turbinage
#>                              <int>            <int>                      <int>
#>     1:                        5164              552                        216
#>     2:                        5596             1041                        199
#>     3:                        6019             1519                        951
#>     4:                        5576              832                        487
#>     5:                        5364              697                        656
#>    ---                                                                        
#> 68828:                        5157             3405                       2451
#> 68829:                        5107             2986                       2143
#> 68830:                        5098             2969                       1930
#> 68831:                        5204             2824                       1533
#> 68832:                        5306             2910                       1619
#>        bioenergies_dechets bioenergies_biomasse bioenergies_biogaz
#>                      <int>                <int>              <int>
#>     1:                  93                  374                245
#>     2:                  94                  373                245
#>     3:                  93                  377                245
#>     4:                  87                  370                245
#>     5:                  95                  371                245
#>    ---                                                            
#> 68828:                 318                  324                255
#> 68829:                 320                  327                255
#> 68830:                 320                  326                255
#> 68831:                 322                  328                255
#> 68832:                 319                  327                255
#>        stockage_batterie destockage_batterie
#>                   <char>              <char>
#>     1:                 4                   7
#>     2:                 3                   6
#>     3:                 7                   1
#>     4:                 3                   4
#>     5:                 7                   2
#>    ---                                      
#> 68828:                -3                  38
#> 68829:                -2                  37
#> 68830:                -1                  33
#> 68831:               -35                  32
#> 68832:                -1                  35

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
