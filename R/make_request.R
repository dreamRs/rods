
#' @importFrom httr2 request req_user_agent req_proxy req_url_query req_perform resp_body_string
#' @importFrom data.table fread
#' @importFrom rlang is_list %||%
make_request <- function(url,
                         ...,
                         proxy = TRUE,
                         verbosity = NULL,
                         wrapper = data.table::as.data.table) {
  req <- request(base_url = url)
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
