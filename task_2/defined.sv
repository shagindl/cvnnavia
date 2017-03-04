`ifndef defined_SV
`define defined_SV

    `define set(vectr, val) {$size(vectr){val}};
    `define set_size(size, val) {size{val}}
    `define scaling(vectr, to_size) {{(to_size - $size(vectr)){vectr[$size(vectr) - 1]}}, vectr}
    `define scaling_type(type_vectr, vectr, to_size) {{(to_size - $size(type_vectr)){vectr[$size(type_vectr) - 1]}}, vectr}
    `define scaling_size(size_vectr, vectr, to_size) {{(to_size - size_vectr){vectr[size_vectr - 1]}}, vectr}
    `define scaling_size_wire(vectr, to_size) {{(to_size - 1){1'b0}}, vectr}
    
    `define scl_zero_type(type_vectr, vectr, to_size) {{(to_size - $size(type_vectr)){1'b0}}, vectr}
    `define scl_zero_size(size_vectr, vectr, to_size) {{(to_size - size_vectr){1'b0}}, vectr}
    `define wire_w(width)   wire [(width - 1) : 0]
    `define logic_w(width)  logic [(width - 1) : 0]

    typedef logic[0 : 0] u1_t;
    typedef logic[3 : 0] u4_t;
    typedef logic[7 : 0] u8_t;
    typedef logic[24 : 0] u24_t;
    typedef logic signed[15 : 0] s16_t;
    typedef logic signed [23 : 0] s24_t;
    typedef logic[31 : 0] u32_t;
    typedef logic signed[31 : 0] s32_t;
    typedef logic signed[63 : 0] s64_t;
    typedef logic[31 : 0] float_t;
    
    interface intf_fltr(
        wire clk, in, out
    );
        
	    
		modport mp_fltr(
            input clk, in,
            output out
		); 
    endinterface
`endif
