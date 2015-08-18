makeCacheMatrix <- function(x = matrix()) {
        invx <- NULL
        set  <- function(y) {
                x <<- y
                m <<- NULL
        }
        get <- function() x
        setinv <- function(inverse) invx <<- inverse
        getinv <- function() invx
        list(set = set, get = get,
             setinv = setinv,
             getinv = getinv)
}


