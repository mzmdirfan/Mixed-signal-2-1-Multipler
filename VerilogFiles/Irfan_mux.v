// define a module for the design
module Irfan_mux(in1, in2, select, out);

// define input  port
input in1, in2, select;

// define the output port
output out;

// assign one of the inputs to the output based upon select line input
assign out = select ? in2 : in1;
endmodule :Irfan_mux 

