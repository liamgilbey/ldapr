#include "ldapr.h"

//' Parse an LDAP URL. 
//' 
//' This function performs robust URL validation by attempting to break the URL into the component pieces.
//' @keywords internal
//' @param ldap_uri The URL to validate
//' 
//' @export
// [[Rcpp::export]]
int ldapr_url_parse(
    SEXP ldap_uri
){
  int result;
  const char *l = Rcpp::as<const char *>(ldap_uri);
  LDAPURLDesc *ludp;
  // check the URL
  result = ldap_url_parse(l, &ludp);
  if(result != LDAP_SUCCESS){
    stop("Failure to parse URL: %s\n", ldap_err2string(result));
  }
  // free LDAP URL structure
  ldap_free_urldesc(ludp);
  // return the result
  return result;
}
