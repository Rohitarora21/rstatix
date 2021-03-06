% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/box_m.R
\name{box_m}
\alias{box_m}
\title{Box's M-test for Homogeneity of Covariance Matrices}
\usage{
box_m(data, group)
}
\arguments{
\item{data}{a numeric data.frame or matrix containing n observations of p
variables; it is expected that n > p.}

\item{group}{a vector of length n containing the class of each
observation; it is usually a factor.}
}
\value{
A data frame containing the following components:
\itemize{
\item{statistic }{an approximated value of the chi-square distribution.}
\item{parameter }{the degrees of freedom related of the test statistic in this case that it follows a Chi-square distribution.}
\item{p.value }{the p-value of the test.}
\item{method }{the character string "Box's M-test for Homogeneity of Covariance Matrices".}
}
}
\description{
Performs the Box's M-test for homogeneity of covariance matrices
  obtained from multivariate normal data according to one grouping variable.
  The test is based on the chi-square approximation.
}
\examples{
data(iris)
box_m(iris[, -5], iris[, 5])
}
