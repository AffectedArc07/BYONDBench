// Returns a list containing all subtypes of the given path, but not the given path itself.
/proc/subtypesof(path)
    if(!path || !ispath(path))
        CRASH("Invalid path, failed to fetch subtypes of \"[path]\".")
    return (typesof(path) - path)
