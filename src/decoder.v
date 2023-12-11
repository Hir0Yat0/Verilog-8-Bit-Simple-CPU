
module decoder (
    // ports
    instructions_ports,
    opcodes_outputs,
    immediates_outputs,
    outputs_selectors
);

    input [7:0] instructions_ports;
    output [3:0] opcodes_outputs;
    output outputs_selectors;
    output [3:0] immediates_outputs;

    reg [3:0] opcodes;
    reg [3:0] immediates;
    reg is_using_acc;
    reg [2:0] instructions;

    assign opcodes_outputs = instructions;
    assign outputs_selectors = is_using_acc;
    assign immediates_outputs = immediates;

    // initial begin
    //     opcodes = 0;
    //     immediates = 0;
    //     is_using_acc = 0;
    //     instructions = 0;
    // end

    /* decodes instructions */
    always @(instructions_ports) begin
        opcodes = instructions_ports[7:4];
        immediates = instructions_ports[3:0];
        is_using_acc = opcodes[3];
        instructions = opcodes[2:0];
    end
    
endmodule
