
module accumulator (
    // ports
    clk,
    write_bit,
    read_port,
    write_port
);
    input clk, write_bit, write_port;
    output read_port;

    reg val;

    initial begin
        val = 8'b00000000
    end

    assign read_port = val

    always @(posegde clk) begin
        if (write_bit) begin
            val = write_port
        end
    end
    
endmodule
