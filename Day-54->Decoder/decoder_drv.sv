class driver; // Class for driving signals to DUT
    mailbox gen2drv; // Mailbox from generator
    transaction tr; // Transaction handle
    virtual decoder_inf vif; // Virtual interface

    // Constructor
    function new(mailbox gen2drv, virtual decoder_inf vif);
        this.gen2drv = gen2drv;
        this.vif = vif;
    endfunction

    // Run task to drive signals
    task run();
        forever begin
            tr = new();
            gen2drv.get(tr); // Get transaction from generator
            vif.a <= tr.a; // Drive inputs
            vif.b <= tr.b;
            tr.print("DRIVER");
            #1; // Wait for a time unit
        end
    endtask
endclass
