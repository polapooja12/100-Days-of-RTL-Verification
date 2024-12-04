class driver;
  mailbox gen2drv;  // Mailbox connected to generator
  transaction tr;   // Transaction handle
  virtual priority_encoder_if vif;  // Virtual interface handle

  function new(mailbox gen2drv, virtual priority_encoder_if vif);
    this.gen2drv = gen2drv;
    this.vif = vif;
  endfunction

  task run();
    forever begin
      tr = new();
      gen2drv.get(tr);  // Get transaction from generator
      vif.a <= tr.a;    // Drive input a
      vif.b <= tr.b;    // Drive input b
      vif.c <= tr.c;    // Drive input c
      vif.d <= tr.d;    // Drive input d
      #1;  // Wait for a time delay
      tr.y1 = vif.y1;   // Capture output y1
      tr.y2 = vif.y2;   // Capture output y2
      tr.print("DRIVER");
    end
  endtask
endclass
