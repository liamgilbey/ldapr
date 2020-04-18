# R interface to OpenLDAP libldap library

AC_INIT([ldapr],[see.DESCRIPTION.file])
# Find the compiler and compiler flags used by R.
: ${R_HOME=`R RHOME`}
if test -z "${R_HOME}"; then
  echo "could not determine R_HOME"
  exit 1
fi

CXX=`"${R_HOME}/bin/R" CMD config CXX`
CXXFLAGS=`"${R_HOME}/bin/R" CMD config CXXFLAGS`
CPPFLAGS=`"${R_HOME}/bin/R" CMD config CPPFLAGS`
AC_LANG(C++)
AC_PROG_CPP

AC_SEARCH_LIBS(ldap_init, ldap, [], [HAVE_LDAP=FALSE])
AC_CHECK_HEADERS(ldap.h, [], [HAVE_LDAP=FALSE])

if test "x${HAVE_LDAP}" = FALSE; then
  AC_MSG_FAILURE([
  ---------------------------------------------
   'ldap' is required.

   Please install:

   * libldap-2.4-2 (on Debian and Ubuntu)

   and try again.

  ---------------------------------------------])
fi


# Write the flags into the src/Makevars file.
AC_SUBST([PKG_CPPFLAGS], ["${PKG_CPPFLAGS}"])
AC_SUBST([PKG_LIBS], ["${LIBS} ${PKG_LIBS} ${ac_cv_search_ldap_init}"])
AC_CONFIG_FILES([src/Makevars])
AC_OUTPUT

echo "
  --------------------------------------------------
  Configuration for ${PACKAGE_NAME} ${PACKAGE_VERSION}

    cppflags: ${CPPFLAGS} ${PKG_CPPFLAGS}
    libs:     ${PKG_LIBS}

  --------------------------------------------------
"
