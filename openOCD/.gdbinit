def zynq-connect
  target remote :3333
end

def zynq-fsbl-restart
 mon xilinx_ps7_init
end

def zynq-restart
 mon xilinx_ps7_init
 mon halt
end

