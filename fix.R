libs <- .libPaths()
.libPaths(new = libs[!grepl("Lehre", libs)])
