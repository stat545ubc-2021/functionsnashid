
<!-- README.md is generated from README.Rmd. Please edit that file -->

# functionsnashid

<!-- badges: start -->
<!-- badges: end -->

During the data exploration phase, developers write repeated code to
investigate the summary view based on different categories. The goal of
this package is to avoid writing [boilerplate
code](https://en.wikipedia.org/wiki/Boilerplate_code) during the data
exploration phase. This package implements counting the number of
observations per category in a given dataset.

## Installation

This package is not in the CRAN yet. You can install the development
version of `functionsnashid` from the
[GitHub](https://github.com/stat545ubc-2021/functionsnashid) repository
with:

``` r
devtools::install_github("stat545ubc-2021/functionsnashid")
```

## Basic Example

Now we demonstrate the basic usage of the function:

1.  **Results in descending order by default:**

``` r
library(functionsnashid)
library(tidyverse)
#> ── Attaching packages ─────────────────────────────────────── tidyverse 1.3.1 ──
#> ✓ ggplot2 3.3.5     ✓ purrr   0.3.4
#> ✓ tibble  3.1.5     ✓ dplyr   1.0.7
#> ✓ tidyr   1.1.4     ✓ stringr 1.4.0
#> ✓ readr   2.0.2     ✓ forcats 0.5.1
#> ── Conflicts ────────────────────────────────────────── tidyverse_conflicts() ──
#> x dplyr::filter() masks stats::filter()
#> x dplyr::lag()    masks stats::lag()
library(datateachr)

games <- steam_games %>%
  select(id, name, genre, publisher, developer, original_price, release_date, all_reviews) %>%
  separate_rows(genre, sep = ",", convert = TRUE)

count_by_category(steam_games, genre, 5)
#> # A tibble: 5 × 2
#>   genre                  count
#>   <chr>                  <int>
#> 1 Action                  2386
#> 2 Action,Indie            2129
#> 3 Casual,Indie            1732
#> 4 Action,Adventure,Indie  1585
#> 5 Adventure,Indie         1520
```

2.  **Results in ascending order:**

``` r
count_by_category(steam_games, genre, 5, FALSE)
#> # A tibble: 5 × 2
#>   genre                                                                    count
#>   <chr>                                                                    <int>
#> 1 Accounting,Animation & Modeling,Audio Production,Design & Illustration,…     1
#> 2 Accounting,Education,Software Training,Utilities,Early Access                1
#> 3 Action,Adventure,Casual,Early Access                                         1
#> 4 Action,Adventure,Casual,Free to Play                                         1
#> 5 Action,Adventure,Casual,Free to Play,Early Access                            1
```

## More Examples with Different Datasets

Here we would demonstrate the usage of the function `count_by_category`
to explore different dataset:

#### Get the count of trees per genus in the `vancouver_trees` dataset.

We see Acer genus i.e. family of Maple trees are the most common in
vancouver.

``` r
count_by_category(vancouver_trees, genus_name, 5)
#> # A tibble: 5 × 2
#>   genus_name count
#>   <chr>      <int>
#> 1 ACER       36062
#> 2 PRUNUS     30683
#> 3 FRAXINUS    7381
#> 4 TILIA       6773
#> 5 QUERCUS     6119
```

#### Get the count of apartment buildings per property type in the `apt_buildings` dataset.

``` r
count_by_category(apt_buildings, property_type, 5)
#> # A tibble: 3 × 2
#>   property_type  count
#>   <chr>          <int>
#> 1 PRIVATE         2888
#> 2 TCHC             327
#> 3 SOCIAL HOUSING   240
```

#### What `heating_types` are common in in the `apt_buildings` dataset?

``` r
count_by_category(apt_buildings, heating_type, 5)
#> # A tibble: 3 × 2
#>   heating_type   count
#>   <chr>          <int>
#> 1 HOT WATER       2789
#> 2 FORCED AIR GAS   315
#> 3 ELECTRIC         265
```
