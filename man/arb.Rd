\name{arb}
\alias{arb}

\title{
Average relative bias
}
\description{
Average relative bias (ARB).
}
\usage{
arb(Bpar, B0)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{Bpar}{
Matrix \eqn{b \times p} . 
}
  \item{B0}{
Vector of true parameter values.
}
}
\details{
Let \eqn{\hat{\theta}_{ij}} be the estimated parameter value if the \eqn{j}th 
parameter in the \eqn{i}th sample (replicate), \eqn{i = 1, 2, \ldots B}, \eqn{j = 1, 2, \ldots P}, (thus \eqn{P =} number of parameters, \eqn{B =} number of replicates),
and let \eqn{\theta_{j}} be the corresponding true parameter value, the Average relative bias is defined as follows:

\deqn{ARB=\frac{100}{B}\sum_{i}\frac{1}{P} \sum_{j} \left( \frac{\hat{\theta}_{ij}-\theta_{j}}{\theta_{j}} \right)  } 

}
\value{
Gives the ARB value.
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
\code{\link{amse}}
}
%\examples{
%
%}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{utility}
%\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
