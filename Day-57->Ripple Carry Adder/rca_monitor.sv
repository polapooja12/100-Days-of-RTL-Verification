class monitor;
    virtual rca_interface vif;
    transaction tr;
    mailbox mon2scr;

    function new(mailbox mon2scr, virtual rca_interface vif);
        this.mon2scr = mon2scr;
        this.vif = vif;
    endfunction

    task run();
        forever begin
            tr = new();
            tr.a = vif.a;
            tr.b = vif.b;
            tr.cin = vif.cin;
            tr.sum = vif.sum;
            tr.carryout = vif.carryout;
            mon2scr.put(tr);
            tr.print("MONITOR");
            #1;
        end
    endtask
endclass
