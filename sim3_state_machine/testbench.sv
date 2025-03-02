module turnstile_example_tb();

    reg r_reset = 1'b1, r_clk = 1'b0, r_coin = 1'b0, r_push = 1'b0;
    wire w_locked;

    turnstile_example UUT(
        .i_reset(r_reset),
        .i_clk(r_clk),
        .i_coin(r_coin),
        .i_push(r_push),
        .o_locked(w_locked)
    );

    // generate clock
    always #1 r_clk <= !r_clk;

    initial begin
        $dumpfile("dump.vcd");
        $dumpvars;
        #10;

        r_reset = 1'b0;
        #10;
        assert(w_locked == 1'b1);

        r_coin = 1'b1;
        #10;
        assert(w_locked == 1'b0);

        r_push = 1'b1;
        #10;
        assert(w_locked == 1'b1);

        r_coin = 1'b0;
        #10;
        assert(w_locked == 1'b1);

        r_push = 1'b0;
        #10;
        assert(w_locked == 1'b1);

        $finish();
    end

endmodule
