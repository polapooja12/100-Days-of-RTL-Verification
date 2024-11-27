class scoreboard;
  transaction tra;
  transaction tr;
  mailbox gen2scr, mon2scr;

  function new(mailbox gen2scr, mailbox mon2scr);
    this.gen2scr = gen2scr;
    this.mon2scr = mon2scr;
  endfunction

  task run();
    forever begin
      gen2scr.get(tr);
      mon2scr.get(tra);
      
      {tra.y1, tra.y2, tra.y3, tra.y4, tra.y5, tra.y6} = {tr.a & tr.b, ~(tr.a & tr.b), tr.a | tr.b, ~(tr.a | tr.b), tr.a ^ tr.b, ~(tr.a ^ tr.b)};
      
      tr.print("SCOREBOARD");
      if ({tra.y1, tra.y2, tra.y3, tra.y4, tra.y5, tra.y6} == {tr.y1, tr.y2, tr.y3, tr.y4, tr.y5, tr.y6}) 
        $display("Successfully Matched");
      else 
        $display("Not Successfully Matched");
    end
  endtask
endclass
