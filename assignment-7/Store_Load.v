// Amrit kumar --190122
// Yash Gupta ---190997


module Store_Load(
  input  reset,
  input [9:0] PC, 
  input [31:0] Data_Value,
  input [31:0] Address,
  input [31:0] Instruction,
  input Opcode_Data,
  output reg [31:0] Dataout
);

  wire [15:0] Offset;
  assign Offset= Instruction[15:0];

// wire [31:0] Data1, Data2;
// assign Data1= Register[Instruction[25:21]];
// assign Data2= Register[Instruction[20:16]];

  reg [31:0] Data_Memory [0:1023];

	integer i;
	initial begin
		for (i=0; i < 1024; i++) begin
      Data_Memory[i] = 0;
		end
    Data_Memory[0] = 32'd7;
    Data_Memory[1] = 32'd3;
    Data_Memory[2] = 32'd8;
    Data_Memory[3] = 32'd4;
    Data_Memory[4] = 32'd2;
    Data_Memory[5] = 32'd5;
	end


	always @(reset or Data_Value or Address or Offset or Opcode_Data) begin
    if (reset == 1) begin
      for (i = 0; i < 1024; i = i + 1)
        Data_Memory[i] = 0;
    end
    else begin
      if (Opcode_Data) begin
        Data_Memory[Address[9:0] + Offset[9:0]] = Data_Value;
        $display("Data_Memory[%d] %d", Address[9:0] + Offset[9:0], Data_Memory[Address[9:0] + Offset[9:0]] );
      end
      else if (Opcode_Data == 1'b0) begin
        Dataout = Data_Memory[Address[9:0] + Offset[9:0]];
      end
	  end

  end

endmodule