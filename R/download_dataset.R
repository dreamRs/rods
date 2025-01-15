
#' Donwload dataset from an OpenDataSoft portal
#'
#' @param server The URL of the OpenDataSoft portal.
#' @param dataset Name of the dataset to download.
#' @param proxy Use or not a proxy server. If `TRUE`,
#'  an environment variable `PROXY_URL` must be set (along with `PROXY_PORT`, `PROXY_ID`, and `PROXY_PWD`).
#'  Altrenatively a `list` can be used with names corresponding to arguments of [httr2::req_proxy()].
#' @param ... Arguments passed to [httr2::req_url_query()].
#' @param wrapper Function to wrap output data into, default is to return a `data.table`.
#' @inheritParams httr2::req_perform
#'
#' @return Result of the request.
#' @export
#'
#' @importFrom data.table as.data.table
#'
#' @examples
#' \dontrun{
#'
#' eco2mix <- download_dataset(
#'   server = "https://odre.opendatasoft.com",
#'   dataset = "eco2mix-national-tr",
#'   select = "date_heure,consommation,taux_co2",
#'   where = "minute(date_heure) = 0 and month(date_heure) = 9 and year(date_heure) = 2024",
#'   order_by = "date_heure"
#' )
#'
#' # or equivalent:
#' eco2mix <- download_dataset(
#'   server = "https://odre.opendatasoft.com",
#'   dataset = "eco2mix-national-tr",
#'   select = "date_heure,consommation,taux_co2",
#'   where = "minute(date_heure) = 0 and date_heure >= '2024-09-01' and date_heure < '2024-10-01'",
#'   order_by = "date_heure"
#' )
#'
#' }
download_dataset <- function(server,
                             dataset,
                             ...,
                             proxy = TRUE,
                             verbosity = NULL,
                             wrapper = data.table::as.data.table) {
  make_request(
    url = paste0(server, sprintf("/api/explore/v2.1/catalog/datasets/%s/exports/csv", dataset)),
    ...,
    proxy = proxy,
    verbosity = verbosity,
    wrapper = wrapper
  )
}

