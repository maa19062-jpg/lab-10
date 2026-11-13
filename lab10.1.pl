square(Side, Area, Perimeter) :-
    number(Side), Side > 0,
    Area is Side * Side,
    Perimeter is 4 * Side.

rectangle(Length, Width, Area, Perimeter) :-
    number(Length), number(Width),
    Length > 0, Width > 0,
    Area is Length * Width,
    Perimeter is 2 * (Length + Width).

triangle(A, B, C, Area, Perimeter) :-
    number(A), number(B), number(C),
    A > 0, B > 0, C > 0,
    A + B > C,
    A + C > B,
    B + C > A,
    Perimeter is A + B + C,
    S is Perimeter / 2,
    Area is sqrt(S * (S - A) * (S - B) * (S - C)).

% ?- square(5, Area, Perimeter).
% Area = 25, Perimeter = 20.
%
% ?- rectangle(6, 4, Area, Perimeter).
% Area = 24, Perimeter = 20.
%
% ?- triangle(3, 4, 5, Area, Perimeter).
% Area = 6.0, Perimeter = 12.
%
% ?- triangle(1, 2, 3, Area, Perimeter).
% false.  (These sides cannot form a non-degenerate triangle.)
%
% ?- square(-2, Area, Perimeter).
% false.
