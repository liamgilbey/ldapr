context("Bind")

testthat::test_that("Bind works", {
  l <- ldap$new(
    host = "zflexldap.com",
    base_dn = "ou=users,ou=guests,dc=zflexsoftware,dc=com"
  )
  l$bind("guest1",
         "guest1password",
         "uid")
  testthat::expect_true(l$get()$authenticated)
  testthat::expect_equal(l$get()$authenticated_user, "guest1")
})

