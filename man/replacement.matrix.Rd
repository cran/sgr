\name{replacement.matrix}
\alias{replacement.matrix}

\title{
Replacement matrix.
}
\description{
Creates the replacement matrix.
}
\usage{
replacement.matrix(Q = 5, p = c(0,0), gam = c(1,1), del = c(1,1),
    fake.model = c("uninformative", "average", "slight", "extreme"))
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{Q}{
Number of discrete possible values. 
}
  \item{p}{
Overall probability of replacement: \code{p[1]} indicates the faking good probability  
  \code{p[2]} the faking bad probability.
}
  \item{gam}{
Gamma parameter: \code{gam[,1]} indicates the faking good parameter \eqn{\gamma_{+}}, 
  \code{gam[,2]} the faking bad parameter \eqn{\gamma_{-}}.
}
  \item{del}{
Delta parameter: \code{del[,1]} indicates the faking good parameter \eqn{\delta_{+}}, 
  \code{del[,2]} the faking bad parameter \eqn{\delta_{-}}.
}
  \item{fake.model}{A character string indicating which instance of a conditional replacement distribution is to be used for the faking model. The options are:  \code{uninformative} (default option), sets \code{gam = c(1,1)} and \code{del = c(1,1)}; \code{average} sets \code{gam = c(3,3)} and \code{del = c(3,3)}; 
  \code{slight} sets \code{gam = c(1.5,4)} and \code{del = c(4,1.5)}; \code{extreme} sets \code{gam = c(4,1.5)} and \code{del = c(1.5,4)}.}
}
\details{
Additional parameters can be \code{gamma} and \code{delta} for generalized beta for discrete variables (\code{\link{dgBetaD}}). 

}
\value{
Gives a \eqn{Q \times Q} matrix with replacement probabilities. Each row is a probability distribution which gives the conditional probability \eqn{p(k=r|h=c,\pi)} where \eqn{r} is the row and \eqn{c} the column of the matrix, and \eqn{\pi} (\code{p}) is the overall replacement probability. 

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
## non replacements
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
