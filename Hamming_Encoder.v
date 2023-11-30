
module Hamming_Encoder(
    output [7:0] data_out,
    input [3:0] data_in,
    input clk, rstn
    );

// **** TODO **** //

		wire [3:0] parity;

		assign parity[3] = data_in[0] ^ data_in[1] ^ data_in[2];
		assign parity[2] = data_in[1] ^ data_in[2] ^ data_in[3];
		assign parity[1] = data_in[0] ^ data_in[2] ^ data_in[3];
		assign parity[0] = data_in[0] ^ data_in[1] ^ data_in[3];

		assign data_out = {parity[3], data_in[3:1], parity[2], data_in[0], parity[1:0]};	

// ************** //

endmodule
