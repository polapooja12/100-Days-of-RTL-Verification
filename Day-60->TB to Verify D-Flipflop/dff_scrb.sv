class scoreboard;
  transaction tra;   // Transaction handle
  transaction tr;    // Transaction handle
  mailbox gen2scr;   // Mailbox connected to generator
  mailbox mon2scr;   // Mailbox connected to monitor
  virtual dff_if vif; // Virtual interface for accessing signals

  // Constructor
  function new(mailbox gen2scr, mailbox mon2scr, virtual dff_if vif);
    this.gen2scr = gen2scr;
    this.mon2scr = mon2scr;
    this.vif = vif; // Assign virtual interface
  endfunction

  // Run Task
  task run();
    forever begin
        gen2scr.get(tr);   // Get transaction from generator
        mon2scr.get(tra);  // Get transaction from monitor

        // Wait for the next positive clock edge
        @(posedge vif.clk);
        #1; // Small delay for stabilization

        if (tra.dout == tr.din && !tr.rst) 
            $display("MATCH: Expected dout=%b, got dout=%b at time %0t", tr.din, tra.dout, $time);
        else if (tra.dout == 1'b0 && tr.rst) 
            $display("MATCH (Reset): dout=%b, rst=%b at time %0t", tra.dout, tra.rst, $time);
        else 
            $display("MISMATCH: Expected dout=%b, got dout=%b at time %0t", tr.din, tra.dout, $time);
    end
endtask



endclass
