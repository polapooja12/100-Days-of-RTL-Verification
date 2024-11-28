class transaction;
rand bit a,b,cin;
bit sum;
bit carry;
function void print(string name);
  $display("------- %0s -------",name);
  $display("The values of a=%b amd b=%b and cin=%b",a,b,cin);
  $display("The sum=%b and carry=%b",sum,carry);
endfunction
endclass
