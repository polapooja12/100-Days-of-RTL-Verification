class driver;
    mailbox gen2drv;
    transaction tr;
    virtual sub_inf vif; 
    function new(mailbox gen2drv, virtual sub_inf vif);
        this.gen2drv = gen2drv;
        this.vif = vif;
    endfunction

    task run();
        forever begin
            tr = new();
            gen2drv.get(tr);
            vif.a <= tr.a;
            vif.b <= tr.b;
            vif.bin <= tr.bin;
            tr.print("DRIVER");
            #1;
        end
    endtask
endclass
