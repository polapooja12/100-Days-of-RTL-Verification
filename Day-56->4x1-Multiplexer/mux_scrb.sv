class scoreboard; // Class for comparing expected and actual outputs
    transaction tra; // Transaction handle for actual output
    transaction tr; // Transaction handle for expected output
    mailbox gen2scr; // Mailbox connected to generator
    mailbox mon2scr; // Mailbox connected to monitor

    // Constructor
    function new(mailbox gen2scr, mailbox mon2scr);
        this.gen2scr = gen2scr;
        this.mon2scr = mon2scr;
    endfunction

    // Run task to compare expected and actual outputs
    task run();
        forever begin
            // Get the actual output from the monitor
            mon2scr.get(tra);
            // Get the expected output from the generator
            gen2scr.get(tr);

            // Calculate expected output based on inputs and select lines
           // logic expected_y;
            tr.y= (~tr.s1 & ~tr.s2 & tr.a) | 
                          (~tr.s1 & tr.s2 & tr.b) | 
                          (tr.s1 & ~tr.s2 & tr.c) | 
                          (tr.s1 & tr.s2 & tr.d);

            // Compare expected output with actual output
          if (tra.y == tr.y) 
            $display("Successfully Matched");
else
$display("Not Sucessfulluy Mathed");
                
           
        end
    endtask
endclass
