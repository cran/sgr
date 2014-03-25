\name{model.fake.par}
\alias{model.fake.par}

\title{
Internal function.
}
\description{
Set different instances of the conditional replacement distribution.
}
\usage{
model.fake.par(fake.model = c("uninformative", "average", "slight", "extreme"))
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{fake.model}{A character string
indicating the model for the conditional replacement distribution.
The options are:  \code{uninformative} (default option) [\code{gam = c(1,1)} and \code{del = c(1,1)}]; \code{average} [\code{gam = c(3,3)} and \code{del = c(3,3)}]; 
  \code{slight} [\code{gam = c(1.5,4)} and \code{del = c(4,1.5)}]; \code{extreme} [\code{gam = c(4,1.5)} and \code{del = c(1.5,4)}].}
}
\value{
Gives a list with \eqn{\gamma} and \eqn{\delta} parameters.
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
\references{
Pastore, M., Lombardi, L. (in press). The impact of faking on Cronbach's Alpha for
dichotomous and ordered rating scores. \emph{Quality & Quantity}.
}
%% ~Make other sections like Warning with \section{Warning }{....} ~
%\seealso{
% \code{\link{dgBetaD}}, \code{\link{pfake}}, \code{\link{pfakegood}}, \code{\link{pfa%kebad}}
%}
\examples{
model.fake.par() # default
model.fake.par("average")
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{utility}
%\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
