% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/DataDiscoveryRetrieval.R
\name{ask_user}
\alias{ask_user}
\title{Ask user to approve WQP downloads}
\usage{
ask_user(n_records)
}
\arguments{
\item{n_records}{A numeric value indicating the number of records that will be downloaded from the WQP if the user decides to proceed.}
}
\description{
Once record counts have been retrieved from the Water Quality Portal (WQP) for
a query, this function is used to prompt the user to decide (i.e., "yes"/"no")
whether the download should proceed. The user is also reminded of the limits of
Microsoft Excel for row counts as a comparison.
}
