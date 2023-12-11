
module accumulator (
    // ports
    // clk,
    read_port,
    write_bit,
    write_port
);
    input write_bit, write_port;
    output read_port;

    reg [7:0] val;

    initial begin
        val = 8'b00000000;
    end

    assign read_port = val;
    /*posedge clk*/
    always @(*) begin
        if (write_bit) begin
            val = write_port;
        end
    end
    
endmodule
