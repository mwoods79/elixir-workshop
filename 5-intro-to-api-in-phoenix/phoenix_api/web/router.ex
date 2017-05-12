defmodule PhoenixApi.Router do
  use PhoenixApi.Web, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", PhoenixApi do
    pipe_through :api

    resources "/beers", BeerController, except: [:new, :edit]

    # restful resources
    #   GET     /beers       index
    #   PATCH   /beers/:id   update
    #   DELTE   /beers/:id   delete
    #   POST    /beers       create
    #   GET     /beers/:id   show
    #
    # apply to html
    # GET /beers/new      new
    # GET /beers/:id/edit edit
  end
end
