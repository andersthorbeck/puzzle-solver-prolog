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

