#include "ldapr.h"

// [[Rcpp::export]]
CharacterVector ldapr_search(SEXP f,
                 SEXP l,
                 SEXP bd) {
  LDAPMessage *res, *msg; 
  char *dn;
  int msgtype = 0;
  CharacterVector search_result;
  // convert to char
  const char *filter = Rcpp::as<const char *>(f);
  const char *base_dn = Rcpp::as<const char *>(bd);
  // get the external pointer back
  Rcpp::XPtr<LDAP> ll(l);
  LDAP *ld = ll.get();
  
  // perform the search
  int result = ldap_search_ext_s( 
      ld, 
      base_dn, 
      LDAP_SCOPE_SUBTREE, 
      filter, 
      NULL, 
      0,
      NULL, 
      NULL, 
      NULL, 
      0, 
      &res );
  
  // error if unsuccessful
  if(result != LDAP_SUCCESS){
    stop("Failure to search LDAP server: %s\n", ldap_err2string(result));
  }
  
  // loop through search results
  for(msg = ldap_first_message(ld, res); msg != NULL; msg = ldap_next_message(ld, msg)){
    msgtype = ldap_msgtype(msg);
    switch(msgtype){
    case LDAP_RES_SEARCH_ENTRY:
      if (( dn = ldap_get_dn( ld, res )) != NULL ) {
        search_result.push_back(dn);
        ldap_memfree( dn ); 
      }
    }
  }

  ldap_msgfree(res);
  
  return(search_result);
}
