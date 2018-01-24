defmodule WhiteBreadContext do
  use WhiteBread.Context
  use Wallaby.DSL

  scenario_starting_state fn _state ->
    Application.put_env(:wallaby, :base_url, WallabyWhiteBreadExampleWeb.Endpoint.url)
    # :ok = Ecto.Adapters.SQL.Sandbox.checkout(WallabyWhiteBreadExample.Repo)

    Ecto.Adapters.SQL.Sandbox.mode(WallabyWhiteBreadExample.Repo, {:shared, self()})

    metadata = Phoenix.Ecto.SQL.Sandbox.metadata_for(WallabyWhiteBreadExample.Repo, self())
    {:ok, session} = Wallaby.start_session(metadata: metadata)
    %{session: session}
  end

  given_ ~r/^I am on the home page$/, fn %{session: session}=state ->
    session
    |> visit("/")

    {:ok, state}
  end

  then_ ~r/^I should see the greeting$/, fn %{session: session}=state ->
    session
    |> take_screenshot()
    |> assert_has(Wallaby.Query.text("Welcome to Phoenix!"))
    {:ok, state}
  end
end
