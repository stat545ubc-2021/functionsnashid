#' is.boolean function is motivated from https://github.com/Rapporter/
#'
#' Checks if provided object is a boolean i.e. a length-one logical vector.
#' @param x an object to check
#' @return a logical value indicating whether provided object is a boolean
#'
is.boolean <- function(x){
  is.logical(x) && length(x) == 1
}
#'
#' @title **count_by_category**
#'
#' @description Given a data frame, for a specific column, count of the number of observations per category. This function removes NA values
#' and then count per category. By default the function return result in descending order.
#'
#' @param data: input data frame that you want to select from. Here naming of this parameter is self-explanatory.
#' @param column_name: the column we want to categorize against. This parameter could be named as column as well.
#' @param limit: the number of records that we want to return. The parameter name limit is self-documenting and clearly conveys API specification.
#' @param is_descending: Optional boolean parameter which is set to TRUE by default.
#
#' @return a table, counting the number of observations per category.
#'
#' @examples
#'
#' count_by_category(datateachr::apt_buildings, property_type, 5, )
#' count_by_category(datateachr::apt_buildings, heating_type, 5, TRUE)
#' count_by_category(datateachr:: building_permits, property_use, 5, TRUE)
#' count_by_category(datateachr:: building_permits, property_use, 5, TRUE)
#' count_by_category(datateachr:: steam_games, developer, 6)
#' count_by_category(datateachr:: steam_games, developer, 5, FALSE)
#'
#' @import dplyr tidyr datateachr
#' @export
count_by_category <- function(data, column_name, limit, is_descending = TRUE) {
  # demonstrate incorrect argument handing
  if(!is.data.frame(data)) {
    stop('data should be of type dataframe. Here, your input data is of class: ', class(data))
  }
  if(!is.numeric(limit)) {
    stop("parameter limit should be numeric.")
  }

  if(!is.boolean(is_descending)) {
    stop("is_descending should be boolean.")
  }
  r <- data %>%
    drop_na({{ column_name }}) %>%
    group_by({{ column_name }}) %>%
    summarize(count = n())

  if(is_descending)
    r <- r %>% arrange(desc(count))
  else
    r <- r %>% arrange(count)

  head(r, limit)
}
