defmodule DynamicPageHandler do
  def init(_type, req, []) do
    {:ok, req, :no_state}
  end

  def handle(request, state) do
    dynamic = "Dynamic"
    { :ok, reply } = :cowboy_req.reply( 200, [{"content-type", "text/html"}], "#{dynamic} Hello World", request)
    {:ok, reply, state}
  end

  def terminate(reason, request, state) do
    :ok
  end
end
