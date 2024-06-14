module tb();

reg clk, reset, moveFox, moveChicken, moveSeeds, moveFarmer, noMove;

wire win, lose, impossible;
wire [3:0] movement;

Controller dut(
	clk,
	reset,
	moveFox,
	moveChicken,
	moveSeeds,
	moveFarmer,
	noMove,
	movement,
	win,
	lose,
	impossible 
);

always begin
#5 clk = ~clk;
$display("clk=%b, reset=%b,movement=%b, moveFox=%b,moveChicken=%b,moveSeeds=%b,moveFarmer=%b,noMove=%b,win=%b,lose=%b,impossible=%b,  @ %d", clk, reset, movement, moveFox,moveChicken,moveSeeds,moveFarmer,noMove, win, lose, impossible,$time);
#5 clk = ~clk;
end

initial begin
	$display("Start of test");
clk <= 0;
#1
reset <= 1'b1; moveFox <= 1'b0; moveChicken <= 1'b0; moveSeeds <= 1'b0; moveFarmer <= 1'b0; noMove <= 1'b0; #10

//Testing lose cases
$display("Testing lose at beginning");
reset <= 1'b1; moveFox <= 1'b0; moveChicken <= 1'b0; moveSeeds <= 1'b0; moveFarmer <= 1'b0; noMove <= 1'b0; #10

reset <= 1'b0; moveFox <= 1'b1; moveChicken <= 1'b0; moveSeeds <= 1'b0; moveFarmer <= 1'b1; noMove <= 1'b0; #10
reset <= 1'b0; moveFox <= 1'b0; moveChicken <= 1'b0; moveSeeds <= 1'b0; moveFarmer <= 1'b0; noMove <= 1'b1; #10
reset <= 1'b0; moveFox <= 1'b0; moveChicken <= 1'b0; moveSeeds <= 1'b0; moveFarmer <= 1'b0; noMove <= 1'b1; #10

reset <= 1'b1; moveFox <= 1'b0; moveChicken <= 1'b0; moveSeeds <= 1'b0; moveFarmer <= 1'b0; noMove <= 1'b0; #10
reset <= 1'b0; moveFox <= 1'b0; moveChicken <= 1'b0; moveSeeds <= 1'b0; moveFarmer <= 1'b0; noMove <= 1'b1; #10
reset <= 1'b0; moveFox <= 1'b0; moveChicken <= 1'b0; moveSeeds <= 1'b1; moveFarmer <= 1'b1; noMove <= 1'b0; #10

reset <= 1'b1; moveFox <= 1'b0; moveChicken <= 1'b0; moveSeeds <= 1'b0; moveFarmer <= 1'b0; noMove <= 1'b0; #10
reset <= 1'b0; moveFox <= 1'b0; moveChicken <= 1'b0; moveSeeds <= 1'b0; moveFarmer <= 1'b0; noMove <= 1'b1; #10
reset <= 1'b0; moveFox <= 1'b0; moveChicken <= 1'b0; moveSeeds <= 1'b0; moveFarmer <= 1'b1; noMove <= 1'b0; #10
$display("Testing lose in path 1 ");
reset <= 1'b1; moveFox <= 1'b0; moveChicken <= 1'b0; moveSeeds <= 1'b0; moveFarmer <= 1'b0; noMove <= 1'b0; #10
reset <= 1'b0; moveFox <= 1'b0; moveChicken <= 1'b1; moveSeeds <= 1'b0; moveFarmer <= 1'b1; noMove <= 1'b0; #10
reset <= 1'b0; moveFox <= 1'b0; moveChicken <= 1'b0; moveSeeds <= 1'b0; moveFarmer <= 1'b1; noMove <= 1'b0; #10
reset <= 1'b0; moveFox <= 1'b0; moveChicken <= 1'b0; moveSeeds <= 1'b1; moveFarmer <= 1'b1; noMove <= 1'b0; #10
reset <= 1'b0; moveFox <= 1'b0; moveChicken <= 1'b0; moveSeeds <= 1'b0; moveFarmer <= 1'b1; noMove <= 1'b0; #10
$display("Testing lose in path 2 ");
reset <= 1'b1; moveFox <= 1'b0; moveChicken <= 1'b0; moveSeeds <= 1'b0; moveFarmer <= 1'b0; noMove <= 1'b0; #10
reset <= 1'b0; moveFox <= 1'b0; moveChicken <= 1'b1; moveSeeds <= 1'b0; moveFarmer <= 1'b1; noMove <= 1'b0; #10
reset <= 1'b0; moveFox <= 1'b0; moveChicken <= 1'b0; moveSeeds <= 1'b0; moveFarmer <= 1'b1; noMove <= 1'b0; #10
reset <= 1'b0; moveFox <= 1'b1; moveChicken <= 1'b0; moveSeeds <= 1'b0; moveFarmer <= 1'b1; noMove <= 1'b0; #10
reset <= 1'b0; moveFox <= 1'b0; moveChicken <= 1'b0; moveSeeds <= 1'b0; moveFarmer <= 1'b1; noMove <= 1'b0; #10

//Testing win cases
$display("Testing win in path 1 ");
reset <= 1'b1; moveFox <= 1'b0; moveChicken <= 1'b0; moveSeeds <= 1'b0; moveFarmer <= 1'b0; noMove <= 1'b0; #10
reset <= 1'b0; moveFox <= 1'b0; moveChicken <= 1'b1; moveSeeds <= 1'b0; moveFarmer <= 1'b1; noMove <= 1'b0; #10
reset <= 1'b0; moveFox <= 1'b0; moveChicken <= 1'b0; moveSeeds <= 1'b0; moveFarmer <= 1'b1; noMove <= 1'b0; #10
reset <= 1'b0; moveFox <= 1'b1; moveChicken <= 1'b0; moveSeeds <= 1'b0; moveFarmer <= 1'b1; noMove <= 1'b0; #10
reset <= 1'b0; moveFox <= 1'b0; moveChicken <= 1'b1; moveSeeds <= 1'b0; moveFarmer <= 1'b1; noMove <= 1'b0; #10
reset <= 1'b0; moveFox <= 1'b0; moveChicken <= 1'b0; moveSeeds <= 1'b1; moveFarmer <= 1'b1; noMove <= 1'b0; #10
reset <= 1'b0; moveFox <= 1'b0; moveChicken <= 1'b0; moveSeeds <= 1'b0; moveFarmer <= 1'b1; noMove <= 1'b0; #10
reset <= 1'b0; moveFox <= 1'b0; moveChicken <= 1'b1; moveSeeds <= 1'b0; moveFarmer <= 1'b1; noMove <= 1'b0; #10

$display("Testing win in path 2 ");
reset <= 1'b1; moveFox <= 1'b0; moveChicken <= 1'b0; moveSeeds <= 1'b0; moveFarmer <= 1'b0; noMove <= 1'b0; #10
reset <= 1'b0; moveFox <= 1'b0; moveChicken <= 1'b1; moveSeeds <= 1'b0; moveFarmer <= 1'b1; noMove <= 1'b0; #10
reset <= 1'b0; moveFox <= 1'b0; moveChicken <= 1'b0; moveSeeds <= 1'b0; moveFarmer <= 1'b1; noMove <= 1'b0; #10
reset <= 1'b0; moveFox <= 1'b0; moveChicken <= 1'b0; moveSeeds <= 1'b1; moveFarmer <= 1'b1; noMove <= 1'b0; #10
reset <= 1'b0; moveFox <= 1'b0; moveChicken <= 1'b1; moveSeeds <= 1'b0; moveFarmer <= 1'b1; noMove <= 1'b0; #10
reset <= 1'b0; moveFox <= 1'b1; moveChicken <= 1'b0; moveSeeds <= 1'b0; moveFarmer <= 1'b1; noMove <= 1'b0; #10
reset <= 1'b0; moveFox <= 1'b0; moveChicken <= 1'b0; moveSeeds <= 1'b0; moveFarmer <= 1'b1; noMove <= 1'b0; #10
reset <= 1'b0; moveFox <= 1'b0; moveChicken <= 1'b1; moveSeeds <= 1'b0; moveFarmer <= 1'b1; noMove <= 1'b0; #10

$display("Testing no move in middle of path 2 win");
reset <= 1'b0; moveFox <= 1'b0; moveChicken <= 1'b0; moveSeeds <= 1'b0; moveFarmer <= 1'b0; noMove <= 1'b0; #10
reset <= 1'b0; moveFox <= 1'b0; moveChicken <= 1'b1; moveSeeds <= 1'b0; moveFarmer <= 1'b1; noMove <= 1'b0; #10
reset <= 1'b0; moveFox <= 1'b0; moveChicken <= 1'b0; moveSeeds <= 1'b0; moveFarmer <= 1'b1; noMove <= 1'b0; #10
reset <= 1'b0; moveFox <= 1'b0; moveChicken <= 1'b0; moveSeeds <= 1'b1; moveFarmer <= 1'b1; noMove <= 1'b0; #10
reset <= 1'b0; moveFox <= 1'b0; moveChicken <= 1'b1; moveSeeds <= 1'b0; moveFarmer <= 1'b1; noMove <= 1'b0; #10

reset <= 1'b0; moveFox <= 1'b0; moveChicken <= 1'b0; moveSeeds <= 1'b0; moveFarmer <= 1'b0; noMove <= 1'b1; #10

reset <= 1'b0; moveFox <= 1'b1; moveChicken <= 1'b0; moveSeeds <= 1'b0; moveFarmer <= 1'b1; noMove <= 1'b0; #10
reset <= 1'b0; moveFox <= 1'b0; moveChicken <= 1'b0; moveSeeds <= 1'b0; moveFarmer <= 1'b1; noMove <= 1'b0; #10
reset <= 1'b0; moveFox <= 1'b0; moveChicken <= 1'b0; moveSeeds <= 1'b0; moveFarmer <= 1'b1; noMove <= 1'b1; #10
reset <= 1'b0; moveFox <= 1'b0; moveChicken <= 1'b1; moveSeeds <= 1'b0; moveFarmer <= 1'b1; noMove <= 1'b0; #10

$display("Testing impossible inputs");
reset <= 1'b0; moveFox <= 1'b1; moveChicken <= 1'b1; moveSeeds <= 1'b0; moveFarmer <= 1'b1; noMove <= 1'b0; #10
reset <= 1'b0; moveFox <= 1'b1; moveChicken <= 1'b1; moveSeeds <= 1'b1; moveFarmer <= 1'b1; noMove <= 1'b0; #10
reset <= 1'b0; moveFox <= 1'b1; moveChicken <= 1'b1; moveSeeds <= 1'b1; moveFarmer <= 1'b1; noMove <= 1'b0; #10
reset <= 1'b0; moveFox <= 1'b0; moveChicken <= 1'b1; moveSeeds <= 1'b1; moveFarmer <= 1'b1; noMove <= 1'b1; #10

$display("Testing  reset before path 2 win");
reset <= 1'b1; moveFox <= 1'b0; moveChicken <= 1'b0; moveSeeds <= 1'b0; moveFarmer <= 1'b0; noMove <= 1'b0; #10
reset <= 1'b0; moveFox <= 1'b0; moveChicken <= 1'b1; moveSeeds <= 1'b0; moveFarmer <= 1'b1; noMove <= 1'b0; #10
reset <= 1'b0; moveFox <= 1'b0; moveChicken <= 1'b0; moveSeeds <= 1'b0; moveFarmer <= 1'b1; noMove <= 1'b0; #10
reset <= 1'b0; moveFox <= 1'b0; moveChicken <= 1'b0; moveSeeds <= 1'b1; moveFarmer <= 1'b1; noMove <= 1'b0; #10
reset <= 1'b0; moveFox <= 1'b0; moveChicken <= 1'b1; moveSeeds <= 1'b0; moveFarmer <= 1'b1; noMove <= 1'b0; #10

reset <= 1'b1; moveFox <= 1'b0; moveChicken <= 1'b0; moveSeeds <= 1'b0; moveFarmer <= 1'b0; noMove <= 1'b0; #10

reset <= 1'b0; moveFox <= 1'b0; moveChicken <= 1'b1; moveSeeds <= 1'b0; moveFarmer <= 1'b1; noMove <= 1'b0; #10
reset <= 1'b0; moveFox <= 1'b0; moveChicken <= 1'b0; moveSeeds <= 1'b0; moveFarmer <= 1'b1; noMove <= 1'b0; #10
reset <= 1'b0; moveFox <= 1'b0; moveChicken <= 1'b0; moveSeeds <= 1'b1; moveFarmer <= 1'b1; noMove <= 1'b0; #10
reset <= 1'b0; moveFox <= 1'b0; moveChicken <= 1'b1; moveSeeds <= 1'b0; moveFarmer <= 1'b1; noMove <= 1'b0; #10
reset <= 1'b0; moveFox <= 1'b1; moveChicken <= 1'b0; moveSeeds <= 1'b0; moveFarmer <= 1'b1; noMove <= 1'b0; #10
reset <= 1'b0; moveFox <= 1'b0; moveChicken <= 1'b0; moveSeeds <= 1'b0; moveFarmer <= 1'b1; noMove <= 1'b0; #10
reset <= 1'b0; moveFox <= 1'b0; moveChicken <= 1'b1; moveSeeds <= 1'b0; moveFarmer <= 1'b1; noMove <= 1'b0; #10

	$finish;
end
endmodule

