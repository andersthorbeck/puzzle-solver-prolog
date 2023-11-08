minigrid_box_width(2).
minigrid_box_height(2).

minigrid([
  [1,2,3,4],
  [3,4,1,2],
  [2,3,4,1],
  [4,1,2,3]
]).

grid_box_width(W) :- minigrid_box_width(W).
grid_box_height(H) :- minigrid_box_height(H).

grid(G) :- minigrid(G).

valid_grid_dimensions(Grid) :-
    grid_box_width(Width),
    grid_box_height(Height),
    Dimension is Width*Height,
    grid(Grid),
    length(Grid, Dimension),
    forall(
        member(Row, Grid),
        length(Row, Dimension)
    ).

