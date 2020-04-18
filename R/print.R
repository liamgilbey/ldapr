# Printing method
ldap_print <- function(
  private
){
  sep <- "\n  "
  x <- "<LDAP connection>"
  x <- paste(x, paste0("URI: ", private$uri), sep = sep)
  x <- paste(x, paste0("Authenticated: ", private$authenticated), sep = sep)
  if(private$authenticated){
    x <- paste(x, paste0("Authenticated user: ", private$authenticated_user), sep = sep)
    x <- paste(x, paste0("Authenticated until: ", private$authenticated_until), sep = sep)
  }
  cat(x)
}