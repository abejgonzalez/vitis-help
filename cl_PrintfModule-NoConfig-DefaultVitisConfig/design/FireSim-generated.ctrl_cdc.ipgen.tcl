create_ip -name axi_clock_converter \
          -vendor xilinx.com \
          -library ip \
          -version 2.1 \
          -module_name ctrl_cdc

set_property -dict [list CONFIG.PROTOCOL {AXI4LITE} \
                         CONFIG.ADDR_WIDTH {12} \
                         CONFIG.SYNCHRONIZATION_STAGES {3} \
                         CONFIG.DATA_WIDTH {32} \
                         CONFIG.ID_WIDTH {1} \
                         CONFIG.AWUSER_WIDTH {0} \
                         CONFIG.ARUSER_WIDTH {0} \
                         CONFIG.RUSER_WIDTH {0} \
                         CONFIG.WUSER_WIDTH {0} \
                         CONFIG.BUSER_WIDTH {0}] \
             [get_ips ctrl_cdc]
