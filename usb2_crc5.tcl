clear -all
analyze -sv12 -f design.f
elaborate -top crc5_gen
clock -none
reset -none
prove -all
report -results

