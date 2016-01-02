defmodule HelloPhoenix.Router do
  use HelloPhoenix.Web, :router
  scope "/", HelloPhoenix do
    post "/transactions", TransactionController, :create
  end
end
