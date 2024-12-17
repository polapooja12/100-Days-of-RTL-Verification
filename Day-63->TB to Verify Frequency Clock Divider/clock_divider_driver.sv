class clock_divider_driver;
    mailbox gen2drv; 
    clock_divider_transaction tr; 
    virtual clock_divider_inf vif;

    function new(mailbox gen2drv, virtual clock_divider_inf vif);
        this.gen2drv = gen2drv;
        this.vif = vif;
    endfunction

    task run();
        forever begin
            tr = new();
            gen2drv.get(tr); // Drive signals to the DUT
            // Capture output
            tr.f2 = vif.f2;
            tr.f4 = vif.f4;
            tr.f8 = vif.f8;
            tr.f16 = vif.f16;
            tr.f32 = vif.f32;
            tr.f64 = vif.f64;
            tr.print("DRIVER");
            #1; // Wait for a time unit
        end
    endtask
endclass
