
module board (
    // ports
);

    reg [7:0] instructions;
    reg [7:0] _regs;
    reg [7:0] cpu_outputs;
    reg [7:0] cpu_regs;

    wire [7:0] cpu_outputs_wires;
    wire [7:0] cpu_regs_wires;
    wire [7:0] _wires;

    main cpu(
        .IN0(instructions),
        .IN1(_regs),
        .IN2(_regs),
        .OUT0(cpu_outputs_wires),
        .OUT1(cpu_regs_wires),
        .OUT2(_wires)
    );

    initial begin
        $display("");
    end


endmodule
