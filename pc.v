module pc(
    input wire clk,
    input wire enable,
    input wire [31:0] pc_in, //pc_in = pc_out + 4
    output reg [31:0] pc_out //pc_out = pc_in
);
    reg reset = 1'b1;
    always @(posedge clk) begin
        if (reset == 1'b1) begin
            pc_out <= 32'b0;
            reset <= 1'b0;
        end 
        if (enable == 1'b0) begin
            pc_out <= pc_in;
        end
    end


endmodule