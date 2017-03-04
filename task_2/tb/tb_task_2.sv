`timescale 1ns / 100ps

`include "defined.sv"

module tb_task_2(
	input wire rsrv
);

logic clk, reset;
u24_t test_seq = 24'b011100101111110001100000;
u24_t check_seq = 24'b00000011100001111110000;
intf_fltr ifltr();

initial begin
	$display("Start: init");
	
	ifltr.reset = 1'b1;
	ifltr.clk = 1'b0;
    ifltr.in = 1'b0;
	#40 ifltr.reset = 1'b0;
	$display("end init");
end

// -- CLOCKs BLOK
always begin
  #10 ifltr.clk = ~ifltr.clk;
end

assign ifltr.in = test_seq[$size(test_seq) - 1];
always_ff @(posedge clk) begin
	test_seq = (test_seq << 1) | test_seq[$size(test_seq) - 1];
end

fltr_task_2 fltr_task_2_inst(ifltr);

endmodule
