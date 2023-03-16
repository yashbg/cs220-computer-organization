// `timescale 1ns/1ns
// module up_down_counter (
//     clk,reset,Up,count
// );
// input clk,reset,Up;
// output reg [3:0]count=0;
// parameter W=50000000;
// reg [31:0] inti_counti;
// always @(negedge(clk) or posedge(reset) )begin
// if(reset)
// begin
// inti_counti=32'b0;
// end
// else
// begin
// if(inti_counti==W)
// begin
// inti_counti=32'b0;
// end
// else
// begin
// inti_counti=inti_counti+1;
// end
// end
// end
// always @(negedge(clk) or posedge(reset) )begin
//     if(reset==1)
//     begin
//         count=0;

//     end
//     else
//     begin
//    if(inti_counti==W)
// begin
//         if(Up==1)
//         begin
//           if(count==15)count=0;
//           else count=count+1;
//         end
//         else
//         begin
//             if(count==0)count=15;
//             else count=count-1;
//         end
//     end
// else
// begin
// count=count;
// end
// end
// end

// endmodule



module mod_async_10(q, clk, reset, t);

output [3:0] q;
input clk, reset, t;

// TFF tff0(q[0], clk, reset, t);
// TFF tff1(q[1], q[0], reset, t);
// TFF tff2(q[2], q[1], reset, t);
// TFF tff3(q[3], q[2], reset, t);
endmodule

module TFF(q, clk, reset, t);

output q;
input clk, reset, t;
wire d;

DFF dff0(q,d, clk, reset);
assign d= ^q;
endmodule

module DFF(q, d, clk, reset);

output q;
input d, clk, reset;
reg q;
always@(posedge reset or negedge clk)
begin
    if(reset)
        q<=1'b0;
    else
        q<=d;
end

endmodule