
module alu (
    // ports
    // clk,
    output_1,
    alu_component_select,
    input_1,
    input_2,

);

    input [3:0] alu_component_select;
    input [7:0] input_1, input_2;
    output [7:0] output_1;

    reg [7:0] result;

    reg [7:0] add_result;
    wire [7:0] add_result_wire;
    reg [7:0] mult_result;
    wire [7:0] mult_result_wire;
    reg [7:0] and_result;
    wire [7:0] and_result_wire;
    reg [7:0] or_result;
    wire [7:0] or_result_wire;
    reg [7:0] not_result;
    wire [7:0] not_result_wire;

    // adder add(
    //     .output_1 result,
    //     .input_1 input_1,
    //     .input_2 input_2 
    // );

    // multer mult(
    //     .output_1 result,
    //     .input_1 input_1,
    //     .input_2 input_2
    // );

    adder ALU_ADD(
        .output_1 (add_result_wire),
        .input_1 (input_1),
        .input_2 (input_2) 
    ); 

    multer ALU_MULT(
        .output_1 (mult_result_wire),
        .input_1 (input_1),
        .input_2 (input_2)
    );

    and_gate ALU_AND(
        .out (and_result_wire),
        .a (input_1),
        .b (input_2)
    ) ;

    or_gate ALU_OR(
        .out (or_result_wire),
        .a (input_1),
        .b (input_2)
    );

    not_gate ALU_NOT(
        .out (not_result_wire),
        .in (input_1)
    );

    /* currently supports only add, multiply, and, or , not add */    
    /* im pretty sure always @(*) check for any dependency inside blocks changes */
    always @(*) begin
        
        case (alu_component_select)
            3'b000: 
                result = add_result_wire;
            3'b001:
                result = mult_result_wire;
            3'b010:
                result = and_result_wire;
            3'b011:
                result = or_result_wire;
            3'b100:
                result = not_result_wire;
            // 3'b101:
            // 3'b110:
            // 3'b111:
            default: 
                result = input_1;
        endcase

    end

    assign output_1 = result;

    
endmodule







