defmodule TrDaisy3Web.PageController do
  use TrDaisy3Web, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
