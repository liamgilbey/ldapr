.onUnload <- function (libpath) {
  library.dynam.unload("ldapr", libpath)
}