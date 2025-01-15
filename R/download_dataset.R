
#' Donwload dataset from an OpenDataSoft portal
#'
#' @param server The URL of the OpenDataSoft portal.
#' @param api Path for the API to use.
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
#' @importFrom httr2 request req_user_agent req_proxy req_url_query req_perform resp_body_string
#' @importFrom data.table fread
#' @importFrom rlang is_list %||%
#'
#' @examples
#' \dontrun{
#'
#' eco2mix <- download_dataset(
#'   server = "https://odre.opendatasoft.com",
#'   dataset = "eco2mix-national-tr",
#'   select = "date_heure,consommation,taux_co2",
#'   where = "minute(date_heure) = 0 and month(date_heure) = 9 and year(date_heure) = 2024"
#' )
#'
#' }
download_dataset <- function(server,
                             dataset,
                             ...,
                             proxy = TRUE,
                             verbosity = NULL,
                             wrapper = data.table::as.data.table) {
  req <- request(paste0(server, sprintf("/api/explore/v2.1/catalog/datasets/%s/exports/csv", dataset)))
  req <- req_user_agent(
    req = req,
    string = "Request made by R package rods (https://github.com/dreamRs/rods)"
  )
  if (isTRUE(proxy) && !identical(Sys.getenv("PROXY_URL"), "")) {
    req <- req_proxy(
      req = req,
      url = Sys.getenv("PROXY_URL"),
      port = as.integer(Sys.getenv("PROXY_PORT")),
      username = Sys.getenv("PROXY_ID"),
      password = Sys.getenv("PROXY_PWD"),
      auth = Sys.getenv("PROXY_AUTH", unset = "basic")
    )
  } else if (is_list(proxy)) {
    req <- req_proxy(
      req = req,
      url = proxy$url,
      port = proxy$port,
      username = proxy$username,
      password = proxy$password,
      auth = proxy$auth %||% "basic"
    )
  }
  req <- req_url_query(.req = req, ...)
  res <- req_perform(req, verbosity = verbosity)
  data <- fread(text = resp_body_string(res))
  wrapper(data)
}

