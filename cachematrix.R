## The functions are to help us understand lexical scoping, 
## how to use object-based programming skills to generate an object
## and get its cached parameter values.

## Generate a list of four functions: set the matrix, get the matrix, set its inverse, and get its inverse.

makeCacheMatrix <- function(x = matrix()) {                    ##  initialize the function which whill generate four functions
  m <- NULL                                                    ##  initializing a local variable to the function (m/inverse value) to NULL.
  set <- function(y) {                                         ## construct an object function/method called set. 
    x <<- y                                                    ## set the cached x value to the passed in numeric vector
    m <<- NULL                                                ##setting the cached (m/mean) to NULL
  }
  get <- function() x                                     ## function to get the matrix
  setinverse <- function(solve) m <<- solve               ##function to set the inverse of the matrix
  getinverse <- function() m                              ##function to return the inverse
  list(set = set, get = get,                              ## print the list of the four functions
       setinverse = setinverse, 
       getinverse = getinverse)
}


## Get the cached inverse matrix or generate one if none exists.

cacheSolve <- function(x, ...) {                           ## Return a matrix that is the inverse of 'x'
  m<- x$getinverse()                                        ## retrive m from getinverse() of makeMatrix()
  if(!is.null(m)) {                                        ##if the inverse matrix was generated, return it and print a note
    message("getting cached data")
    return(m)
  }
  data <- x$get()                                         ##if retrive no inverse matrix, compute it here
  m <- solve(data, ...)
  x$setinverse(m)
  m
  
}
