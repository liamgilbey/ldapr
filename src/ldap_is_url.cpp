#include "ldapr.h"

//' Validate an LDAP URL.
//' 
//' This is a fairly simple version of validation, simply checking whether the URL string starts with \code{ldap://}
//' @keywords internal
//' @param ldap_uri The URI you wish to validate
//' 
//' @export
// [[Rcpp::export]]
int ldapr_is_ldap_url(
    SEXP ldap_uri
){
  int result;
  const char *l = Rcpp::as<const char *>(ldap_uri);
  // check the URL
  result = ldap_is_ldap_url(l);
  if(result == 0){
    stop("Invalid LDAP URI");
  }
  // return the result
  return result;
}
