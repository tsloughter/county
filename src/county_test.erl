-module(county_test).

-export([paint/2]).

-compile({parse_transform, county_transform}).
-compile({parse_transform, sheriff}).

-record(county_test_model, {id   :: integer()
                           ,name :: string()}).


-type colors() :: blue | red | green | yellow.
paint(Color, Object) ->
    case sheriff:check(Color, colors) of
        true ->
            io:format("Pain safe~n");
        false ->
            {error, badarg}
    end.
