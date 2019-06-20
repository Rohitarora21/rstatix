% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/get_pvalue_position.R
\name{get_y_position}
\alias{get_y_position}
\alias{add_y_position}
\alias{add_x_position}
\alias{add_xy_position}
\title{Autocompute P-value Positions For Plotting Significance}
\usage{
get_y_position(data, formula, fun = "max", ref.group = NULL,
  comparisons = NULL, step.increase = 0.12)

add_y_position(test, fun = "max", step.increase = 0.12, data = NULL,
  formula = NULL, ref.group = NULL, comparisons = NULL)

add_x_position(test, x = NULL, dodge = 0.8)

add_xy_position(test, x = NULL, dodge = 0.8, fun = "max",
  step.increase = 0.12, ...)
}
\arguments{
\item{data}{a data.frame containing the variables in the formula.}

\item{formula}{a formula of the form \code{x ~ group} where \code{x} is a
numeric variable giving the data values and \code{group} is a factor with
one or multiple levels giving the corresponding groups. For example,
\code{formula = TP53 ~ cancer_group}.}

\item{fun}{summary statistics function. Possible values include: \code{"max",
 "mean", "mean_sd", "mean_se", "mean_ci", "median", "median_iqr",
 "median_mad"}.

 \code{"max"} is suitable when you want to add, for example, p-value on box
 plots. The remaining functions are suitable for bar plots and line plots
 showing mean plots +/- error bars.}

\item{ref.group}{a character string specifying the reference group. If
specified, for a given grouping variable, each of the group levels will be
compared to the reference group (i.e. control group).}

\item{comparisons}{A list of length-2 vectors specifying the groups of
interest to be compared. For example to compare groups "A" vs "B" and "B" vs
"C", the argument is as follow: \code{comparisons = list(c("A", "B"), c("B",
"C"))}}

\item{step.increase}{numeric vector with the increase in fraction of total
height for every additional comparison to minimize overlap.}

\item{test}{an object of class \code{rstatix_test} as returned by
\code{\link{t_test}()}, \code{\link{wilcox_test}()}, \code{\link{sign_test}()},
\code{\link{tukey_hsd}()}, \code{\link{dunn_test}()}.}

\item{x}{variable on x axis.}

\item{dodge}{dodge width for grouped ggplot/test. Default is 0.8. Used only
when \code{x} specified.}

\item{...}{other arguments to be passed to the function
\code{\link[stats]{t.test}}.}
}
\description{
Compute p-value x and y positions for plotting significance
 levels.
}
\section{Functions}{
\itemize{
\item \code{get_y_position}: compute the p-value y positions

\item \code{add_y_position}: add p-value y positions to an object of class \code{rstatix_test}

\item \code{add_x_position}: compute and add p-value x positions.

\item \code{add_xy_position}: compute and add both x and y positions.
}}

\examples{
# Data preparation
#::::::::::::::::::::::::::::::::::::
df <- ToothGrowth
df$dose <- as.factor(df$dose)
df$group <- factor(rep(c(1, 2), 30))
head(df)

# Stat tests
#::::::::::::::::::::::::::::::::::::
stat.test <- df \%>\%
  t_test(len ~ dose)
stat.test

# Add the test into box plots
#::::::::::::::::::::::::::::::::::::
stat.test <- stat.test \%>\%
  add_y_position()
\donttest{
 if(require("ggpubr")){
   ggboxplot(df, x = "dose", y = "len") +
     stat_pvalue_manual(stat.test, label = "p.adj.signif", tip.length = 0.01)
  }
}
}