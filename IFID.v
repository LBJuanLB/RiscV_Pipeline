module ifid(
    input wire clk,
    input wire [31:0] instruction_in,
    input wire [31:0] pc_out_in,
    input wire [31:0] sum_out_in,
    input wire rst,
    input wire NextPCSrc_in,
    output reg [31:0] instruction_out,
    output reg [31:0] pc_out_out,
    output reg [31:0] sum_out_out
);

    reg borrado = 1'b0;

    always @ (rst) begin
        if (rst) begin
            instruction_out <= 0;
            pc_out_out <= 0;
            sum_out_out <= 0;
        end
    end

    always @(NextPCSrc_in) begin
        if (NextPCSrc_in == 1'b1) begin
            instruction_out <= 32'b00000000000000000000000000110011;
            pc_out_out <= 0;
            sum_out_out <= 0;
            borrado <= 1'b1;
        end
    end

    always @ (negedge clk) begin
        if (borrado == 1'b1) begin
            instruction_out <= 32'b00000000000000000000000000110011;
            pc_out_out <= 0;
            sum_out_out <= 0;
            borrado <= 1'b0;
        end else begin
            instruction_out <= instruction_in;
            pc_out_out <= pc_out_in;
            sum_out_out <= sum_out_in;
        end
    end

endmodule