/* Create student data based structure in sv, where Roll number ,name marks will be stored for two students.
change the name of the student.
copy one student data to another student and prnt.
do the same using union */
module struct_union1;
  typedef struct{
    int roll_number;
    string name;
    shortreal marks;
  }student;
  student s1,s2;
  initial begin
    s1='{10,"pooja",85.50};
    s2=''{11,"harshitha",90.50};
    $display("s1=%p",s1);
    $display("s2=%p",s2);
    s2.Name="guru latha";
    s2.roll_number=26;
    $display("s2=%p",s2);
    s1=s2;
    $display("s1=%p",s1);
    $display("s2=%p",s2);
  end 
endmodule
***************UNION***************
module struct_union2;
  typedef union{
    int roll_number;
    //string name;
    shortreal marks;
  }student;
  student s1,s2;
  initial begin
    s1.roll_number=10;
    s1.marks=85.50;
    $display("s1=%p",s1);
    $display("s2=%p",s2);
    s2.roll_number=26;
    $display("s2=%p",s2);
    s1=s2;
    $display("s1=%p",s1);
    $display("s2=%p",s2);
  end
endmodule
   
