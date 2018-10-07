def zynq-connect
  target remote :3333
end

def zynq-fsbl-restart
 mon xilinx_ps7_init
end

def zynq-restart
 mon xilinx_ps7_init
 mon load_image *.elf 0x10000 elf
 mon resume 0
 mon sleep 2000
 mon halt
end
