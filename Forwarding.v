module Forwarding(
    input wire [4:0] rs1_idex,
    input wire [4:0] rs2_idex,
    input wire [4:0] rd_mem,
    input wire [4:0] rd_wb,
    input wire RUWrme,
    input wire RUWrwb,
    output reg [1:0] control1,
    output reg [1:0] control2
);

    always @ (*) begin
        if (rs1_idex == rd_mem & RUWrme == 1'b1) begin
            control1 = 2'b01;
        end else if (rs1_idex == rd_wb & RUWrwb == 1'b1) begin
            control1 = 2'b10;
        end else begin
            control1 = 2'b00;
        end
    end

    always @ (*) begin
        if (rs2_idex == rd_mem & RUWrme == 1'b1) begin
            control2 = 2'b00;
        end else if (rs2_idex == rd_wb & RUWrwb == 1'b1) begin
            control2 = 2'b10;
        end else begin
            control2 = 2'b01;
        end
    end

endmodule