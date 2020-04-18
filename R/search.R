# search
ldap_search <- function(
  filter,
  private
){
  assert_character(filter)
  
  ldapr_search(
    filter,
    private$handle,
    private$base_dn
    )
}