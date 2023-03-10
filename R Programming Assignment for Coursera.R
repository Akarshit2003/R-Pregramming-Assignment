## Put comments here that give an overall description of what your
## functions do
## Caching the Inverse of a Matrix
## A pair of functions that are used to create a special object that 
## stores a matrix and caches its inverse

## Write a short comment describing this function
## This functions creates a special matrix object that can cache its inverse.

makeCacheMatrix <- function(x = matrix()) {
  
  inv <- NULL
  set <- function(y){
    x<<-y 
    inv<<- NULL
  }
  get <- function()x
  setinverse<- function(inverse) inv<<- inverse
  getinverse<- function()inv
  list (set = set,
        get = get,
        setinverse = setinverse,
        getinverse =getinverse)
}

## Write a short comment describing this function
## "cachesolve" function computes the inverse of the special matrix 
## created by "makeCachematrix"

cacheSolve <- function(x, ...) {
  ## Return a matrix that is the inverse of 'x'
  inv<- x$getinverse()
  if (!is.null(inv)) {
    message("getting cached data")
    return(inv)
  }
  mat <- x$get()
  inv <- solve(mat, ...)
  x$setinverse(inv)
  inv
}