
class scoreboard;
    transaction tra;
    transaction tr;
    mailbox gen2scr, mon2scr;

    function new(mailbox gen2scr, mailbox mon2scr);
        this.gen2scr = gen2scr;
        this.mon2scr = mon2scr;
    endfunction

    task run();
        forever begin
            gen2scr.get(tr);
            mon2scr.get(tra);
            tr.diff=tr.a^tr.b^tr.bin;
          tr.bout=(~tr.a&tr.b)|(~tr.a&tr.bin)|(tr.b&tr.bin);
          //{tr.bout, tr.diff} = tr.a - tr.b - tr.bin;

            tr.print("SCOREBOARD");
            if ({tra.bout, tra.diff} == {tr.bout, tr.diff})
                $display("Successfully Matched");
            else
                $display("Not Successfully Matched");
        end
    endtask
endclass
