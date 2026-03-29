defmodule ElixirGraphqlMysqlWeb.PageController do
  use ElixirGraphqlMysqlWeb, :controller

  def index(conn, _params) do
    content = File.read!("priv/static/index.html")
    html(conn, content)
  end
end
