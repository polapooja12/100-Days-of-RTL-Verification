// sync_counter_scoreboard.sv
class sync_counter_scoreboard;
    sync_counter_transaction tra; 
    sync_counter_transaction tr; 
    mailbox gen2scr, mon2scr;

    function new(mailbox gen2scr, mailbox mon2scr);
        this.gen2scr = gen2scr;
        this.mon2scr = mon2scr;
    endfunction

    task run();
        forever begin
            gen2scr.get(tr); 
            mon2scr.get(tra); 
            // Expected Output implementation
            // Here you can implement the expected behavior of the counter
            // For example, you can check if the output q is incremented correctly
           if (tra.q == (tr.q + 1) && tra.qbar == ~tra.q) 
    $display("Successfully Matched: q=%b, qbar=%b", tra.q, tra.qbar);
else 
    $display("Mismatch: Expected q=%b, Got q=%b", (tr.q + 1), tra.q);
        end
    endtask
endclass
