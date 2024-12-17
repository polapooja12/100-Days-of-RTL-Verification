class clock_divider_generator;
    int n; // Number of transactions
    mailbox gen2drv; // Mailbox connected to driver
    mailbox gen2scr; // Mailbox connected to scoreboard
    clock_divider_transaction tr; // Declare transaction handle

    function new(mailbox gen2drv, mailbox gen2scr);
        this.gen2drv = gen2drv;
        this.gen2scr = gen2scr;
    endfunction

    // Task to generate transactions
    task run();
        repeat(n) begin
            tr = new();
            // Randomization can be added if necessary
            gen2drv.put(tr);
            gen2scr.put(tr);
            tr.print("GENERATOR");
        end
    endtask
endclass
