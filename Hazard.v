module Hazard(
    input wire [4:0] loadRd,
    input wire [4:0] loadRs1,
    input wire [4:0] loadRs2,
    input wire load,
    output reg control
);

    always @ (*) begin
        if (loadRd == loadRs1 & load == 1'b1) begin
            control = 1'b1;
        end else if (loadRd == loadRs2 & load == 1'b1) begin
            control = 1'b1;
        end else begin
            control = 1'b0;
        end
    end

endmodule