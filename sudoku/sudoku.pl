/* Imports */

:- use_module(library(clpfd)).  /* Constraint Logic Programming over Finite Domains */

/* Potential input grids */

minigrid_box_width(2).
minigrid_box_height(2).

minigrid([
  [1,2,3,4],
  [3,4,1,2],
  [2,3,4,1],
  [4,1,2,3]
]).

/* Chosen input grid */

grid_box_width(W) :- minigrid_box_width(W).
grid_box_height(H) :- minigrid_box_height(H).

grid(G) :- minigrid(G).

/* Sudoku rules */

grid_size(Size) :-
    grid_box_width(Width),
    grid_box_height(Height),
    Size is Width*Height.

valid_grid_dimensions(Grid) :-
    grid_size(Size),
    grid(Grid),
    length(Grid, Size),
    forall(
        member(Row, Grid),
        length(Row, Size)
    ).

has_duplicates([Head | Tail]) :- member(Head, Tail), !; has_duplicates(Tail).

/* Can be used both to check cell _values_, and also 1-indexed row/column indices. */
is_in_bounds(N, Size) :-
    N in 1..Size.

valid_row(Row) :-
    grid_size(Size),
    /* row length checked in valid_grid_dimensions */
    forall(
        member(Cell, Row),
        (
            integer(Cell),
            1 =< Cell,
            Cell =< Size
        )
    ),
    \+ has_duplicates(Row).

valid_rows(Grid) :-
    valid_grid_dimensions(Grid),
    forall(
        member(Row, Grid),
        valid_row(Row)
    ).

row(Row, Grid) :-
    member(Row, Grid).

column(ColIndex, Grid, Column) :-
    grid_size(Size),
    is_in_bounds(ColIndex, Size),
    findall(
        Cell,
        (
            row(Row, Grid),
            nth1(ColIndex, Row, Cell)
        ),
        Column
    ).

