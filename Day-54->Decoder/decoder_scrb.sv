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
            // Get the expected output from the generator
            gen2scr.get(tr);
            // Get the actual output from the monitor
            mon2scr.get(tra);

            // Calculate expected outputs based on inputs
           // logic expected_y0, expected_y1, expected_y2, expected_y3;
            tr.y0 = ~tr.a & ~tr.b; // Output for 00
            tr.y1 = ~tr.a & tr.b;  // Output for 01
            tr.y2 = tr.a & ~tr.b;  // Output for 10
            tr.y3 = tr.a & tr.b;   // Output for 11

            // Compare expected outputs with actual outputs
          if ({tr.y3, tr.y2, tr.y1, tr.y0} === {tra.y3, tra.y2, tra.y1, tra.y0}) 
            $display("Successfully Matched");
else
$display("Not Sucessfulluy Mathed");
            end
        
    endtask
endclass
