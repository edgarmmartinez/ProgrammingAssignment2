## Functions to create and cache a matrix inverse

## Create matrix object that can cache its invers

makeCacheMatrix <- function(x = matrix()) {
    ## Local variables
    myMatrix <- x
    myInvMatrix <- NULL
    
    # set raw/original matrix
    setMatrix <- function(m) {
        myMatrix <<- m
    }
    
    #get raw/original matrix
    getMatrix <- function() {
        myMatrix
    }
    
    #set inverse of original matrix
    setInv <- function(y) {
        myInvMatrix <<- y
    }
    
    #get cached inverse of original matrix
    getInv <- function() {
        myInvMatrix
    }
    
    # return list of getters and setters
    list(setMatrix = setMatrix,
         getMatrix = getMatrix,
         setInv = setInv,
         getInv = getInv)
}


## Return a matrix that is the inverse of 'x'. 'x' is an object
## created by makeCacheMatrix
cacheSolve <- function(x, ...) {
    #try to get the cached matrix inverse
    m<-x$getInv()
    
    if(is.null(m)) {
        #create the matrix inverse if it's never been done before
        print("Creating cache") # for illustration purposes
        m<-solve(x$getMatrix())
        
        #store the newly created matrix inverse
        x$setInv(m)
    }
    
    #return the matrix inverse, whether it came from cache or just created
    m
}

#m1<-makeCacheMatrix(matrix(round(rnorm(100,mean=10,sd=3)),10,10))
#m2<-makeCacheMatrix(matrix(round(rnorm(100,mean=10,sd=3)),10,10))
#m3<-makeCacheMatrix(matrix(round(runif(100,1,10)),10,10))
#m4<-makeCacheMatrix(matrix(round(runif(100,10,100)),10,10))
#cacheSolve(m1)
#cacheSolve(m2)
#cacheSolve(m3)
#cacheSolve(m4)
