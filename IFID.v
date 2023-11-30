module ifid(
    input wire clk,
    input wire [31:0] instruction_in,
    input wire [31:0] pc_out_in,
    input wire [31:0] sum_out_in,
    input wire rst,
    input wire NextPCSrc_in,
    input wire hazard_detection,
    output reg [31:0] instruction_out,
    output reg [31:0] pc_out_out,
    output reg [31:0] sum_out_out
);

    always @ (rst) begin
        if (rst) begin
            instruction_out <= 0;
            pc_out_out <= 0;
            sum_out_out <= 0;
        end
    end

    always @ (posedge clk) begin
        if (NextPCSrc_in == 1'b1) begin
            instruction_out <= 0;
            sum_out_out <= 0;
            pc_out_out <= 0;
        end else if (hazard_detection == 1'b0) begin
            sum_out_out <= sum_out_in;
            pc_out_out <= pc_out_in;
            instruction_out <= instruction_in;
        end 
    end

endmodule