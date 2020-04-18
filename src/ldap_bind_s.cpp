#include "ldapr.h"

// [[Rcpp::export]]
int ldapr_bind_s(SEXP l, 
                 SEXP bind_dn, 
                 SEXP bind_pw
) {
  int version;
  LDAPMessage *e, *ldap_result;
  char *dn;
  // get the external pointer back
  Rcpp::XPtr<LDAP> ll(l);
  LDAP *ld = ll.get();
  // convert to char
  const char *bind_dn_ = Rcpp::as<const char *>(bind_dn);
  const char *bind_pw_ = Rcpp::as<const char *>(bind_pw);
  
  // set options
  version = LDAP_VERSION3;
  ldap_set_option(ld, LDAP_OPT_PROTOCOL_VERSION, &version);
  
  // perform a simple bind
  int result = ldap_simple_bind_s(ld,
                              bind_dn_,
                              bind_pw_);
  // error if unsuccessful
  if(result != LDAP_SUCCESS){
    stop("Failure to bind to LDAP server: %s\n", ldap_err2string(result));
  }
  return(result);
}