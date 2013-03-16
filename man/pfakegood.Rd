\name{pfakegood}
\alias{pfakegood}

\title{
Probability of faking good.
}
\description{
The function gives the conditional probability of replacement \eqn{p(f=k|d=h,\theta_F)} for discrete values in the range \eqn{1, \ldots, Q}. 
}
\usage{
pfakegood(k, h = k, p = 0, Q = 5, gam = 1, del = 1)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{k}{
A fake value.
}
  \item{h}{
An observed original value. 
}
  \item{p}{
Overall probability of replacement. 
}
  \item{Q}{
Number of discrete possible values. 
}
  \item{gam}{
Gamma parameter.
}
  \item{del}{
Delta parameter.
}
}
%\details{
%%  ~~ If necessary, more details than the description above ~~
%}
\value{
Gives the conditional probability based on the following equation
\deqn{
p(f=k|d=h,\theta_F)=
\left\{ 
\begin{array}{cl} 
1 & h=k=Q \\
 GD(k;h+1,Q,\gamma,\delta) \pi & 1 \leq h < k \leq Q   \\
1-\pi  &  1 \leq k=h < Q \\
0 & 1 \leq k < h \leq Q
\end{array}
\right. 
}
with \eqn{\theta_F} is the parameter vector \eqn{\theta=(\gamma,\delta,\pi)} and \eqn{GD} is the generalized Beta distribution for discrete variables (\code{\link{dgBetaD}}) with bounds \eqn{a=h+1} and \eqn{b=Q}. The parameter \eqn{\pi} denotes the probability of faking good.   
}
\references{
Pastore, M., Lombardi, L. (in press). The impact of faking on Cronbach’s Alpha for
dichotomous and ordered rating scores. \emph{Quality & Quantity}.
}
\author{
Massimiliano Pastore & Luigi Lombardi
}
%\note{
%%  ~~further notes~~
%}

%% ~Make other sections like Warning with \section{Warning }{....} ~

%\seealso{
%% ~~objects to See Also as \code{\link{help}}, ~~~
%}
\examples{
x <- 1:7
GA <- c(1,3,1.5,8); DE <- c(1,3,4,2.5)
par(mfrow=c(2,2))
for (j in 1:4) {
  y <- NULL
  for (i in x) y <- c(y,pfakegood(x[i],h=3,Q=7,gam=GA[j],del=DE[j],p=.4))
  plot(x,y,type="h",panel.first=points(x,y,pch=19),
       main=paste("gamma=",GA[j]," delta=",DE[j],sep=""),ylim=c(0,.7),
       ylab="Replacement probability")  
}}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{distribution}
%\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
