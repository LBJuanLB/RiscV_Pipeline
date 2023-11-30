module InstructionMemory#(
  parameter TAM = 4  // Valor predeterminado de TAM
)(
  input wire [31:0] pc,
  output reg [31:0] instruction
);

  reg [31:0] mem[0:TAM];
  reg [31:0] pc_in;

  always @(*) begin
    instruction <= mem[pc/4];
  end

endmodule