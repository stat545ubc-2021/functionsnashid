
<!-- README.md is generated from README.Rmd. Please edit that file -->

# functionsnashid

<!-- badges: start -->
<!-- badges: end -->

The goal of functionsnashid is to implement counting the number of
observations per category.

## Installation

You can install the released version of functionsnashid from
[CRAN](https://CRAN.R-project.org) with:

``` r
install.packages("functionsnashid")
```

And the development version from [GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("stat545ubc-2021/functionsnashid")
```

## Example

This is a basic example which shows you how to solve a common problem.

In the following example, we get the number of games per genre from the
steam_games dataset.

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

count_by_category(games, genre, 5)
#> # A tibble: 5 × 2
#>   genre      count
#>   <chr>      <int>
#> 1 Indie      24684
#> 2 Action     16558
#> 3 Adventure  13106
#> 4 Casual     13083
#> 5 Simulation  9491
```

Now we demonstrate the usage of the function:

**Results in descending order by default:**

``` r
count_by_category(games, genre, 5)
#> # A tibble: 5 × 2
#>   genre      count
#>   <chr>      <int>
#> 1 Indie      24684
#> 2 Action     16558
#> 3 Adventure  13106
#> 4 Casual     13083
#> 5 Simulation  9491
```

**Results in ascending order:**

``` r
count_by_category(games, genre, 5, FALSE)
#> # A tibble: 5 × 2
#>   genre     count
#>   <chr>     <int>
#> 1 HTC           1
#> 2 Tutorial      1
#> 3 360 Video     2
#> 4 Short         3
#> 5 Valve         4
```

## Exercise 3: Include examples (15 points)

Demonstrate the usage of your function with a few examples. Use one or
more new code chunks, describing what you’re doing.

Note: If you want to deliberately show an error, you can use
`error = TRUE` in your code chunk option.

### Demonstrate the Usage of the Function:

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
