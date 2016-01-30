defmodule MasonMoney.Router do
  use MasonMoney.Web, :router
  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", MasonMoney do
    pipe_through :api

    post "/transactions", TransactionController, :create
    get "/transactions", TransactionController, :index
    get "/accounts/:account_id", AccountController, :show
  end
end
