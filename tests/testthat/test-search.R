context("search")

testthat::test_that("Search works", {
  # authenticate
  l <- ldap$new(
    host = "zflexldap.com",
    base_dn = "ou=users,ou=guests,dc=zflexsoftware,dc=com"
  )
  l$bind(
    "guest1",
    "guest1password",
    "uid"
  )
  
  testthat::expect_equal(
    l$search("(uid=guest2)"),
    "uid=guest2,ou=users,ou=guests,dc=zflexsoftware,dc=com"
  )
  
  l$unbind()
})

testthat::test_that("Search fails pre authentication", {
  l <- ldap$new(
    host = "zflexldap.com",
    base_dn = "ou=users,ou=guests,dc=zflexsoftware,dc=com"
  )

  testthat::expect_error(
    l$search("(uid=guest2)"),
    "No authentication to"
  )  
})

testthat::test_that("Search fails post unbinding", {
  l <- ldap$new(
    host = "zflexldap.com",
    base_dn = "ou=users,ou=guests,dc=zflexsoftware,dc=com"
  )
  
  l$bind(
    "guest1",
    "guest1password",
    "uid"
  )
  
  l$unbind()
  
  testthat::expect_error(
    l$search("(uid=guest2)"),
    "No authentication to"
  )  
})
