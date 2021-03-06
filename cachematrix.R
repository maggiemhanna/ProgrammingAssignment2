## 2 functions makeCacheMatrix and cacheSolve making use of lexical scoping 

## Creates a matrix object that can cache its inverse.

makeCacheMatrix <- function(x = matrix()) {
    I <- NULL
    set <- function(y) {
        x <<- y
        I <<- NULL
    }
    get <- function() x
    setinv <- function(inv) I <<- inv
    getinv <- function() I
    list(set = set, get = get,
         setinv = setinv,
         getinv = getinv)
}


## Function cacheSolve.
## Computes the inverse of the matrix object returned by makeCacheMatrix.
## If the inverse has already been calculated and the matrix has not
## changed, then cacheSolve retrieves the inverse from the cache.

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
    I <- x$getinv()
    if(!is.null(I)) {
        message("getting cached data")
        return(I)
    }
    data <- x$get()
    I <- solve(data, ...)
    x$setinv(I)
    I
}
