class monitor;
  transaction tra;   // Transaction handle
  mailbox mon2scr;  // Mailbox connected to scoreboard
  virtual priority_encoder_if vif;  // Virtual interface handle

  function new(mailbox mon2scr, virtual priority_encoder_if vif);
    this.mon2scr = mon2scr;
    this.vif = vif;
  endfunction

  task run();
    forever begin
      tra = new();
      tra.a = vif.a;    // Monitor input a
      tra.b = vif.b;    // Monitor input b
      tra.c = vif.c;    // Monitor input c
      tra.d = vif.d;    // Monitor input d
      tra.y1 = vif.y1;  // Monitor output y1
      tra.y2 = vif.y2;  // Monitor output y2
      mon2scr.put(tra); // Send transaction to scoreboard
      tra.print("MONITOR");
      #1;  // Wait for a time delay
    end
  endtask
endclass
