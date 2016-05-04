defmodule HumanMoney.PageController do
  use HumanMoney.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
