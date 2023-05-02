module Register (
	D,
	en,
	clear,
	clock,
	Q
);
	parameter WIDTH = 3;
	input wire [WIDTH - 1:0] D;
	input wire en;
	input wire clear;
	input wire clock;
	output reg [WIDTH - 1:0] Q;
	always @(posedge clock)
		if (clear)
			Q <= 0;
		else if (en)
			Q <= D;
		else
			Q <= Q;
endmodule
module ttt_game_control (
	b0,
	b1,
	b2,
	b3,
	b4,
	b5,
	b6,
	b7,
	b8,
	player_sel,
	start,
	clk,
	reset,
	led0,
	led1,
	led2,
	led3,
	led4,
	led5,
	led6,
	led7,
	led8
);
	input wire b0;
	input wire b1;
	input wire b2;
	input wire b3;
	input wire b4;
	input wire b5;
	input wire b6;
	input wire b7;
	input wire b8;
	input wire player_sel;
	input wire start;
	input wire clk;
	input wire reset;
	output wire led0;
	output wire led1;
	output wire led2;
	output wire led3;
	output wire led4;
	output wire led5;
	output wire led6;
	output wire led7;
	output wire led8;
	wire [8:0] game_state;
	wire [8:0] p1_state;
	wire [8:0] p2_state;
	reg [8:0] game_state_reg;
	reg [8:0] p1_state_reg;
	reg [8:0] p2_state_reg;
	wire curr_player;
	wire button_pressed;
	wire new_game;
	wire finished;
	reg led0_en;
	reg led1_en;
	reg led2_en;
	reg led3_en;
	reg led4_en;
	reg led5_en;
	reg led6_en;
	reg led7_en;
	reg led8_en;
	reg game_state_en;
	reg p1_state_en;
	reg p2_state_en;
	reg led0_reg;
	reg led1_reg;
	reg led2_reg;
	reg led3_reg;
	reg led4_reg;
	reg led5_reg;
	reg led6_reg;
	reg led7_reg;
	reg led8_reg;
	wire b0_reg0;
	wire b0_reg1;
	wire b1_reg0;
	wire b1_reg1;
	wire b2_reg0;
	wire b2_reg1;
	wire b3_reg0;
	wire b3_reg1;
	wire b4_reg0;
	wire b4_reg1;
	wire b5_reg0;
	wire b5_reg1;
	wire b6_reg0;
	wire b6_reg1;
	wire b7_reg0;
	wire b7_reg1;
	wire b8_reg0;
	wire b8_reg1;
	Register #(.WIDTH(1)) db0_0(
		.D(b0),
		.Q(b0_reg0),
		.en(1),
		.clear(0),
		.clock(clk)
	);
	Register #(.WIDTH(1)) db0_1(
		.D(b0_reg0),
		.Q(b0_reg1),
		.en(1),
		.clear(0),
		.clock(clk)
	);
	Register #(.WIDTH(1)) d1_0(
		.D(b1),
		.Q(b1_reg0),
		.en(1),
		.clear(0),
		.clock(clk)
	);
	Register #(.WIDTH(1)) db1_1(
		.D(b1_reg0),
		.Q(b1_reg1),
		.en(1),
		.clear(0),
		.clock(clk)
	);
	Register #(.WIDTH(1)) db2_0(
		.D(b2),
		.Q(b2_reg0),
		.en(1),
		.clear(0),
		.clock(clk)
	);
	Register #(.WIDTH(1)) db2_1(
		.D(b2_reg0),
		.Q(b2_reg1),
		.en(1),
		.clear(0),
		.clock(clk)
	);
	Register #(.WIDTH(1)) db3_0(
		.D(b3),
		.Q(b3_reg0),
		.en(1),
		.clear(0),
		.clock(clk)
	);
	Register #(.WIDTH(1)) db3_1(
		.D(b3_reg0),
		.Q(b3_reg1),
		.en(1),
		.clear(0),
		.clock(clk)
	);
	Register #(.WIDTH(1)) db4_0(
		.D(b4),
		.Q(b4_reg0),
		.en(1),
		.clear(0),
		.clock(clk)
	);
	Register #(.WIDTH(1)) db4_1(
		.D(b5_reg0),
		.Q(b4_reg1),
		.en(1),
		.clear(0),
		.clock(clk)
	);
	Register #(.WIDTH(1)) db5_0(
		.D(b5),
		.Q(b5_reg0),
		.en(1),
		.clear(0),
		.clock(clk)
	);
	Register #(.WIDTH(1)) db5_1(
		.D(b5_reg0),
		.Q(b5_reg1),
		.en(1),
		.clear(0),
		.clock(clk)
	);
	Register #(.WIDTH(1)) db6_0(
		.D(b6),
		.Q(b6_reg0),
		.en(1),
		.clear(0),
		.clock(clk)
	);
	Register #(.WIDTH(1)) db6_1(
		.D(b6_reg0),
		.Q(b6_reg1),
		.en(1),
		.clear(0),
		.clock(clk)
	);
	Register #(.WIDTH(1)) db7_0(
		.D(b7),
		.Q(b7_reg0),
		.en(1),
		.clear(0),
		.clock(clk)
	);
	Register #(.WIDTH(1)) db7_1(
		.D(b7_reg0),
		.Q(b7_reg1),
		.en(1),
		.clear(0),
		.clock(clk)
	);
	Register #(.WIDTH(1)) db8_0(
		.D(b8),
		.Q(b8_reg0),
		.en(1),
		.clear(0),
		.clock(clk)
	);
	Register #(.WIDTH(1)) db8_1(
		.D(b8_reg0),
		.Q(b8_reg1),
		.en(1),
		.clear(0),
		.clock(clk)
	);
	Register #(.WIDTH(1)) led0_r(
		.D(led0_reg),
		.Q(led0),
		.en(led0_en),
		.clear(0),
		.clock(clk)
	);
	Register #(.WIDTH(1)) led1_r(
		.D(led1_reg),
		.Q(led1),
		.en(led1_en),
		.clear(0),
		.clock(clk)
	);
	Register #(.WIDTH(1)) led2_r(
		.D(led2_reg),
		.Q(led2),
		.en(led2_en),
		.clear(0),
		.clock(clk)
	);
	Register #(.WIDTH(1)) led3_r(
		.D(led3_reg),
		.Q(led3),
		.en(led3_en),
		.clear(0),
		.clock(clk)
	);
	Register #(.WIDTH(1)) led4_r(
		.D(led4_reg),
		.Q(led4),
		.en(led4_en),
		.clear(0),
		.clock(clk)
	);
	Register #(.WIDTH(1)) led5_r(
		.D(led5_reg),
		.Q(led5),
		.en(led5_en),
		.clear(0),
		.clock(clk)
	);
	Register #(.WIDTH(1)) led6_r(
		.D(led6_reg),
		.Q(led6),
		.en(led6_en),
		.clear(0),
		.clock(clk)
	);
	Register #(.WIDTH(1)) led7_r(
		.D(led7_reg),
		.Q(led7),
		.en(led7_en),
		.clear(0),
		.clock(clk)
	);
	Register #(.WIDTH(1)) led8_r(
		.D(led8_reg),
		.Q(led8),
		.en(led8_en),
		.clear(0),
		.clock(clk)
	);
	Register #(.WIDTH(9)) game_state_r(
		.D(game_state_reg),
		.Q(game_state),
		.en(game_state_en),
		.clear(0),
		.clock(clk)
	);
	Register #(.WIDTH(9)) p1_state_r(
		.D(p1_state_reg),
		.Q(p1_state),
		.en(p1_state_en),
		.clear(0),
		.clock(clk)
	);
	Register #(.WIDTH(9)) p2_state_r(
		.D(p2_state_reg),
		.Q(p2_state),
		.en(p2_state_en),
		.clear(0),
		.clock(clk)
	);
	assign button_pressed = (((((((b0_reg1 | b1_reg1) | b2_reg1) | b3_reg1) | b4_reg1) | b5_reg1) | b6_reg1) | b7_reg1) | b8_reg1;
	always @(*) begin
		led0_en = 1'b0;
		led1_en = 1'b0;
		led2_en = 1'b0;
		led3_en = 1'b0;
		led4_en = 1'b0;
		led5_en = 1'b0;
		led6_en = 1'b0;
		led7_en = 1'b0;
		led8_en = 1'b0;
		game_state_en = 1'b0;
		p1_state_en = 1'b0;
		p2_state_en = 1'b0;
		led0_reg = 1'b0;
		led1_reg = 1'b0;
		led2_reg = 1'b0;
		led3_reg = 1'b0;
		led4_reg = 1'b0;
		led5_reg = 1'b0;
		led6_reg = 1'b0;
		led7_reg = 1'b0;
		led8_reg = 1'b0;
		game_state_reg = 9'd0;
		p1_state_reg = 9'd0;
		p2_state_reg = 9'd0;
		if (reset || new_game) begin
			game_state_reg = 9'd0;
			p1_state_reg = 9'd0;
			p2_state_reg = 9'd0;
			game_state_en = 1;
			p1_state_en = 1;
			p2_state_en = 1;
		end
		else if (curr_player == 0) begin
			if ((b0_reg1 == 1) && (game_state[0] == 0)) begin
				led0_reg = 1;
				game_state_reg = {game_state[8:1], 1'b1};
				p1_state_reg = {p1_state[8:1], 1'b1};
				led0_en = 1;
				game_state_en = 1;
				p1_state_en = 1;
			end
			else if ((b1_reg1 == 1) && (game_state[1] == 0)) begin
				led1_reg = 1;
				game_state_reg = {game_state[8:2], 1'b1, game_state[0]};
				p1_state_reg = {p1_state[8:2], 1'b1, p1_state[0]};
				led1_en = 1;
				game_state_en = 1;
				p1_state_en = 1;
			end
			else if ((b2_reg1 == 1) && (game_state[2] == 0)) begin
				led2_reg = 1;
				game_state_reg = {game_state[8:3], 1'b1, game_state[1:0]};
				p1_state_reg = {p1_state[8:3], 1'b1, p1_state[1:0]};
				led2_en = 1;
				game_state_en = 1;
				p1_state_en = 1;
			end
			else if ((b3_reg1 == 1) && (game_state[3] == 0)) begin
				led3_reg = 1;
				game_state_reg = {game_state[8:4], 1'b1, game_state[2:0]};
				p1_state_reg = {p1_state[8:4], 1'b1, p1_state[2:0]};
				led3_en = 1;
				game_state_en = 1;
				p1_state_en = 1;
			end
			else if ((b4_reg1 == 1) && (game_state[4] == 0)) begin
				led4_reg = 1;
				game_state_reg = {game_state[8:5], 1'b1, game_state[3:0]};
				p1_state_reg = {p1_state[8:5], 1'b1, p1_state[3:0]};
				led4_en = 1;
				game_state_en = 1;
				p1_state_en = 1;
			end
			else if ((b5_reg1 == 1) && (game_state[5] == 0)) begin
				led5_reg = 1;
				game_state_reg = {game_state[8:6], 1'b1, game_state[4:0]};
				p1_state_reg = {p1_state[8:6], 1'b1, p1_state[4:0]};
				led5_en = 1;
				game_state_en = 1;
				p1_state_en = 1;
			end
			else if ((b6_reg1 == 1) && (game_state[6] == 0)) begin
				led6_reg = 1;
				game_state_reg = {game_state[8:7], 1'b1, game_state[5:0]};
				p1_state_reg = {p1_state[8:7], 1'b1, p1_state[5:0]};
				led6_en = 1;
				game_state_en = 1;
				p1_state_en = 1;
			end
			else if ((b7_reg1 == 1) && (game_state[7] == 0)) begin
				led7_reg = 1;
				game_state_reg = {game_state[8], 1'b1, game_state[6:0]};
				p1_state_reg = {p1_state[8], 1'b1, p1_state[6:0]};
				led7_en = 1;
				game_state_en = 1;
				p1_state_en = 1;
			end
			else if ((b8_reg1 == 1) && (game_state[8] == 0)) begin
				led8_reg = 1;
				game_state_reg = {1'b1, game_state[7:0]};
				p1_state_reg = {1'b1, p1_state[7:0]};
				led8_en = 1;
				game_state_en = 1;
				p1_state_en = 1;
			end
			else begin
				led0_en = 1'b0;
				led1_en = 1'b0;
				led2_en = 1'b0;
				led3_en = 1'b0;
				led4_en = 1'b0;
				led5_en = 1'b0;
				led6_en = 1'b0;
				led7_en = 1'b0;
				led8_en = 1'b0;
				game_state_en = 1'b0;
				p1_state_en = 1'b0;
				p2_state_en = 1'b0;
				led0_reg = 1'b0;
				led1_reg = 1'b0;
				led2_reg = 1'b0;
				led3_reg = 1'b0;
				led4_reg = 1'b0;
				led5_reg = 1'b0;
				led6_reg = 1'b0;
				led7_reg = 1'b0;
				led8_reg = 1'b0;
				game_state_reg = 9'd0;
				p1_state_reg = 9'd0;
				p2_state_reg = 9'd0;
			end
		end
		else if ((b0_reg1 == 1) && (game_state[0] == 0)) begin
			led0_reg = 1;
			game_state_reg = {game_state[8:1], 1'b1};
			p2_state_reg = {p2_state[8:1], 1'b1};
			led0_en = 1;
			game_state_en = 1;
			p2_state_en = 1;
		end
		else if ((b1_reg1 == 1) && (game_state[1] == 0)) begin
			led1_reg = 1;
			game_state_reg = {game_state[8:2], 1'b1, game_state[0]};
			p2_state_reg = {p2_state[8:2], 1'b1, p2_state[0]};
			led1_en = 1;
			game_state_en = 1;
			p2_state_en = 1;
		end
		else if ((b2_reg1 == 1) && (game_state[2] == 0)) begin
			led2_reg = 1;
			game_state_reg = {game_state[8:3], 1'b1, game_state[1:0]};
			p2_state_reg = {p2_state[8:3], 1'b1, p2_state[1:0]};
			led2_en = 1;
			game_state_en = 1;
			p2_state_en = 1;
		end
		else if ((b3_reg1 == 1) && (game_state[3] == 0)) begin
			led3_reg = 1;
			game_state_reg = {game_state[8:4], 1'b1, game_state[2:0]};
			p2_state_reg = {p2_state[8:4], 1'b1, p2_state[2:0]};
			led3_en = 1;
			game_state_en = 1;
			p2_state_en = 1;
		end
		else if ((b4_reg1 == 1) && (game_state[4] == 0)) begin
			led4_reg = 1;
			game_state_reg = {game_state[8:5], 1'b1, game_state[3:0]};
			p2_state_reg = {p2_state[8:5], 1'b1, p2_state[3:0]};
			led4_en = 1;
			game_state_en = 1;
			p2_state_en = 1;
		end
		else if ((b5_reg1 == 1) && (game_state[5] == 0)) begin
			led5_reg = 1;
			game_state_reg = {game_state[8:6], 1'b1, game_state[4:0]};
			p2_state_reg = {p2_state[8:6], 1'b1, p2_state[4:0]};
			led5_en = 1;
			game_state_en = 1;
			p2_state_en = 1;
		end
		else if ((b6_reg1 == 1) && (game_state[6] == 0)) begin
			led6_reg = 1;
			game_state_reg = {game_state[8:7], 1'b1, game_state[5:0]};
			p2_state_reg = {p2_state[8:7], 1'b1, p2_state[5:0]};
			led6_en = 1;
			game_state_en = 1;
			p2_state_en = 1;
		end
		else if ((b7_reg1 == 1) && (game_state[7] == 0)) begin
			led7_reg = 1;
			game_state_reg = {game_state[8], 1'b1, game_state[6:0]};
			p2_state_reg = {p2_state[8], 1'b1, p2_state[6:0]};
			led7_en = 1;
			game_state_en = 1;
			p2_state_en = 1;
		end
		else if ((b8_reg1 == 1) && (game_state[8] == 0)) begin
			led8_reg = 1;
			game_state_reg = {1'b1, game_state[7:0]};
			p2_state_reg = {1'b1, p2_state[7:0]};
			led8_en = 1;
			game_state_en = 1;
			p2_state_en = 1;
		end
		else begin
			led0_en = 1'b0;
			led1_en = 1'b0;
			led2_en = 1'b0;
			led3_en = 1'b0;
			led4_en = 1'b0;
			led5_en = 1'b0;
			led6_en = 1'b0;
			led7_en = 1'b0;
			led8_en = 1'b0;
			game_state_en = 1'b0;
			p1_state_en = 1'b0;
			p2_state_en = 1'b0;
			led0_reg = 1'b0;
			led1_reg = 1'b0;
			led2_reg = 1'b0;
			led3_reg = 1'b0;
			led4_reg = 1'b0;
			led5_reg = 1'b0;
			led6_reg = 1'b0;
			led7_reg = 1'b0;
			led8_reg = 1'b0;
			game_state_reg = 9'd0;
			p1_state_reg = 9'd0;
			p2_state_reg = 9'd0;
		end
	end
	win_detection wd(
		.p1_state(p1_state_reg),
		.p2_state(p2_state_reg),
		.clk(clk),
		.reset(reset),
		.finished(finished)
	);
	ttt_fsm fsm(
		.start(start),
		.button_pressed(button_pressed),
		.finished(finished),
		.clk(clk),
		.reset(reset),
		.curr_player(curr_player),
		.new_game(new_game)
	);
endmodule
module win_detection (
	p1_state,
	p2_state,
	clk,
	reset,
	finished
);
	input wire [8:0] p1_state;
	input wire [8:0] p2_state;
	input wire clk;
	input wire reset;
	output reg finished;
	always @(*)
		if (((p1_state[0] == 1) && (p1_state[1] == 1)) && (p1_state[2] == 1))
			finished = 1;
		else if (((p1_state[3] == 1) && (p1_state[4] == 1)) && (p1_state[5] == 1))
			finished = 1;
		else if (((p1_state[6] == 1) && (p1_state[7] == 1)) && (p1_state[8] == 1))
			finished = 1;
		else if (((p1_state[0] == 1) && (p1_state[3] == 1)) && (p1_state[6] == 1))
			finished = 1;
		else if (((p1_state[1] == 1) && (p1_state[4] == 1)) && (p1_state[7] == 1))
			finished = 1;
		else if (((p1_state[2] == 1) && (p1_state[5] == 1)) && (p1_state[8] == 1))
			finished = 1;
		else if (((p1_state[0] == 1) && (p1_state[4] == 1)) && (p1_state[8] == 1))
			finished = 1;
		else if (((p1_state[2] == 1) && (p1_state[4] == 1)) && (p1_state[6] == 1))
			finished = 1;
		else if (((p2_state[0] == 1) && (p2_state[1] == 1)) && (p2_state[2] == 1))
			finished = 1;
		else if (((p2_state[3] == 1) && (p2_state[4] == 1)) && (p2_state[5] == 1))
			finished = 1;
		else if (((p2_state[6] == 1) && (p2_state[7] == 1)) && (p2_state[8] == 1))
			finished = 1;
		else if (((p2_state[0] == 1) && (p2_state[3] == 1)) && (p2_state[6] == 1))
			finished = 1;
		else if (((p2_state[1] == 1) && (p2_state[4] == 1)) && (p2_state[7] == 1))
			finished = 1;
		else if (((p2_state[2] == 1) && (p2_state[5] == 1)) && (p2_state[8] == 1))
			finished = 1;
		else if (((p2_state[0] == 1) && (p2_state[4] == 1)) && (p2_state[8] == 1))
			finished = 1;
		else if (((p2_state[2] == 1) && (p2_state[4] == 1)) && (p2_state[6] == 1))
			finished = 1;
		else
			finished = 0;
endmodule
module ttt_fsm (
	start,
	button_pressed,
	finished,
	clk,
	reset,
	curr_player,
	new_game
);
	input wire start;
	input wire button_pressed;
	input wire finished;
	input wire clk;
	input wire reset;
	output reg curr_player;
	output reg new_game;
	reg [1:0] state;
	reg [1:0] nextState;
	always @(*) begin
		new_game = 0;
		case (state)
			2'd0: begin
				curr_player = 0;
				if (start)
					nextState = 2'd1;
				else
					nextState = 2'd0;
			end
			2'd1:
				if (finished) begin
					curr_player = 0;
					nextState = 2'd3;
				end
				else if (button_pressed) begin
					curr_player = 1;
					nextState = 2'd2;
				end
				else begin
					curr_player = 0;
					nextState = 2'd1;
				end
			2'd2:
				if (finished) begin
					curr_player = 0;
					nextState = 2'd3;
				end
				else if (button_pressed) begin
					curr_player = 0;
					nextState = 2'd1;
				end
				else begin
					curr_player = 1;
					nextState = 2'd2;
				end
			2'd3: begin
				curr_player = 0;
				new_game = 1;
				nextState = 2'd0;
			end
		endcase
	end
	always @(posedge clk)
		if (reset)
			state <= 2'd0;
		else
			state <= nextState;
endmodule
