lib <- .libPaths()
.libPaths(new = lib[!grepl("Lehre", lib)])
