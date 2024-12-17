// sync_counter_generator.sv
class sync_counter_generator;
    int n; // Number of transactions
    mailbox gen2drv; // Mailbox connected to driver
    mailbox gen2scr; // Mailbox connected to scoreboard
    sync_counter_transaction tr; // Declare transaction handle

    // Constructor
    function new(mailbox gen2drv, mailbox gen2scr);
        this.gen2drv = gen2drv;
        this.gen2scr = gen2scr;
    endfunction

    // Task for randomizing and putting transactions in mailbox
    task run();
        repeat(n) begin
            tr = new();
            // Randomize logic can be added here if needed
            gen2drv.put(tr);
            gen2scr.put(tr);
            tr.print("GENERATOR");
        end
    endtask
endclass
