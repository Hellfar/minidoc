# R-lang

## Syntaxe

- `1`, `3` and `56` are numbers.
- `"string"` is a string.
- `TRUE` and `FALSE` are booleans (`T` and `F` are shorthands to them).
- `c(4, 7, 9)` is a vector of numbers.

To set a variable up `x <- 3`.

To set a comment use `# this is a comment`.

## Vectors

- `5:9` is another way to set a vector but as a sequence (`seq(5, 9, 0.5)` to set the incremental).
- `9:5` sequences can be reversed.
- `se[3]` accessing the third element of the `se` vector.
- `se[c(1, 3)]` and `se[2:4]` can also be used to select elements that'll be parts of a new vector (`se[5:7] <- c('first', 'second', 'third')` can be used as sequence replacement).

Names the the columns of a vector as follow:

```
    > ranks <- 1:3
    > names(ranks) <- c("first", "second", "third")
    > ranks
     first second  third
         1      2      3
    > ranks["first"]
    first
        1
```

## General

```
builtins() # List all built-in functions
options()  # Set options to control how R computes & displays results

?NA        # Help page on handling of missing data values
abs(x)     # The absolute value of "x"
append()   # Add elements to a vector
c(x)       # A generic function which combines its arguments
cat(x)     # Prints the arguments
cbind()    # Combine vectors by row/column (cf. "paste" in Unix)
diff(x)    # Returns suitably lagged and iterated differences
gl()       # Generate factors with the pattern of their levels
grep()     # Pattern matching
identical()  # Test if 2 objects are *exactly* equal
jitter()     # Add a small amount of noise to a numeric vector
julian()     # Return Julian date
length(x)    # Return no. of elements in vector x
ls()         # List objects in current environment
mat.or.vec() # Create a matrix or vector
paste(x)     # Concatenate vectors after converting to character
range(x)     # Returns the minimum and maximum of x
rep(1,5)     # Repeat the number 1 five times
rev(x)       # List the elements of "x" in reverse order
seq(1,10,0.4)  # Generate a sequence (1 -> 10, spaced by 0.4)
sequence()     # Create a vector of sequences
sign(x)        # Returns the signs of the elements of x
sort(x)        # Sort the vector x
order(x)       # list sorted element numbers of x
tolower(),toupper()  # Convert string to lower/upper case letters
unique(x)      # Remove duplicate entries from vector
system("cmd")  # Execute "cmd" in operating system (outside of R)
vector()       # Produces a vector of given length and mode

formatC(x)     # Format x using 'C' style formatting specifications
floor(x), ceiling(x), round(x), signif(x), trunc(x)   # rounding functions

Sys.getenv(x)  # Get the value of the environment variable "x"
Sys.putenv(x)  # Set the value of the environment variable "x"
Sys.time()     # Return system time
Sys.Date()     # Return system date
getwd()        # Return working directory
setwd()        # Set working directory
?files         # Help on low-level interface to file system
list.files()   # List files in a give directory
file.info()    # Get information about files

# Built-in constants:
pi,letters,LETTERS   # Pi, lower & uppercase letters, e.g. letters[7] = "g"
month.abb,month.name # Abbreviated & full names for months
```

## Maths

```
log(x),logb(),log10(),log2(),exp(),expm1(),log1p(),sqrt()   # Fairly obvious
cos(),sin(),tan(),acos(),asin(),atan(),atan2()       # Usual stuff
cosh(),sinh(),tanh(),acosh(),asinh(),atanh()         # Hyperbolic functions
union(),intersect(),setdiff(),setequal()             # Set operations
+,-,*,/,^,%%,%/%                                     # Arithmetic operators
<,>,<=,>=,==,!=                                      # Comparison operators
eigen()      # Computes eigenvalues and eigenvectors

deriv()      # Symbolic and algorithmic derivatives of simple expressions
integrate()  # Adaptive quadrature over a finite or infinite interval.

sqrt(),sum()
?Control     # Help on control flow statements (e.g. if, for, while)
?Extract     # Help on operators acting to extract or replace subsets of vectors
?Logic       # Help on logical operators
?Mod         # Help on functions which support complex arithmetic in R
?Paren       # Help on parentheses
?regex       # Help on regular expressions used in R
?Syntax      # Help on R syntax and giving the precedence of operators
?Special     # Help on special functions related to beta and gamma functions
```

## Graphical

```
help(package=graphics) # List all graphics functions

plot()                # Generic function for plotting of R objects
par()                 # Set or query graphical parameters
curve(5*x^3,add=T)    # Plot an equation as a curve
points(x,y)           # Add another set of points to an existing graph
arrows()              # Draw arrows [see errorbar script]
abline()              # Adds a straight line to an existing graph
lines()               # Join specified points with line segments
segments()            # Draw line segments between pairs of points
hist(x)               # Plot a histogram of x
pairs()               # Plot matrix of scatter plots
matplot()             # Plot columns of matrices

?device               # Help page on available graphical devices
postscript()          # Plot to postscript file
pdf()                 # Plot to pdf file
png()                 # Plot to PNG file
jpeg()                # Plot to JPEG file
X11()                 # Plot to X window
persp()               # Draws perspective plot
contour()             # Contour plot
image()               # Plot an image
```

## Fitting / regression / optimisation

```
lm		# Fit liner model
glm		# Fit generalised linear model
nls		# non-linear (weighted) least-squares fitting
lqs		# "library(MASS)" resistant regression

optim		# general-purpose optimisation
optimize	# 1-dimensional optimisation
constrOptim	# Constrained optimisation
nlm		# Non-linear minimisation
nlminb		# More robust (non-)constrained non-linear minimisation
```

## Statistical

```
help(package=stats)   # List all stats functions

?Chisquare            # Help on chi-squared distribution functions
?Poisson              # Help on Poisson distribution functions
help(package=survival) # Survival analysis

cor.test()            # Perform correlation test
cumsum(); cumprod(); cummin(); cummax()   # Cumuluative functions for vectors
density(x)            # Compute kernel density estimates
ks.test()             # Performs one or two sample Kolmogorov-Smirnov tests
loess(), lowess()     # Scatter plot smoothing
mad()                 # Calculate median absolute deviation
mean(x), weighted.mean(x), median(x), min(x), max(x), quantile(x)
rnorm(), runif()  # Generate random data with Gaussian/uniform distribution
splinefun()           # Perform spline interpolation
smooth.spline()       # Fits a cubic smoothing spline
sd()                  # Calculate standard deviation
summary(x)            # Returns a summary of x: mean, min, max etc.
t.test()              # Student's t-test
var()                 # Calculate variance
sample()              # Random samples & permutations
ecdf()                # Empirical Cumulative Distribution Function
qqplot()              # quantile-quantile plot
```

## Files

```
    > list.files() # list the files (non-hidden) in the current location.
    > source("bottle1.R") # run a script
```

## sources

[http://www.sr.bham.ac.uk/~ajrs/R/r-function_list.html](http://www.sr.bham.ac.uk/~ajrs/R/r-function_list.html)
