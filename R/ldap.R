#' LDAP functionality inside R
#' 
#' LDAP is the Lightweight Directory Access Protocol. It's a hierarchical organization of Users, Groups, and Organisational Units -
#'  which are containers for users and groups. Every object has it's own unique path to it's place in the directory - 
#'  called a Distinguished Name, or DN. The bulk of the code is a wrapper around [liblap]{https://github.com/openldap/openldap/tree/master/libraries/libldap}
#'  
#'  The main purpose of this function is to provide LDAP authentication to Shiny applications.
#' 
#' @section Initializing an LDAP connection:
#' An LDAP object is an R6 object that can be created with \code{ldap$new()}. It has the following arguments:
#' \describe{
#'     \item{host}{The server that is hosting the LDAP server - either the IP address of the server or an appropriate hostname}
#'     \item{base_dn}{The section of the LDAP directory where the application will commence searching for Users. For example, we might have
#'      a DN for a single user of \code{cn=John Doe,ou=Users,dc=example,dc=local}, so the appropriate Base DN would be 
#'      \code{ou=Users,dc=example,dc=local}}
#'     \item{port}{The port defined for this LDAP directory. Typically this is 389, or 636 for LDAP over SSL} 
#' }
#' 
#' @section Using the LDAP connection:
#' By itself, an LDAP object is simply a pointer to a connection handle
#' @export
#' @examples 
#' 
#' \dontrun{
#' ld <- ldap$new("example.local", "ou=Users,dc=example,dc=local", 389)
#' ld$bind("John Doe", "my_password")
#' } 
#' @name ldap
NULL

ldap <- R6::R6Class("ldap",
                    
  public = list(
    initialize = function(host, base_dn, port = 389){
      ldap_init(self, private, host, base_dn, port)},
    
    bind = function(user, pw, type, timeout = 15){
      ldap_bind(self, private, user, pw, type, timeout)},
    get = function(){
      as.list(private)
    },
    print = function(){
      ldap_print(private)},
    search = function(filter){
      ldap_search(filter, private)},
    unbind = function(){
      ldap_unbind(private)}
  ),
  
  private = list(
    host = NULL,
    port = NULL,
    uri = NULL,
    base_dn = NULL,
    handle = NULL,
    authenticated = F,
    authenticated_user = NULL,
    authenticated_until = NULL
  )
)







# unbind
ldap_unbind <- function(
  private
){
  ldap_unbind(private$handle)
}

