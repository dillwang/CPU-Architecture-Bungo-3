module LUT (
    input       [3:0]		LutPointer,
    output logic[9:0]       absaddress
);

// 2**4 entries

logic[9:0] core [2**4];

initial							    // load the program
    $readmemb("C:/Users/dillw/Downloads/257613734/257611410/ass/output_jmps.txt", core);

assign absaddress = core[LutPointer];

endmodule
