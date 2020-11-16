defmodule CmstutWeb.PageController do
  use CmstutWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
