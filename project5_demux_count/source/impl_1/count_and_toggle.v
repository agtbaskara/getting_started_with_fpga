module count_and_toggle #(COUNT_LIMIT = 10) (
    input i_clk,
    input i_enable,
    output reg o_toggle
);

reg [$clog2(COUNT_LIMIT-1):0] r_counter;

always @(posedge i_clk) begin
    if(i_enable == 1'b1) begin
        if(r_counter == COUNT_LIMIT - 1) begin
            o_toggle <= !o_toggle;
            r_counter <= 0;
        end
        else begin
            r_counter <= r_counter + 1;
        end
    end
    else begin
        o_toggle <= 1'b0;
    end
end

endmodule
