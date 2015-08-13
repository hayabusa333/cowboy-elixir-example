defmodule DynamicHelloWorld do
  def start(_type, _args) do
    dispatch = :cowboy_router.compile([
      { :_, 
        [
          {"/", DynamicPageHandler, []}
      ]}
    ])
    { :ok, _ } = :cowboy.start_http(:http, 100, [{:port, 8080}], [{ :env, [{:dispatch, dispatch}]}] )

  end
end
