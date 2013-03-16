% --- Source file: psydata.Rd --- 
\name{psydata} 
\alias{psydata} 
\title{Data set} 

\description{ 
The \code{psydata} data frame has 744 rows and 22 columns.
} 

\usage{data(psydata)} 

\format{
This data frame contains the following columns:
    \itemize{
    \item \code{nsogg}: int, subject number.
    \item \code{vers}: Factor, questionnaire version: 
    \code{V1} fake-motivating version, \code{V3} true-motivating version
    e \code{V4} neutral version.
    \item \code{sex}: Factor, gender.
    \item \code{eta}: int, age.
    \item \code{resid}: Factor, residence.
    \item \code{dipl}: Factor, education.
    \item \code{voto}: int, high school final score.
    \item \code{votomax}: int, maximum value for \code{voto}.
    \item \code{cdl}: Factor, a character string indicating type of undergraduate program.
    \item \code{aep..}: int, 12 items of AEP/A scale.
    \item \code{tot}: int, total score. 
}
}
%\source{Keppel, G. (1991). \emph{Design and analysis}. Prentice Hall, %London.}
\author{Andrea Bobbio, Massimo Nucci, Massimiliano Pastore}
\keyword{data}
