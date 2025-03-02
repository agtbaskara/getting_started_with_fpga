module debounce_filter_TB();
    // create clock signal
    reg r_clk = 1'b0, r_bouncy = 1'b0;
    always #2 r_clk <= !r_clk;

    debounce_filter #(.DEBOUNCE_LIMIT(4)) UUT(
        .i_clk(r_clk),
      	.i_bouncy(r_bouncy),
        .o_debounced(w_debounced)
    );

    initial begin
        $dumpfile("dump.vcd"); $dumpvars;

        repeat(3) @(posedge r_clk);
        r_bouncy <= 1'b1; // toggle state of input pin

        @(posedge r_clk);
        r_bouncy <= 1'b0; // simulate bouncing

        @(posedge r_clk);
        r_bouncy <= 1'b1; // bounce go away

        repeat(6) @(posedge r_clk);
        $display("Test Complete");

        $finish();
    end
endmodule
