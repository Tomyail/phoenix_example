defmodule AuctionWeb.Router do
  use AuctionWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
    plug AuctionWeb.Authenticator
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", AuctionWeb do
    pipe_through :browser

    get "/", PageController, :index

    # 这句话相当于下面八句话

    resources "/items", ItemController,
      only: [
        :index,
        :show,
        :new,
        :create,
        :edit,
        :update
      ] do
      resources "/bids", BidController, only: [:create]
    end

    resources "/users", UserController,
      only: [
        :show,
        :new,
        :create
      ]

    get "/login", SessionController, :new
    post "/login", SessionController, :create
    delete "/login", SessionController, :delete

    # get "/items", ItemController, :index
    # get "/items/new", ItemController, :new
    # post "/items", ItemController, :create
    # get "/items/:id", ItemController, :show
    # get "/items/:id/edit", ItemController, :edit
    # patch "/items/:id", ItemController, :update
    # put "/items/:id", ItemController, :update
    # delete "/items/:id", ItemController, :delete
  end

  # Other scopes may use custom stacks.
  scope "/api", AuctionWeb.Api do
    pipe_through :api

    resources "/items", ItemController, only: [:index, :show]
  end
end
