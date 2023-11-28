module pc(
    input wire clk,
    input wire reset, //reset = 0
    input wire [31:0] pc_in, //pc_in = pc_out + 4
    input wire enable,
    output reg [31:0] pc_out //pc_out = pc_in
);

    always @(negedge clk) begin
        if (enable == 1'b0) begin
            if (reset) begin
                pc_out <= 0;
            end else begin
                pc_out <= pc_in;
            end
        end
    end


endmodule