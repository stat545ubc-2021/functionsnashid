test_that("test ascending function", {
  # get 4 results
  expected = tribble(~race,         ~count,
                     "Hobbits",     1,
                     "Elves",       2,
                     "Dwarven",     3,
                     "Dragons",     4)

  result <- count_by_category(lotr_test_data, race, 4, FALSE)
  expect_length(result$race, 4)
  expect_length(result$count, 4)
  expect_equal(result, expected)

  # get all results
  expected = tribble(~race,         ~count,
                     "Hobbits",     1,
                     "Elves",       2,
                     "Dwarven",     3,
                     "Dragons",     4,
                     "Men",         5)

  result <- count_by_category(lotr_test_data, race, 5, FALSE)
  expect_length(result$race, 5)
  expect_length(result$count, 5)
  expect_equal(result, expected)
})
