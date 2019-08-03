
<!-- README.md is generated from README.Rmd. Please edit that file -->

# scotus

<!-- badges: start -->

<!-- badges: end -->

The goal of `scotus` is to provide a access to
[SCOTUS](https://www.supremecourt.gov/) opinions for use in text
analysis. All the data have been taken fro the repository
<https://github.com/brianwc/bulk_scotus>.

## Installation

You can install the development version from
[GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("EmilHvitfeldt/scotus")
```

## Darta

So far the package only includes 1 dataset, `scotus_sample` which is a
random sample of 10% of the total number of opinions (for size reasons).

``` r
library(scotus)
str(scotus_sample)
#> Classes 'tbl_df', 'tbl' and 'data.frame':    6336 obs. of  5 variables:
#>  $ year         : chr  "2002" "2002" "2002" "1918" ...
#>  $ case_name    : chr  "Martinez-Garduno, AKA Garcia-Jimenez v. United States" "Dinkins v. Cockrell, Director, Texas Department of Criminal Justice, Institutional Division" "Young v. Stubblefield, Superintendent, Missouri Eastern Correctional Center" "Cox v. Wood" ...
#>  $ docket_number: chr  "02-5021" "02-5107" "02-6152" "833" ...
#>  $ id           : num  107750 107820 108930 83544 100733 ...
#>  $ text         : chr  "No. 02-5021.\nCERTIORARI TO THE UNITED STATES COURT OF APPEALS FOR THE NINTH CIRCUIT.\nC. A. 9th Cir. Certiorar"| __truncated__ "No. 02-5107.\nCERTIORARI TO THE UNITED STATES COURT OF APPEALS FOR THE FIFTH CIRCUIT.\nC. A. 5th Cir. Certiorar"| __truncated__ "No. 02-6152.\nCERTIORARI TO THE UNITED STATES COURT OF APPEALS FOR THE EIGHTH CIRCUIT.\nC. A. 8th Cir. Certiorari denied." "No. 833.\nMr. Hannis Taylor, of Washington, D. C., for appellant.\nMr. Solicitor General Davis, for appellee.\n"| __truncated__ ...
```
