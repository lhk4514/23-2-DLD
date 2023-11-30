
module Hamming_Decoder(
    output [3:0] data_out,
    output err_uncorrectable, err_correctable,
    input [7:0] data_in,
    input clk, rstn
    );

// **** TODO **** //

		reg [3:0] syndrome;
		reg [7:0] corrected_data;

		reg error_index;
		
		always @(posedge clk) begin
				syndrome[3] = data_in[7] ^ data_in[6] ^ data_in[5] ^ data_in[4] ^ data_in[3] ^ data_in[2] ^ data_in[1] ^ data_in[0];
				syndrome[2] = data_in[6] ^ data_in[5] ^ data_in[4] ^ data_in[3];
				syndrome[1] = data_in[6] ^ data_in[5] ^ data_in[2] ^ data_in[1];
				syndrome[0] = data_in[6] ^ data_in[4] ^ data_in[2] ^ data_in[0];

				error_index = 4 * syndrome[2] + 2 * syndrome[1] + syndrome[0];
		end

		always @(*) begin
				corrected_data <= data_in;
				corrected_data[error_index] <= (err_correctable) ? !data_in[error_index] : data_in[error_index];
		end

		assign err_correctable = (syndrome[3]) ? 1 : 0;
		assign err_uncorrectable = (!syndrome[3] && (syndrome[2] || syndrome[1] || syndrome[0])) ? 1 : 0;
		
		assign data_out = {corrected_data[6:4], corrected_data[2]};

// ************** //

endmodule
