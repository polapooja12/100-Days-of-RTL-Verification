class clock_divider_monitor;
    clock_divider_transaction tr;
    mailbox mon2scr; // Mailbox connected to scoreboard
    virtual clock_divider_inf vif;

    function new(mailbox mon2scr, virtual clock_divider_inf vif);
        this.mon2scr = mon2scr;
        this.vif = vif;
    endfunction

    task run();
        forever begin
            tr = new(); // Capture signals from the DUT
            tr.f2 = vif.f2;
            tr.f4 = vif.f4;
            tr.f8 = vif.f8;
            tr.f16 = vif.f16;
            tr.f32 = vif.f32;
            tr.f64 = vif.f64;
            mon2scr.put(tr);
            tr.print("MONITOR");
            #1; // Wait for a time unit
        end
    endtask
endclass
