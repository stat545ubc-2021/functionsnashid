lotr_test_data = tribble(
  ~name,             ~race,      ~gender,
  "Boromir",         "Men",     "Male",
  "Faramir",         "Men",     "Male",
  "Manthor",         "Men",     "Male",
  "Aragorn",         "Men",     "Male",
  "Glóredhel",       "Men",     "Female",

  "Smaug",          "Dragons",  "Male",
  "Scatha",         "Dragons",  "Male",
  "Glaurung",       "Dragons",  "Male",
  "Ancalagon",      "Dragons",  "Male",

  "Borin",          "Dwarven",  "Male",
  "Gimli",          "Dwarven",  "Male",
  "Balin",          "Dwarven",  "Male",

  "Míriel",         "Elves",    "Female",
  "Galadriel",      "Elves",    "Female",

  "Bilbo Baggins",  "Hobbits",  "Male")

test_that("test return types", {
  result <- count_by_category(lotr_test_data, race, 5)
  expect_true(is.data.frame(result))
  expect_true(is.numeric(result$count))
})

test_that("test argument", {
  expect_error(count_by_category("lotr_test_data", race, 1), "data should be of type dataframe. Here, your input data is of class: character")

  expected = tribble(~race,         ~count,
                     "Men",         5,
                     "Dragons",     4,
                     "Dwarven",     3,
                     "Elves",       2,
                     "Hobbits",     1)
  expect_success(expect_equal(count_by_category(lotr_test_data, race, 5), expected))
})


test_that("test descending function", {
  result <- count_by_category(lotr_test_data, race, 1, TRUE)
  expect_equal(result$race, "Men")
  expect_equal(result$count, 5)
})

test_that("test descending function", {
  expected = tribble(
    ~race,         ~count,
    "Men",         5,
    "Dragons",     4,
    "Dwarven",     3,
    "Elves",       2,
    "Hobbits",     1)

  result <- count_by_category(lotr_test_data, race, 5, TRUE)
  expect_equal(result, expected)
})


test_that("test ascending function", {
  result <- count_by_category(lotr_test_data, race, 1, FALSE)
  expect_equal(result$race, "Hobbits")
  expect_equal(result$count, 1)
})

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

