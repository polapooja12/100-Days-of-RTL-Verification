class monitor;
  transaction tra;   // Transaction handle
  mailbox mon2scr;  // Mailbox connected to scoreboard
  virtual dff_if vif;  // Virtual interface handle

  function new(mailbox mon2scr, virtual dff_if vif);
    this.mon2scr = mon2scr;
    this.vif = vif;
  endfunction

task run();
    forever begin
        tra = new();
        @(posedge vif.clk); // Observe at the positive edge
        #1; // Allow stabilization
        tra.din = vif.din;
        tra.rst = vif.rst;
        tra.dout = vif.dout;
        mon2scr.put(tra); // Send transaction to scoreboard
        tra.print("MONITOR");
    end
endtask


endclass
