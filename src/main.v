
module main (
    // ports
    IN0,
    IN1,
    IN2,
    OUT0,
    OUT1,
    OUT2

);
    /* inputs outputs of the main boards */
    input [7:0] IN0, IN1, IN2;
    output [7:0] OUT0, OUT1, OUT2;

    reg [7:0] alu_result;
    wire [7:0] alu_result_wire;
    reg [3:0] alu_component_select;
    reg alu_output_select;
    reg [7:0] alu_input_1, alu_input_2;

    // reg [7:0] decoders_inputs_instructions_inputs;
    wire [3:0] decoders_opcodes;
    wire decoders_is_using_acc_as_outputs;
    wire [3:0] decoders_immediates;

    assign OUT0 = alu_result_wire;
    assign OUT1 = reg_read;

    always @(*) begin
        $display("alu_results_wires:[0b%b]",alu_result_wire);
        $display("reg_read:[0b%b]",reg_read);
        $display("reg_write:[0b%b]",reg_write);
        $display("reg_write_bit:[0b%b]",reg_write_bit);
        // #10;
    end

    decoder dec(
        // .instructions_ports(decoders_inputs_instructions_inputs),
        .instructions_ports(IN0),
        .opcodes_outputs(decoders_opcodes),
        .immediates_outputs(decoders_immediates),
        .outputs_selectors(decoders_is_using_acc_as_outputs)
    );

    alu the_alu(
        .output_1 (alu_result_wire),
        .alu_component_select (alu_component_select),
        .input_1 (alu_input_1),
        .input_2 (alu_input_2)
    );

    wire [7:0] reg_read;
    reg reg_write_bit;
    reg [7:0] reg_write;

    accumulator acc(
        .read_port(reg_read),
        .write_bit(reg_write_bit),
        .write_port(reg_write)
    );

    // always @(*) begin
    //     alu_result = alu_result_wire;
    //     // #10;
    // end

    /* connecting decoders, alus, and registers */
    always @(*) begin
        // decoders_inputs_instructions_inputs = IN0;
        // $display("decoders Instructions:[0b%b]",decoders_inputs_instructions_inputs);
        $display("decoders Instructions:[0b%b]",IN0);
        alu_input_1 = reg_read;
        alu_input_2 = decoders_immediates;
        alu_component_select = decoders_opcodes;
        alu_result = alu_result_wire;
        reg_write_bit = decoders_is_using_acc_as_outputs;
        reg_write = alu_result;
        #10;
    end
    // always @(*) begin
        // reg_write_bit = decoders_is_using_acc_as_outputs;
        // reg_write = alu_result;
        // #10;
    // end
    // always @(*) begin
        // decoders_inputs_instructions_inputs = IN0;
        // $display("decoders Instructions:[0b%b]",decoders_inputs_instructions_inputs);
        // #10;
    // end

    // assign OUT0 = alu_result;
    // assign OUT1 = reg_read;

    // alu_result = alu_result_wire;



    /* tests */
    /* alu tests */
    // initial begin
    //     $display("");
    //     /* add 0 + 1 */
    //     alu_component_select = 3'b000;
    //     alu_input_1 = 8'b00000000; 
    //     alu_input_2 = 8'b00000001; #10;
    //     $display("add 0 + 1");
    //     $display("Expected Outputs: [0b00000001]");
    //     $display("SEL1[0b%b] OUT1:[0b%b] IN1:[0b%b] IN2:[0b%b] ",alu_component_select,alu_result_wire,alu_input_1,alu_input_2);
    //     #10;
    //     /* add 1 + 0 */
    //     alu_component_select = 3'b000;
    //     alu_input_1 = 8'b00000001; 
    //     alu_input_2 = 8'b00000000; #10;
    //     $display("add 1 + 0");
    //     $display("Expected Outputs: [0b00000001]");
    //     $display("SEL1[0b%b] OUT1:[0b%b] IN1:[0b%b] IN2:[0b%b]",alu_component_select,alu_result_wire,alu_input_1,alu_input_2);
    //     #10;
    //     /* add 1 + 1 */
    //     alu_component_select = 3'b000;
    //     alu_input_1 = 8'b00000001; 
    //     alu_input_2 = 8'b00000001; #10;
    //     $display("add 1 + 1");
    //     $display("Expected Outputs: [0b00000010]");
    //     $display("SEL1[0b%b] OUT1:[0b%b] IN1:[0b%b] IN2:[0b%b]",alu_component_select,alu_result_wire,alu_input_1,alu_input_2);
    //     #10;
    //     /* and 0110 0101 */
    //     alu_component_select = 3'b010;
    //     alu_input_1 = 8'b00000110; 
    //     alu_input_2 = 8'b00000101; #10;
    //     $display("and 0110 0100");
    //     $display("Expected Outputs: [0b00000100]");
    //     $display("SEL1[0b%b] OUT1:[0b%b] IN1:[0b%b] IN2:[0b%b]",alu_component_select,alu_result_wire,alu_input_1,alu_input_2);
    //     #10;
    //     /* or 0110 1001 */
    //     alu_component_select = 3'b011;
    //     alu_input_1 = 8'b00001001; 
    //     alu_input_2 = 8'b00000110; #10;
    //     $display("or 0110 1001");
    //     $display("Expected Outputs: [0b00001111]");
    //     $display("SEL1[0b%b] OUT1:[0b%b] IN1:[0b%b] IN2:[0b%b]",alu_component_select,alu_result_wire,alu_input_1,alu_input_2);
    //     #10;
    //     /* not 1000 1110 (supposed to only read the left inputs)*/
    //     alu_component_select = 3'b100;
    //     alu_input_1 = 8'b00001000; 
    //     alu_input_2 = 8'b00001110; #10;
    //     $display("not 1000 1110 (supposed to only read the left inputs)");
    //     $display("Expected Outputs: [0b11110111]");
    //     $display("SEL1[0b%b] OUT1:[0b%b] IN1:[0b%b] IN2:[0b%b]",alu_component_select,alu_result_wire,alu_input_1,alu_input_2);
    //     #10;
    //     /* mult 0001 0011*/
    //     alu_component_select = 3'b001;
    //     alu_input_1 = 8'b00000001; 
    //     alu_input_2 = 8'b00000011; #10;
    //     $display("mult 0001 0011");
    //     $display("Expected Outputs: [0b00000011]");
    //     $display("SEL1[0b%b] OUT1:[0b%b] IN1:[0b%b] IN2:[0b%b]",alu_component_select,alu_result_wire,alu_input_1,alu_input_2);
    //     #10;
    //     /* mult 0000 0011*/
    //     alu_component_select = 3'b001;
    //     alu_input_1 = 8'b00000000; 
    //     alu_input_2 = 8'b00000011; #10;
    //     $display("mult 0000 0011");
    //     $display("Expected Outputs: [0b00000000]");
    //     $display("SEL1[0b%b] OUT1:[0b%b] IN1:[0b%b] IN2:[0b%b]",alu_component_select,alu_result_wire,alu_input_1,alu_input_2);
    //     #10;
    //     /* mult 0010 0011*/
    //     alu_component_select = 3'b001;
    //     alu_input_1 = 8'b00000010; 
    //     alu_input_2 = 8'b00000011; #10;
    //     $display("mult 0010 0011");
    //     $display("Expected Outputs: [0b00000110]");
    //     $display("SEL1[0b%b] OUT1:[0b%b] IN1:[0b%b] IN2:[0b%b]",alu_component_select,alu_result_wire,alu_input_1,alu_input_2);
    //     #10;
    //     /* select 0b111 (supposed to return input_1)*/
    //     alu_component_select = 3'b111;
    //     alu_input_1 = 8'b00000001; 
    //     alu_input_2 = 8'b00000011; #10;
    //     $display("select 0b111 (supposed to return input_1)");
    //     $display("Expected Outputs: [0b00000001]");
    //     $display("SEL1[0b%b] OUT1:[0b%b] IN1:[0b%b] IN2:[0b%b]",alu_component_select,alu_result_wire,alu_input_1,alu_input_2);
    //     #10;
        
    // end

    /* register tests */
    // initial begin

    //     $display("");

    //     reg_write = 8'b00000000;
    //     reg_write_bit = 1'b0;
    //     #10;
    //     $display("Expected:[0b00000000]");
    //     $display("ACC:[0b%b]",reg_read);
    //     #10;
    //     reg_write = 8'b00000001;
    //     reg_write_bit = 1'b0;
    //     #10;
    //     $display("Expected:[0b00000000]");
    //     $display("ACC:[0b%b]",reg_read);
    //     #10;
    //     reg_write = 8'b00000001;
    //     reg_write_bit = 1'b1;
    //     #10;
    //     $display("Expected:[0b00000001]");
    //     $display("ACC:[0b%b]",reg_read);
    //     #10;
    //     reg_write = 8'b00000000;
    //     reg_write_bit = 1'b0;
    //     #10;
    //     $display("Expected:[0b00000001]");
    //     $display("ACC:[0b%b]",reg_read);
    //     #10;
    //     reg_write = 8'b00001111;
    //     reg_write_bit = 1'b1;
    //     #10;
    //     $display("Expected:[0b00001111]");
    //     $display("ACC:[0b%b]",reg_read);
    //     #10;
    //     reg_write = 8'b00001111;
    //     reg_write_bit = 1'b1;
    //     #10;
    //     $display("Expected:[0b00001111]");
    //     $display("ACC:[0b%b]",reg_read);
    //     #10;
    // end

endmodule

