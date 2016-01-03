defmodule HelloPhoenix.Router do
  use HelloPhoenix.Web, :router
  scope "/", HelloPhoenix do
    post "/transactions", TransactionController, :create
    get "/accounts/:account_id", AccountController, :show
  end
end
