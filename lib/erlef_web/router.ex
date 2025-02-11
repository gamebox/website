defmodule ErlefWeb.Router do
  use ErlefWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", ErlefWeb do
    pipe_through :browser

    get "/", PageController, :index
    get "/about", PageController, :about
    get "/bylaws", PageController, :bylaws
    get "/contact", PageController, :contact
    get "/faq", PageController, :faq
    get "/sponsors", PageController, :sponsors

    get "/news/:id", BlogController, :show, as: :news

    resources "/wg", WorkingGroupController, only: [:index, :show]
  end
end
