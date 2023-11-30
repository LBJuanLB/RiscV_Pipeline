module idex(
    input wire clk,
    input wire [31:0] sum_out_in,
    input wire [31:0] pc_out_in,
    input wire [31:0] data1_in,
    input wire [31:0] data2_in,
    input wire [31:0] imm_in,
    input wire [4:0] rs1_in,
    input wire [4:0] rs2_in,
    input wire [4:0] rd_in,
    input wire we_in,
    input wire [1:0] controlRF_in,
    input wire controlALU_in,
    input wire store_in,
    input wire [2:0] funct3_alu_in,
    input wire Type_alu_in,
    input wire [2:0] Type_dm_in,
    input wire [4:0] BrOp_in,
    input wire controlOp1_in,
    input wire rst,
    input wire hazard_detection,
    input wire NextPCSrc_in,
    input wire load_in,
    output reg load_out,
    output reg [31:0] sum_out_out,
    output reg [31:0] pc_out_out,
    output reg [31:0] data1_out,
    output reg [31:0] data2_out,
    output reg [31:0] imm_out,
    output reg [4:0] rd_out,
    output reg [4:0] rs1_out,
    output reg [4:0] rs2_out,
    output reg we_out,
    output reg [1:0] controlRF_out,
    output reg controlALU_out,
    output reg store_out,
    output reg [2:0] funct3_alu_out,
    output reg Type_alu_out,
    output reg [2:0] Type_dm_out,
    output reg [4:0] BrOp_out,
    output reg controlOp1_out
);
    reg clear;
    always @(rst) begin 
        if (rst) begin
            load_out <= 1'b0;
            sum_out_out <= 32'b0;
            pc_out_out <= 32'b0;
            data1_out <= 32'b0;
            data2_out <= 32'b0;
            imm_out <= 32'b0;
            rd_out <= 5'b0;
            rs1_out <= 5'b0;
            rs2_out <= 5'b0;
            we_out <= 1'b0;
            controlRF_out <= 2'b00;
            controlALU_out <= 1'b0;
            store_out <= 1'b0;
            funct3_alu_out <= 3'b000;
            Type_alu_out <= 1'b0;
            Type_dm_out <= 3'b000;
            BrOp_out <= 5'b00000;
            controlOp1_out <= 1'b0;
        end
    end
    // Módulo idex
    always @(negedge clk) begin
        if (hazard_detection == 1'b1 | NextPCSrc_in == 1'b1) begin
                we_out <= 1'b0;
                controlRF_out <= 2'b00;
                store_out <= 1'b0;
                controlALU_out <= 1'b0;
                controlOp1_out <= 1'b0;
                funct3_alu_out <= 3'b000;
                Type_dm_out <= 3'b000;
                Type_alu_out <= 1'b0;
                BrOp_out <= 5'b00000;
                load_out <= 1'b0;
        end else begin
            sum_out_out <= sum_out_in;
            pc_out_out <= pc_out_in;
            data1_out <= data1_in;
            data2_out <= data2_in;
            imm_out <= imm_in;
            rd_out <= rd_in;
            rs1_out <= rs1_in;
            rs2_out <= rs2_in;
            we_out <= we_in;
            controlRF_out <= controlRF_in;
            controlALU_out <= controlALU_in;
            store_out <= store_in;
            funct3_alu_out <= funct3_alu_in;
            Type_alu_out <= Type_alu_in;
            Type_dm_out <= Type_dm_in;
            BrOp_out <= BrOp_in;
            controlOp1_out <= controlOp1_in;
            load_out <= load_in;
        end
    end
endmodule