test_that("harmonization works", {
  dat <- TADA_RandomTestingData(choose_random_state = TRUE)
  dat <- subset(dat, !is.na(dat$TADA.ResultMeasureValue))
  dat <- TADA_FlagFraction(dat, clean = TRUE)
  dat <- TADA_FlagResultUnit(dat, clean = "suspect_only")
  dat <- TADA_FlagSpeciation(dat, clean = "suspect_only")
  dat <- TADA_FlagMethod(dat, clean = TRUE)

  ref <- TADA_GetSynonymRef(dat)
  dat1 <- TADA_HarmonizeSynonyms(dat, ref = ref)

  expect_true(dim(dat)[1] == dim(dat1)[1])
})

test_that("np summation key matches nutrient harmonization ref", {
  harm <- TADA_GetSynonymRef()
  harm <- unique(subset(harm, harm$HarmonizationGroup %in% c("Phosphorus", "Nitrogen"))[, c("TADA.CharacteristicName", "TADA.ResultSampleFractionText", "TADA.MethodSpeciationName")])
  np <- TADA_GetNutrientSummationRef()[, c("TADA.CharacteristicName", "TADA.ResultSampleFractionText", "TADA.MethodSpeciationName")]
  np$np <- 1
  check <- merge(harm, np, all.x = TRUE)
  expect_false(any(is.na(check$np)))
})
