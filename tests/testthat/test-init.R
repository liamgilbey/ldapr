context("Init")

testthat::test_that("Init works on a test server", {
  l <- ldap$new(
    host = "zflexldap.com",
    base_dn = "ou=users,ou=guests,dc=zflexsoftware,dc=com"
  )
  testthat::expect_is(l, 'ldap')
  testthat::expect_is(l, 'R6')
  testthat::expect_equal(l$get()$uri, "ldap://zflexldap.com:389")
  testthat::expect_type(l$get()$handle, "externalptr")
})


testthat::test_that("Init fails with incorrect types supplied", {
  ## character port
  testthat::expect_error(
    ldap$new(
      host = "zflexldap.com",
      base_dn = "ou=users,ou=guests,dc=zflexsoftware,dc=com",
      port = "abc"
    ),
    NULL
  )
  
  ## numeric host
  testthat::expect_error(
    ldap$new(
      host = as.numeric(paste0(sample(1:9, 5, replace = T), collapse = "")),
      base_dn = "ou=users,ou=guests,dc=zflexsoftware,dc=com",
      port = 389
    ),
    NULL
  )
  
})
