# Initialize the LDAP object
ldap_init <- function(
  self, 
  private,
  host, 
  base_dn,
  port = 389
){
  assert_character(host)
  assert_character(base_dn)
  assert_numeric_scalar(port)
  
  ldap_uri <- ldap_string(host, port)
  uri_check <- ldapr_url_parse(ldap_uri)

  private$host <- host
  private$port <- port
  private$base_dn <- base_dn
  private$uri <- ldap_uri
  private$handle <- ldapr_init(ldap_uri)
  self
}