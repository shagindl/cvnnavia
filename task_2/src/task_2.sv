`timescale 1 ns / 100 ps

`include "defined.sv"

module fltr_task_2 #(
    parameter N = 3
)(
    // -- FLTR
    intf_fltr.mp_fltr ifltr
);

logic out_reg = 1'b0;
const u8_t CHK_DELAY = 1;

assign ifltr.out = out_reg;

u8_t cnt_in, cnt_delay;
enTASK2_MODE mode;
always_ff @(posedge ifltr.clk) begin
    case(mode)
    MD_IDLE : begin
        // -- Check input
        if(cnt_in >= N) begin
            mode = MD_SKIP;
            out_reg = 1'b1;
            // -- Init var
            cnt_in = 8'h00;
            cnt_delay = (ifltr.in) ? (CHK_DELAY + 1) : CHK_DELAY;
        end else begin
            // -- Test input sequence
            if(ifltr.in) cnt_in++;
            else cnt_in = 8'h00;
            // -- Delays organization
            if(!cnt_delay) out_reg = 1'b0;
            else cnt_delay--;
        end
    end
    MD_SKIP : if(!ifltr.in) mode = MD_IDLE;
    default : mode = MD_IDLE;
    endcase
end

endmodule
