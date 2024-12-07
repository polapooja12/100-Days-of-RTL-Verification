// sipo_driver.sv
class sipo_driver;
    mailbox gen2drv; 
    sipo_transaction tr; 
    virtual sipo_inf vif; // Declare handle for interface

    function new(mailbox gen2drv, virtual sipo_inf vif);
        this.gen2drv = gen2drv;
        this.vif = vif;
    endfunction

    task run();
        forever begin
            tr = new(); // Getting the transactions from generator through mailbox gen2drv
            gen2drv.get(tr); // Drive the signals to the DUT through the interface
            vif.d <= tr.d; // Assigning input
            #1; // Wait for a time unit
            // Capture output
            tr.q = vif.q; // Get the output from the DUT
            tr.print("DRIVER");
        end
    endtask
endclass
