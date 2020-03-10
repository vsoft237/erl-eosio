%%%-------------------------------------------------------------------
%% @doc frame public API
%% @end
%%%-------------------------------------------------------------------

-module(main_app).

-behaviour(application).

%% Application callbacks
-export([start/2, stop/1]).

%%====================================================================
%% API
%%====================================================================

start(_StartType, _StartArgs) ->
%%    db:start(),
    Dispatch = cowboy_router:compile([
        {'_', [
            {"/[...]", toppage_h, []}
        ]}
    ]),
    {ok, _} = cowboy:start_clear(http, [{port, 18080}], #{
        env => #{dispatch => Dispatch}
    }),
    main_sup:start_link().


%%--------------------------------------------------------------------
stop(_State) ->
    ok.

%%====================================================================
%% Internal functions
%%====================================================================
