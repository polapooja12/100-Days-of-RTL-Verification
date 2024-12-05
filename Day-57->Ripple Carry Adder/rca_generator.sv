class generator;
    int n;
    mailbox gen2drv, gen2scr;
    transaction tr;

    function new(mailbox gen2drv, mailbox gen2scr);
        this.gen2drv = gen2drv;
        this.gen2scr = gen2scr;
    endfunction

    task run();
        repeat(n) begin
            tr = new();
            tr.randomize();
            gen2drv.put(tr);
            gen2scr.put(tr);
            tr.print("GENERATOR");
        end
    endtask
endclass
