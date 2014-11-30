\name{pfake}
\alias{pfake}

\title{
Probability of faking.
}
\description{
The function gives the conditional probability of replacement \eqn{p(f=k|d=h,\theta_F)} for discrete values in the range \eqn{1, \ldots, Q}. 

}
\usage{
pfake(k, h = k, p = c(0,0), Q = 5, gam = c(1,1), del = c(1,1),
      fake.model = c("uninformative", "average", "slight", "extreme"))
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
Overall probability of replacement: \code{p[1]} indicates the faking good probability, \code{p[2]} indicates the faking bad probability.
}
  \item{Q}{Max value in the discrete r.v. range: \eqn{1, \ldots, Q}.
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
%%  ~~ If necessary, more details than the description above ~~
%}
\value{
Gives the conditional probability distribution based on the following equation
\deqn{
p(f=k|d=h,\theta_F)=
\left\{ 
\begin{array}{cl} 
 DG(k;h+1,Q,\gamma_{+},\delta_{+}) \pi_{+} & 1 \leq h < k \leq Q   \\
 DG(k;q,h-1,\gamma_{-},\delta_{-}) \pi_{-} & 1 \leq k < h \leq Q   \\
1-(\pi_{+}+\pi{-})  &  1 < h=k < Q \\
1- \pi_{+} & k=h=1 \\
1- \pi_{-} & k=h=Q 
\end{array}
\right. 
}
with \eqn{\theta_F} and \eqn{DG} being the parameter vector \eqn{(\gamma_{+},\gamma_{-},\delta_{+},\delta_{-},\pi_{+},\pi_{-})} and the generalized Beta distribution for discrete variables (\code{\link{dgBetaD}}) with bounds \eqn{a=h+1} (resp. \eqn{a=1}) and \eqn{b=Q} (resp \eqn{b=h-1}). The parameter \eqn{\pi_{+}} denotes the probability of faking good, \eqn{\pi_{-}} indicates the probability of faking bad.  
Note that the faking probabilities must satisfy the following condition: \eqn{\pi_{+}+\pi_{-} \leq 1}.   
}
\references{
Lombardi, L., Pastore, M. (2014).  sgr: A Package for Simulating Conditional Fake Ordinal Data. \emph{The R Journal}, 6, 164-177.

Pastore, M., Lombardi, L. (2014). The impact of faking on Cronbach's Alpha for
dichotomous and ordered rating scores. \emph{Quality & Quantity}, 48, 1191-1211.
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

### fake good
par(mfrow=c(2,2))
for (j in 1:4) {
  y <- NULL
  for (i in x) y <- c(y,pfake(x[i],h=4,Q=7,
                gam=c(GA[j],GA[j]),del=c(DE[j],DE[j]),p=c(.4,0)))
  plot(x,y,type="h",panel.first=points(x,y,pch=19),
       main=paste("gamma=",GA[j]," delta=",DE[j],sep=""),ylim=c(0,.7),
       ylab="Replacement probability") 
}

### fake bad
for (j in 1:4) {
  y <- NULL
  for (i in x) y <- c(y,pfake(x[i],h=4,Q=7,
                gam=c(GA[j],GA[j]),del=c(DE[j],DE[j]),p=c(0,.4)))
  plot(x,y,type="h",panel.first=points(x,y,pch=19),
       main=paste("gamma=",GA[j]," delta=",DE[j],sep=""),ylim=c(0,.7),
       ylab="Replacement probability") 
}

### fake good and fake bad
P = c(.4,.4)
par(mfrow=c(2,4))
for (j in x) {
  y <- NULL
  for (i in x) {
    y <- c(y,pfake(x[i],h=x[j],Q=max(x),gam=c(GA[1],GA[1]),del=c(DE[1],DE[1]),p=P))
  }
  plot(x,y,type="h",panel.first=points(x,y,pch=19),
       main=paste("h=",x[j],sep=""),ylim=c(0,1),
       ylab="Replacement probability") 
  print(sum(y,na.rm=TRUE)) 
}

### using the fake.model argument
x <- 1:5 
models <- c("uninformative","average","slight","extreme")
par(mfrow=c(2,2))
for (j in 1:4) {
  y <- NULL
  for (i in x) y <- c(y,pfake(x[i],h=2,Q=max(x),
            fake.model=models[j],p=c(.45,0)))       # fake good
  plot(x,y,type="h",panel.first=points(x,y,pch=19),
       main=paste(models[j],"model"),ylim=c(0,1),
       ylab="Replacement probability") 
}

par(mfrow=c(2,2))
for (j in 1:4) {
  y <- NULL
  for (i in x) y <- c(y,pfake(x[i],h=4,Q=max(x),
            fake.model=models[j],p=c(0,.45)))       # fake bad
  plot(x,y,type="h",panel.first=points(x,y,pch=19),
       main=paste(models[j],"model"),ylim=c(0,1),
       ylab="Replacement probability") 
}

}

% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{distribution}
%\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
