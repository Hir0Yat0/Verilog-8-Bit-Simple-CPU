
module main /*(
    // ports


);*/
    reg [7:0] alu_result;
    reg [3:0] alu_component_select;
    reg alu_output_select;
    reg [7:0] alu_input_1, alu_input_2;

    alu the_alu(
        .output_1 alu_result,
        .alu_component_select alu_component_select
        .input_1 alu_input_1,
        .input_2 alu_input_2,
    );
    
    initial begin
        alu_component_select = 3'b000;
        alu_input_1 = 8'b00000000; 
        alu_input_2 = 8'b00000001; #10
        $display("IN1:[%b] IN2:[%b] OUT1:[%b]",alu_input_1,alu_input_2,alu_result);
        #10;
        
    end

endmodule

