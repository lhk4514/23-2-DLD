
module Error_Injection(
        output [7:0] data_out,
        input [7:0] data_in,
        input btn1, btn2,
        input clk, rstn
    );

// **** TODO **** //

		reg [7:0] errored_data;

		always @(*) begin
				errored_data = data_in;
		
				errored_data[0] = (btn1) ? !errored_data[0] : errored_data[0];
				errored_data[4] = (btn2) ? !errored_data[4] : errored_data[4];
		end

		assign data_out = errored_data;

// ************** // 

endmodule
