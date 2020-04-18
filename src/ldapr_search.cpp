#include "ldapr.h"

// [[Rcpp::export]]
int ldapr_search(SEXP f,
                 SEXP l,
                 SEXP bd) {
  LDAPMessage *e, *ldap_result;
  char *dn;
  // convert to char
  const char *filter = Rcpp::as<const char *>(f);
  const char *base_dn = Rcpp::as<const char *>(bd);
  // get the external pointer back
  Rcpp::XPtr<LDAP> ll(l);
  LDAP *ld = ll.get();
  
  int rc = ldap_search_ext_s( ld, base_dn, LDAP_SCOPE_SUBTREE, filter, NULL, 0,
                          NULL, NULL, NULL, 0, &ldap_result );
  
  for ( e = ldap_first_entry( ld, ldap_result ); e != NULL;
  e = ldap_next_entry( ld, e ) ) {
    if ( (dn = ldap_get_dn( ld, e )) != NULL ) {
      printf( "dn: %s\n", dn );
      ldap_memfree( dn );
    }
  }
  
  ldap_msgfree(ldap_result);
  
  return(rc);
}
