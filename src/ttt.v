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
	output reg led0;
	output reg led1;
	output reg led2;
	output reg led3;
	output reg led4;
	output reg led5;
	output reg led6;
	output reg led7;
	output reg led8;
	reg [8:0] game_state;
	reg [8:0] p1_state;
	reg [8:0] p2_state;
	wire curr_player;
	wire button_pressed;
	wire new_game;
	wire finished;
	assign button_pressed = (((((((b0 | b1) | b2) | b3) | b4) | b5) | b6) | b7) | b8;
	always @(posedge clk)
		if (reset || new_game) begin
			game_state <= 9'd0;
			p1_state <= 9'd0;
			p2_state <= 9'd0;
		end
		else if (curr_player == 0) begin
			if ((b0 == 1) && (game_state[0] == 0)) begin
				led0 <= 1;
				game_state <= {game_state[8:1], 1'b1};
				p1_state <= {p1_state[8:1], 1'b1};
			end
			else if ((b1 == 1) && (game_state[1] == 0)) begin
				led1 <= 1;
				game_state <= {game_state[8:2], 1'b1, game_state[0]};
				p1_state <= {p1_state[8:2], 1'b1, p1_state[0]};
			end
			else if ((b2 == 1) && (game_state[2] == 0)) begin
				led2 <= 1;
				game_state <= {game_state[8:3], 1'b1, game_state[1:0]};
				p1_state <= {p1_state[8:3], 1'b1, p1_state[1:0]};
			end
			else if ((b3 == 1) && (game_state[3] == 0)) begin
				led3 <= 1;
				game_state <= {game_state[8:4], 1'b1, game_state[2:0]};
				p1_state <= {p1_state[8:4], 1'b1, p1_state[2:0]};
			end
			else if ((b4 == 1) && (game_state[4] == 0)) begin
				led4 <= 1;
				game_state <= {game_state[8:5], 1'b1, game_state[3:0]};
				p1_state <= {p1_state[8:5], 1'b1, p1_state[3:0]};
			end
			else if ((b5 == 1) && (game_state[5] == 0)) begin
				led5 <= 1;
				game_state <= {game_state[8:6], 1'b1, game_state[4:0]};
				p1_state <= {p1_state[8:6], 1'b1, p1_state[4:0]};
			end
			else if ((b6 == 1) && (game_state[6] == 0)) begin
				led6 <= 1;
				game_state <= {game_state[8:7], 1'b1, game_state[5:0]};
				p1_state <= {p1_state[8:7], 1'b1, p1_state[5:0]};
			end
			else if ((b7 == 1) && (game_state[7] == 0)) begin
				led7 <= 1;
				game_state <= {game_state[8], 1'b1, game_state[6:0]};
				p1_state <= {p1_state[8], 1'b1, p1_state[6:0]};
			end
			else if ((b8 == 1) && (game_state[8] == 0)) begin
				led8 <= 1;
				game_state <= {1'b1, game_state[7:0]};
				p1_state <= {1'b1, p1_state[7:0]};
			end
		end
		else if ((b0 == 1) && (game_state[0] == 0)) begin
			led0 <= 1;
			game_state <= {game_state[8:1], 1'b1};
			p1_state <= {p2_state[8:1], 1'b1};
		end
		else if ((b1 == 1) && (game_state[1] == 0)) begin
			led1 <= 1;
			game_state <= {game_state[8:2], 1'b1, game_state[0]};
			p2_state <= {p2_state[8:2], 1'b1, p2_state[0]};
		end
		else if ((b2 == 1) && (game_state[2] == 0)) begin
			led2 <= 1;
			game_state <= {game_state[8:3], 1'b1, game_state[1:0]};
			p2_state <= {p2_state[8:3], 1'b1, p2_state[1:0]};
		end
		else if ((b3 == 1) && (game_state[3] == 0)) begin
			led3 <= 1;
			game_state <= {game_state[8:4], 1'b1, game_state[2:0]};
			p2_state <= {p2_state[8:4], 1'b1, p2_state[2:0]};
		end
		else if ((b4 == 1) && (game_state[4] == 0)) begin
			led4 <= 1;
			game_state <= {game_state[8:5], 1'b1, game_state[3:0]};
			p2_state <= {p2_state[8:5], 1'b1, p2_state[3:0]};
		end
		else if ((b5 == 1) && (game_state[5] == 0)) begin
			led5 <= 1;
			game_state <= {game_state[8:6], 1'b1, game_state[4:0]};
			p2_state <= {p2_state[8:6], 1'b1, p2_state[4:0]};
		end
		else if ((b6 == 1) && (game_state[6] == 0)) begin
			led6 <= 1;
			game_state <= {game_state[8:7], 1'b1, game_state[5:0]};
			p2_state <= {p2_state[8:7], 1'b1, p2_state[5:0]};
		end
		else if ((b7 == 1) && (game_state[7] == 0)) begin
			led7 <= 1;
			game_state <= {game_state[8], 1'b1, game_state[6:0]};
			p2_state <= {p2_state[8], 1'b1, p2_state[6:0]};
		end
		else if ((b8 == 1) && (game_state[8] == 0)) begin
			led8 <= 1;
			game_state <= {1'b1, game_state[7:0]};
			p2_state <= {1'b1, p2_state[7:0]};
		end
	win_detection wd(
		.p1_state(p1_state),
		.p2_state(p2_state),
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
	input wire [8:0] clk;
	input wire [8:0] reset;
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
