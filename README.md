# Mixed-signal-2-1-Multipler


- [Abstract](#abstract)
- [Reference Circuit Diagram](#reference-circuit-diagram)
- [Circuit Details](#circuit-details)
- [Proposed Methodology](#proposed-methodology)
- [EDA Tools Used](#eda-tools-used)
- [Verilog Code](#verilog-code)
- [Makerchip](#makerchip)
- [Schematics](#schematics)
- [Netlist](#netlist)
- [Output Waveforms](#output-waveforms)
- [Author](#author)
- [Acknowledgements](#acknowledgements)
- [References](#references)




# Abstract
At the start a brief and concise introduction to multiplexer specifically a simplest 2_1 multiplexer is provided with the explanation of the output they will show. A multiplexer can also be referred as a mux in short form and 2_1 mux is the simpler of its kind

# Reference Circuit Diagram
  ![image](https://user-images.githubusercontent.com/100523407/157670111-e50e54ea-1a05-49fa-bbd5-743b4dd0f077.png)
  
  # Circuit Details
   A multiplexer is a combinational type of digital circuits that are used to transfer one of the available input lines to the single output and, which input has to be transferred to the output it will be decided by the state(logic 0 or logic 1) of the select line signal. 2:1 Multiplexer is having two inputs, one select line (to select one of the two input) and a single output
   
# Proposed Methodology   
• Step 1 : Writing Verilog code for 2:1 Multiplxer & simulating on Makerchip

• Step 2 : Model creation on NgVeri

• Step 3 : Schematics creation

• Step 4 : Creating Netlist

• Step 5 : Setting simulation instance parameters on KicadToNgspice converter

• Step 6: Simulation & Verification of results

# EDA Tools Used
**eSim**

It is an Open Source EDA developed by FOSSEE, IIT Bombay. It is used for electronic circuit simulation. It is made by the combination of two software namely NgSpice and KiCAD. For more details refer:

https://esim.fossee.in/home

**NgSpice**

It is an Open Source Software for Spice Simulations. For more details refer:

http://ngspice.sourceforge.net/docs.html

**Makerchip**

It is an Online Web Browser IDE for Verilog/System-verilog/TL-Verilog Simulation. For more details refer:

https://www.makerchip.com/


# Verilog Code

```
// define a module for the design
module Irfan_mux(in1, in2, select, out);

// define input  port
input in1, in2, select;

// define the output port
output out;

// assign one of the inputs to the output based upon select line input
assign out = select ? in2 : in1;
endmodule :Irfan_mux 
```

# Makerchip

```
\TLV_version 1d: tl-x.org
\SV
/* verilator lint_off UNUSED*/  /* verilator lint_off DECLFILENAME*/  /* verilator lint_off BLKSEQ*/  /* verilator lint_off WIDTH*/  /* verilator lint_off SELRANGE*/  /* verilator lint_off PINCONNECTEMPTY*/  /* verilator lint_off DEFPARAM*/  /* verilator lint_off IMPLICIT*/  /* verilator lint_off COMBDLY*/  /* verilator lint_off SYNCASYNCNET*/  /* verilator lint_off UNOPTFLAT */  /* verilator lint_off UNSIGNED*/  /* verilator lint_off CASEINCOMPLETE*/  /* verilator lint_off UNDRIVEN*/  /* verilator lint_off VARHIDDEN*/  /* verilator lint_off CASEX*/  /* verilator lint_off CASEOVERLAP*/  /* verilator lint_off PINMISSING*/    /* verilator lint_off BLKANDNBLK*/  /* verilator lint_off MULTIDRIVEN*/   /* verilator lint_off WIDTHCONCAT*/  /* verilator lint_off ASSIGNDLY*/  /* verilator lint_off MODDUP*/  /* verilator lint_off STMTDLY*/  /* verilator lint_off LITENDIAN*/  /* verilator lint_off INITIALDLY*/  
//Your Verilog/System Verilog Code Starts Here:
// define a module for the design
module mux2_1(in1, in2, select, out);
// define input  port
input in1, in2, select;
// define the output port
output out;
// assign one of the inputs to the output based upon select line input
assign out = select ? in2 : in1;
endmodule :mux2_1  
//Top Module Code Starts here:
    module top(input logic clk, input logic reset, input logic [31:0] cyc_cnt, output logic passed, output logic failed);
        logic  in1;//input
        logic  in2;//input
        logic  select;//input
        logic  out;//output
//The $random() can be replaced if user wants to assign values
        assign in1 = $random();
        assign in2 = $random();
        assign select = $random();
        mux2_1 mux2_1(.in1(in1), .in2(in2), .select(select), .out(out));
    
\TLV
//Add \TLV here if desired                                     
\SV
endmodule
```
Output of Makerchip

![Screenshot (1169)](https://user-images.githubusercontent.com/100523407/157682160-c01e7e24-ec6e-429b-8fc4-c6e9f7ca7984.png)

# Schematics

![Screenshot (1170)](https://user-images.githubusercontent.com/100523407/157688863-c76aca0c-4544-42ef-9ba8-04f2125b785e.png)

# Netlist

```
* /home/mzmdirfan/esim-workspace/mux/mux.cir

* u1  net-_u1-pad1_ net-_u1-pad2_ net-_u1-pad3_ net-_u1-pad4_ irfan_mux
* u3  clk rst in net-_u1-pad1_ net-_u1-pad2_ net-_u1-pad3_ adc_bridge_3
* u2  net-_u1-pad4_ net-_r3-pad1_ dac_bridge_1
* u4  out plot_v1
c1  out gnd 1u
r3  net-_r3-pad1_ out 1k
v2  rst gnd pulse(0 5 0.1m 0.1m 0.1m 1 2)
v1  net-_r1-pad1_ gnd pulse(0 5 0.1m 0.1m 0.1m 1 1000)
v3  in gnd pulse(0 5 0.1m 0.1m 0.1m 2 4)
r1  net-_r1-pad1_ clk 1k
r2  clk gnd 1k
* u6  clk plot_v1
* u5  rst plot_v1
* u7  in plot_v1
a1 [net-_u1-pad1_ ] [net-_u1-pad2_ ] [net-_u1-pad3_ ] [net-_u1-pad4_ ] u1
a2 [clk rst in ] [net-_u1-pad1_ net-_u1-pad2_ net-_u1-pad3_ ] u3
a3 [net-_u1-pad4_ ] [net-_r3-pad1_ ] u2
* Schematic Name:                             irfan_mux, NgSpice Name: irfan_mux
.model u1 irfan_mux(rise_delay=1.0e-9 fall_delay=1.0e-9 input_load=1.0e-12 instance_id=1 ) 
* Schematic Name:                             adc_bridge_3, NgSpice Name: adc_bridge
.model u3 adc_bridge(in_low=1.0 in_high=2.0 rise_delay=1.0e-9 fall_delay=1.0e-9 ) 
* Schematic Name:                             dac_bridge_1, NgSpice Name: dac_bridge
.model u2 dac_bridge(out_low=0.0 out_high=5.0 out_undef=0.5 input_load=1.0e-12 t_rise=1.0e-9 t_fall=1.0e-9 ) 
.tran 0.1e-00 20e-00 0e-00

* Control Statements 
.control
run
print allv > plot_data_v.txt
print alli > plot_data_i.txt
plot v(out)
plot v(clk)
plot v(rst)
plot v(in)
.endc
.end
```

# Output waveforms

![Screenshot (1164)](https://user-images.githubusercontent.com/100523407/157692907-d9fc2c3f-117e-4c9a-a150-4474edd32e4b.png)

![Screenshot (1165)](https://user-images.githubusercontent.com/100523407/157693143-f8a9c8b2-b5e2-49d5-99b0-3381694d0515.png)

![Screenshot (1166)](https://user-images.githubusercontent.com/100523407/157693351-160df6ac-9f07-4b88-8567-5f8df3f5fe18.png)

![Screenshot (1167)](https://user-images.githubusercontent.com/100523407/157693601-45bcc9f5-018e-4bea-9d17-7386bffaa1bd.png)

# Author

Mohamed Irfan

3rd Year B.Tech Electronics and Instrumentation Engg

B. S. Abdur Rahman Crescent Institute Of Science And Technology, Chennai

Mail: mzmdirfan@gmail.com

# Acknowledgements

1.	Kunal Ghosh (Co-Founder, VLSI System Design Pvt. Ltd.)

2.	FOSSEE, IIT Bombay	

3.	Steve Hoover (Founder, Redwood EDA)
	
4.	Sumanto Kar (eSim Team, FOSSEE, IIT Bombay)

# References

https://www.geeksforgeeks.org/multiplexer-design-using-verilog-hdl/

https://microcontrollerslab.com/multiplexer-design-simulation-pspice/

