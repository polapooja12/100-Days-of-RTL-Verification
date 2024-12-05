class driver; // Class for driving signals to the DUT
    mailbox gen2drv; // Mailbox connected to generator
    transaction tr; // Transaction handle
    virtual full_inf vif; // Virtual interface handle

    // Constructor
  function new(mailbox gen2drv, virtual full_inf vif);
        this.gen2drv = gen2drv;
        this.vif = vif;
    endfunction

    // Run task to drive signals to the DUT
    task run();
        forever begin
            tr = new();
            gen2drv.get(tr); // Get transaction from generator
            vif.a <= tr.a;
            vif.b <= tr.b;
            vif.c <= tr.c;
            vif.d <= tr.d;
            vif.s1 <= tr.s1;
            vif.s2 <= tr.s2;
            tr.print("DRIVER");
            #1; // Wait for a time unit
        end
    endtask
endclass
