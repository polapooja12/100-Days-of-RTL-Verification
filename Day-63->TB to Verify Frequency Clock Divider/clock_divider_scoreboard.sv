class clock_divider_scoreboard;
    clock_divider_transaction tra;
    clock_divider_transaction tr;
    mailbox gen2scr, mon2scr;

    function new(mailbox gen2scr, mailbox mon2scr);
        this.gen2scr = gen2scr;
        this.mon2scr = mon2scr;
    endfunction

    task run();
        forever begin
            gen2scr.get(tr); 
            mon2scr.get(tra);

            // Verify expected behavior
            if (tra.f2 !== tr.f2 || tra.f4 !== tr.f4 || tra.f8 !== tr.f8 ||
                tra.f16 !== tr.f16 || tra.f32 !== tr.f32 || tra.f64 !== tr.f64) 
                $display("Mismatch: Expected f2=%b, f4=%b, ..., but got f2=%b, f4=%b, ...",
                         tr.f2, tr.f4, tra.f2, tra.f4);
            else 
                $display("Successfully Matched");
        end
    endtask
endclass
