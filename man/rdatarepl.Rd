\name{rdatarepl}
\alias{rdatarepl}

\title{
Random replacements of data.
}
\description{
Replaces data in the original data matrix using a specified replacement matrix. 
}
\usage{
rdatarepl(Dx, RM, printfp = TRUE)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{Dx}{Data frame or matrix to be replaced.}
  \item{RM}{Replacement matrix.}
  \item{printfp}{Logical, if \code{TRUE} (the default) print the percentage of
  data replaced.}
}
\details{
Replacement matrix could be obtained from \code{\link{replacement.matrix}} function. 
}
\value{
Returns a list with two elements: 
  \item{Fx }{The replaced (fake) data matrix.}
  \item{Fperc }{Percentage of replaced data.}
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
 \code{\link{replacement.matrix}}
}

\examples{
require(MASS)
set.seed(20130207)
Dx <- rdatagen(R=matrix(c(1,.3,.3,1),2,2),Q=5)$data
RM <- replacement.matrix(p=c(.6,0))
Fx <- rdatarepl(Dx,RM)$Fx

par(mfrow=c(2,2))
for (j in 1:ncol(Dx)) barplot(table(Dx[,j]),main="original data")
for (j in 1:ncol(Fx)) barplot(table(Fx[,j]),main="replaced data")
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{utility}
%\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
