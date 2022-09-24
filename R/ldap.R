#' LDAP functionality inside R
#' 
#' LDAP is the Lightweight Directory Access Protocol. It's a hierarchical organization of Users, Groups, and Organisational Units -
#'  which are containers for users and groups. Every object has it's own unique path to it's place in the directory - 
#'  called a Distinguished Name, or DN. The bulk of the code is a wrapper around \href{https://github.com/openldap/openldap/tree/master/libraries/libldap}{libldap}
#'  
#'  The main purpose of this function is to provide LDAP authentication to Shiny applications.
#' 
#' @export
ldap <- R6::R6Class("ldap",
                    
  public = list(
    
    #' @description 
    #' Create a new ldap object. 
    #' @param host The server that is hosting the LDAP server - either the IP address 
    #' of the server or an appropriate hostname
    #' @param base_dn The section of the LDAP directory where the application will 
    #' commence searching for Users. For example, we might have a DN for a single 
    #' user of \code{cn=John Doe,ou=Users,dc=example,dc=local}, so the appropriate 
    #' Base DN would be \code{ou=Users,dc=example,dc=local}
    #' @param port The port defined for this LDAP directory. Typically this is 389, or 636 for LDAP over SSL
    #' @examples 
    #' ld <- ldap$new("zflexldap.com", "ou=users,ou=guests,dc=zflexsoftware,dc=com", 389)
    initialize = function(
      host, 
      base_dn, 
      port = 389
    ){
      ldap_init(
        self, 
        private, 
        host, 
        base_dn, 
        port
      )
    },
    
    #' @description 
    #' Bind to the LDAP server with a username and password.
    #' @param user The username used for authentication
    #' @param pw The password used for authentication
    #' @param type The type of user information supplied - one of either `cn` or `uid`
    #' @param timeout The timeout required for authentication
    #' @examples 
    #' ld$bind("guest1", "guest1password", "uid")
    bind = function(
      user, 
      pw, 
      type, 
      timeout = 15
    ){
      ldap_bind(
        self, 
        private, 
        user, 
        pw, 
        type, 
        timeout
      )
    },
    
    #' @description Get the private values from the R6 class
    #' @examples 
    #' ld$get()
    get = function(){
      as.list(private)
    },
    
    #' @description Custom print method for the new R6 class
    #' @examples
    #' ld
    print = function(){
      ldap_print(private)
    },
    
    #' @description Perform a search against an authenicated LDAP server
    #' @param filter The search filter to apply. Must be a valid LDAP search string
    #' @examples 
    #' ld$search("(uid=guest2)")
    search = function(filter){
      ldap_search(filter, private)
    },
    
    #' @description Unbind from an authenticated LDAP server
    #' @examples 
    #' ld$unbind()
    unbind = function(){
      ldap_unbind(private, self)
    }
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
