user(ali, 'pass123').
user(sara, 'sara456').
user(admin, 'admin123').

login :-
    login_attempts(3).

% No attempts remain: print the required message and stop.
login_attempts(0) :-
    write('Sorry, you exceeded the maximum number of attempts, try again later.'),
    nl.

login_attempts(AttemptsLeft) :-
    AttemptsLeft > 0,
    write('Username (end with a period): '),
    read(Username),
    write('Password (end with a period): '),
    read(Password),
    ( valid_credentials(Username, Password) ->
        write('Login Successful'), nl
    ; write('Login Unsuccessful'), nl,
      Remaining is AttemptsLeft - 1,
      login_attempts(Remaining)
    ).

% Reject unbound variables so they cannot match arbitrary dataset entries.
valid_credentials(Username, Password) :-
    atom(Username),
    atom(Password),
    user(Username, Password).