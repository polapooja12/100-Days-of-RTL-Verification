class scoreboard;
    transaction tra;   // Transaction handle
    transaction tr;    // Transaction handle
    mailbox gen2scr;  // Mailbox connected to generator
    mailbox mon2scr;  // Mailbox connected to monitor

    function new(mailbox gen2scr, mailbox mon2scr);
        this.gen2scr = gen2scr;
        this.mon2scr = mon2scr;
    endfunction

    task run();
        forever begin
            gen2scr.get(tr);  // Get transaction from generator
            mon2scr.get(tra); // Get transaction from monitor
            // Compare the expected output with the actual output
            if (tra.q == tr.q && tra.qn == tr.qn) 
                $display("Successfully Matched");
            else 
                $display("Not Successfully Matched");
        end
    endtask
endclass
