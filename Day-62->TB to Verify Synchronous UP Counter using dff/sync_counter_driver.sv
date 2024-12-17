// sync_counter_driver.sv
class sync_counter_driver;
    mailbox gen2drv; 
    sync_counter_transaction tr; 
    virtual sync_counter_inf vif; // Declare handle for interface

    function new(mailbox gen2drv, virtual sync_counter_inf vif);
        this.gen2drv = gen2drv;
        this.vif = vif;
    endfunction

    task run();
        forever begin
            tr = new(); // Getting the transactions from generator through mailbox gen2drv
            gen2drv.get(tr); // Drive the signals to the DUT through the interface
            // Capture output
            tr.q = vif.q; // Get the output from the DUT
            tr.qbar = vif.qbar; // Get the inverted output from the DUT
            tr.print("DRIVER");
            #1; // Wait for a time unit
        end
    endtask
endclass
