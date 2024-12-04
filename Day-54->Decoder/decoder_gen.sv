class generator; // Class for generating transactions
    int n; // Number of transactions
    mailbox gen2drv; // Mailbox to driver
    mailbox gen2scr; // Mailbox to scoreboard
    transaction tr; // Transaction handle

    // Constructor
    function new(mailbox gen2drv, mailbox gen2scr);
        this.gen2drv = gen2drv;
        this.gen2scr = gen2scr;
    endfunction

    // Run task for generating transactions
    task run();
        repeat(n) begin
            tr = new();
            tr.randomize(); // Randomize inputs
            gen2drv.put(tr); // Send to driver
            gen2scr.put(tr); // Send to scoreboard
            tr.print("GENERATOR");
        end
    endtask
endclass
