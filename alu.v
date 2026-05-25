
module alu(input [3:0] A,B,sel,output reg [4:0] result);
  always@(*)
    begin
      case(sel)
        4'b0000: result = A+B; //ADD
        4'b0001: result = A-B; //SUB
        4'b0010: result = A&B; //AND
        4'b0011: result = A|B; //OR
        
        4'b0100: result = A^B; //XOR
        4'b0101: result = ~A ; //NOT A
        4'b0110: result = ~(A&B); //NAND
        4'b0111: result = ~(A|B); //NOR
        
        4'b1000: result = ~(A^B); //XNOR
        4'b1001: result = A<<1; // LOGICAL LEFT SHIFT
        4'b1010: result = A>>1; //LOGICAL RIGHT SHIFT
        4'b1011: result = {A[2:0],A[3]}; //ROTATE LEFT
        
        4'b1100: result = {A[0],A[3:1]}; //ROTATE RIGHT
        4'b1101: result = A+1'b1; //INCREMENT A
        4'b1110: result = A-1'b1; //DECREMENT A
        4'b1111: result = (A>B)?5'b00001:5'b00000; //COMPARING IF A>B OR NOT
        default: result = 5'b00000;
      endcase
    end
endmodule