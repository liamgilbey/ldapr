#include "ldapr.h"

//' Initialize an LDAP connection handle
//' 
//' @param ldap_uri A valid LDAP uri string
//' @keywords internal
//' @export
// [[Rcpp::export]]
SEXP ldapr_init(
    SEXP ldap_uri
  ){
  LDAP *ld;
  int result;
  const char *l = Rcpp::as<const char *>(ldap_uri);
  // initialize the connection handler
  result = ldap_initialize(&ld, l);
  // error if unsuccessful
  if(result != LDAP_SUCCESS){
    stop("Failure to initialize LDAP connection: %s\n", ldap_err2string(result));
  }
  // return as an external pointer
  return Rcpp::XPtr<LDAP>(ld, true);
}
