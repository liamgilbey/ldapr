#include "ldapr.h"

// [[Rcpp::export]]
int ldapr_unbind(
    SEXP l
){
  // get the external pointer back
  Rcpp::XPtr<LDAP> ll(l);
  LDAP *ld = ll.get();
  // unbind
  ldap_unbind(ld);
  return(0);
}