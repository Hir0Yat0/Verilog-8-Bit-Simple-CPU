
module accumulator (
    // ports
    clk,
    read_port,
    write_bit,
    write_port
);
    input clk, write_bit, write_port;
    output read_port;

    reg val;

    initial begin
        val = 8'b00000000
    end

    assign read_port = val

    always @(posedge clk) begin
        if (write_bit) begin
            val = write_port
        end
    end
    
endmodule
