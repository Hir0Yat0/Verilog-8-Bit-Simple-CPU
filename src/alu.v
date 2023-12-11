
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

    /* currently supports only add, multiply, and, or , not add */    
    /* im pretty sure always @(*) check for any dependency inside blocks changes */
    always @(*) begin
        
        case (alu_component_select)
            3'b000: 
                adder add(
                    .output_1 result,
                    .input_1 input_1,
                    .input_2 input_2 
                ); 
            3'b001:
                multer mult(
                    .output_1 result,
                    .input_1 input_1,
                    .input_2 input_2
                );
            3'b010:
                and_gate and(
                    .out result,
                    .a input_1,
                    .b input_2,
                ) ;
            3'b011:
                or_gate or(
                    .out result,
                    .a input_1,
                    .b input_2,
                );
            3'b100:
                not_gate not(
                    .out result,
                    .in input_1,
                );
            // 3'b101:
            // 3'b110:
            // 3'b111:
            default: 
                result = input_1;
        endcase

    end

    assign output_1 = result;

    
endmodule







