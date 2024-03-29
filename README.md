
<!-- README.md is generated from README.Rmd. Please edit that file -->

# ldapr

<!-- badges: start -->

[![Travis build
status](https://travis-ci.org/liamgilbey/ldapr.svg?branch=master)](https://travis-ci.org/liamgilbey/ldapr)
[![Codecov test
coverage](https://codecov.io/gh/liamgilbey/ldapr/branch/master/graph/badge.svg)](https://codecov.io/gh/liamgilbey/ldapr?branch=master)
<!-- badges: end -->

## Overview

ldapr is a system for
[LDAP](https://en.wikipedia.org/wiki/Lightweight_Directory_Access_Protocol)
authentication in R. It acts as a wrapper around
[lidlap](https://www.openldap.org/software/man.cgi?query=ldap) to
provide a central authentication mechanism to R products. The primary
goal is to provide an LDAP client to shiny applications that require
authentication, without having to resort to options such as Shiny Server
Pro.

All suggestions are appreciated, so please get in touch.

## Installation

As this package relies on `libldap` this needs to be installed at the
system level.

``` sh
# Debian systems
apt install libldap-2.4-2
```

For now this package is only available from GitHub.

``` r
# install.packages("devtools")
devtools::install_github("liamgilbey/ldapr")
```

## Usage

The central object in `ldapr` is the R6 class `ldap`. As with all R6
classes, a new `ldap` object is created with the `new` method. For
testing purposes, we can attempt to authenticate against the free online
LDAP server hosted by
[zflexldap](https://www.zflexldapadministrator.com/index.php/blog/82-free-online-ldap).

``` r
library(ldapr)
```

``` r
l <- ldap$new(
  host = "zflexldap.com",
  base_dn = "ou=users,ou=guests,dc=zflexsoftware,dc=com"
)
l
#> <LDAP connection>
#>   URI: ldap://zflexldap.com:389
#>   Authenticated: FALSE
```

Authenticating against the LDAP server is then easy with envoking the
`bind` method.

``` r
l$bind(
  user = "guest1",
  pw = "guest1password",
  "uid"
)
#> <LDAP connection>
#>   URI: ldap://zflexldap.com:389
#>   Authenticated: TRUE
#>   Authenticated user: guest1
#>   Authenticated until: 2022-09-24 11:05:52
```

Once bound and authenticated with the LDAP server, we can perform search
operations to lookup entries in the DN.

``` r
l$search("(uid=guest2)")
#> [1] "uid=guest2,ou=users,ou=guests,dc=zflexsoftware,dc=com"
```
