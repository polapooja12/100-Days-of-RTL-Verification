class monitor;
    transaction tra;
    mailbox mon2scr; 
    virtual sub_inf vif;

    function new(mailbox mon2scr, virtual sub_inf vif);
        this.mon2scr = mon2scr;
        this.vif = vif;
    endfunction

    task run();
        forever begin
            tra = new();
            tra.a = vif.a;
            tra.b = vif.b;
            tra.bin = vif.bin;
            tra.diff = vif.diff;
            tra.bout = vif.bout;

            mon2scr.put(tra);
            tra.print("MONITOR");
            #1;
        end
    endtask
endclass
