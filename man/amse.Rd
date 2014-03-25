\name{amse}
\alias{amse}

\title{
Average root mean square error 
}
\description{
Average root mean square error (AMSE).
}
\usage{
amse(Bpar, B0)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{Bpar}{
A \eqn{B \times P} matrix  (\eqn{B} replicates \eqn{\times} \eqn{P} parameters). 
}
  \item{B0}{
Vector of true parameter values.
}
}
\details{
Let \eqn{\hat{\theta}_{ij}} be the estimated parameter value for the \eqn{j}th 
parameter in the \eqn{i}th sample (replicate), \eqn{i = 1, 2, \ldots B}, \eqn{j = 1, 2, \ldots P}, 
and let \eqn{\theta_{j}} be the corresponding true parameter value, the Average root mean square error is defined as follows:

\deqn{AMSE=\frac{1}{B}\sum_{i}\sqrt{\frac{1}{P} \sum_{j} \left[ \frac{\hat{\theta}_{ij}-\theta_{j}}{\theta_{j}} \right]^2}  } 

}
\value{
Gives the AMSE value.
}
\references{
Yang-Wallentin, F., Joreskog, K. G., Luo, H. (2010). Confirmatory
Factor Analysis of Ordinal Variables With Misspecified Models, \emph{Structural Equation Modeling: A Multidisciplinary Journal}, 17, 392-423.
}
\author{
Massimiliano Pastore & Luigi Lombardi
}
%\note{
%%  ~~further notes~~
%}

%% ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{
\code{\link{arb}}
}
%\examples{
%
%}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{utility}
%\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
