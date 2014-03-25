\name{dgBetaD}
\alias{dgBetaD}

\title{
Generalized Beta distribution for discrete variables
}
\description{
Generalized Beta distribution for discrete variables.
}
\usage{
dgBetaD(x, a = min(x), b = max(x), gam = 1, del = 1, ct = 1)
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
  \item{ct}{Correction term, default value: 1.}
}
\details{
Let \eqn{X} be a discrete variable with range 
\deqn{R_X=\{a,a+1,a+2,\ldots, a+t-1,a+t = b  \} }
and where \eqn{a \in \mathrm{N} \cup \{0 \} } and \eqn{t \in \mathrm{N}}. The Generalized Discrete Beta Distribution for the r.v. \eqn{X} is defined as follows:
\deqn{DG(x;a,b,\gamma,\delta)= 
\left\{ 
\begin{array}{cl} 
\frac{G^*(x;a,b,\gamma,\delta)}{\sum_{x' \in R_X} G^*(x';a,b,\gamma,\delta)} & x \in  R_X\\
0 & x \notin  R_X
\end{array}
\right. 
}
where \eqn{G^*}  is a modified version of the generalized beta distribution \code{\link{dgBeta}} defined as
\deqn{
G^*(x;a,b,\gamma,\delta)=\frac{1}{B(\gamma,\delta)(b-a+2c)^{\gamma+\delta-1}}
(x-a+c)^{\gamma-1}(b-x+c)^{\delta-1}
}

}
\value{
Gives the density.
}
\references{
Pastore, M., Lombardi, L. (in press). The impact of faking on Cronbach's Alpha for
dichotomous and ordered rating scores. \emph{Quality & Quantity}.
}
\author{
Massimiliano Pastore & Luigi Lombardi
}
%\note{
%%  ~~further notes~~
%}

%% ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{
\code{\link{dgBeta}}
}
\examples{
x <- 1:7
GA <- c(1,3,1.5,8); DE <- c(1,3,4,2.5)
par(mfrow=c(2,2))
for (j in 1:4) {
  plot(x,dgBetaD(x,gam=GA[j],del=DE[j]),type="h",
       panel.first=points(x,dgBetaD(x,gam=GA[j],del=DE[j]),pch=19),
       main=paste("gamma=",GA[j]," delta=",DE[j],sep=""),ylim=c(0,.6),
       ylab="dgBetaD(x)")  
}
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{distribution}
%\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
