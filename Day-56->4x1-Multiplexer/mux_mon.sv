class monitor; // Class for monitoring signals from the DUT
    transaction tra; // Transaction handle
    mailbox mon2scr; // Mailbox connected to scoreboard
    virtual full_inf vif; // Virtual interface handle

    // Constructor
  function new(mailbox mon2scr, virtual full_inf vif);
        this.mon2scr = mon2scr;
        this.vif = vif;
    endfunction

    // Run task to monitor signals from the DUT
    task run();
        forever begin
            tra = new();
            // Monitor inputs and output from the DUT
            tra.a = vif.a;
            tra.b = vif.b;
            tra.c = vif.c;
            tra.d = vif.d;
            tra.s1 = vif.s1;
            tra.s2 = vif.s2;
            tra.y = vif.y; // Capture the output from the DUT
            mon2scr.put(tra); // Send transaction to scoreboard
            tra.print("MONITOR");
            #1; // Wait for a time unit
        end
    endtask
endclass
