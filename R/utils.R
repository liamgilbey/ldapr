ldap_string <- function(
  host,
  port
){
  paste0("ldap://", host, ":", port)
}

ldap_bind_dn <- function(
  uid,
  base_dn,
  type
){
  paste0(type, "=", uid, ",", base_dn)
}

# calculate our timeout
get_timeout <- function(timeout_mins = 15){
  Sys.time() + (60 * timeout_mins)
}


# assertions
assert_generic <- function(x, f){
  stopifnot(
    f(x),
    length(x) > 0
  )
}

assert_numeric <- function(x){
  assert_generic(x, is.numeric)
}

assert_character <- function(x){
  assert_generic(x, is.character)
}

assert_numeric_scalar <- function(x){
  stopifnot(
    is.numeric(x),
    length(x) == 1,
    !is.na(x)
  )
}


