class monitor;
  transaction tra;
  mailbox mon2scr;
  virtual logicgates_inf vif;

  function new(mailbox mon2scr, virtual logicgates_inf vif);
    this.mon2scr = mon2scr;
    this.vif = vif;
  endfunction

  task run();
    forever begin
      tra = new();
      tra.a = vif.a;
      tra.b = vif.b;
      tra.y1 = vif.y1;
      tra.y2 = vif.y2;
      tra.y3 = vif.y3;
      tra.y4 = vif.y4;
      tra.y5 = vif.y5;
      tra.y6 = vif.y6;
      mon2scr.put(tra);
      tra.print("MONITOR");
      #1;
    end
  endtask
endclass
