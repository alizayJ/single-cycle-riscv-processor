//Register file(32x32)
module register_file(
    input  logic  clk, regwrite, 
    input  logic [31:0] instruction,
    input  logic [31:0] W_Data,
    output logic [31:0] RD1, RD2
);
    logic [4:0] A1, A2, A3;
    assign A1 = instruction[19:15]; //A1, A2 = source register, A3 = destination register
    assign A2 = instruction[24:20];
    assign A3 = instruction[11:7];

    logic [31:0] regfile [31:0];   // 32 registers, 32 bits each
    
initial begin
    $readmemb("./reg_file.bin",regfile,0,31);
end
    // READ 
    assign RD1 = regfile[A1];
    assign RD2 = regfile[A2];

    // WRITE 
    always_ff @(posedge clk)
        if (regwrite)
            regfile[A3] <= W_Data;
     initial begin
         $writememb("./reg_file.bin",regfile,0,31);
     end     
endmodule

