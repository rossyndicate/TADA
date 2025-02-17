% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/Utilities.R
\name{getPopup}
\alias{getPopup}
\title{Get text for tribal marker popup
getPopup is used within TADA_addPolys and TADA_addPoints}
\usage{
getPopup(layer, layername)
}
\arguments{
\item{layer}{A map feature layer}

\item{layername}{Name of the layer}
}
\value{
Vector of strings to be used as the text for the popups when clicking on a tribal marker
}
\description{
Get text for tribal marker popup
getPopup is used within TADA_addPolys and TADA_addPoints
}
\examples{
\dontrun{
# Get the Oklahoma Tribal Statistical Areas feature layer
layer <- getLayer("extdata/OKTribe.shp")
# Get popup text for individual markers
getPopup(layer, "Oklahoma Tribal Statistical Areas")
}

}
