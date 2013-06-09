\name{rdatagen}
\alias{rdatagen}

\title{
Simulate discrete data.
}
\description{
Simulate discrete data from either a correlation matrix or thresholds or probabilities.
}
\usage{
rdatagen(n = 100, R = diag(1,2), Q = NULL, th = NULL, probs = NULL)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{n}{
Number of observations.
}
  \item{R}{
Correlation matrix.
}
  \item{Q}{
Number of discrete values in the random variable. Could be a single value or a vector. If \code{Q} is set to 1 (default value), the function produces continuous variables by setting \code{th=c(-Inf,Inf)} and \code{probs=1}. 
}

\item{th}{
List of thresholds; each element contains \code{Q}+1 values.
}
  \item{probs}{
List of probabilities; each elements contains \code{Q} values. 
}
}
%\details{
%%  ~~ If necessary, more details than the description above ~~
%}
\value{
Returns a list with four elements:
\item{data }{The simulate data matrix.}
  \item{R }{Correlation matrix.}
\item{thresholds }{The list of thresholds.}
\item{probs }{The list of probabilities. }
}
\references{
Pastore, M., Lombardi, L. (in press). The impact of faking on Cronbach’s Alpha for
dichotomous and ordered rating scores. \emph{Quality & Quantity}.
}
\author{
Massimiliano Pastore & Luigi Lombardi
}
\note{
Requires  

Defaults work like in the \code{mwrnorm} function of the \code{MASS} package.
}

%% ~Make other sections like Warning with \section{Warning }{....} ~

%\seealso{
%% ~~objects to See Also as \code{\link{help}}, ~~~
%}
\examples{
require(MASS)
## only default
rdatagen()

## set correlations only
R <- matrix(c(1,.4,.4,1),2,2)
Dx <- rdatagen(n=10000,R=R)$data

par(mfrow=c(1,2))
for (j in 1:ncol(Dx)) hist(Dx[,j])

## set correlations and Q
Dx <- rdatagen(n=10000,R=R,Q=2)$data

par(mfrow=c(1,2))
for (j in 1:ncol(Dx)) barplot(table(Dx[,j])/nrow(Dx))

## set correlations and thresholds
th <- list(c(-Inf,qchisq(pbinom(0:3,4,.5),1),Inf),
    c(-Inf,qnorm(pbinom(0:2,3,.5)),Inf))
Dx <- rdatagen(n=10000,R=R,th=th)$data

par(mfrow=c(1,2))
for (j in 1:ncol(Dx)) barplot(table(Dx[,j])/nrow(Dx))

## set correlations and probabilities
probs <- list(c(.125,.375,.375,.125),c(.125,.375,.375,.125))
Dx <- rdatagen(n=10000,R=R,probs=probs)$data

par(mfrow=c(1,2))
for (j in 1:ncol(Dx)) barplot(table(Dx[,j])/nrow(Dx))

## set different values for Q
Dx <- rdatagen(n=1000,Q=c(2,4),R=R)$data

par(mfrow=c(1,2))
for (j in 1:ncol(Dx)) barplot(table(Dx[,j])/nrow(Dx))
}

% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{datagen}
%\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
