# 
# Synthesis run script generated by Vivado
# 

set_param xicom.use_bs_reader 1
set_msg_config -id {Synth 8-256} -limit 10000
set_msg_config -id {Synth 8-638} -limit 10000
create_project -in_memory -part xc7a35tcpg236-1

set_param project.singleFileAddWarning.threshold 0
set_param project.compositeFile.enableAutoGeneration 0
set_param synth.vivado.isSynthRun true
set_property webtalk.parent_dir C:/Users/gorka/Documents/Repostiorios/Serial-Basys3/TXRX_Servos/TXRX_Servos.cache/wt [current_project]
set_property parent.project_path C:/Users/gorka/Documents/Repostiorios/Serial-Basys3/TXRX_Servos/TXRX_Servos.xpr [current_project]
set_property default_lib xil_defaultlib [current_project]
set_property target_language Verilog [current_project]
set_property board_part digilentinc.com:basys3:part0:1.1 [current_project]
set_property ip_output_repo c:/Users/gorka/Documents/Repostiorios/Serial-Basys3/TXRX_Servos/TXRX_Servos.cache/ip [current_project]
set_property ip_cache_permissions {read write} [current_project]
read_vhdl -library xil_defaultlib {
  C:/Users/gorka/Documents/Repostiorios/Serial-Basys3/TXRX_Servos/TXRX_Servos.srcs/sources_1/new/Data_memoria.vhd
  C:/Users/gorka/Documents/Repostiorios/Serial-Basys3/TXRX_Servos/TXRX_Servos.srcs/sources_1/new/EM_display.vhd
  C:/Users/gorka/Documents/Repostiorios/Serial-Basys3/TXRX_Servos/TXRX_Servos.srcs/sources_1/new/FrekuentziZatitzailea.vhd
  C:/Users/gorka/Documents/Repostiorios/Serial-Basys3/TXRX_Servos/TXRX_Servos.srcs/sources_1/new/PMW_Controller.vhd
  C:/Users/gorka/Documents/Repostiorios/Serial-Basys3/TXRX_Servos/TXRX_Servos.srcs/sources_1/new/display.vhd
  C:/Users/gorka/Documents/Repostiorios/Serial-Basys3/TXRX_Servos/TXRX_Servos.srcs/sources_1/new/divisor_display.vhd
  C:/Users/gorka/Documents/Repostiorios/Serial-Basys3/TXRX_Servos/TXRX_Servos.srcs/sources_1/new/kcuart_rx.vhd
  C:/Users/gorka/Documents/Repostiorios/Serial-Basys3/TXRX_Servos/TXRX_Servos.srcs/sources_1/new/selector.vhd
  C:/Users/gorka/Documents/Repostiorios/Serial-Basys3/TXRX_Servos/TXRX_Servos.srcs/sources_1/new/top.vhd
}
# Mark all dcp files as not used in implementation to prevent them from being
# stitched into the results of this synthesis run. Any black boxes in the
# design are intentionally left as such for best results. Dcp files will be
# stitched into the design at a later time, either when this synthesis run is
# opened, or when it is stitched into a dependent implementation run.
foreach dcp [get_files -quiet -all -filter file_type=="Design\ Checkpoint"] {
  set_property used_in_implementation false $dcp
}
read_xdc {{C:/Users/gorka/Documents/Repostiorios/Serial-Basys3/TXRX_Servos/TXRX_Servos.srcs/constrs_1/imports/Sistema Logiko Programagarriak/Basys3_Master.xdc}}
set_property used_in_implementation false [get_files {{C:/Users/gorka/Documents/Repostiorios/Serial-Basys3/TXRX_Servos/TXRX_Servos.srcs/constrs_1/imports/Sistema Logiko Programagarriak/Basys3_Master.xdc}}]


synth_design -top top -part xc7a35tcpg236-1


write_checkpoint -force -noxdef top.dcp

catch { report_utilization -file top_utilization_synth.rpt -pb top_utilization_synth.pb }
