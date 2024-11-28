class scoreboard;
transaction tra;
transaction tr;
mailbox gen2scr,mon2scr;

function new(mailbox gen2scr,mailbox mon2scr);
this.gen2scr = gen2scr;
this.mon2scr = mon2scr;
endfunction

task run();
forever begin
gen2scr.get(tr);
mon2scr.get(tra);
  tr.sum=tr.a^tr.b^tr.cin;
  tr.carry=(tr.a & tr.b)|(tr.b&tr.cin)|(tr.cin&tr.a);
//{tr.carry,tr.sum}=tr.a+tr.b+tr.cin;

//tr.print(“SCOREBOARD”);
if({tra.carry,tra.sum}=={tr.carry,tr.sum})
$display("Successfully Matched");
else
$display("Not Sucessfulluy Mathed");
end
endtask

endclass
