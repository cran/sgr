### AVERAGE RELATIVE BIAS
## B = matrice parametri di bootstrap
## B0 true parameters
arb <- function(Bpar,B0) {
  Bpar <- na.omit(Bpar)
  P <- NULL
  for (j in 1:ncol(Bpar)) {
    P <- cbind(P,(Bpar[,j]-B0[j])/B0[j])
  }
  P <- apply(P,1,mean,na.rm=TRUE)
  arb <- sum(P)*100/nrow(Bpar)
  return(arb)
}

amse <- function(Bpar,B0) {
  Bpar <- na.omit(Bpar)
  P <- NULL
  for (j in 1:ncol(Bpar)) {
    P <- cbind(P,((Bpar[,j]-B0[j])/B0[j])^2)
  }
  P <- sqrt(apply(P,1,mean,na.rm=TRUE))
  amse <- sum(P)/nrow(Bpar)
  return(amse)
}
