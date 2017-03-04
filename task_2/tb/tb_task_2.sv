`timescale 1ns / 100ps

`include "defined.sv"

module tb_task_2 #(
    parameter N = 3
)(
	input wire rsrv
);

logic clk, reset;
u24_t test_seq = 24'b011100101111110001100000;
u24_t check_seq = 24'b00001110000111111000000;
intf_fltr ifltr();
u8_t cnt_success = 0;
// -- Debug 
logic check_sig;

initial begin
	$display("Start: init");
	
	reset = 1'b1;
	clk = 1'b0;
 	#40 reset = 1'b0;
	$display("end init");
end

// -- CLOCKs BLOK
always begin
  #10 clk = ~clk;
end

assign ifltr.clk = clk;
assign ifltr.in = test_seq[$size(test_seq) - 1];

always_ff @(posedge clk) begin
	test_seq = (test_seq << 1) | test_seq[$size(test_seq) - 1];
	check_seq <= (check_seq << 1) | check_seq[$size(check_seq) - 1];
   	// -- Check TEST
	if(ifltr.out != check_seq[$size(check_seq) - 1]) begin
	    cnt_success = 0;
	    $display("ERROR!!!");
    end else if(cnt_success >= $size(check_seq)) $display("TEST Success");
	else cnt_success++;
end

fltr_task_2 #(N) fltr_task_2_inst(ifltr);

// -- Debug
assign check_sig = check_seq[$size(check_seq) - 1];

endmodule
