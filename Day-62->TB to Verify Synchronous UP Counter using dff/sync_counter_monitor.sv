// sync_counter_monitor.sv
class sync_counter_monitor;
    sync_counter_transaction tra; 
    mailbox mon2scr; // Mailbox connected to scoreboard
    virtual sync_counter_inf vif; // Declare handle for interface

    function new(mailbox mon2scr, virtual sync_counter_inf vif);
        this.mon2scr = mon2scr;
        this.vif = vif;
    endfunction

    task run();
        forever begin
            tra = new(); // Monitoring the signals from the DUT through the interface
            tra.q = vif.q; 
            tra.qbar = vif.qbar; 
            mon2scr.put(tra); 
            tra.print("MONITOR");
            #1; // Wait for a time unit
        end
    endtask
endclass
