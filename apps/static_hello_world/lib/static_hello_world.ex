defmodule StaticHelloWorld do
  def start(_type, _args) do
    dispatch = :cowboy_router.compile([
     { :_, 
       [
         {"/", :cowboy_static, {:priv_file, :static_hello_world, "index.html"}}
       ]
     }
    ])
    { :ok, _ } = :cowboy.start_http(:http, 100, [{:port, 8080}], [{ :env, [{:dispatch, dispatch}]}])
  end
end
