class monitor;
  transaction tra;   // Transaction handle
  mailbox mon2scr;  // Mailbox connected to scoreboard
  virtual BCDto7Segment_inf vif;  // Virtual interface handle

  function new(mailbox mon2scr, virtual BCDto7Segment_inf vif);
    this.mon2scr = mon2scr;
    this.vif = vif;
  endfunction

  task run();
    forever begin
      tra = new();
      tra.bcd = vif.bcd;  // Monitor BCD input
        tra.seg = vif.seg;  // Monitor 7-segment output
  mon2scr.put(tra);  // Send transaction to scoreboard
  tra.print("MONITOR");
  #1;  // Wait for a time delay
end
  endtask
endclass
