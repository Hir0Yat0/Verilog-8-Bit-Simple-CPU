
module and_gate (
    // ports
    out,
    a,
    b,
);

    input [7:0] a, b;
    output [7:0] out;

    assign out = a & b;
    
endmodule
