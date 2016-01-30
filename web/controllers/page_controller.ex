defmodule MasonMoney.PageController do
  use MasonMoney.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
