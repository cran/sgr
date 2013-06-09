\name{partition.replacement}
\alias{partition.replacement}

\title{
Internal function.
}
\description{
This function allows to set different replacement distributions for different subsets of cells of the data matrix.
}
\usage{
partition.replacement(Dx, PM, Q = NULL, Pparm = NULL,
        fake.model = NULL,p = NULL)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{Dx}{Data frame or matrix to be replaced.}
  \item{PM}{Partition matrix with same dimension of \code{Dx}. See details.}
\item{Q}{Number of discrete values, \eqn{1, \ldots, Q}, in the r. v.}  
  \item{Pparm}{List of replacement parameters for each partition. See details}
  \item{fake.model}{A character string indicating which instance of a conditional replacement distribution is to be used for the faking model, see \code{\link{model.fake.par}}.}
  \item{p}{Overall probability of replacement. Must be a matrix with \eqn{P} rows and  two columns. See details.
  }
}
\details{
\code{PM} has the same dimension as \code{Dx} and a numeric code for each distinct class in the partition.
If a cell of the partition matrix \code{PM} contains 
\code{0}, then the corresponding \code{Dx} cell value is not modified (no replacements condition class).

\code{Pparm} is a list containing three elements. Each element is a \eqn{P\times 2} matrix where \eqn{P} is the total number of classes in the partition (see examples for further details). 

\code{p}: Overall probability of replacement: \code{p[,1]} indicates the faking good probability, \code{p[,2]} the faking bad probability.

\code{gam}: Gamma parameter: \code{gam[,1]} indicates the faking good parameter, 
  \code{gam[,2]} the faking bad parameter.

\code{del}: Delta parameter: \code{del[,1]} indicates the faking good parameter, 
  \code{del[,2]} the faking bad parameter.

Note that it is possible to define a fake model using the \code{fake.model} assignment. In such cases the user must specify also the overall probability of replacement using parameter \code{p}. 

}

\value{
Returns the fake data matrix. 
}
%\references{
%% ~put references to the literature/web site here ~
%}
\author{
Massimiliano Pastore
}
%\note{
%%  ~~further notes~~
%}

%% ~Make other sections like Warning with \section{Warning }{....} ~
\seealso{
 \code{\link{rdatarepl}}, \code{\link{replacement.matrix}}
}
\examples{
require(MASS)
set.seed(20130207)
R <- matrix(c(1,.3,.3,1),2,2)
Dx <- rdatagen(n=20,R=R,Q=5)$data

## partition matrix
PM <- matrix(0,nrow(Dx),ncol(Dx))
PM[3:10,2] <- 1
PM[3:10,1] <- 1
partition.replacement(Dx,PM) # warning! zero replacements

## using fake.model
partition.replacement(Dx,PM,fake.model="uninformative",p=matrix(c(.3,.2),ncol=2))

###
p <- c(.5,0)
gam <- c(1,1)
del <- c(1,1)
Pparm <- list(p=p,gam=gam,del=del)
partition.replacement(Dx,PM,Pparm=Pparm) 

### another partition
PM[11:15,2] <- 2
(Pparm <- list(p=matrix(c(0,.5,.5,0),2,2),
      gam=matrix(c(1,4,1,4),2,2),del=matrix(c(1,2,1,2),2,2)))
partition.replacement(Dx,PM,Pparm=Pparm) 


}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{utility}
%\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
