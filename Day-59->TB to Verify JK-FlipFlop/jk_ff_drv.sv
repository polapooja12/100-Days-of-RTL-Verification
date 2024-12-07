class driver;
    mailbox gen2drv;  // Mailbox connected to generator
    transaction tr;   // Transaction handle
    virtual jk_ff_if vif;  // Virtual interface handle

    function new(mailbox gen2drv, virtual jk_ff_if vif);
        this.gen2drv = gen2drv;
        this.vif = vif;
    endfunction

    task run();
    // Initialize all signals
    vif.reset <= 1'b1;
    vif.j <= 1'b0;
    vif.k <= 1'b0;

    @(posedge vif.clk);
    vif.reset <= 1'b0; // Deassert reset after the first clock edge

    forever begin
        tr = new();
        gen2drv.get(tr);  // Get transaction from generator

        @(posedge vif.clk);
        vif.reset <= tr.reset;  // Drive reset
        vif.j <= tr.j;          // Drive J input
        vif.k <= tr.k;          // Drive K input

        @(posedge vif.clk);
        #1;  // Small stabilization delay
        tr.q = vif.q;      // Capture Q
        tr.qn = vif.qn;    // Capture QN
        tr.print("DRIVER");
    end
endtask


endclass
