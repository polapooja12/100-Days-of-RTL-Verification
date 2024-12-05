class scoreboard;
    transaction tr, mon_tr;
    mailbox gen2scr, mon2scr;

    function new(mailbox gen2scr, mailbox mon2scr);
        this.gen2scr = gen2scr;
        this.mon2scr = mon2scr;
    endfunction

    task run();
        forever begin
            gen2scr.get(tr);
            mon2scr.get(mon_tr);
            {tr.carryout, tr.sum} = tr.a + tr.b + tr.cin;
            tr.print("SCOREBOARD");
            if ({mon_tr.carryout, mon_tr.sum} == {tr.carryout, tr.sum})
                $display("Successfully Matched");
            else
                $display("Not Successfully Matched");
        end
    endtask
endclass
