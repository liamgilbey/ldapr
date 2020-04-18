context("Init")

testthat::test_that("Init works on a test server", {
  l <- ldap$new(
    host = "zflexldap.com",
    base_dn = "ou=users,ou=guests,dc=zflexsoftware,dc=com"
  )
  testthat::expect_type(l, 'ldap')
  testthat::expect_type(l, 'R6')
  testthat::expect_equal(l$get()$uri, "ldap://zflexldap.com:389")
  testthat::expect_type(l$get()$handle, "externalptr")
})