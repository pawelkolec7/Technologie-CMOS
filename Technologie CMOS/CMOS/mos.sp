* Asterisk indicates a comment
* Transistor models
.include psp102_nmos.mod
* Circuit definition
M1 VDD Vg VSS VSS NCH L=65n W=200n
VGS Vg VSS DC 1.0V
VDS VDD VSS DC 1.2V
VSS VSS 0 0
* Simulation settings
.options Temp=27.0
.control
let v_plus = 0
repeat 5
alter VGS $&v_plus
dc vds 0 1.2 0.05
let v_plus = v_plus + 0.3
end
plot dc1.i(vds) dc2.i(vds) dc3.i(vds) dc4.i(vds) dc5.i(vds)
.endc
.meas dc result AVG VDS#branch from=0.0 to=1.2
.end