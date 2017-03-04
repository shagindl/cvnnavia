`timescale 1 ns / 100 ps

`include "defined.sv"

module semaphore_task_3 #(
    parameter DELAY_GLOW = 10,
    parameter NMB_STATE_SEM = 4
)(
    input wire clk, reset,
    // -- Manage Delay
    input u4_t Addr,
    input wire write,
    input u8_t Data,
    // -- Semaphore signals
    output `wire_w(NMB_SIG_SEMAPHORE) sm_sig
);

const `logic_w(NMB_STATE_SEM * NMB_SIG_SEMAPHORE) CHK_encoding_sig = {
    ((1 << RED) << 0 * NMB_SIG_SEMAPHORE) |
    (((1 << RED) | (1 << YELLOW)) << 1 * NMB_SIG_SEMAPHORE) |
    ((1 << GREEN)  << 2 * NMB_SIG_SEMAPHORE) |
    ((1 << YELLOW) << 3 * NMB_SIG_SEMAPHORE)
};
const `logic_w(3) encoding_delay[NMB_STATE_SEM - 1 : 0] = {YELLOW, GREEN, YELLOW, RED};

u8_t DelayGlow[NMB_SIG_SEMAPHORE - 1 : 0], delay;
u8_t state_sem;
`logic_w(NMB_SIG_SEMAPHORE) sm_reg;
`logic_w(NMB_STATE_SEM * NMB_SIG_SEMAPHORE) encoding_sig;

// -- Manage Delay glow
always_ff @(posedge clk) begin
    int i;
    
    if(reset) begin
        for(i = 0; i < NMB_SIG_SEMAPHORE; i++) DelayGlow[i] = DELAY_GLOW;
    end else begin
        if(write) DelayGlow[Addr] = Data;
    end
end

// -- SEMAPHORE
assign sm_sig = encoding_sig[NMB_SIG_SEMAPHORE - 1 : 0];
always_ff @(posedge clk) begin
    if(reset) begin
        encoding_sig = CHK_encoding_sig;
        // -- Init vars
        state_sem = `set(state_sem, 0);
        delay = `set(delay, 1'b0);
    end else begin
        if(delay >= DelayGlow[encoding_delay[state_sem]]) begin
            encoding_sig[$size(encoding_sig) - 1 : $size(encoding_sig) - NMB_SIG_SEMAPHORE] <= encoding_sig[NMB_SIG_SEMAPHORE - 1 : 0];
            encoding_sig >>= NMB_SIG_SEMAPHORE;
            // --
            if(state_sem < (NMB_STATE_SEM - 1)) state_sem++;
            else state_sem = `set(state_sem, 1'b0);
            // --
            delay = `set(delay, 1'b0);
        end else delay++;
    end
end

endmodule
