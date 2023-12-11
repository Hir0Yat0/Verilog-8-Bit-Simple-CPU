
module board (
    // ports
);

    integer num_of_instructions = 5;

    reg [5][7:0] instructions;
    reg [5][7:0] expected_outputs;
    reg [5][7:0] expected_regs;
    // integer instructions[5];
    reg [7:0] instruction;
    reg [7:0] _regs;
    reg [7:0] cpu_outputs;
    reg [7:0] cpu_regs;

    wire [7:0] cpu_outputs_wires;
    wire [7:0] cpu_regs_wires;
    wire [7:0] _wires;

    // initial begin
    //     instructions[0] = 0b10001101;
    //     instructions[1] = 0b00000000;
    //     instructions[2] = 0b00110000;
    //     instructions[3] = 0b00010010;
    //     instructions[4] = 0b10000010;
        
    // end

    initial begin
        instructions = '{
            8'b10001101,
            8'b00000000,
            8'b00110000,
            8'b00010010,
            8'b10000010};
        expected_outputs = '{
            8'b00001101,
            8'b00000000,
            8'b11110010,
            8'b00011010,
            8'b00001111
        };
        expected_regs = '{
            8'b00001101,
            8'b00001101,
            8'b00001101,
            8'b00001101,
            8'b00001111
        };
    end

    main cpu(
        .IN0(instruction),
        .IN1(_regs),
        .IN2(_regs),
        .OUT0(cpu_outputs_wires),
        .OUT1(cpu_regs_wires),
        .OUT2(_wires)
    );

    always @(*) begin
        cpu_outputs = cpu_outputs_wires;
        cpu_regs = cpu_regs_wires;
        // #10;
    end

    initial begin
        $display("--CPU TESTS--");
        $display();
        #10;
        for (integer i = 0; i < num_of_instructions;i++) begin
            instruction = instructions[i];
            $display("Instructions:[0b%b]",instruction);
            $display("CPU Outputs:[0b%b]",cpu_outputs);
            $display("CPU Regs:[0b%b]",cpu_regs);
            $display("Expected CPU Outputs:[0b%b]",expected_outputs[i]);
            $display("Expected CPU Regs:[0b%b]",expected_regs[i]);
            $display("");
            #10;
        end

    end


endmodule
