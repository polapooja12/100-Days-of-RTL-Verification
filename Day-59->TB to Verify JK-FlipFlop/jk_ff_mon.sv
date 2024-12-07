class monitor;
    transaction tra;   // Transaction handle
    mailbox mon2scr;  // Mailbox connected to scoreboard
    virtual jk_ff_if vif;  // Virtual interface handle

    function new(mailbox mon2scr, virtual jk_ff_if vif);
        this.mon2scr = mon2scr;
        this.vif = vif;
    endfunction

    task run();
    // Wait for the initial reset phase to complete
    wait(vif.reset == 1'b0);

    forever begin
        tra = new();
        @(posedge vif.clk);
        tra.j = vif.j;       // Monitor J input
        tra.k = vif.k;       // Monitor K input
        tra.reset = vif.reset; // Monitor reset signal
        tra.q = vif.q;       // Monitor output Q
        tra.qn = vif.qn;     // Monitor output QN
        mon2scr.put(tra);    // Send transaction to scoreboard
        tra.print("MONITOR");
    end
endtask


endclass
