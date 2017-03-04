onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /tb_task_2/ifltr/clk
add wave -noupdate /tb_task_2/ifltr/in
add wave -noupdate /tb_task_2/ifltr/out
add wave -noupdate -divider Block_task_2
add wave -noupdate /tb_task_2/check_sig
add wave -noupdate -radix decimal /tb_task_2/fltr_task_2_inst/cnt_delay
add wave -noupdate -radix decimal /tb_task_2/fltr_task_2_inst/cnt_in
add wave -noupdate /tb_task_2/fltr_task_2_inst/out_reg
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {129600 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 150
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 1
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 2
configure wave -gridperiod 10000
configure wave -griddelta 8
configure wave -timeline 1
configure wave -timelineunits us
update
WaveRestoreZoom {186100 ps} {539300 ps}
