class subclass;
  string loc;
  function subclass copy();
    copy=new();
    copyloc=this.loc;
  endfunction
endclass
class packet;
  int date;
  string name;
  subclass sub=new();
  function packet copy();
    copy=new();
    copy.date=this.date;
    copy.name=this.name;
    copy.sub=this.sub.copy;
  endfunction
endclass
module top;
  packet p1,p2;
  initial begin
    p1=new();
    p1.date=12;p1.name=Pooja";
    p1.sub.loc="bang";
    $display("before shallow copy");
    $display("packet 1: date=%0d name=%0s loc=%0s",p1.date,p1.name,p1.sub.loc);
    p2=new p1;
    $display("After Shallow Copy");
    $display("packet 1: date=%0d name=%0s loc=%0s",p1.date,p1.name,p1.sub.loc);
    $display("packet 2: date=%0d name=%0s loc=%0s",p2.date,p2.name,p2.sub.loc);
    p2.date=20;p2.name="Rajesh";p2.sub.loc="hyd";
    $display("After changes");
    $display("packet 1: date=%0d name=%0s loc=%0s",p1.date,p1.name,p1.sub.loc);
    $display("packet 2: date=%0d name=%0s loc=%0s",p2.date,p2.name,p2.sub.loc);
    p2=p1.copy;
    $display("After Deep Copy");
    $display("packet 1: date=%0d name=%0s loc=%0s",p1.date,p1.name,p1.sub.loc);
    $display("packet 2: date=%0d name=%0s loc=%0s",p2.date,p2.name,p2.sub.loc);
    p2.date=9;p2.name="Srujan";p2.sub.loc="hyderabad";
    $display("After changes");
    $display("packet 1: date=%0d name=%0s loc=%0s",p1.date,p1.name,p1.sub.loc);
    $display("packet 2: date=%0d name=%0s loc=%0s",p2.date,p2.name,p2.sub.loc);
  end
endmodule
