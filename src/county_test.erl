-module(county_test).

-export([]).

-compile({parse_transform, county_transform}).
-compile({parse_transform, sheriff}).

-record(county_test_model, {id   :: integer()
                           ,name :: string()}).


