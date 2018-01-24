defmodule WallabyWhiteBreadExampleWeb.PageController do
  use WallabyWhiteBreadExampleWeb, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
