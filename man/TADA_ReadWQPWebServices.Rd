% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/DataDiscoveryRetrieval.R
\name{TADA_ReadWQPWebServices}
\alias{TADA_ReadWQPWebServices}
\title{Read in WQP data using the Water Quality Portal (WQP) web services}
\usage{
TADA_ReadWQPWebServices(webservice)
}
\arguments{
\item{webservice}{WQP Web Service URL, entered within quotes, i.e., "webserviceurl"}
}
\value{
WQP Data Profile
}
\description{
Go to the WQP website (https://www.waterqualitydata.us/) and fill out the
advanced query form. Choose the file format Comma-Separated.
Then, choose a data profile. When finished, do not hit the download button.
Instead, copy the web service URL located at the bottom of the page under
the header "Station" or "Result". This is the url in the second box from the
top. Use that web service URL as the input for this function to download
data directly into R.
}
\details{
We recommend retrieving data for all the following profiles
(you can run this function three separate times to bring in all three profiles):
\enumerate{
\item Sample Results (physical/chemical metadata)
\item Project Data
\item Site Data Only
}

After you retrieve all three profiles, you can use TADA_JoinWQPProfiles to
join the three dataframes into a single dataframe.

Note: It may be useful to save the Query URL from the WQP as well as a
comment within your code. This URL let's you return to the WQP query page
with all your selected data filters. For example, this is the query used
in the examples for this function:
https://www.waterqualitydata.us/#statecode=US\%3A09&sampleMedia=water&sampleMedia=Water&startDateLo=01-01-2021&mimeType=csv&dataProfile=biological&providers=NWIS&providers=STEWARDS&providers=STORET

\strong{Extra tip:} Note that the web service call built using the Water
Quality Portal uses the inputs startDateLo and startDateHi rather than
startDate and endDate, and dates are in the format MM-DD-YYYY rather
than the TADA_DataRetrieval and dataRetrieval format of YYYY-MM-DD. The
functions use the latter format rather than the web service call date
format because YYYY-MM-DD is a more easily utilized format in the R
coding environment. However, users of USGS's dataRetrieval may use the
date format MM-DD-YYYY \emph{only if} they specify with "startDateLo" and
"startDateHi" inputs. For coding consistency, it is recommended users
stick with YYYY-MM-DD.
}
\examples{
\dontrun{
physchemresults1 <- TADA_ReadWQPWebServices("https://www.waterqualitydata.us/data/Result/search?statecode=US\%3A09&sampleMedia=water&sampleMedia=Water&startDateLo=01-01-2021&mimeType=csv&zip=yes&dataProfile=biological&providers=NWIS&providers=STEWARDS&providers=STORET")
sites1 <- TADA_ReadWQPWebServices("https://www.waterqualitydata.us/data/Station/search?statecode=US\%3A09&sampleMedia=water&sampleMedia=Water&startDateLo=01-01-2021&mimeType=csv&zip=yes&providers=NWIS&providers=STEWARDS&providers=STORET")
projects1 <- TADA_ReadWQPWebServices("https://www.waterqualitydata.us/data/Project/search?statecode=US\%3A09&sampleMedia=water&sampleMedia=Water&startDateLo=01-01-2021&mimeType=csv&zip=yes&providers=NWIS&providers=STEWARDS&providers=STORET")
}

}
