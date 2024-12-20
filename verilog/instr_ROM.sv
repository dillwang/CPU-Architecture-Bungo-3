// lookup table
// deep 
// 9 bits wide; as deep as you wish
module instr_ROM #(parameter D=10)(
  input       [D-1:0] prog_ctr,    // prog_ctr	  address pointer
  output logic[8:0] mach_code);

  logic[8:0] core[2**D]; // 2^10 entries? we should be fine.
  initial							    // load the program
    $readmemb("C:/Users/dillw/Downloads/257613734/257611410/ass/output_code.txt",core);

  always_comb mach_code = core[prog_ctr];

endmodule