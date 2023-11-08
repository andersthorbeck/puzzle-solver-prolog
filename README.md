# puzzle-solver-prolog
A puzzle solver written in Prolog.

## Installing SWI-Prolog

On Ubuntu Linux, [install SWI-Prolog](https://www.swi-prolog.org/build/PPA.html)
using a Personal Package Archive (PPA).
See the [quickstart documentation](https://www.swi-prolog.org/pldoc/man?section=quickstart)
for how to load prolog files with SWI-Prolog.

## Sudoku solver

### How to run

Start SWI-Prolog as follows:

    $ cd sudoku
    $ swipl sudoku.pl

Execute queries in the SWI-Prolog REPL as follows:

    ?- grid_box_width(W).
