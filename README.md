
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

What is special about using `README.Rmd` instead of just `README.md`?
You can include R chunks like so:

``` r
summary(cars)
#>      speed           dist       
#>  Min.   : 4.0   Min.   :  2.00  
#>  1st Qu.:12.0   1st Qu.: 26.00  
#>  Median :15.0   Median : 36.00  
#>  Mean   :15.4   Mean   : 42.98  
#>  3rd Qu.:19.0   3rd Qu.: 56.00  
#>  Max.   :25.0   Max.   :120.00
```

You’ll still need to render `README.Rmd` regularly, to keep `README.md`
up-to-date. `devtools::build_readme()` is handy for this. You could also
use GitHub Actions to re-render `README.Rmd` every time you push. An
example workflow can be found here:
<https://github.com/r-lib/actions/tree/master/examples>.

You can also embed plots, for example:

<img src="man/figures/README-pressure-1.png" width="100%" />

In that case, don’t forget to commit and push the resulting figure
files, so they display on GitHub and CRAN.
