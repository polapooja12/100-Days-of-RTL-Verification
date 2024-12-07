class driver;
  mailbox gen2drv;  // Mailbox connected to generator
  transaction tr;   // Transaction handle
  virtual dff_if vif;  // Virtual interface handle

  function new(mailbox gen2drv, virtual dff_if vif);
    this.gen2drv = gen2drv;
    this.vif = vif;
  endfunction

task run();
    forever begin
        tr = new();
        gen2drv.get(tr); // Get transaction from generator

        @(negedge vif.clk); // Drive inputs on the negative edge for stability
        vif.rst <= tr.rst;
        vif.din <= tr.din;

        // Wait for the next positive edge for sampling
        @(posedge vif.clk);
        #1; // Small propagation delay
        tr.dout = vif.dout; // Capture the output
        tr.print("DRIVER");
    end
endtask




endclass
