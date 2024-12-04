class monitor; // Class for monitoring DUT outputs
    transaction tra; // Transaction handle
    mailbox mon2scr; // Mailbox to scoreboard
    virtual decoder_inf vif; // Virtual interface

    // Constructor
    function new(mailbox mon2scr, virtual decoder_inf vif);
        this.mon2scr = mon2scr;
        this.vif = vif;
    endfunction

    // Run task to monitor outputs
    task run();
        forever begin
            tra = new();
            tra.a = vif.a; // Monitor inputs
            tra.b = vif.b;
            tra.y0 = vif.y0; // Monitor outputs
            tra.y1 = vif.y1;
            tra.y2 = vif.y2;
            tra.y3 = vif.y3;

            mon2scr.put(tra); // Send to scoreboard
            tra.print("MONITOR");
            #1; // Wait for a time unit
        end
    endtask
endclass
