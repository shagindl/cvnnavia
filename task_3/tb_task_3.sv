`timescale 1ns / 100ps

`include "defined.sv"

module tb_task_3(
	input wire rsrv
);

logic clk, reset;

u4_t Addr = 0;
logic write = 1'b0;
u8_t Data = 0;
`wire_w(NMB_SIG_SEMAPHORE) sm_sig;

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

//--
int unsigned mode;
`define BGN_TST1 100
always_ff @(posedge clk) begin
	if(reset) begin
		mode = 0;
	end else begin
        case(mode)
		// -- Write Delay GLOW
		(`BGN_TST1 + 0) : begin
		  Addr = GREEN;
		  Data = 20;
		  write = 1'b1;
		end
		(`BGN_TST1 + 1) : write = 1'b0;
		(`BGN_TST1 + 2) : begin
		  Addr = YELLOW;
		  Data = 30;
		  write = 1'b1;
		end
		(`BGN_TST1 + 3) : write = 1'b0;
		(`BGN_TST1 + 4) : begin
		  Addr = RED;
		  Data = 40;
		  write = 1'b1;
		end
		(`BGN_TST1 + 5) : write = 1'b0;
		endcase
		mode++;
	end
end

semaphore_task_3 task_3_inst(
    clk, reset,
    // --
    Addr, write, Data,
    // --
    sm_sig
);

endmodule
