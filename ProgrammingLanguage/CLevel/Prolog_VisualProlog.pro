# 递归
father(zeb, john_boy_sr).
father(john_boy_sr, john_boy_jr).
 
ancestor(X,Y) :- father(X,Y).
ancestor(X,Y) :- father(X,Z), ancestor(Z,Y).
 
# 数独
valid([]).
valid([Head|Tail]) :- fd_all_different(Head), valid(Tail).
sudoku(Puzzle, Solution) :-
  Solution = Puzzle,
  Puzzle = [S11,S12,S13,S14,
            S21,S22,S23,S24,
            S31,S32,S33,S34,
            S41,S42,S43,S44],
  fd_domain(Solution, 1, 4),
  Row1 = [S11,S12,S13,S14],
  Row2 = [S21,S22,S23,S24],
  Row3 = [S31,S32,S33,S34],
  Row4 = [S41,S42,S43,S44],
  Col1 = [S11, S21, S31, S41],
  Col2 = [S12, S22, S32, S42],
  Col3 = [S13, S23, S33, S43],
  Col4 = [S14, S24, S34, S44],
  Square1 = [S11, S12, S21, S22],
  Square2 = [S13, S14, S23, S24],
  Square3 = [S31, S32, S41, S42],
  Square4 = [S33, S34, S43, S44],
  valid([Row1, Row2, Row3, Row4,Col1, Col2, Col3, Col4, Square1, Square2, Square3, Square4]).
# 八皇后
valid_queen((Row, Col)) :- member(Col, [1,2,3,4,5,6,7,8]).
valid_board([]).
valid_board([Head|Tail]) :- valid_queen(Head), valid_board(Tail).
 
cols([], []).
cols([(_, Col)|QueensTail], [Col|ColsTail]) :- cols(QueensTail, ColsTail).
 
diags1([], []).
diags1([(Row, Col)|QueensTail], [Diagonal|DiagonalsTail]) :- Diagonal is Col-Row, diags1(QueensTail, DiagonalsTail).
 
diags2([], []).
diags2([(Row, Col)|QueensTail], [Diagonal|DiagonalsTail]) :- Diagonal is Col+Row, diags2(QueensTail, DiagonalsTail).
 
eight_queens(Board) :-
  Board = [(1,_), (2,_), (3,_), (4,_), (5,_), (6,_), (7,_), (8,_)],
  valid_board(Board),
 
  cols(Board, Cols),
  diags1(Board, Diags1),
  diags2(Board, Diags2),
 
  fd_all_different(Cols),
  fd_all_different(Diags1),
  fd_all_different(Diags2).
