\name{dgBeta}
\alias{dgBeta}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Generalized Beta Distribution. 
}
\description{
The generalized beta
distribution extends the classical beta distribution to continuous
random variables beyond the normalized range [0,1] (Whitby,
1971). 
}
\usage{
dgBeta(x, a = min(x), b = max(x), gam = 1, del = 1)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{x}{
Vector of quantilies.
}
  \item{a}{
Minimum of range of r.v. \eqn{X}.
}
  \item{b}{
Maximum of range of  r.v. \eqn{X}.
}
  \item{gam}{
Gamma parameter.
}
  \item{del}{
Delta parameter.
}
}
\details{
The Generalized Beta Distribution is defined as follows: 

\deqn{G(x;a,b,\gamma,\delta) = \frac{1}{B(\gamma,\delta)(b-a)^{\gamma+\delta-1}}
(x-a)^{\gamma-1}(b-x)^{\delta-1}}

where \eqn{B(\gamma,\delta)} is the beta function. The parameters \eqn{a \in R} and 
\eqn{b \in R} (with \eqn{a < b}) are the left and right end points respectively, and \eqn{\gamma > 0} and \eqn{\delta > 0} are the governing shape parameters for \eqn{a} and \eqn{b} respectively. For all the values of
the r.v. \eqn{X} that fall outside the interval \eqn{[a, b]}, \eqn{G} simply takes value 0. The
generalized beta distribution reduces to the beta distribution when \eqn{a = 0} and
\eqn{b = 1}.


}
\value{
Gives the density.}
\references{
Whitby, O.  (1971). \emph{Estimation of parameters in the
    generalized beta distribution} (Technical Report NO. 29). Department of
Statistics: Standford
    University.
}
\author{
Massimiliano Pastore & Luigi Lombardi
}
%\note{
%%  ~~further notes~~
%}

%% ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{
\code{\link{dgBetaD}}
}
\examples{
curve(dgBeta(x))
curve(dgBeta(x,gam=3,del=3))
curve(dgBeta(x,gam=1.5,del=2.5))

x <- 1:7
GA <- c(1,3,1.5,8); DE <- c(1,3,4,2.5)
par(mfrow=c(2,2))
for (j in 1:4) {
  plot(x,dgBeta(x,gam=GA[j],del=DE[j]),type="h",
       panel.first=points(x,dgBeta(x,gam=GA[j],del=DE[j]),pch=19),
       main=paste("gamma=",GA[j]," delta=",DE[j],sep=""),ylim=c(0,.6),
       ylab="dgBeta(x)")  
}
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{distribution}
%\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
