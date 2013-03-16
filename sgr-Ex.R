pkgname <- "sgr"
source(file.path(R.home("share"), "R", "examples-header.R"))
options(warn = 1)
library('sgr')

assign(".oldSearch", search(), pos = 'CheckExEnv')
cleanEx()
nameEx("dgBeta")
### * dgBeta

flush(stderr()); flush(stdout())

### Name: dgBeta
### Title: Generalized Beta Distribution.
### Aliases: dgBeta
### Keywords: distribution

### ** Examples

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



graphics::par(get("par.postscript", pos = 'CheckExEnv'))
cleanEx()
nameEx("dgBetaD")
### * dgBetaD

flush(stderr()); flush(stdout())

### Name: dgBetaD
### Title: Generalized Beta distribution for discrete variables
### Aliases: dgBetaD
### Keywords: distribution

### ** Examples

x <- 1:7
GA <- c(1,3,1.5,8); DE <- c(1,3,4,2.5)
par(mfrow=c(2,2))
for (j in 1:4) {
  plot(x,dgBetaD(x,gam=GA[j],del=DE[j]),type="h",
       panel.first=points(x,dgBetaD(x,gam=GA[j],del=DE[j]),pch=19),
       main=paste("gamma=",GA[j]," delta=",DE[j],sep=""),ylim=c(0,.6),
       ylab="dgBetaD(x)")  
}



graphics::par(get("par.postscript", pos = 'CheckExEnv'))
cleanEx()
nameEx("model.fake.par")
### * model.fake.par

flush(stderr()); flush(stdout())

### Name: model.fake.par
### Title: Internal function.
### Aliases: model.fake.par
### Keywords: utility

### ** Examples

model.fake.par() # default
model.fake.par("average")



cleanEx()
nameEx("partition.replacement")
### * partition.replacement

flush(stderr()); flush(stdout())

### Name: partition.replacement
### Title: Partition of fake.
### Aliases: partition.replacement
### Keywords: utility

### ** Examples

require(MASS)
set.seed(20130207)
R <- matrix(c(1,.3,.3,1),2,2)
Dx <- rdatagen(n=20,R=R,Q=5)$data

## partition matrix
PM <- matrix(0,nrow(Dx),ncol(Dx))
PM[3:10,2] <- 1
PM[3:10,1] <- 1
partition.replacement(Dx,PM) # warning! zero replacements

## using fake.model
partition.replacement(Dx,PM,fake.model="uninformative",p=matrix(c(.3,.2),ncol=2))

###
p <- c(.5,0)
gam <- c(1,1)
del <- c(1,1)
Pparm <- list(p=p,gam=gam,del=del)
partition.replacement(Dx,PM,Pparm=Pparm) 

### another partition
PM[11:15,2] <- 2
(Pparm <- list(p=matrix(c(0,.5,.5,0),2,2),
      gam=matrix(c(1,4,1,4),2,2),del=matrix(c(1,2,1,2),2,2)))
partition.replacement(Dx,PM,Pparm=Pparm) 





cleanEx()
nameEx("pfake")
### * pfake

flush(stderr()); flush(stdout())

### Name: pfake
### Title: Probability of faking.
### Aliases: pfake
### Keywords: distribution

### ** Examples

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




graphics::par(get("par.postscript", pos = 'CheckExEnv'))
cleanEx()
nameEx("pfakebad")
### * pfakebad

flush(stderr()); flush(stdout())

### Name: pfakebad
### Title: Probability of faking bad.
### Aliases: pfakebad
### Keywords: distribution

### ** Examples

x <- 1:7
GA <- c(1,3,1.5,8); DE <- c(1,3,4,2.5)
par(mfrow=c(2,2))
for (j in 1:4) {
  y <- NULL
  for (i in x) y <- c(y,pfakebad(x[i],h=5,Q=7,gam=GA[j],del=DE[j],p=.4))
  plot(x,y,type="h",panel.first=points(x,y,pch=19),
       main=paste("gamma=",GA[j]," delta=",DE[j],sep=""),ylim=c(0,.7),
       ylab="Replacement probability")  
}


graphics::par(get("par.postscript", pos = 'CheckExEnv'))
cleanEx()
nameEx("pfakegood")
### * pfakegood

flush(stderr()); flush(stdout())

### Name: pfakegood
### Title: Probability of faking good.
### Aliases: pfakegood
### Keywords: distribution

### ** Examples

x <- 1:7
GA <- c(1,3,1.5,8); DE <- c(1,3,4,2.5)
par(mfrow=c(2,2))
for (j in 1:4) {
  y <- NULL
  for (i in x) y <- c(y,pfakegood(x[i],h=3,Q=7,gam=GA[j],del=DE[j],p=.4))
  plot(x,y,type="h",panel.first=points(x,y,pch=19),
       main=paste("gamma=",GA[j]," delta=",DE[j],sep=""),ylim=c(0,.7),
       ylab="Replacement probability")  
}


graphics::par(get("par.postscript", pos = 'CheckExEnv'))
cleanEx()
nameEx("rdatagen")
### * rdatagen

flush(stderr()); flush(stdout())

### Name: rdatagen
### Title: Simulate discrete data.
### Aliases: rdatagen
### Keywords: datagen

### ** Examples

require(MASS)
## only default
rdatagen()

## set correlation only
R <- matrix(c(1,.4,.4,1),2,2)
Dx <- rdatagen(n=10000,R=R)$data

par(mfrow=c(1,2))
for (j in 1:ncol(Dx)) hist(Dx[,j])

## set correlation and Q
Dx <- rdatagen(n=10000,R=R,Q=2)$data

par(mfrow=c(1,2))
for (j in 1:ncol(Dx)) barplot(table(Dx[,j])/nrow(Dx))

## set correlation and thresholds
th <- list(c(-Inf,qchisq(pbinom(0:3,4,.5),1),Inf),
    c(-Inf,qnorm(pbinom(0:2,3,.5)),Inf))
Dx <- rdatagen(n=10000,R=R,th=th)$data

par(mfrow=c(1,2))
for (j in 1:ncol(Dx)) barplot(table(Dx[,j])/nrow(Dx))

## set correlation and probabilities
probs <- list(c(.125,.375,.375,.125),c(.125,.375,.375,.125))
Dx <- rdatagen(n=10000,R=R,probs=probs)$data

par(mfrow=c(1,2))
for (j in 1:ncol(Dx)) barplot(table(Dx[,j])/nrow(Dx))

## set different values for Q
Dx <- rdatagen(n=1000,Q=c(2,4),R=R)$data

par(mfrow=c(1,2))
for (j in 1:ncol(Dx)) barplot(table(Dx[,j])/nrow(Dx))



graphics::par(get("par.postscript", pos = 'CheckExEnv'))
cleanEx()
nameEx("rdatarepl")
### * rdatarepl

flush(stderr()); flush(stdout())

### Name: rdatarepl
### Title: Random replacements of data.
### Aliases: rdatarepl
### Keywords: utility

### ** Examples

require(MASS)
set.seed(20130207)
Dx <- rdatagen(R=matrix(c(1,.3,.3,1),2,2),Q=5)$data
RM <- replacement.matrix(p=c(.6,0))
Fx <- rdatarepl(Dx,RM)$Fx

par(mfrow=c(2,2))
for (j in 1:ncol(Dx)) barplot(table(Dx[,j]),main="original data")
for (j in 1:ncol(Fx)) barplot(table(Fx[,j]),main="replaced data")



graphics::par(get("par.postscript", pos = 'CheckExEnv'))
cleanEx()
nameEx("replacement.matrix")
### * replacement.matrix

flush(stderr()); flush(stdout())

### Name: replacement.matrix
### Title: Replacement matrix.
### Aliases: replacement.matrix
### Keywords: utility

### ** Examples

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



### * <FOOTER>
###
cat("Time elapsed: ", proc.time() - get("ptime", pos = 'CheckExEnv'),"\n")
grDevices::dev.off()
###
### Local variables: ***
### mode: outline-minor ***
### outline-regexp: "\\(> \\)?### [*]+" ***
### End: ***
quit('no')
