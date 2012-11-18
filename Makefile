# -*- mode: Makefile; fill-column: 80; comment-column: 75; -*-

ERL = $(shell which erl)

ERLFLAGS= -pa $(CURDIR)/.eunit -pa $(CURDIR)/ebin -pa $(CURDIR)/*/ebin

REBAR=./rebar

COUNTY_PLT=$(CURDIR)/.depsolver_plt

.PHONY: dialyzer typer clean distclean

compile:
	@./rebar get-deps compile

$(COUNTY_PLT):
	dialyzer --output_plt $(COUNTY_PLT) --build_plt \
		--apps erts kernel stdlib crypto public_key -r deps --fullpath

dialyzer: $(COUNTY_PLT)
	dialyzer --plt $(COUNTY_PLT) -pa deps/* --src src

typer: $(COUNTY_PLT)
	typer --plt $(COUNTY_PLT) -r ./src

clean:
	$(REBAR) clean

distclean: clean
	rm $(COUNTY_PLT)
	rm -rvf $(CURDIR)/deps/*
