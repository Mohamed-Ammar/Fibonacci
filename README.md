# Fibonacci
An implementation to the well known Fibonacci series
The series implemented using two register each connected to 2x1 multiplexer 
It is a finite state machine with two states
Where in the first state we intiate the current number by 0 and the next by one 
In the second state with the following clock cycle after initating the next number become the current and the result become the next number
We always assign fib (result) to cuurent num + next num

It is implemented as FSM to avoid multiple driver connection that may occur 
