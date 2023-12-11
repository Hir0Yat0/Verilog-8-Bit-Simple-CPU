
module multer (
    // ports

    output_1
    input_1,
    input_2,

);

    // 8 bits inputs outputs
    input [7:0] input_1, input_2; //[7:0]
    output [7:0] output_1
    /* copy paste from adder.v, changed + to * */
    always @(*) begin
        assign output_1 = input_1 * input_2;
    end
    
endmodule
