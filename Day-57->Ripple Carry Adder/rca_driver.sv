class driver;
    virtual rca_interface vif;
    transaction tr;
    mailbox gen2drv;

    function new(mailbox gen2drv, virtual rca_interface vif);
        this.gen2drv = gen2drv;
        this.vif = vif;
    endfunction

    task run();
        forever begin
            gen2drv.get(tr);
            vif.a <= tr.a;
            vif.b <= tr.b;
            vif.cin <= tr.cin;
            tr.print("DRIVER");
            #1;
        end
    endtask
endclass
