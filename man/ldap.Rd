% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/ldap.R
\name{ldap}
\alias{ldap}
\title{LDAP functionality inside R}
\description{
LDAP functionality inside R

LDAP functionality inside R
}
\details{
LDAP is the Lightweight Directory Access Protocol. It's a hierarchical organization of Users, Groups, and Organisational Units -
 which are containers for users and groups. Every object has it's own unique path to it's place in the directory - 
 called a Distinguished Name, or DN. The bulk of the code is a wrapper around \href{https://github.com/openldap/openldap/tree/master/libraries/libldap}{libldap}
 
 The main purpose of this function is to provide LDAP authentication to Shiny applications.
}
\examples{

## ------------------------------------------------
## Method `ldap$new`
## ------------------------------------------------

ld <- ldap$new("zflexldap.com", "ou=users,ou=guests,dc=zflexsoftware,dc=com", 389)

## ------------------------------------------------
## Method `ldap$bind`
## ------------------------------------------------

ld$bind("guest1", "guest1password", "uid")

## ------------------------------------------------
## Method `ldap$get`
## ------------------------------------------------

ld$get()

## ------------------------------------------------
## Method `ldap$print`
## ------------------------------------------------

ld

## ------------------------------------------------
## Method `ldap$search`
## ------------------------------------------------

ld$search("(uid=guest2)")

## ------------------------------------------------
## Method `ldap$unbind`
## ------------------------------------------------

ld$unbind()
}
\section{Methods}{
\subsection{Public methods}{
\itemize{
\item \href{#method-ldap-new}{\code{ldap$new()}}
\item \href{#method-ldap-bind}{\code{ldap$bind()}}
\item \href{#method-ldap-get}{\code{ldap$get()}}
\item \href{#method-ldap-print}{\code{ldap$print()}}
\item \href{#method-ldap-search}{\code{ldap$search()}}
\item \href{#method-ldap-unbind}{\code{ldap$unbind()}}
\item \href{#method-ldap-clone}{\code{ldap$clone()}}
}
}
\if{html}{\out{<hr>}}
\if{html}{\out{<a id="method-ldap-new"></a>}}
\if{latex}{\out{\hypertarget{method-ldap-new}{}}}
\subsection{Method \code{new()}}{
Create a new ldap object.
\subsection{Usage}{
\if{html}{\out{<div class="r">}}\preformatted{ldap$new(host, base_dn, port = 389)}\if{html}{\out{</div>}}
}

\subsection{Arguments}{
\if{html}{\out{<div class="arguments">}}
\describe{
\item{\code{host}}{The server that is hosting the LDAP server - either the IP address 
of the server or an appropriate hostname}

\item{\code{base_dn}}{The section of the LDAP directory where the application will 
commence searching for Users. For example, we might have a DN for a single 
user of \code{cn=John Doe,ou=Users,dc=example,dc=local}, so the appropriate 
Base DN would be \code{ou=Users,dc=example,dc=local}}

\item{\code{port}}{The port defined for this LDAP directory. Typically this is 389, or 636 for LDAP over SSL}
}
\if{html}{\out{</div>}}
}
\subsection{Examples}{
\if{html}{\out{<div class="r example copy">}}
\preformatted{ld <- ldap$new("zflexldap.com", "ou=users,ou=guests,dc=zflexsoftware,dc=com", 389)
}
\if{html}{\out{</div>}}

}

}
\if{html}{\out{<hr>}}
\if{html}{\out{<a id="method-ldap-bind"></a>}}
\if{latex}{\out{\hypertarget{method-ldap-bind}{}}}
\subsection{Method \code{bind()}}{
Bind to the LDAP server with a username and password.
\subsection{Usage}{
\if{html}{\out{<div class="r">}}\preformatted{ldap$bind(user, pw, type, timeout = 15)}\if{html}{\out{</div>}}
}

\subsection{Arguments}{
\if{html}{\out{<div class="arguments">}}
\describe{
\item{\code{user}}{The username used for authentication}

\item{\code{pw}}{The password used for authentication}

\item{\code{type}}{The type of user information supplied - one of either `cn` or `uid`}

\item{\code{timeout}}{The timeout required for authentication}
}
\if{html}{\out{</div>}}
}
\subsection{Examples}{
\if{html}{\out{<div class="r example copy">}}
\preformatted{ld$bind("guest1", "guest1password", "uid")
}
\if{html}{\out{</div>}}

}

}
\if{html}{\out{<hr>}}
\if{html}{\out{<a id="method-ldap-get"></a>}}
\if{latex}{\out{\hypertarget{method-ldap-get}{}}}
\subsection{Method \code{get()}}{
Get the private values from the R6 class
\subsection{Usage}{
\if{html}{\out{<div class="r">}}\preformatted{ldap$get()}\if{html}{\out{</div>}}
}

\subsection{Examples}{
\if{html}{\out{<div class="r example copy">}}
\preformatted{ld$get()
}
\if{html}{\out{</div>}}

}

}
\if{html}{\out{<hr>}}
\if{html}{\out{<a id="method-ldap-print"></a>}}
\if{latex}{\out{\hypertarget{method-ldap-print}{}}}
\subsection{Method \code{print()}}{
Custom print method for the new R6 class
\subsection{Usage}{
\if{html}{\out{<div class="r">}}\preformatted{ldap$print()}\if{html}{\out{</div>}}
}

\subsection{Examples}{
\if{html}{\out{<div class="r example copy">}}
\preformatted{ld
}
\if{html}{\out{</div>}}

}

}
\if{html}{\out{<hr>}}
\if{html}{\out{<a id="method-ldap-search"></a>}}
\if{latex}{\out{\hypertarget{method-ldap-search}{}}}
\subsection{Method \code{search()}}{
Perform a search against an authenicated LDAP server
\subsection{Usage}{
\if{html}{\out{<div class="r">}}\preformatted{ldap$search(filter)}\if{html}{\out{</div>}}
}

\subsection{Arguments}{
\if{html}{\out{<div class="arguments">}}
\describe{
\item{\code{filter}}{The search filter to apply. Must be a valid LDAP search string}
}
\if{html}{\out{</div>}}
}
\subsection{Examples}{
\if{html}{\out{<div class="r example copy">}}
\preformatted{ld$search("(uid=guest2)")
}
\if{html}{\out{</div>}}

}

}
\if{html}{\out{<hr>}}
\if{html}{\out{<a id="method-ldap-unbind"></a>}}
\if{latex}{\out{\hypertarget{method-ldap-unbind}{}}}
\subsection{Method \code{unbind()}}{
Unbind from an authenticated LDAP server
\subsection{Usage}{
\if{html}{\out{<div class="r">}}\preformatted{ldap$unbind()}\if{html}{\out{</div>}}
}

\subsection{Examples}{
\if{html}{\out{<div class="r example copy">}}
\preformatted{ld$unbind()
}
\if{html}{\out{</div>}}

}

}
\if{html}{\out{<hr>}}
\if{html}{\out{<a id="method-ldap-clone"></a>}}
\if{latex}{\out{\hypertarget{method-ldap-clone}{}}}
\subsection{Method \code{clone()}}{
The objects of this class are cloneable with this method.
\subsection{Usage}{
\if{html}{\out{<div class="r">}}\preformatted{ldap$clone(deep = FALSE)}\if{html}{\out{</div>}}
}

\subsection{Arguments}{
\if{html}{\out{<div class="arguments">}}
\describe{
\item{\code{deep}}{Whether to make a deep clone.}
}
\if{html}{\out{</div>}}
}
}
}
