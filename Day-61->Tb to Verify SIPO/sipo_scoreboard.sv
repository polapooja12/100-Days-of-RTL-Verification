class sipo_scoreboard;
    sipo_transaction tra; 
    sipo_transaction tr; 
    mailbox gen2scr, mon2scr;

    // Add virtual interface handle
    virtual sipo_inf vif; 

    // Constructor with virtual interface
    function new(mailbox gen2scr, mailbox mon2scr, virtual sipo_inf vif);
        this.gen2scr = gen2scr;
        this.mon2scr = mon2scr;
        this.vif = vif; // Assign the virtual interface
    endfunction

    task run();
        forever begin
            gen2scr.get(tr); 
            @(posedge vif.clk); // Wait for the clock edge using the provided virtual interface
            mon2scr.get(tra); 
            // Expected output implementation
            tra.q = {tra.q[2:0], tr.d}; // Shift in the new data
            tr.print("SCOREBOARD"); // Print transaction details
            // Compare actual vs. expected
            if (tra.q == tr.q)
                $display("Successfully Matched at time %0t", $time);
            else
                $display("Mismatch at time %0t: Expected=%b, Got=%b", $time, tra.q, tr.q);
        end
    endtask
endclass
