defmodule HelloPhoenix.Router do
  use HelloPhoenix.Web, :router
  scope "/", HelloPhoenix do
    post "/transactions", TransactionController, :create
    get "/transactions", TransactionController, :index
    get "/accounts/:account_id", AccountController, :show
  end
end
