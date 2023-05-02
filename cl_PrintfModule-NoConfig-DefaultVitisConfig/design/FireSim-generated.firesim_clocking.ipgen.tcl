
create_ip -name clk_wiz \
          -vendor xilinx.com \
          -library ip \
          -version 6.0 \
          -module_name firesim_clocking

set_property -dict [list CONFIG.USE_PHASE_ALIGNMENT {false} \
                         CONFIG.PRIM_SOURCE {No_buffer} \
                         CONFIG.PRIM_IN_FREQ {300.00} \
                         CONFIG.CLKOUT1_REQUESTED_OUT_FREQ $frequency \
                         CONFIG.CLKOUT1_DRIVES {Buffer}] \
             [get_ips firesim_clocking]
