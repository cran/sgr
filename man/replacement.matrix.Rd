\name{replacement.matrix}
\alias{replacement.matrix}

\title{
Replacement matrix.
}
\description{
Builds the replacement matrix. 
}
\usage{
replacement.matrix(Q = 5, p = c(0,0), gam = c(1,1), del = c(1,1),
    fake.model = c("uninformative", "average", "slight", "extreme"))
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{Q}{
Max value in the discrete r.v. range: \eqn{1, \ldots, Q}.
}
  \item{p}{
Overall probability of replacement: \code{p[1]} indicates the faking good probability, \code{p[2]} indicates the faking bad probability.
}
  \item{gam}{
Gamma parameter: \code{gam[,1]} indicates the faking good parameter \eqn{\gamma_{+}}, 
  \code{gam[,2]} indicates the faking bad parameter \eqn{\gamma_{-}}.
}
  \item{del}{
Delta parameter: \code{del[,1]} indicates the faking good parameter \eqn{\delta_{+}}, 
  \code{del[,2]} indicates the faking bad parameter \eqn{\delta_{-}}.
}
  \item{fake.model}{A character string
indicating the model for the conditional replacement distribution. The options are:  \code{uninformative} (default option) [\code{gam = c(1,1)} and \code{del = c(1,1)}]; \code{average} [\code{gam = c(3,3)} and \code{del = c(3,3)}]; 
  \code{slight} [\code{gam = c(1.5,4)} and \code{del = c(4,1.5)}]; \code{extreme} [\code{gam = c(4,1.5)} and \code{del = c(1.5,4)}].}
}
%\details{
%Additional parameters can be \code{gamma} and \code{delta} for generalized beta for discrete variables (\code{\link{dgBetaD}}). 
%}
\value{
Gives a \eqn{Q \times Q} matrix with replacement probabilities. Each row \eqn{r} (\eqn{1 \leq r \leq Q}) in the matrix indicates  the conditional probability distribution \deqn{p(k=r|h=c,\pi), \qquad h=1,\ldots,Q} \eqn{\pi} (\code{p}) denotes the overall replacement probability. 

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
 \code{\link{dgBetaD}}, \code{\link{pfake}}, \code{\link{pfakegood}}, \code{\link{pfakebad}}
}
\examples{
## no replacements
replacement.matrix(Q=7) 

## faking good
replacement.matrix(Q=7,p=c(.5,0))
replacement.matrix(Q=7,p=c(.5,0),gam=8,del=2.5)

## faking bad
replacement.matrix(Q=7,p=c(0,.5))
replacement.matrix(Q=7,p=c(0,.5),gam=8,del=2.5)

## faking good and faking bad
replacement.matrix(Q=7,p=c(.3,.5),gam=c(8,8),del=c(2.5,2.5))

## using the fake.model argument
replacement.matrix(Q=7,p=c(0,.4),fake.model="extreme")
replacement.matrix(Q=7,p=c(.4,0),fake.model="extreme")
replacement.matrix(Q=7,p=c(.4,.4),fake.model="slight")
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{utility}
%\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
