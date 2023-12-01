module InstructionMemory#(
  parameter TAM = 4  // Valor predeterminado de TAM
)(
  input wire [31:0] pc,
  output reg [31:0] instruction,
  output reg mostrar
);

  reg [31:0] mem[0:TAM];
  reg [31:0] pc_in;

  always @(*) begin
    instruction <= mem[pc/4];
    if (instruction == 32'b0) begin 
      //Guardar el pc que llega
      pc_in <= pc + 24;
    end
    if (pc == pc_in) begin
      $finish;
    end else if (pc == pc_in - 4) begin
      mostrar <= 1'b1;
    end
  end

endmodule