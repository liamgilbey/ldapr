# reset the authentication
ldap_reset <- function(
  private,
  self
){
  private$authenticated <- F
  private$authenticated_user <- NULL
  private$authenticated_until <- NULL
  self
}

# simple bind
ldap_bind <- function(
  self,
  private,
  user,
  pw,
  type = c("cn", "uid"),
  timeout
){
  # reset the authentication
  ldap_reset(private, self)
  type <- match.arg(type)
  bind_dn <- ldap_bind_dn(user, private$base_dn, type)
  r <- ldapr_bind_s(private$handle, 
                    bind_dn,
                    pw)
  private$authenticated <- T
  private$authenticated_user <- user
  private$authenticated_until <- get_timeout(timeout)
  self
}
