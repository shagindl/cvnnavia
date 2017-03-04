`timescale 1 ns / 100 ps

`include "defined.sv"

module fltr_task_2 (
    // -- FLTR
    intf_fltr.mp_fltr ifltr
);

assign ifltr.out = ifltr.in;

endmodule
