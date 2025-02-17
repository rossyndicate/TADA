% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/ResultFlagsIndependent.R
\name{TADA_FlagCoordinates}
\alias{TADA_FlagCoordinates}
\title{Suspect coordinates}
\usage{
TADA_FlagCoordinates(
  .data,
  clean_outsideUSA = c("no", "remove", "change sign"),
  clean_imprecise = FALSE,
  flaggedonly = FALSE
)
}
\arguments{
\item{.data}{TADA dataframe}

\item{clean_outsideUSA}{Character argument with options "no", "remove", and "change sign";
flags coordinates as outside the USA when clean_outsideUSA = "no";
removes data with coordinates outside of the United States when clean_outsideUSA = "remove";
changes sign of lat/long coordinates flagged as outside the USA when
clean_outside = "change sign"; Default is clean_outsideUSA = "no".}

\item{clean_imprecise}{Boolean argument; removes imprecise data when
clean_imprecise = TRUE. Default is clean_imprecise = FALSE.}

\item{flaggedonly}{Boolean argument; Return only flagged data when flaggedonly = TRUE;
default is flaggedonly = FALSE.}
}
\value{
Returns input TADA dataset with the added "TADA.SuspectCoordinates.Flag" column.
When clean_outsideUSA is "no", "change sign", or clean_imprecise argument is FALSE,
a column flagging rows with the respective QA check is appended to the input
dataframe. When clean_outsideUSA is "remove" or clean_imprecise is TRUE,
"Suspect" or "imprecise" data is removed, respectively. When flaggedonly is TRUE,
the dataframe will be filtered to show only the data flagged as Suspect, imprecise,
or out of the United States. Defaults are clean_outsideUSA = "no",
clean_imprecise = FALSE, and flaggedonly = FALSE.
}
\description{
This function identifies and flags Suspect coordinate data. When
clean_outsideUSA = "no" and clean_imprecise = FALSE,
a column will be appended titled "TADA.SuspectCoordinates.Flag" with the following
flags: 1) If the latitude is less than zero, the row will be
flagged with "LAT_OutsideUSA" (with the exception of American Samoa,
Northern Mariana Islands, and Guam), 2) If the longitude is greater than zero AND less than 145,
the row will be flagged as "LONG_OutsideUSA" (with the exception of
American Samoa, Northern Mariana Islands, and Guam), and 3) Finally,
precision can be measured by the number of decimal places in the latitude and longitude
provided. If either the latitude or longitude does not have at least three numbers to the
right of the decimal point, the row will be flagged as "Imprecise_lessthan3decimaldigits". Occasionally
latitude and longitude measurements are flagged as outside of the United States
because the data was entered as negative when it should be positive or vice versa.
This function offers the option of clean_outsideUSA = "change sign" to fix this
issue. However, data owners should fix the raw data through WQX. For assistance
with changing raw data, email the WQX help desk: \email{WQX@epa.gov}
}
\examples{
# Load example dataset:
data(Data_Nutrients_UT)

# Flag, but do not remove, data with Suspect coordinates in new column
# titled "TADA.SuspectCoordinates.Flag":
# Return ALL data:
SuspectCoord_flags <- TADA_FlagCoordinates(Data_Nutrients_UT)

# Flag, but do not remove, data with Suspect coordinates in new column
# titled "TADA.SuspectCoordinates.Flag"
# Return ONLY the flagged data:
SuspectCoord_flags_flaggedonly <- TADA_FlagCoordinates(Data_Nutrients_UT, flaggedonly = TRUE)

# Remove data with coordinates outside the USA, but keep flagged data with
# imprecise coordinates:
OutsideUSACoord_removed <- TADA_FlagCoordinates(Data_Nutrients_UT, clean_outsideUSA = "remove")

# Change the sign of coordinates flagged as outside the USA and keep all
# flagged data:
OutsideUSACoord_changed <- TADA_FlagCoordinates(Data_Nutrients_UT, clean_outsideUSA = "change sign")

# Remove data with imprecise coordinates, but keep flagged data with coordinates outside the USA;
# imprecise data may have less than 3 significant figures to the right
# of the decimal point:
ImpreciseCoord_removed <- TADA_FlagCoordinates(Data_Nutrients_UT, clean_imprecise = TRUE)

# Remove data with imprecise coordinates or coordinates outside the USA from the dataframe:
SuspectCoord_removed <- TADA_FlagCoordinates(Data_Nutrients_UT, clean_outsideUSA = "remove", clean_imprecise = TRUE)

}
