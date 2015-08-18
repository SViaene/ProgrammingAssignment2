## This couple of functions allows for fast repeated matrix inversion by 
## caching the result and allowing to recall the cached inverted matrix.

## This function does the actual caching through the getter and setter functions

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


## This function does the actual matrix inversion, but checks beforehand if the
## inverse matrix is available in the cache.

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
        invx <- x$getinv()
        if(!is.null(invx)) {
                message("getting cached data")
                return(invx)
        }
        data <- x$get()
        invx <- solve(data, ...)
        x$setinv(invx)
        invx
}
