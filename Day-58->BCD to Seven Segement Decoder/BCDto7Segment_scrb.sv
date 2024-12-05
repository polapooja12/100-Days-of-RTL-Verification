class scoreboard;
  transaction tra;   // Transaction handle
  transaction tr;    // Transaction handle
  mailbox gen2scr;  // Mailbox connected to generator
  mailbox mon2scr;  // Mailbox connected to monitor

  function new(mailbox gen2scr, mailbox mon2scr);
    this.gen2scr = gen2scr;
    this.mon2scr = mon2scr;
  endfunction

  task run();
    forever begin
      gen2scr.get(tr);  // Get transaction from generator
      mon2scr.get(tra);  // Get transaction from monitor
      // Compare the expected output with the actual output
      if (tra.seg == calculate_segment(tr.bcd)) 
        $display("Successfully Matched");
      else 
        $display("Not Successfully Matched");
    end
  endtask

  function bit [6:0] calculate_segment(bit [3:0] bcd);
    // Implement the logic to calculate the 7-segment output based on the BCD input
    // This is a placeholder for the actual logic
    case (bcd)
      4'b0000: return 7'b1111110;  // 0
      4'b0001: return 7'b0110000;  // 1
      4'b0010: return 7'b1101101;  // 2
      4'b0011: return 7'b1111001;  // 3
      4'b0100: return 7'b0110011;  // 4
      4'b0101: return 7'b1011011;  // 5
      4'b0110: return 7'b1011111;  // 6
      4'b0111: return 7'b1110000;  // 7
      4'b1000: return 7'b1111111;  // 8
      4'b1001: return 7'b1111011;  // 9
      default: return 7'b0000000;  // Turn off all segments for invalid inputs
    endcase
  endfunction
endclass
