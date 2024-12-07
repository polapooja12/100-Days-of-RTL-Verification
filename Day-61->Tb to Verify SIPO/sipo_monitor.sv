// sipo_monitor.sv
class sipo_monitor;
    sipo_transaction tra; 
    mailbox mon2scr; // Mailbox connected to scoreboard
    virtual sipo_inf vif; // Declare handle for interface

    function new(mailbox mon2scr, virtual sipo_inf vif);
        this.mon2scr = mon2scr;
        this.vif = vif;
    endfunction

    task run();
        forever begin
            tra = new(); // Monitoring the signals from the DUT through the interface
            tra.d = vif.d; 
            tra.q = vif.q; 
            mon2scr.put(tra); 
            tra.print("MONITOR");
            #1; // Wait for a time unit
        end
    endtask
endclass
