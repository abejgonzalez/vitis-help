module MCRFile(
  input         clock,
  input         reset,
  output        io_nasti_aw_ready,
  input         io_nasti_aw_valid,
  input  [7:0]  io_nasti_aw_bits_len,
  input         io_nasti_aw_bits_id,
  output        io_nasti_w_ready,
  input         io_nasti_w_valid,
  input  [31:0] io_nasti_w_bits_data,
  input         io_nasti_b_ready,
  output        io_nasti_b_valid,
  output        io_nasti_b_bits_id,
  output        io_nasti_ar_ready,
  input         io_nasti_ar_valid,
  input  [7:0]  io_nasti_ar_bits_len,
  input         io_nasti_ar_bits_id,
  input         io_nasti_r_ready,
  output        io_nasti_r_valid,
  output [31:0] io_nasti_r_bits_data,
  output        io_nasti_r_bits_id,
  input  [31:0] io_mcr_read_0_bits,
  output        io_mcr_write_0_valid,
  output [31:0] io_mcr_write_0_bits
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
  reg [31:0] _RAND_5;
  reg [31:0] _RAND_6;
`endif // RANDOMIZE_REG_INIT
  reg  arFired; // @[Lib.scala 317:26]
  reg  awFired; // @[Lib.scala 318:26]
  reg  wFired; // @[Lib.scala 319:26]
  reg  wCommited; // @[Lib.scala 320:26]
  reg  bId; // @[Lib.scala 321:22]
  reg  rId; // @[Lib.scala 322:22]
  reg [31:0] wData; // @[Lib.scala 324:22]
  wire  _T = io_nasti_aw_ready & io_nasti_aw_valid; // @[Decoupled.scala 51:35]
  wire  _T_3 = ~reset; // @[Lib.scala 333:11]
  wire  _GEN_0 = _T | awFired; // @[Lib.scala 329:26 330:13 318:26]
  wire  _T_5 = io_nasti_w_ready & io_nasti_w_valid; // @[Decoupled.scala 51:35]
  wire  _GEN_3 = _T_5 | wFired; // @[Lib.scala 336:25 337:12 319:26]
  wire  _T_6 = io_nasti_ar_ready & io_nasti_ar_valid; // @[Decoupled.scala 51:35]
  wire  _GEN_6 = _T_6 | arFired; // @[Lib.scala 342:26 343:13 317:26]
  wire  _T_11 = io_nasti_r_ready & io_nasti_r_valid; // @[Decoupled.scala 51:35]
  wire  _T_12 = io_nasti_b_ready & io_nasti_b_valid; // @[Decoupled.scala 51:35]
  wire  _GEN_12 = _T_12 ? 1'h0 : wCommited; // @[Lib.scala 353:25 356:15 320:26]
  wire  _GEN_13 = io_mcr_write_0_valid | _GEN_12; // @[Lib.scala 359:35 360:15]
  wire  _io_mcr_write_0_valid_T = awFired & wFired; // @[Lib.scala 364:41]
  assign io_nasti_aw_ready = ~awFired; // @[Lib.scala 376:24]
  assign io_nasti_w_ready = ~wFired; // @[Lib.scala 377:24]
  assign io_nasti_b_valid = _io_mcr_write_0_valid_T & wCommited; // @[Lib.scala 373:41]
  assign io_nasti_b_bits_id = bId; // @[nasti.scala 228:17 229:10]
  assign io_nasti_ar_ready = ~arFired; // @[Lib.scala 375:24]
  assign io_nasti_r_valid = arFired; // @[Lib.scala 370:31]
  assign io_nasti_r_bits_data = io_mcr_read_0_bits; // @[nasti.scala 216:17 218:12]
  assign io_nasti_r_bits_id = rId; // @[nasti.scala 216:17 217:10]
  assign io_mcr_write_0_valid = awFired & wFired & ~wCommited; // @[Lib.scala 364:51]
  assign io_mcr_write_0_bits = wData; // @[Lib.scala 363:58]
  always @(posedge clock) begin
    if (reset) begin // @[Lib.scala 317:26]
      arFired <= 1'h0; // @[Lib.scala 317:26]
    end else if (_T_11) begin // @[Lib.scala 349:25]
      arFired <= 1'h0; // @[Lib.scala 350:13]
    end else begin
      arFired <= _GEN_6;
    end
    if (reset) begin // @[Lib.scala 318:26]
      awFired <= 1'h0; // @[Lib.scala 318:26]
    end else if (_T_12) begin // @[Lib.scala 353:25]
      awFired <= 1'h0; // @[Lib.scala 354:15]
    end else begin
      awFired <= _GEN_0;
    end
    if (reset) begin // @[Lib.scala 319:26]
      wFired <= 1'h0; // @[Lib.scala 319:26]
    end else if (_T_12) begin // @[Lib.scala 353:25]
      wFired <= 1'h0; // @[Lib.scala 355:15]
    end else begin
      wFired <= _GEN_3;
    end
    if (reset) begin // @[Lib.scala 320:26]
      wCommited <= 1'h0; // @[Lib.scala 320:26]
    end else begin
      wCommited <= _GEN_13;
    end
    if (_T) begin // @[Lib.scala 329:26]
      bId <= io_nasti_aw_bits_id; // @[Lib.scala 332:13]
    end
    if (_T_6) begin // @[Lib.scala 342:26]
      rId <= io_nasti_ar_bits_id; // @[Lib.scala 345:13]
    end
    if (_T_5) begin // @[Lib.scala 336:25]
      wData <= io_nasti_w_bits_data; // @[Lib.scala 338:12]
    end
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T & ~reset & ~(io_nasti_aw_bits_len == 8'h0)) begin
          $fwrite(32'h80000002,"Assertion failed\n    at Lib.scala:333 assert(io.nasti.aw.bits.len === 0.U)\n"); // @[Lib.scala 333:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_6 & _T_3 & ~(io_nasti_ar_bits_len == 8'h0)) begin
          $fwrite(32'h80000002,
            "Assertion failed: MCRFile only support single beat reads\n    at Lib.scala:346 assert(io.nasti.ar.bits.len === 0.U, \"MCRFile only support single beat reads\")\n"
            ); // @[Lib.scala 346:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  arFired = _RAND_0[0:0];
  _RAND_1 = {1{`RANDOM}};
  awFired = _RAND_1[0:0];
  _RAND_2 = {1{`RANDOM}};
  wFired = _RAND_2[0:0];
  _RAND_3 = {1{`RANDOM}};
  wCommited = _RAND_3[0:0];
  _RAND_4 = {1{`RANDOM}};
  bId = _RAND_4[0:0];
  _RAND_5 = {1{`RANDOM}};
  rId = _RAND_5[0:0];
  _RAND_6 = {1{`RANDOM}};
  wData = _RAND_6[31:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
  always @(posedge clock) begin
    //
    if (_T & ~reset) begin
      assert(io_nasti_aw_bits_len == 8'h0); // @[Lib.scala 333:11]
    end
    //
    if (_T_6 & _T_3) begin
      assert(io_nasti_ar_bits_len == 8'h0); // @[Lib.scala 346:11]
    end
  end
endmodule
module SimulationMaster(
  input         clock,
  input         reset,
  output        io_ctrl_aw_ready,
  input         io_ctrl_aw_valid,
  input  [7:0]  io_ctrl_aw_bits_len,
  input         io_ctrl_aw_bits_id,
  output        io_ctrl_w_ready,
  input         io_ctrl_w_valid,
  input  [31:0] io_ctrl_w_bits_data,
  input         io_ctrl_b_ready,
  output        io_ctrl_b_valid,
  output        io_ctrl_b_bits_id,
  output        io_ctrl_ar_ready,
  input         io_ctrl_ar_valid,
  input  [7:0]  io_ctrl_ar_bits_len,
  input         io_ctrl_ar_bits_id,
  input         io_ctrl_r_ready,
  output        io_ctrl_r_valid,
  output [31:0] io_ctrl_r_bits_data,
  output        io_ctrl_r_bits_id
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
`endif // RANDOMIZE_REG_INIT
  wire  crFile_clock; // @[Widget.scala 166:24]
  wire  crFile_reset; // @[Widget.scala 166:24]
  wire  crFile_io_nasti_aw_ready; // @[Widget.scala 166:24]
  wire  crFile_io_nasti_aw_valid; // @[Widget.scala 166:24]
  wire [7:0] crFile_io_nasti_aw_bits_len; // @[Widget.scala 166:24]
  wire  crFile_io_nasti_aw_bits_id; // @[Widget.scala 166:24]
  wire  crFile_io_nasti_w_ready; // @[Widget.scala 166:24]
  wire  crFile_io_nasti_w_valid; // @[Widget.scala 166:24]
  wire [31:0] crFile_io_nasti_w_bits_data; // @[Widget.scala 166:24]
  wire  crFile_io_nasti_b_ready; // @[Widget.scala 166:24]
  wire  crFile_io_nasti_b_valid; // @[Widget.scala 166:24]
  wire  crFile_io_nasti_b_bits_id; // @[Widget.scala 166:24]
  wire  crFile_io_nasti_ar_ready; // @[Widget.scala 166:24]
  wire  crFile_io_nasti_ar_valid; // @[Widget.scala 166:24]
  wire [7:0] crFile_io_nasti_ar_bits_len; // @[Widget.scala 166:24]
  wire  crFile_io_nasti_ar_bits_id; // @[Widget.scala 166:24]
  wire  crFile_io_nasti_r_ready; // @[Widget.scala 166:24]
  wire  crFile_io_nasti_r_valid; // @[Widget.scala 166:24]
  wire [31:0] crFile_io_nasti_r_bits_data; // @[Widget.scala 166:24]
  wire  crFile_io_nasti_r_bits_id; // @[Widget.scala 166:24]
  wire [31:0] crFile_io_mcr_read_0_bits; // @[Widget.scala 166:24]
  wire  crFile_io_mcr_write_0_valid; // @[Widget.scala 166:24]
  wire [31:0] crFile_io_mcr_write_0_bits; // @[Widget.scala 166:24]
  reg [6:0] initDelay; // @[Master.scala 17:28]
  wire [6:0] _initDelay_T_1 = initDelay - 7'h1; // @[Master.scala 18:55]
  wire  _T_1 = initDelay == 7'h0; // @[Master.scala 19:28]
  reg [31:0] INIT_DONE; // @[Widget.scala 127:33]
  MCRFile crFile ( // @[Widget.scala 166:24]
    .clock(crFile_clock),
    .reset(crFile_reset),
    .io_nasti_aw_ready(crFile_io_nasti_aw_ready),
    .io_nasti_aw_valid(crFile_io_nasti_aw_valid),
    .io_nasti_aw_bits_len(crFile_io_nasti_aw_bits_len),
    .io_nasti_aw_bits_id(crFile_io_nasti_aw_bits_id),
    .io_nasti_w_ready(crFile_io_nasti_w_ready),
    .io_nasti_w_valid(crFile_io_nasti_w_valid),
    .io_nasti_w_bits_data(crFile_io_nasti_w_bits_data),
    .io_nasti_b_ready(crFile_io_nasti_b_ready),
    .io_nasti_b_valid(crFile_io_nasti_b_valid),
    .io_nasti_b_bits_id(crFile_io_nasti_b_bits_id),
    .io_nasti_ar_ready(crFile_io_nasti_ar_ready),
    .io_nasti_ar_valid(crFile_io_nasti_ar_valid),
    .io_nasti_ar_bits_len(crFile_io_nasti_ar_bits_len),
    .io_nasti_ar_bits_id(crFile_io_nasti_ar_bits_id),
    .io_nasti_r_ready(crFile_io_nasti_r_ready),
    .io_nasti_r_valid(crFile_io_nasti_r_valid),
    .io_nasti_r_bits_data(crFile_io_nasti_r_bits_data),
    .io_nasti_r_bits_id(crFile_io_nasti_r_bits_id),
    .io_mcr_read_0_bits(crFile_io_mcr_read_0_bits),
    .io_mcr_write_0_valid(crFile_io_mcr_write_0_valid),
    .io_mcr_write_0_bits(crFile_io_mcr_write_0_bits)
  );
  assign io_ctrl_aw_ready = crFile_io_nasti_aw_ready; // @[Widget.scala 168:21]
  assign io_ctrl_w_ready = crFile_io_nasti_w_ready; // @[Widget.scala 168:21]
  assign io_ctrl_b_valid = crFile_io_nasti_b_valid; // @[Widget.scala 168:21]
  assign io_ctrl_b_bits_id = crFile_io_nasti_b_bits_id; // @[Widget.scala 168:21]
  assign io_ctrl_ar_ready = crFile_io_nasti_ar_ready; // @[Widget.scala 168:21]
  assign io_ctrl_r_valid = crFile_io_nasti_r_valid; // @[Widget.scala 168:21]
  assign io_ctrl_r_bits_data = crFile_io_nasti_r_bits_data; // @[Widget.scala 168:21]
  assign io_ctrl_r_bits_id = crFile_io_nasti_r_bits_id; // @[Widget.scala 168:21]
  assign crFile_clock = clock;
  assign crFile_reset = reset;
  assign crFile_io_nasti_aw_valid = io_ctrl_aw_valid; // @[Widget.scala 168:21]
  assign crFile_io_nasti_aw_bits_len = io_ctrl_aw_bits_len; // @[Widget.scala 168:21]
  assign crFile_io_nasti_aw_bits_id = io_ctrl_aw_bits_id; // @[Widget.scala 168:21]
  assign crFile_io_nasti_w_valid = io_ctrl_w_valid; // @[Widget.scala 168:21]
  assign crFile_io_nasti_w_bits_data = io_ctrl_w_bits_data; // @[Widget.scala 168:21]
  assign crFile_io_nasti_b_ready = io_ctrl_b_ready; // @[Widget.scala 168:21]
  assign crFile_io_nasti_ar_valid = io_ctrl_ar_valid; // @[Widget.scala 168:21]
  assign crFile_io_nasti_ar_bits_len = io_ctrl_ar_bits_len; // @[Widget.scala 168:21]
  assign crFile_io_nasti_ar_bits_id = io_ctrl_ar_bits_id; // @[Widget.scala 168:21]
  assign crFile_io_nasti_r_ready = io_ctrl_r_ready; // @[Widget.scala 168:21]
  assign crFile_io_mcr_read_0_bits = INIT_DONE; // @[Lib.scala 288:24]
  always @(posedge clock) begin
    if (reset) begin // @[Master.scala 17:28]
      initDelay <= 7'h40; // @[Master.scala 17:28]
    end else if (initDelay != 7'h0) begin // @[Master.scala 18:30]
      initDelay <= _initDelay_T_1; // @[Master.scala 18:42]
    end
    if (reset) begin // @[Widget.scala 127:33]
      INIT_DONE <= 32'h0; // @[Widget.scala 127:33]
    end else if (crFile_io_mcr_write_0_valid) begin // @[Lib.scala 280:32]
      INIT_DONE <= crFile_io_mcr_write_0_bits; // @[Lib.scala 281:18]
    end else begin
      INIT_DONE <= {{31'd0}, _T_1}; // @[Widget.scala 129:44]
    end
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  initDelay = _RAND_0[6:0];
  _RAND_1 = {1{`RANDOM}};
  INIT_DONE = _RAND_1[31:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module MCRFile_1(
  input         clock,
  input         reset,
  output        io_nasti_aw_ready,
  input         io_nasti_aw_valid,
  input  [11:0] io_nasti_aw_bits_addr,
  input  [7:0]  io_nasti_aw_bits_len,
  input         io_nasti_aw_bits_id,
  output        io_nasti_w_ready,
  input         io_nasti_w_valid,
  input  [31:0] io_nasti_w_bits_data,
  input         io_nasti_b_ready,
  output        io_nasti_b_valid,
  output        io_nasti_b_bits_id,
  output        io_nasti_ar_ready,
  input         io_nasti_ar_valid,
  input  [11:0] io_nasti_ar_bits_addr,
  input  [7:0]  io_nasti_ar_bits_len,
  input         io_nasti_ar_bits_id,
  input         io_nasti_r_ready,
  output        io_nasti_r_valid,
  output [31:0] io_nasti_r_bits_data,
  output        io_nasti_r_bits_id,
  input  [31:0] io_mcr_read_0_bits,
  input  [31:0] io_mcr_read_1_bits,
  output        io_mcr_read_2_ready,
  input  [31:0] io_mcr_read_2_bits,
  input  [31:0] io_mcr_read_3_bits,
  input  [31:0] io_mcr_read_4_bits,
  output        io_mcr_read_5_ready,
  input  [31:0] io_mcr_read_5_bits,
  output        io_mcr_write_0_valid,
  output [31:0] io_mcr_write_0_bits,
  output        io_mcr_write_1_valid,
  output [31:0] io_mcr_write_1_bits,
  output        io_mcr_write_2_valid,
  output [31:0] io_mcr_write_2_bits,
  output        io_mcr_write_3_valid,
  output [31:0] io_mcr_write_3_bits,
  output        io_mcr_write_4_valid,
  output [31:0] io_mcr_write_4_bits,
  output        io_mcr_write_5_valid,
  output [31:0] io_mcr_write_5_bits
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
  reg [31:0] _RAND_5;
  reg [31:0] _RAND_6;
  reg [31:0] _RAND_7;
  reg [31:0] _RAND_8;
`endif // RANDOMIZE_REG_INIT
  reg  arFired; // @[Lib.scala 317:26]
  reg  awFired; // @[Lib.scala 318:26]
  reg  wFired; // @[Lib.scala 319:26]
  reg  wCommited; // @[Lib.scala 320:26]
  reg  bId; // @[Lib.scala 321:22]
  reg  rId; // @[Lib.scala 322:22]
  reg [31:0] wData; // @[Lib.scala 324:22]
  reg [2:0] wIndex; // @[Lib.scala 325:22]
  reg [2:0] rIndex; // @[Lib.scala 326:22]
  wire  _T = io_nasti_aw_ready & io_nasti_aw_valid; // @[Decoupled.scala 51:35]
  wire  _T_3 = ~reset; // @[Lib.scala 333:11]
  wire  _GEN_0 = _T | awFired; // @[Lib.scala 329:26 330:13 318:26]
  wire [9:0] _GEN_1 = _T ? io_nasti_aw_bits_addr[11:2] : {{7'd0}, wIndex}; // @[Lib.scala 329:26 331:13 325:22]
  wire  _T_5 = io_nasti_w_ready & io_nasti_w_valid; // @[Decoupled.scala 51:35]
  wire  _GEN_3 = _T_5 | wFired; // @[Lib.scala 336:25 337:12 319:26]
  wire  _T_6 = io_nasti_ar_ready & io_nasti_ar_valid; // @[Decoupled.scala 51:35]
  wire  _GEN_6 = _T_6 | arFired; // @[Lib.scala 342:26 343:13 317:26]
  wire  _T_11 = io_nasti_r_ready & io_nasti_r_valid; // @[Decoupled.scala 51:35]
  wire  _T_12 = io_nasti_b_ready & io_nasti_b_valid; // @[Decoupled.scala 51:35]
  wire  _GEN_12 = _T_12 ? 1'h0 : wCommited; // @[Lib.scala 353:25 356:15 320:26]
  wire  _GEN_20 = 3'h1 == wIndex ? io_mcr_write_1_valid : io_mcr_write_0_valid; // @[Decoupled.scala 51:{35,35}]
  wire  _GEN_21 = 3'h2 == wIndex ? io_mcr_write_2_valid : _GEN_20; // @[Decoupled.scala 51:{35,35}]
  wire  _GEN_22 = 3'h3 == wIndex ? io_mcr_write_3_valid : _GEN_21; // @[Decoupled.scala 51:{35,35}]
  wire  _GEN_23 = 3'h4 == wIndex ? io_mcr_write_4_valid : _GEN_22; // @[Decoupled.scala 51:{35,35}]
  wire  _GEN_24 = 3'h5 == wIndex ? io_mcr_write_5_valid : _GEN_23; // @[Decoupled.scala 51:{35,35}]
  wire  _GEN_25 = _GEN_24 | _GEN_12; // @[Lib.scala 359:35 360:15]
  wire  _io_mcr_write_valid_T = awFired & wFired; // @[Lib.scala 364:41]
  wire [31:0] _GEN_33 = 3'h1 == rIndex ? io_mcr_read_1_bits : io_mcr_read_0_bits; // @[nasti.scala 218:{12,12}]
  wire [31:0] _GEN_34 = 3'h2 == rIndex ? io_mcr_read_2_bits : _GEN_33; // @[nasti.scala 218:{12,12}]
  wire [31:0] _GEN_35 = 3'h3 == rIndex ? io_mcr_read_3_bits : _GEN_34; // @[nasti.scala 218:{12,12}]
  wire [31:0] _GEN_36 = 3'h4 == rIndex ? io_mcr_read_4_bits : _GEN_35; // @[nasti.scala 218:{12,12}]
  assign io_nasti_aw_ready = ~awFired; // @[Lib.scala 376:24]
  assign io_nasti_w_ready = ~wFired; // @[Lib.scala 377:24]
  assign io_nasti_b_valid = _io_mcr_write_valid_T & wCommited; // @[Lib.scala 373:41]
  assign io_nasti_b_bits_id = bId; // @[nasti.scala 228:17 229:10]
  assign io_nasti_ar_ready = ~arFired; // @[Lib.scala 375:24]
  assign io_nasti_r_valid = arFired; // @[Lib.scala 370:31]
  assign io_nasti_r_bits_data = 3'h5 == rIndex ? io_mcr_read_5_bits : _GEN_36; // @[nasti.scala 218:{12,12}]
  assign io_nasti_r_bits_id = rId; // @[nasti.scala 216:17 217:10]
  assign io_mcr_read_2_ready = rIndex == 3'h2 & arFired & io_nasti_r_ready; // @[Lib.scala 366:54]
  assign io_mcr_read_5_ready = rIndex == 3'h5 & arFired & io_nasti_r_ready; // @[Lib.scala 366:54]
  assign io_mcr_write_0_valid = 3'h0 == wIndex & (awFired & wFired & ~wCommited); // @[Lib.scala 364:{30,30} 363:39]
  assign io_mcr_write_0_bits = wData; // @[Lib.scala 363:58]
  assign io_mcr_write_1_valid = 3'h1 == wIndex & (awFired & wFired & ~wCommited); // @[Lib.scala 364:{30,30} 363:39]
  assign io_mcr_write_1_bits = wData; // @[Lib.scala 363:58]
  assign io_mcr_write_2_valid = 3'h2 == wIndex & (awFired & wFired & ~wCommited); // @[Lib.scala 364:{30,30} 363:39]
  assign io_mcr_write_2_bits = wData; // @[Lib.scala 363:58]
  assign io_mcr_write_3_valid = 3'h3 == wIndex & (awFired & wFired & ~wCommited); // @[Lib.scala 364:{30,30} 363:39]
  assign io_mcr_write_3_bits = wData; // @[Lib.scala 363:58]
  assign io_mcr_write_4_valid = 3'h4 == wIndex & (awFired & wFired & ~wCommited); // @[Lib.scala 364:{30,30} 363:39]
  assign io_mcr_write_4_bits = wData; // @[Lib.scala 363:58]
  assign io_mcr_write_5_valid = 3'h5 == wIndex & (awFired & wFired & ~wCommited); // @[Lib.scala 364:{30,30} 363:39]
  assign io_mcr_write_5_bits = wData; // @[Lib.scala 363:58]
  always @(posedge clock) begin
    if (reset) begin // @[Lib.scala 317:26]
      arFired <= 1'h0; // @[Lib.scala 317:26]
    end else if (_T_11) begin // @[Lib.scala 349:25]
      arFired <= 1'h0; // @[Lib.scala 350:13]
    end else begin
      arFired <= _GEN_6;
    end
    if (reset) begin // @[Lib.scala 318:26]
      awFired <= 1'h0; // @[Lib.scala 318:26]
    end else if (_T_12) begin // @[Lib.scala 353:25]
      awFired <= 1'h0; // @[Lib.scala 354:15]
    end else begin
      awFired <= _GEN_0;
    end
    if (reset) begin // @[Lib.scala 319:26]
      wFired <= 1'h0; // @[Lib.scala 319:26]
    end else if (_T_12) begin // @[Lib.scala 353:25]
      wFired <= 1'h0; // @[Lib.scala 355:15]
    end else begin
      wFired <= _GEN_3;
    end
    if (reset) begin // @[Lib.scala 320:26]
      wCommited <= 1'h0; // @[Lib.scala 320:26]
    end else begin
      wCommited <= _GEN_25;
    end
    if (_T) begin // @[Lib.scala 329:26]
      bId <= io_nasti_aw_bits_id; // @[Lib.scala 332:13]
    end
    if (_T_6) begin // @[Lib.scala 342:26]
      rId <= io_nasti_ar_bits_id; // @[Lib.scala 345:13]
    end
    if (_T_5) begin // @[Lib.scala 336:25]
      wData <= io_nasti_w_bits_data; // @[Lib.scala 338:12]
    end
    wIndex <= _GEN_1[2:0];
    if (_T_6) begin // @[Lib.scala 342:26]
      rIndex <= io_nasti_ar_bits_addr[4:2]; // @[Lib.scala 344:13]
    end
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T & ~reset & ~(io_nasti_aw_bits_len == 8'h0)) begin
          $fwrite(32'h80000002,"Assertion failed\n    at Lib.scala:333 assert(io.nasti.aw.bits.len === 0.U)\n"); // @[Lib.scala 333:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_6 & _T_3 & ~(io_nasti_ar_bits_len == 8'h0)) begin
          $fwrite(32'h80000002,
            "Assertion failed: MCRFile only support single beat reads\n    at Lib.scala:346 assert(io.nasti.ar.bits.len === 0.U, \"MCRFile only support single beat reads\")\n"
            ); // @[Lib.scala 346:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  arFired = _RAND_0[0:0];
  _RAND_1 = {1{`RANDOM}};
  awFired = _RAND_1[0:0];
  _RAND_2 = {1{`RANDOM}};
  wFired = _RAND_2[0:0];
  _RAND_3 = {1{`RANDOM}};
  wCommited = _RAND_3[0:0];
  _RAND_4 = {1{`RANDOM}};
  bId = _RAND_4[0:0];
  _RAND_5 = {1{`RANDOM}};
  rId = _RAND_5[0:0];
  _RAND_6 = {1{`RANDOM}};
  wData = _RAND_6[31:0];
  _RAND_7 = {1{`RANDOM}};
  wIndex = _RAND_7[2:0];
  _RAND_8 = {1{`RANDOM}};
  rIndex = _RAND_8[2:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
  always @(posedge clock) begin
    //
    if (_T & ~reset) begin
      assert(io_nasti_aw_bits_len == 8'h0); // @[Lib.scala 333:11]
    end
    //
    if (_T_6 & _T_3) begin
      assert(io_nasti_ar_bits_len == 8'h0); // @[Lib.scala 346:11]
    end
  end
endmodule
module ClockBridgeModule(
  input         clock,
  input         reset,
  output        io_ctrl_aw_ready,
  input         io_ctrl_aw_valid,
  input  [11:0] io_ctrl_aw_bits_addr,
  input  [7:0]  io_ctrl_aw_bits_len,
  input         io_ctrl_aw_bits_id,
  output        io_ctrl_w_ready,
  input         io_ctrl_w_valid,
  input  [31:0] io_ctrl_w_bits_data,
  input         io_ctrl_b_ready,
  output        io_ctrl_b_valid,
  output        io_ctrl_b_bits_id,
  output        io_ctrl_ar_ready,
  input         io_ctrl_ar_valid,
  input  [11:0] io_ctrl_ar_bits_addr,
  input  [7:0]  io_ctrl_ar_bits_len,
  input         io_ctrl_ar_bits_id,
  input         io_ctrl_r_ready,
  output        io_ctrl_r_valid,
  output [31:0] io_ctrl_r_bits_data,
  output        io_ctrl_r_bits_id,
  input         hPort_clocks_ready,
  output        hPort_clocks_valid,
  output        hPort_clocks_bits_0
);
`ifdef RANDOMIZE_REG_INIT
  reg [63:0] _RAND_0;
  reg [63:0] _RAND_1;
  reg [63:0] _RAND_2;
  reg [63:0] _RAND_3;
`endif // RANDOMIZE_REG_INIT
  wire  crFile_clock; // @[Widget.scala 166:24]
  wire  crFile_reset; // @[Widget.scala 166:24]
  wire  crFile_io_nasti_aw_ready; // @[Widget.scala 166:24]
  wire  crFile_io_nasti_aw_valid; // @[Widget.scala 166:24]
  wire [11:0] crFile_io_nasti_aw_bits_addr; // @[Widget.scala 166:24]
  wire [7:0] crFile_io_nasti_aw_bits_len; // @[Widget.scala 166:24]
  wire  crFile_io_nasti_aw_bits_id; // @[Widget.scala 166:24]
  wire  crFile_io_nasti_w_ready; // @[Widget.scala 166:24]
  wire  crFile_io_nasti_w_valid; // @[Widget.scala 166:24]
  wire [31:0] crFile_io_nasti_w_bits_data; // @[Widget.scala 166:24]
  wire  crFile_io_nasti_b_ready; // @[Widget.scala 166:24]
  wire  crFile_io_nasti_b_valid; // @[Widget.scala 166:24]
  wire  crFile_io_nasti_b_bits_id; // @[Widget.scala 166:24]
  wire  crFile_io_nasti_ar_ready; // @[Widget.scala 166:24]
  wire  crFile_io_nasti_ar_valid; // @[Widget.scala 166:24]
  wire [11:0] crFile_io_nasti_ar_bits_addr; // @[Widget.scala 166:24]
  wire [7:0] crFile_io_nasti_ar_bits_len; // @[Widget.scala 166:24]
  wire  crFile_io_nasti_ar_bits_id; // @[Widget.scala 166:24]
  wire  crFile_io_nasti_r_ready; // @[Widget.scala 166:24]
  wire  crFile_io_nasti_r_valid; // @[Widget.scala 166:24]
  wire [31:0] crFile_io_nasti_r_bits_data; // @[Widget.scala 166:24]
  wire  crFile_io_nasti_r_bits_id; // @[Widget.scala 166:24]
  wire [31:0] crFile_io_mcr_read_0_bits; // @[Widget.scala 166:24]
  wire [31:0] crFile_io_mcr_read_1_bits; // @[Widget.scala 166:24]
  wire  crFile_io_mcr_read_2_ready; // @[Widget.scala 166:24]
  wire [31:0] crFile_io_mcr_read_2_bits; // @[Widget.scala 166:24]
  wire [31:0] crFile_io_mcr_read_3_bits; // @[Widget.scala 166:24]
  wire [31:0] crFile_io_mcr_read_4_bits; // @[Widget.scala 166:24]
  wire  crFile_io_mcr_read_5_ready; // @[Widget.scala 166:24]
  wire [31:0] crFile_io_mcr_read_5_bits; // @[Widget.scala 166:24]
  wire  crFile_io_mcr_write_0_valid; // @[Widget.scala 166:24]
  wire [31:0] crFile_io_mcr_write_0_bits; // @[Widget.scala 166:24]
  wire  crFile_io_mcr_write_1_valid; // @[Widget.scala 166:24]
  wire [31:0] crFile_io_mcr_write_1_bits; // @[Widget.scala 166:24]
  wire  crFile_io_mcr_write_2_valid; // @[Widget.scala 166:24]
  wire [31:0] crFile_io_mcr_write_2_bits; // @[Widget.scala 166:24]
  wire  crFile_io_mcr_write_3_valid; // @[Widget.scala 166:24]
  wire [31:0] crFile_io_mcr_write_3_bits; // @[Widget.scala 166:24]
  wire  crFile_io_mcr_write_4_valid; // @[Widget.scala 166:24]
  wire [31:0] crFile_io_mcr_write_4_bits; // @[Widget.scala 166:24]
  wire  crFile_io_mcr_write_5_valid; // @[Widget.scala 166:24]
  wire [31:0] crFile_io_mcr_write_5_bits; // @[Widget.scala 166:24]
  reg [63:0] hCycle; // @[Widget.scala 146:30]
  reg [63:0] hCycle_hCycle_mmreg; // @[Widget.scala 147:26]
  wire [31:0] _GEN_3 = crFile_io_mcr_write_2_valid ? crFile_io_mcr_write_2_bits : 32'h0; // @[Lib.scala 280:32 281:18 Widget.scala 157:31]
  wire  hCycle_hCycle_latchEnable = _GEN_3[0]; // @[Widget.scala 157:31]
  wire [63:0] _hCycle_T_1 = hCycle + 64'h1; // @[ClockBridge.scala 159:20]
  reg [63:0] tCycleFastest; // @[Widget.scala 146:30]
  reg [63:0] tCycleFastest_tCycle_mmreg; // @[Widget.scala 147:26]
  wire [31:0] _GEN_4 = crFile_io_mcr_write_5_valid ? crFile_io_mcr_write_5_bits : 32'h0; // @[Lib.scala 280:32 281:18 Widget.scala 157:31]
  wire  tCycleFastest_tCycle_latchEnable = _GEN_4[0]; // @[Widget.scala 157:31]
  wire  _T = hPort_clocks_ready & hPort_clocks_valid; // @[Decoupled.scala 51:35]
  wire [63:0] _tCycleFastest_T_1 = tCycleFastest + 64'h1; // @[ClockBridge.scala 170:36]
  wire  _T_4 = ~reset; // @[Lib.scala 284:13]
  MCRFile_1 crFile ( // @[Widget.scala 166:24]
    .clock(crFile_clock),
    .reset(crFile_reset),
    .io_nasti_aw_ready(crFile_io_nasti_aw_ready),
    .io_nasti_aw_valid(crFile_io_nasti_aw_valid),
    .io_nasti_aw_bits_addr(crFile_io_nasti_aw_bits_addr),
    .io_nasti_aw_bits_len(crFile_io_nasti_aw_bits_len),
    .io_nasti_aw_bits_id(crFile_io_nasti_aw_bits_id),
    .io_nasti_w_ready(crFile_io_nasti_w_ready),
    .io_nasti_w_valid(crFile_io_nasti_w_valid),
    .io_nasti_w_bits_data(crFile_io_nasti_w_bits_data),
    .io_nasti_b_ready(crFile_io_nasti_b_ready),
    .io_nasti_b_valid(crFile_io_nasti_b_valid),
    .io_nasti_b_bits_id(crFile_io_nasti_b_bits_id),
    .io_nasti_ar_ready(crFile_io_nasti_ar_ready),
    .io_nasti_ar_valid(crFile_io_nasti_ar_valid),
    .io_nasti_ar_bits_addr(crFile_io_nasti_ar_bits_addr),
    .io_nasti_ar_bits_len(crFile_io_nasti_ar_bits_len),
    .io_nasti_ar_bits_id(crFile_io_nasti_ar_bits_id),
    .io_nasti_r_ready(crFile_io_nasti_r_ready),
    .io_nasti_r_valid(crFile_io_nasti_r_valid),
    .io_nasti_r_bits_data(crFile_io_nasti_r_bits_data),
    .io_nasti_r_bits_id(crFile_io_nasti_r_bits_id),
    .io_mcr_read_0_bits(crFile_io_mcr_read_0_bits),
    .io_mcr_read_1_bits(crFile_io_mcr_read_1_bits),
    .io_mcr_read_2_ready(crFile_io_mcr_read_2_ready),
    .io_mcr_read_2_bits(crFile_io_mcr_read_2_bits),
    .io_mcr_read_3_bits(crFile_io_mcr_read_3_bits),
    .io_mcr_read_4_bits(crFile_io_mcr_read_4_bits),
    .io_mcr_read_5_ready(crFile_io_mcr_read_5_ready),
    .io_mcr_read_5_bits(crFile_io_mcr_read_5_bits),
    .io_mcr_write_0_valid(crFile_io_mcr_write_0_valid),
    .io_mcr_write_0_bits(crFile_io_mcr_write_0_bits),
    .io_mcr_write_1_valid(crFile_io_mcr_write_1_valid),
    .io_mcr_write_1_bits(crFile_io_mcr_write_1_bits),
    .io_mcr_write_2_valid(crFile_io_mcr_write_2_valid),
    .io_mcr_write_2_bits(crFile_io_mcr_write_2_bits),
    .io_mcr_write_3_valid(crFile_io_mcr_write_3_valid),
    .io_mcr_write_3_bits(crFile_io_mcr_write_3_bits),
    .io_mcr_write_4_valid(crFile_io_mcr_write_4_valid),
    .io_mcr_write_4_bits(crFile_io_mcr_write_4_bits),
    .io_mcr_write_5_valid(crFile_io_mcr_write_5_valid),
    .io_mcr_write_5_bits(crFile_io_mcr_write_5_bits)
  );
  assign io_ctrl_aw_ready = crFile_io_nasti_aw_ready; // @[Widget.scala 168:21]
  assign io_ctrl_w_ready = crFile_io_nasti_w_ready; // @[Widget.scala 168:21]
  assign io_ctrl_b_valid = crFile_io_nasti_b_valid; // @[Widget.scala 168:21]
  assign io_ctrl_b_bits_id = crFile_io_nasti_b_bits_id; // @[Widget.scala 168:21]
  assign io_ctrl_ar_ready = crFile_io_nasti_ar_ready; // @[Widget.scala 168:21]
  assign io_ctrl_r_valid = crFile_io_nasti_r_valid; // @[Widget.scala 168:21]
  assign io_ctrl_r_bits_data = crFile_io_nasti_r_bits_data; // @[Widget.scala 168:21]
  assign io_ctrl_r_bits_id = crFile_io_nasti_r_bits_id; // @[Widget.scala 168:21]
  assign hPort_clocks_valid = 1'h1; // @[ClockBridge.scala 155:16]
  assign hPort_clocks_bits_0 = 1'h1; // @[ClockBridge.scala 155:16]
  assign crFile_clock = clock;
  assign crFile_reset = reset;
  assign crFile_io_nasti_aw_valid = io_ctrl_aw_valid; // @[Widget.scala 168:21]
  assign crFile_io_nasti_aw_bits_addr = io_ctrl_aw_bits_addr; // @[Widget.scala 168:21]
  assign crFile_io_nasti_aw_bits_len = io_ctrl_aw_bits_len; // @[Widget.scala 168:21]
  assign crFile_io_nasti_aw_bits_id = io_ctrl_aw_bits_id; // @[Widget.scala 168:21]
  assign crFile_io_nasti_w_valid = io_ctrl_w_valid; // @[Widget.scala 168:21]
  assign crFile_io_nasti_w_bits_data = io_ctrl_w_bits_data; // @[Widget.scala 168:21]
  assign crFile_io_nasti_b_ready = io_ctrl_b_ready; // @[Widget.scala 168:21]
  assign crFile_io_nasti_ar_valid = io_ctrl_ar_valid; // @[Widget.scala 168:21]
  assign crFile_io_nasti_ar_bits_addr = io_ctrl_ar_bits_addr; // @[Widget.scala 168:21]
  assign crFile_io_nasti_ar_bits_len = io_ctrl_ar_bits_len; // @[Widget.scala 168:21]
  assign crFile_io_nasti_ar_bits_id = io_ctrl_ar_bits_id; // @[Widget.scala 168:21]
  assign crFile_io_nasti_r_ready = io_ctrl_r_ready; // @[Widget.scala 168:21]
  assign crFile_io_mcr_read_0_bits = hCycle_hCycle_mmreg[31:0]; // @[Widget.scala 152:30]
  assign crFile_io_mcr_read_1_bits = hCycle_hCycle_mmreg[63:32]; // @[Widget.scala 152:30]
  assign crFile_io_mcr_read_2_bits = 32'h0;
  assign crFile_io_mcr_read_3_bits = tCycleFastest_tCycle_mmreg[31:0]; // @[Widget.scala 152:30]
  assign crFile_io_mcr_read_4_bits = tCycleFastest_tCycle_mmreg[63:32]; // @[Widget.scala 152:30]
  assign crFile_io_mcr_read_5_bits = 32'h0;
  always @(posedge clock) begin
    if (reset) begin // @[Widget.scala 146:30]
      hCycle <= 64'h0; // @[Widget.scala 146:30]
    end else begin
      hCycle <= _hCycle_T_1; // @[ClockBridge.scala 159:10]
    end
    if (hCycle_hCycle_latchEnable) begin // @[Widget.scala 159:23]
      hCycle_hCycle_mmreg <= hCycle; // @[Widget.scala 160:17]
    end
    if (reset) begin // @[Widget.scala 146:30]
      tCycleFastest <= 64'h0; // @[Widget.scala 146:30]
    end else if (_T & hPort_clocks_bits_0) begin // @[ClockBridge.scala 169:66]
      tCycleFastest <= _tCycleFastest_T_1; // @[ClockBridge.scala 170:19]
    end
    if (tCycleFastest_tCycle_latchEnable) begin // @[Widget.scala 159:23]
      tCycleFastest_tCycle_mmreg <= tCycleFastest; // @[Widget.scala 160:17]
    end
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (~reset & ~(~crFile_io_mcr_write_0_valid)) begin
          $fwrite(32'h80000002,
            "Assertion failed: Register hCycle_0 is read only\n    at Lib.scala:284 assert(write(index).valid =/= true.B, s\"Register ${reg.name} is read only\")\n"
            ); // @[Lib.scala 284:13]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (~reset & ~(~crFile_io_mcr_write_1_valid)) begin
          $fwrite(32'h80000002,
            "Assertion failed: Register hCycle_1 is read only\n    at Lib.scala:284 assert(write(index).valid =/= true.B, s\"Register ${reg.name} is read only\")\n"
            ); // @[Lib.scala 284:13]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_4 & ~(~crFile_io_mcr_read_2_ready)) begin
          $fwrite(32'h80000002,
            "Assertion failed: Register ${reg.name} is write only\n    at Lib.scala:290 assert(read(index).ready === false.B, \"Register ${reg.name} is write only\")\n"
            ); // @[Lib.scala 290:13]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (~reset & ~(~crFile_io_mcr_write_3_valid)) begin
          $fwrite(32'h80000002,
            "Assertion failed: Register tCycle_0 is read only\n    at Lib.scala:284 assert(write(index).valid =/= true.B, s\"Register ${reg.name} is read only\")\n"
            ); // @[Lib.scala 284:13]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (~reset & ~(~crFile_io_mcr_write_4_valid)) begin
          $fwrite(32'h80000002,
            "Assertion failed: Register tCycle_1 is read only\n    at Lib.scala:284 assert(write(index).valid =/= true.B, s\"Register ${reg.name} is read only\")\n"
            ); // @[Lib.scala 284:13]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_4 & ~(~crFile_io_mcr_read_5_ready)) begin
          $fwrite(32'h80000002,
            "Assertion failed: Register ${reg.name} is write only\n    at Lib.scala:290 assert(read(index).ready === false.B, \"Register ${reg.name} is write only\")\n"
            ); // @[Lib.scala 290:13]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {2{`RANDOM}};
  hCycle = _RAND_0[63:0];
  _RAND_1 = {2{`RANDOM}};
  hCycle_hCycle_mmreg = _RAND_1[63:0];
  _RAND_2 = {2{`RANDOM}};
  tCycleFastest = _RAND_2[63:0];
  _RAND_3 = {2{`RANDOM}};
  tCycleFastest_tCycle_mmreg = _RAND_3[63:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
  always @(posedge clock) begin
    //
    if (~reset) begin
      assert(~crFile_io_mcr_write_0_valid); // @[Lib.scala 284:13]
    end
    //
    if (~reset) begin
      assert(~crFile_io_mcr_write_1_valid); // @[Lib.scala 284:13]
    end
    //
    if (_T_4) begin
      assert(~crFile_io_mcr_read_2_ready); // @[Lib.scala 290:13]
    end
    //
    if (~reset) begin
      assert(~crFile_io_mcr_write_3_valid); // @[Lib.scala 284:13]
    end
    //
    if (~reset) begin
      assert(~crFile_io_mcr_write_4_valid); // @[Lib.scala 284:13]
    end
    //
    if (_T_4) begin
      assert(~crFile_io_mcr_read_5_ready); // @[Lib.scala 290:13]
    end
  end
endmodule
module Queue(
  input         clock,
  input         reset,
  output        io_enq_ready,
  input         io_enq_valid,
  input  [31:0] io_enq_bits,
  input         io_deq_ready,
  output        io_deq_valid,
  output [31:0] io_deq_bits
);
`ifdef RANDOMIZE_MEM_INIT
  reg [31:0] _RAND_0;
`endif // RANDOMIZE_MEM_INIT
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
`endif // RANDOMIZE_REG_INIT
  reg [31:0] ram [0:1]; // @[Decoupled.scala 273:95]
  wire  ram_io_deq_bits_MPORT_en; // @[Decoupled.scala 273:95 310:23]
  wire  ram_io_deq_bits_MPORT_addr; // @[Decoupled.scala 273:95 310:23]
  wire [31:0] ram_io_deq_bits_MPORT_data; // @[Decoupled.scala 273:95]
  wire [31:0] ram_MPORT_data; // @[Decoupled.scala 273:95 286:16 287:24]
  wire  ram_MPORT_addr; // @[Decoupled.scala 273:95 286:16 287:8]
  wire  ram_MPORT_mask; // @[Decoupled.scala 273:95 286:16 287:24]
  wire  ram_MPORT_en; // @[Decoupled.scala 273:95 51:35]
  reg  enq_ptr_value; // @[Counter.scala 61:40]
  reg  deq_ptr_value; // @[Counter.scala 61:40]
  reg  maybe_full; // @[Decoupled.scala 276:27]
  wire  ptr_match = enq_ptr_value == deq_ptr_value; // @[Decoupled.scala 277:33]
  wire  empty = ptr_match & ~maybe_full; // @[Decoupled.scala 278:25]
  wire  full = ptr_match & maybe_full; // @[Decoupled.scala 279:24]
  wire  do_enq = io_enq_ready & io_enq_valid; // @[Decoupled.scala 51:35]
  wire  do_deq = io_deq_ready & io_deq_valid; // @[Decoupled.scala 51:35]
  assign ram_io_deq_bits_MPORT_en = 1'h1; // @[Decoupled.scala 310:23]
  assign ram_io_deq_bits_MPORT_addr = deq_ptr_value; // @[Decoupled.scala 310:23]
  assign ram_io_deq_bits_MPORT_data = ram[ram_io_deq_bits_MPORT_addr]; // @[Decoupled.scala 273:95]
  assign ram_MPORT_data = io_enq_bits; // @[Decoupled.scala 286:16 287:24]
  assign ram_MPORT_addr = enq_ptr_value; // @[Decoupled.scala 286:16 287:8]
  assign ram_MPORT_mask = 1'h1; // @[Decoupled.scala 286:16 287:24]
  assign ram_MPORT_en = io_enq_ready & io_enq_valid; // @[Decoupled.scala 51:35]
  assign io_enq_ready = ~full; // @[Decoupled.scala 303:19]
  assign io_deq_valid = ~empty; // @[Decoupled.scala 302:19]
  assign io_deq_bits = ram_io_deq_bits_MPORT_data; // @[Decoupled.scala 310:17]
  always @(posedge clock) begin
    if (ram_MPORT_en & ram_MPORT_mask) begin
      ram[ram_MPORT_addr] <= ram_MPORT_data; // @[Decoupled.scala 273:95]
    end
    if (reset) begin // @[Counter.scala 61:40]
      enq_ptr_value <= 1'h0; // @[Counter.scala 61:40]
    end else if (do_enq) begin // @[Decoupled.scala 286:16]
      enq_ptr_value <= enq_ptr_value + 1'h1; // @[Counter.scala 77:15]
    end
    if (reset) begin // @[Counter.scala 61:40]
      deq_ptr_value <= 1'h0; // @[Counter.scala 61:40]
    end else if (do_deq) begin // @[Decoupled.scala 290:16]
      deq_ptr_value <= deq_ptr_value + 1'h1; // @[Counter.scala 77:15]
    end
    if (reset) begin // @[Decoupled.scala 276:27]
      maybe_full <= 1'h0; // @[Decoupled.scala 276:27]
    end else if (do_enq != do_deq) begin // @[Decoupled.scala 293:27]
      maybe_full <= do_enq; // @[Decoupled.scala 294:16]
    end
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_MEM_INIT
  _RAND_0 = {1{`RANDOM}};
  for (initvar = 0; initvar < 2; initvar = initvar+1)
    ram[initvar] = _RAND_0[31:0];
`endif // RANDOMIZE_MEM_INIT
`ifdef RANDOMIZE_REG_INIT
  _RAND_1 = {1{`RANDOM}};
  enq_ptr_value = _RAND_1[0:0];
  _RAND_2 = {1{`RANDOM}};
  deq_ptr_value = _RAND_2[0:0];
  _RAND_3 = {1{`RANDOM}};
  maybe_full = _RAND_3[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module SatUpDownCounter(
  input        clock,
  input        reset,
  input        io_inc,
  input        io_dec,
  output [1:0] io_value,
  output       io_full,
  output       io_empty
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
`endif // RANDOMIZE_REG_INIT
  reg [1:0] value; // @[Lib.scala 71:22]
  wire [1:0] _value_T_1 = value + 2'h1; // @[Lib.scala 79:20]
  wire [1:0] _value_T_3 = value - 2'h1; // @[Lib.scala 81:20]
  assign io_value = value; // @[Lib.scala 72:12 76:22 77:14]
  assign io_full = value >= 2'h2; // @[Lib.scala 73:21]
  assign io_empty = value == 2'h0; // @[Lib.scala 74:21]
  always @(posedge clock) begin
    if (reset) begin // @[Lib.scala 71:22]
      value <= 2'h0; // @[Lib.scala 71:22]
    end else if (io_inc & ~io_dec & ~io_full) begin // @[Lib.scala 78:45]
      value <= _value_T_1; // @[Lib.scala 79:11]
    end else if (~io_inc & io_dec & ~io_empty) begin // @[Lib.scala 80:46]
      value <= _value_T_3; // @[Lib.scala 81:11]
    end
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  value = _RAND_0[1:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module MCRFile_2(
  input         clock,
  input         reset,
  output        io_nasti_aw_ready,
  input         io_nasti_aw_valid,
  input  [11:0] io_nasti_aw_bits_addr,
  input  [7:0]  io_nasti_aw_bits_len,
  input         io_nasti_aw_bits_id,
  output        io_nasti_w_ready,
  input         io_nasti_w_valid,
  input  [31:0] io_nasti_w_bits_data,
  input         io_nasti_b_ready,
  output        io_nasti_b_valid,
  output        io_nasti_b_bits_id,
  output        io_nasti_ar_ready,
  input         io_nasti_ar_valid,
  input  [11:0] io_nasti_ar_bits_addr,
  input  [7:0]  io_nasti_ar_bits_len,
  input         io_nasti_ar_bits_id,
  input         io_nasti_r_ready,
  output        io_nasti_r_valid,
  output [31:0] io_nasti_r_bits_data,
  output        io_nasti_r_bits_id,
  input  [31:0] io_mcr_read_0_bits,
  input  [31:0] io_mcr_read_1_bits,
  output        io_mcr_read_2_ready,
  output        io_mcr_read_3_ready,
  input  [31:0] io_mcr_read_4_bits,
  input  [31:0] io_mcr_read_5_bits,
  input  [31:0] io_mcr_read_6_bits,
  input  [31:0] io_mcr_read_7_bits,
  input  [31:0] io_mcr_read_8_bits,
  output        io_mcr_write_0_valid,
  output        io_mcr_write_1_valid,
  output        io_mcr_write_2_valid,
  output [31:0] io_mcr_write_2_bits,
  input         io_mcr_write_3_ready,
  output        io_mcr_write_3_valid,
  output [31:0] io_mcr_write_3_bits,
  output        io_mcr_write_4_valid,
  output [31:0] io_mcr_write_4_bits,
  output        io_mcr_write_5_valid,
  output [31:0] io_mcr_write_5_bits,
  output        io_mcr_write_6_valid,
  output [31:0] io_mcr_write_6_bits,
  output        io_mcr_write_7_valid,
  output [31:0] io_mcr_write_7_bits,
  output        io_mcr_write_8_valid,
  output [31:0] io_mcr_write_8_bits
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
  reg [31:0] _RAND_5;
  reg [31:0] _RAND_6;
  reg [31:0] _RAND_7;
  reg [31:0] _RAND_8;
`endif // RANDOMIZE_REG_INIT
  reg  arFired; // @[Lib.scala 317:26]
  reg  awFired; // @[Lib.scala 318:26]
  reg  wFired; // @[Lib.scala 319:26]
  reg  wCommited; // @[Lib.scala 320:26]
  reg  bId; // @[Lib.scala 321:22]
  reg  rId; // @[Lib.scala 322:22]
  reg [31:0] wData; // @[Lib.scala 324:22]
  reg [3:0] wIndex; // @[Lib.scala 325:22]
  reg [3:0] rIndex; // @[Lib.scala 326:22]
  wire  _T = io_nasti_aw_ready & io_nasti_aw_valid; // @[Decoupled.scala 51:35]
  wire  _T_3 = ~reset; // @[Lib.scala 333:11]
  wire  _GEN_0 = _T | awFired; // @[Lib.scala 329:26 330:13 318:26]
  wire [9:0] _GEN_1 = _T ? io_nasti_aw_bits_addr[11:2] : {{6'd0}, wIndex}; // @[Lib.scala 329:26 331:13 325:22]
  wire  _T_5 = io_nasti_w_ready & io_nasti_w_valid; // @[Decoupled.scala 51:35]
  wire  _GEN_3 = _T_5 | wFired; // @[Lib.scala 336:25 337:12 319:26]
  wire  _T_6 = io_nasti_ar_ready & io_nasti_ar_valid; // @[Decoupled.scala 51:35]
  wire  _GEN_6 = _T_6 | arFired; // @[Lib.scala 342:26 343:13 317:26]
  wire  _T_11 = io_nasti_r_ready & io_nasti_r_valid; // @[Decoupled.scala 51:35]
  wire  _T_12 = io_nasti_b_ready & io_nasti_b_valid; // @[Decoupled.scala 51:35]
  wire  _GEN_12 = _T_12 ? 1'h0 : wCommited; // @[Lib.scala 353:25 356:15 320:26]
  wire  _GEN_16 = 4'h3 == wIndex ? io_mcr_write_3_ready : 1'h1; // @[Decoupled.scala 51:{35,35}]
  wire  _GEN_59 = 4'h4 == wIndex; // @[Decoupled.scala 51:{35,35}]
  wire  _GEN_60 = 4'h5 == wIndex; // @[Decoupled.scala 51:{35,35}]
  wire  _GEN_61 = 4'h6 == wIndex; // @[Decoupled.scala 51:{35,35}]
  wire  _GEN_62 = 4'h7 == wIndex; // @[Decoupled.scala 51:{35,35}]
  wire  _GEN_63 = 4'h8 == wIndex; // @[Decoupled.scala 51:{35,35}]
  wire  _GEN_23 = 4'h1 == wIndex ? io_mcr_write_1_valid : io_mcr_write_0_valid; // @[Decoupled.scala 51:{35,35}]
  wire  _GEN_24 = 4'h2 == wIndex ? io_mcr_write_2_valid : _GEN_23; // @[Decoupled.scala 51:{35,35}]
  wire  _GEN_25 = 4'h3 == wIndex ? io_mcr_write_3_valid : _GEN_24; // @[Decoupled.scala 51:{35,35}]
  wire  _GEN_26 = 4'h4 == wIndex ? io_mcr_write_4_valid : _GEN_25; // @[Decoupled.scala 51:{35,35}]
  wire  _GEN_27 = 4'h5 == wIndex ? io_mcr_write_5_valid : _GEN_26; // @[Decoupled.scala 51:{35,35}]
  wire  _GEN_28 = 4'h6 == wIndex ? io_mcr_write_6_valid : _GEN_27; // @[Decoupled.scala 51:{35,35}]
  wire  _GEN_29 = 4'h7 == wIndex ? io_mcr_write_7_valid : _GEN_28; // @[Decoupled.scala 51:{35,35}]
  wire  _GEN_30 = 4'h8 == wIndex ? io_mcr_write_8_valid : _GEN_29; // @[Decoupled.scala 51:{35,35}]
  wire  _T_13 = (4'h8 == wIndex | (4'h7 == wIndex | (4'h6 == wIndex | (4'h5 == wIndex | (4'h4 == wIndex | _GEN_16)))))
     & _GEN_30; // @[Decoupled.scala 51:35]
  wire  _GEN_31 = _T_13 | _GEN_12; // @[Lib.scala 359:35 360:15]
  wire  _io_mcr_write_valid_T = awFired & wFired; // @[Lib.scala 364:41]
  wire [31:0] _GEN_42 = 4'h1 == rIndex ? io_mcr_read_1_bits : io_mcr_read_0_bits; // @[nasti.scala 218:{12,12}]
  wire [31:0] _GEN_43 = 4'h2 == rIndex ? 32'h0 : _GEN_42; // @[nasti.scala 218:{12,12}]
  wire [31:0] _GEN_44 = 4'h3 == rIndex ? 32'h0 : _GEN_43; // @[nasti.scala 218:{12,12}]
  wire [31:0] _GEN_45 = 4'h4 == rIndex ? io_mcr_read_4_bits : _GEN_44; // @[nasti.scala 218:{12,12}]
  wire [31:0] _GEN_46 = 4'h5 == rIndex ? io_mcr_read_5_bits : _GEN_45; // @[nasti.scala 218:{12,12}]
  wire [31:0] _GEN_47 = 4'h6 == rIndex ? io_mcr_read_6_bits : _GEN_46; // @[nasti.scala 218:{12,12}]
  wire [31:0] _GEN_48 = 4'h7 == rIndex ? io_mcr_read_7_bits : _GEN_47; // @[nasti.scala 218:{12,12}]
  wire  _GEN_53 = 4'h3 == rIndex ? 1'h0 : 1'h1; // @[Lib.scala 370:{31,31}]
  assign io_nasti_aw_ready = ~awFired; // @[Lib.scala 376:24]
  assign io_nasti_w_ready = ~wFired; // @[Lib.scala 377:24]
  assign io_nasti_b_valid = _io_mcr_write_valid_T & wCommited; // @[Lib.scala 373:41]
  assign io_nasti_b_bits_id = bId; // @[nasti.scala 228:17 229:10]
  assign io_nasti_ar_ready = ~arFired; // @[Lib.scala 375:24]
  assign io_nasti_r_valid = arFired & (4'h8 == rIndex | (4'h7 == rIndex | (4'h6 == rIndex | (4'h5 == rIndex | (4'h4 ==
    rIndex | _GEN_53))))); // @[Lib.scala 370:31]
  assign io_nasti_r_bits_data = 4'h8 == rIndex ? io_mcr_read_8_bits : _GEN_48; // @[nasti.scala 218:{12,12}]
  assign io_nasti_r_bits_id = rId; // @[nasti.scala 216:17 217:10]
  assign io_mcr_read_2_ready = rIndex == 4'h2 & arFired & io_nasti_r_ready; // @[Lib.scala 366:54]
  assign io_mcr_read_3_ready = rIndex == 4'h3 & arFired & io_nasti_r_ready; // @[Lib.scala 366:54]
  assign io_mcr_write_0_valid = 4'h0 == wIndex & (awFired & wFired & ~wCommited); // @[Lib.scala 364:{30,30} 363:39]
  assign io_mcr_write_1_valid = 4'h1 == wIndex & (awFired & wFired & ~wCommited); // @[Lib.scala 364:{30,30} 363:39]
  assign io_mcr_write_2_valid = 4'h2 == wIndex & (awFired & wFired & ~wCommited); // @[Lib.scala 364:{30,30} 363:39]
  assign io_mcr_write_2_bits = wData; // @[Lib.scala 363:58]
  assign io_mcr_write_3_valid = 4'h3 == wIndex & (awFired & wFired & ~wCommited); // @[Lib.scala 364:{30,30} 363:39]
  assign io_mcr_write_3_bits = wData; // @[Lib.scala 363:58]
  assign io_mcr_write_4_valid = _GEN_59 & (awFired & wFired & ~wCommited); // @[Lib.scala 364:{30,30} 363:39]
  assign io_mcr_write_4_bits = wData; // @[Lib.scala 363:58]
  assign io_mcr_write_5_valid = _GEN_60 & (awFired & wFired & ~wCommited); // @[Lib.scala 364:{30,30} 363:39]
  assign io_mcr_write_5_bits = wData; // @[Lib.scala 363:58]
  assign io_mcr_write_6_valid = _GEN_61 & (awFired & wFired & ~wCommited); // @[Lib.scala 364:{30,30} 363:39]
  assign io_mcr_write_6_bits = wData; // @[Lib.scala 363:58]
  assign io_mcr_write_7_valid = _GEN_62 & (awFired & wFired & ~wCommited); // @[Lib.scala 364:{30,30} 363:39]
  assign io_mcr_write_7_bits = wData; // @[Lib.scala 363:58]
  assign io_mcr_write_8_valid = _GEN_63 & (awFired & wFired & ~wCommited); // @[Lib.scala 364:{30,30} 363:39]
  assign io_mcr_write_8_bits = wData; // @[Lib.scala 363:58]
  always @(posedge clock) begin
    if (reset) begin // @[Lib.scala 317:26]
      arFired <= 1'h0; // @[Lib.scala 317:26]
    end else if (_T_11) begin // @[Lib.scala 349:25]
      arFired <= 1'h0; // @[Lib.scala 350:13]
    end else begin
      arFired <= _GEN_6;
    end
    if (reset) begin // @[Lib.scala 318:26]
      awFired <= 1'h0; // @[Lib.scala 318:26]
    end else if (_T_12) begin // @[Lib.scala 353:25]
      awFired <= 1'h0; // @[Lib.scala 354:15]
    end else begin
      awFired <= _GEN_0;
    end
    if (reset) begin // @[Lib.scala 319:26]
      wFired <= 1'h0; // @[Lib.scala 319:26]
    end else if (_T_12) begin // @[Lib.scala 353:25]
      wFired <= 1'h0; // @[Lib.scala 355:15]
    end else begin
      wFired <= _GEN_3;
    end
    if (reset) begin // @[Lib.scala 320:26]
      wCommited <= 1'h0; // @[Lib.scala 320:26]
    end else begin
      wCommited <= _GEN_31;
    end
    if (_T) begin // @[Lib.scala 329:26]
      bId <= io_nasti_aw_bits_id; // @[Lib.scala 332:13]
    end
    if (_T_6) begin // @[Lib.scala 342:26]
      rId <= io_nasti_ar_bits_id; // @[Lib.scala 345:13]
    end
    if (_T_5) begin // @[Lib.scala 336:25]
      wData <= io_nasti_w_bits_data; // @[Lib.scala 338:12]
    end
    wIndex <= _GEN_1[3:0];
    if (_T_6) begin // @[Lib.scala 342:26]
      rIndex <= io_nasti_ar_bits_addr[5:2]; // @[Lib.scala 344:13]
    end
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T & ~reset & ~(io_nasti_aw_bits_len == 8'h0)) begin
          $fwrite(32'h80000002,"Assertion failed\n    at Lib.scala:333 assert(io.nasti.aw.bits.len === 0.U)\n"); // @[Lib.scala 333:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_6 & _T_3 & ~(io_nasti_ar_bits_len == 8'h0)) begin
          $fwrite(32'h80000002,
            "Assertion failed: MCRFile only support single beat reads\n    at Lib.scala:346 assert(io.nasti.ar.bits.len === 0.U, \"MCRFile only support single beat reads\")\n"
            ); // @[Lib.scala 346:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  arFired = _RAND_0[0:0];
  _RAND_1 = {1{`RANDOM}};
  awFired = _RAND_1[0:0];
  _RAND_2 = {1{`RANDOM}};
  wFired = _RAND_2[0:0];
  _RAND_3 = {1{`RANDOM}};
  wCommited = _RAND_3[0:0];
  _RAND_4 = {1{`RANDOM}};
  bId = _RAND_4[0:0];
  _RAND_5 = {1{`RANDOM}};
  rId = _RAND_5[0:0];
  _RAND_6 = {1{`RANDOM}};
  wData = _RAND_6[31:0];
  _RAND_7 = {1{`RANDOM}};
  wIndex = _RAND_7[3:0];
  _RAND_8 = {1{`RANDOM}};
  rIndex = _RAND_8[3:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
  always @(posedge clock) begin
    //
    if (_T & ~reset) begin
      assert(io_nasti_aw_bits_len == 8'h0); // @[Lib.scala 333:11]
    end
    //
    if (_T_6 & _T_3) begin
      assert(io_nasti_ar_bits_len == 8'h0); // @[Lib.scala 346:11]
    end
  end
endmodule
module PeekPokeBridgeModule(
  input         clock,
  input         reset,
  output        io_ctrl_aw_ready,
  input         io_ctrl_aw_valid,
  input  [11:0] io_ctrl_aw_bits_addr,
  input  [7:0]  io_ctrl_aw_bits_len,
  input         io_ctrl_aw_bits_id,
  output        io_ctrl_w_ready,
  input         io_ctrl_w_valid,
  input  [31:0] io_ctrl_w_bits_data,
  input         io_ctrl_b_ready,
  output        io_ctrl_b_valid,
  output        io_ctrl_b_bits_id,
  output        io_ctrl_ar_ready,
  input         io_ctrl_ar_valid,
  input  [11:0] io_ctrl_ar_bits_addr,
  input  [7:0]  io_ctrl_ar_bits_len,
  input         io_ctrl_ar_bits_id,
  input         io_ctrl_r_ready,
  output        io_ctrl_r_valid,
  output [31:0] io_ctrl_r_bits_data,
  output        io_ctrl_r_bits_id,
  input         hPort_io_a_ready,
  output        hPort_io_a_valid,
  output        hPort_io_a_bits,
  input         hPort_io_b_ready,
  output        hPort_io_b_valid,
  output        hPort_io_b_bits,
  input         hPort_reset_ready,
  output        hPort_reset_valid,
  output        hPort_reset_bits
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [63:0] _RAND_1;
  reg [63:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
  reg [31:0] _RAND_5;
  reg [31:0] _RAND_6;
  reg [31:0] _RAND_7;
  reg [31:0] _RAND_8;
  reg [31:0] _RAND_9;
  reg [31:0] _RAND_10;
`endif // RANDOMIZE_REG_INIT
  wire  step_q_clock; // @[Decoupled.scala 375:21]
  wire  step_q_reset; // @[Decoupled.scala 375:21]
  wire  step_q_io_enq_ready; // @[Decoupled.scala 375:21]
  wire  step_q_io_enq_valid; // @[Decoupled.scala 375:21]
  wire [31:0] step_q_io_enq_bits; // @[Decoupled.scala 375:21]
  wire  step_q_io_deq_ready; // @[Decoupled.scala 375:21]
  wire  step_q_io_deq_valid; // @[Decoupled.scala 375:21]
  wire [31:0] step_q_io_deq_bits; // @[Decoupled.scala 375:21]
  wire  SatUpDownCounter_clock; // @[Lib.scala 87:20]
  wire  SatUpDownCounter_reset; // @[Lib.scala 87:20]
  wire  SatUpDownCounter_io_inc; // @[Lib.scala 87:20]
  wire  SatUpDownCounter_io_dec; // @[Lib.scala 87:20]
  wire [1:0] SatUpDownCounter_io_value; // @[Lib.scala 87:20]
  wire  SatUpDownCounter_io_full; // @[Lib.scala 87:20]
  wire  SatUpDownCounter_io_empty; // @[Lib.scala 87:20]
  wire  SatUpDownCounter_1_clock; // @[Lib.scala 87:20]
  wire  SatUpDownCounter_1_reset; // @[Lib.scala 87:20]
  wire  SatUpDownCounter_1_io_inc; // @[Lib.scala 87:20]
  wire  SatUpDownCounter_1_io_dec; // @[Lib.scala 87:20]
  wire [1:0] SatUpDownCounter_1_io_value; // @[Lib.scala 87:20]
  wire  SatUpDownCounter_1_io_full; // @[Lib.scala 87:20]
  wire  SatUpDownCounter_1_io_empty; // @[Lib.scala 87:20]
  wire  SatUpDownCounter_2_clock; // @[Lib.scala 87:20]
  wire  SatUpDownCounter_2_reset; // @[Lib.scala 87:20]
  wire  SatUpDownCounter_2_io_inc; // @[Lib.scala 87:20]
  wire  SatUpDownCounter_2_io_dec; // @[Lib.scala 87:20]
  wire [1:0] SatUpDownCounter_2_io_value; // @[Lib.scala 87:20]
  wire  SatUpDownCounter_2_io_full; // @[Lib.scala 87:20]
  wire  SatUpDownCounter_2_io_empty; // @[Lib.scala 87:20]
  wire  crFile_clock; // @[Widget.scala 166:24]
  wire  crFile_reset; // @[Widget.scala 166:24]
  wire  crFile_io_nasti_aw_ready; // @[Widget.scala 166:24]
  wire  crFile_io_nasti_aw_valid; // @[Widget.scala 166:24]
  wire [11:0] crFile_io_nasti_aw_bits_addr; // @[Widget.scala 166:24]
  wire [7:0] crFile_io_nasti_aw_bits_len; // @[Widget.scala 166:24]
  wire  crFile_io_nasti_aw_bits_id; // @[Widget.scala 166:24]
  wire  crFile_io_nasti_w_ready; // @[Widget.scala 166:24]
  wire  crFile_io_nasti_w_valid; // @[Widget.scala 166:24]
  wire [31:0] crFile_io_nasti_w_bits_data; // @[Widget.scala 166:24]
  wire  crFile_io_nasti_b_ready; // @[Widget.scala 166:24]
  wire  crFile_io_nasti_b_valid; // @[Widget.scala 166:24]
  wire  crFile_io_nasti_b_bits_id; // @[Widget.scala 166:24]
  wire  crFile_io_nasti_ar_ready; // @[Widget.scala 166:24]
  wire  crFile_io_nasti_ar_valid; // @[Widget.scala 166:24]
  wire [11:0] crFile_io_nasti_ar_bits_addr; // @[Widget.scala 166:24]
  wire [7:0] crFile_io_nasti_ar_bits_len; // @[Widget.scala 166:24]
  wire  crFile_io_nasti_ar_bits_id; // @[Widget.scala 166:24]
  wire  crFile_io_nasti_r_ready; // @[Widget.scala 166:24]
  wire  crFile_io_nasti_r_valid; // @[Widget.scala 166:24]
  wire [31:0] crFile_io_nasti_r_bits_data; // @[Widget.scala 166:24]
  wire  crFile_io_nasti_r_bits_id; // @[Widget.scala 166:24]
  wire [31:0] crFile_io_mcr_read_0_bits; // @[Widget.scala 166:24]
  wire [31:0] crFile_io_mcr_read_1_bits; // @[Widget.scala 166:24]
  wire  crFile_io_mcr_read_2_ready; // @[Widget.scala 166:24]
  wire  crFile_io_mcr_read_3_ready; // @[Widget.scala 166:24]
  wire [31:0] crFile_io_mcr_read_4_bits; // @[Widget.scala 166:24]
  wire [31:0] crFile_io_mcr_read_5_bits; // @[Widget.scala 166:24]
  wire [31:0] crFile_io_mcr_read_6_bits; // @[Widget.scala 166:24]
  wire [31:0] crFile_io_mcr_read_7_bits; // @[Widget.scala 166:24]
  wire [31:0] crFile_io_mcr_read_8_bits; // @[Widget.scala 166:24]
  wire  crFile_io_mcr_write_0_valid; // @[Widget.scala 166:24]
  wire  crFile_io_mcr_write_1_valid; // @[Widget.scala 166:24]
  wire  crFile_io_mcr_write_2_valid; // @[Widget.scala 166:24]
  wire [31:0] crFile_io_mcr_write_2_bits; // @[Widget.scala 166:24]
  wire  crFile_io_mcr_write_3_ready; // @[Widget.scala 166:24]
  wire  crFile_io_mcr_write_3_valid; // @[Widget.scala 166:24]
  wire [31:0] crFile_io_mcr_write_3_bits; // @[Widget.scala 166:24]
  wire  crFile_io_mcr_write_4_valid; // @[Widget.scala 166:24]
  wire [31:0] crFile_io_mcr_write_4_bits; // @[Widget.scala 166:24]
  wire  crFile_io_mcr_write_5_valid; // @[Widget.scala 166:24]
  wire [31:0] crFile_io_mcr_write_5_bits; // @[Widget.scala 166:24]
  wire  crFile_io_mcr_write_6_valid; // @[Widget.scala 166:24]
  wire [31:0] crFile_io_mcr_write_6_bits; // @[Widget.scala 166:24]
  wire  crFile_io_mcr_write_7_valid; // @[Widget.scala 166:24]
  wire [31:0] crFile_io_mcr_write_7_bits; // @[Widget.scala 166:24]
  wire  crFile_io_mcr_write_8_valid; // @[Widget.scala 166:24]
  wire [31:0] crFile_io_mcr_write_8_bits; // @[Widget.scala 166:24]
  reg [31:0] cycleHorizon; // @[PeekPokeIO.scala 43:31]
  reg [63:0] tCycle; // @[Widget.scala 146:30]
  reg [63:0] tCycle_tCycle_mmreg; // @[Widget.scala 147:26]
  wire [31:0] _GEN_11 = crFile_io_mcr_write_2_valid ? crFile_io_mcr_write_2_bits : 32'h0; // @[Lib.scala 280:32 281:18 Widget.scala 157:31]
  wire  tCycle_tCycle_latchEnable = _GEN_11[0]; // @[Widget.scala 157:31]
  reg [31:0] DONE; // @[Widget.scala 127:33]
  wire  done = cycleHorizon == 32'h0; // @[PeekPokeIO.scala 54:26]
  reg  target_reset_i; // @[PeekPokeIO.scala 59:10]
  wire  _isAhead_T_1 = hPort_reset_ready & hPort_reset_valid; // @[Decoupled.scala 51:35]
  wire  isAhead = ~SatUpDownCounter_io_empty | _isAhead_T_1; // @[PeekPokeIO.scala 71:40]
  reg  wordsReceived; // @[PeekPokeIO.scala 81:34]
  wire  reset_poke = crFile_io_mcr_write_5_valid; // @[PeekPokeIO.scala 149:13 79:22]
  wire [31:0] _GEN_17 = {{30'd0}, SatUpDownCounter_io_value}; // @[PeekPokeIO.scala 91:63]
  reg  target_io_b_i; // @[PeekPokeIO.scala 59:10]
  wire  _isAhead_T_3 = hPort_io_b_ready & hPort_io_b_valid; // @[Decoupled.scala 51:35]
  wire  isAhead_1 = ~SatUpDownCounter_1_io_empty | _isAhead_T_3; // @[PeekPokeIO.scala 71:40]
  reg  wordsReceived_1; // @[PeekPokeIO.scala 81:34]
  wire  io_b_poke = crFile_io_mcr_write_6_valid; // @[PeekPokeIO.scala 149:13 79:22]
  wire [31:0] _GEN_18 = {{30'd0}, SatUpDownCounter_1_io_value}; // @[PeekPokeIO.scala 91:63]
  reg  target_io_a_i; // @[PeekPokeIO.scala 59:10]
  wire  _isAhead_T_5 = hPort_io_a_ready & hPort_io_a_valid; // @[Decoupled.scala 51:35]
  wire  isAhead_2 = ~SatUpDownCounter_2_io_empty | _isAhead_T_5; // @[PeekPokeIO.scala 71:40]
  reg  wordsReceived_2; // @[PeekPokeIO.scala 81:34]
  wire  io_a_poke = crFile_io_mcr_write_7_valid; // @[PeekPokeIO.scala 149:13 79:22]
  wire [31:0] _GEN_19 = {{30'd0}, SatUpDownCounter_2_io_value}; // @[PeekPokeIO.scala 91:63]
  reg [31:0] PRECISE_PEEKABLE; // @[Widget.scala 127:33]
  wire  tCycleWouldAdvance = isAhead & isAhead_1 & isAhead_2; // @[PeekPokeIO.scala 130:62]
  wire  tCycleAdvancing = tCycleWouldAdvance & cycleHorizon > 32'h0; // @[PeekPokeIO.scala 133:30]
  wire [63:0] _tCycle_T_1 = tCycle + 64'h1; // @[PeekPokeIO.scala 134:24]
  wire [31:0] _cycleHorizon_T_1 = cycleHorizon - 32'h1; // @[PeekPokeIO.scala 135:36]
  wire  step_valid = step_q_io_deq_valid; // @[PeekPokeIO.scala 49:20 Widget.scala 112:13]
  wire  _T_8 = done & step_valid; // @[Decoupled.scala 51:35]
  wire [31:0] step_bits = step_q_io_deq_bits; // @[PeekPokeIO.scala 49:20 Widget.scala 112:13]
  wire  _T_11 = ~reset; // @[Lib.scala 284:13]
  wire [31:0] _GEN_13 = crFile_io_mcr_write_5_valid ? crFile_io_mcr_write_5_bits : {{31'd0}, target_reset_i}; // @[Lib.scala 280:32 281:18 PeekPokeIO.scala 59:10]
  wire [31:0] _GEN_14 = crFile_io_mcr_write_6_valid ? crFile_io_mcr_write_6_bits : {{31'd0}, target_io_b_i}; // @[Lib.scala 280:32 281:18 PeekPokeIO.scala 59:10]
  wire [31:0] _GEN_15 = crFile_io_mcr_write_7_valid ? crFile_io_mcr_write_7_bits : {{31'd0}, target_io_a_i}; // @[Lib.scala 280:32 281:18 PeekPokeIO.scala 59:10]
  Queue step_q ( // @[Decoupled.scala 375:21]
    .clock(step_q_clock),
    .reset(step_q_reset),
    .io_enq_ready(step_q_io_enq_ready),
    .io_enq_valid(step_q_io_enq_valid),
    .io_enq_bits(step_q_io_enq_bits),
    .io_deq_ready(step_q_io_deq_ready),
    .io_deq_valid(step_q_io_deq_valid),
    .io_deq_bits(step_q_io_deq_bits)
  );
  SatUpDownCounter SatUpDownCounter ( // @[Lib.scala 87:20]
    .clock(SatUpDownCounter_clock),
    .reset(SatUpDownCounter_reset),
    .io_inc(SatUpDownCounter_io_inc),
    .io_dec(SatUpDownCounter_io_dec),
    .io_value(SatUpDownCounter_io_value),
    .io_full(SatUpDownCounter_io_full),
    .io_empty(SatUpDownCounter_io_empty)
  );
  SatUpDownCounter SatUpDownCounter_1 ( // @[Lib.scala 87:20]
    .clock(SatUpDownCounter_1_clock),
    .reset(SatUpDownCounter_1_reset),
    .io_inc(SatUpDownCounter_1_io_inc),
    .io_dec(SatUpDownCounter_1_io_dec),
    .io_value(SatUpDownCounter_1_io_value),
    .io_full(SatUpDownCounter_1_io_full),
    .io_empty(SatUpDownCounter_1_io_empty)
  );
  SatUpDownCounter SatUpDownCounter_2 ( // @[Lib.scala 87:20]
    .clock(SatUpDownCounter_2_clock),
    .reset(SatUpDownCounter_2_reset),
    .io_inc(SatUpDownCounter_2_io_inc),
    .io_dec(SatUpDownCounter_2_io_dec),
    .io_value(SatUpDownCounter_2_io_value),
    .io_full(SatUpDownCounter_2_io_full),
    .io_empty(SatUpDownCounter_2_io_empty)
  );
  MCRFile_2 crFile ( // @[Widget.scala 166:24]
    .clock(crFile_clock),
    .reset(crFile_reset),
    .io_nasti_aw_ready(crFile_io_nasti_aw_ready),
    .io_nasti_aw_valid(crFile_io_nasti_aw_valid),
    .io_nasti_aw_bits_addr(crFile_io_nasti_aw_bits_addr),
    .io_nasti_aw_bits_len(crFile_io_nasti_aw_bits_len),
    .io_nasti_aw_bits_id(crFile_io_nasti_aw_bits_id),
    .io_nasti_w_ready(crFile_io_nasti_w_ready),
    .io_nasti_w_valid(crFile_io_nasti_w_valid),
    .io_nasti_w_bits_data(crFile_io_nasti_w_bits_data),
    .io_nasti_b_ready(crFile_io_nasti_b_ready),
    .io_nasti_b_valid(crFile_io_nasti_b_valid),
    .io_nasti_b_bits_id(crFile_io_nasti_b_bits_id),
    .io_nasti_ar_ready(crFile_io_nasti_ar_ready),
    .io_nasti_ar_valid(crFile_io_nasti_ar_valid),
    .io_nasti_ar_bits_addr(crFile_io_nasti_ar_bits_addr),
    .io_nasti_ar_bits_len(crFile_io_nasti_ar_bits_len),
    .io_nasti_ar_bits_id(crFile_io_nasti_ar_bits_id),
    .io_nasti_r_ready(crFile_io_nasti_r_ready),
    .io_nasti_r_valid(crFile_io_nasti_r_valid),
    .io_nasti_r_bits_data(crFile_io_nasti_r_bits_data),
    .io_nasti_r_bits_id(crFile_io_nasti_r_bits_id),
    .io_mcr_read_0_bits(crFile_io_mcr_read_0_bits),
    .io_mcr_read_1_bits(crFile_io_mcr_read_1_bits),
    .io_mcr_read_2_ready(crFile_io_mcr_read_2_ready),
    .io_mcr_read_3_ready(crFile_io_mcr_read_3_ready),
    .io_mcr_read_4_bits(crFile_io_mcr_read_4_bits),
    .io_mcr_read_5_bits(crFile_io_mcr_read_5_bits),
    .io_mcr_read_6_bits(crFile_io_mcr_read_6_bits),
    .io_mcr_read_7_bits(crFile_io_mcr_read_7_bits),
    .io_mcr_read_8_bits(crFile_io_mcr_read_8_bits),
    .io_mcr_write_0_valid(crFile_io_mcr_write_0_valid),
    .io_mcr_write_1_valid(crFile_io_mcr_write_1_valid),
    .io_mcr_write_2_valid(crFile_io_mcr_write_2_valid),
    .io_mcr_write_2_bits(crFile_io_mcr_write_2_bits),
    .io_mcr_write_3_ready(crFile_io_mcr_write_3_ready),
    .io_mcr_write_3_valid(crFile_io_mcr_write_3_valid),
    .io_mcr_write_3_bits(crFile_io_mcr_write_3_bits),
    .io_mcr_write_4_valid(crFile_io_mcr_write_4_valid),
    .io_mcr_write_4_bits(crFile_io_mcr_write_4_bits),
    .io_mcr_write_5_valid(crFile_io_mcr_write_5_valid),
    .io_mcr_write_5_bits(crFile_io_mcr_write_5_bits),
    .io_mcr_write_6_valid(crFile_io_mcr_write_6_valid),
    .io_mcr_write_6_bits(crFile_io_mcr_write_6_bits),
    .io_mcr_write_7_valid(crFile_io_mcr_write_7_valid),
    .io_mcr_write_7_bits(crFile_io_mcr_write_7_bits),
    .io_mcr_write_8_valid(crFile_io_mcr_write_8_valid),
    .io_mcr_write_8_bits(crFile_io_mcr_write_8_bits)
  );
  assign io_ctrl_aw_ready = crFile_io_nasti_aw_ready; // @[Widget.scala 168:21]
  assign io_ctrl_w_ready = crFile_io_nasti_w_ready; // @[Widget.scala 168:21]
  assign io_ctrl_b_valid = crFile_io_nasti_b_valid; // @[Widget.scala 168:21]
  assign io_ctrl_b_bits_id = crFile_io_nasti_b_bits_id; // @[Widget.scala 168:21]
  assign io_ctrl_ar_ready = crFile_io_nasti_ar_ready; // @[Widget.scala 168:21]
  assign io_ctrl_r_valid = crFile_io_nasti_r_valid; // @[Widget.scala 168:21]
  assign io_ctrl_r_bits_data = crFile_io_nasti_r_bits_data; // @[Widget.scala 168:21]
  assign io_ctrl_r_bits_id = crFile_io_nasti_r_bits_id; // @[Widget.scala 168:21]
  assign hPort_io_a_valid = ~SatUpDownCounter_2_io_full & _GEN_19 < cycleHorizon | wordsReceived_2; // @[PeekPokeIO.scala 91:78]
  assign hPort_io_a_bits = target_io_a_i; // @[PeekPokeIO.scala 90:{48,48}]
  assign hPort_io_b_valid = ~SatUpDownCounter_1_io_full & _GEN_18 < cycleHorizon | wordsReceived_1; // @[PeekPokeIO.scala 91:78]
  assign hPort_io_b_bits = target_io_b_i; // @[PeekPokeIO.scala 90:{48,48}]
  assign hPort_reset_valid = ~SatUpDownCounter_io_full & _GEN_17 < cycleHorizon | wordsReceived; // @[PeekPokeIO.scala 91:78]
  assign hPort_reset_bits = target_reset_i; // @[PeekPokeIO.scala 90:{48,48}]
  assign step_q_clock = clock;
  assign step_q_reset = reset;
  assign step_q_io_enq_valid = crFile_io_mcr_write_3_valid; // @[Widget.scala 111:19 Lib.scala 298:18]
  assign step_q_io_enq_bits = crFile_io_mcr_write_3_bits; // @[Widget.scala 111:19 Lib.scala 298:18]
  assign step_q_io_deq_ready = cycleHorizon == 32'h0; // @[PeekPokeIO.scala 54:26]
  assign SatUpDownCounter_clock = clock;
  assign SatUpDownCounter_reset = reset;
  assign SatUpDownCounter_io_inc = hPort_reset_ready & hPort_reset_valid; // @[Decoupled.scala 51:35]
  assign SatUpDownCounter_io_dec = tCycleWouldAdvance & cycleHorizon > 32'h0; // @[PeekPokeIO.scala 133:30]
  assign SatUpDownCounter_1_clock = clock;
  assign SatUpDownCounter_1_reset = reset;
  assign SatUpDownCounter_1_io_inc = hPort_io_b_ready & hPort_io_b_valid; // @[Decoupled.scala 51:35]
  assign SatUpDownCounter_1_io_dec = tCycleWouldAdvance & cycleHorizon > 32'h0; // @[PeekPokeIO.scala 133:30]
  assign SatUpDownCounter_2_clock = clock;
  assign SatUpDownCounter_2_reset = reset;
  assign SatUpDownCounter_2_io_inc = hPort_io_a_ready & hPort_io_a_valid; // @[Decoupled.scala 51:35]
  assign SatUpDownCounter_2_io_dec = tCycleWouldAdvance & cycleHorizon > 32'h0; // @[PeekPokeIO.scala 133:30]
  assign crFile_clock = clock;
  assign crFile_reset = reset;
  assign crFile_io_nasti_aw_valid = io_ctrl_aw_valid; // @[Widget.scala 168:21]
  assign crFile_io_nasti_aw_bits_addr = io_ctrl_aw_bits_addr; // @[Widget.scala 168:21]
  assign crFile_io_nasti_aw_bits_len = io_ctrl_aw_bits_len; // @[Widget.scala 168:21]
  assign crFile_io_nasti_aw_bits_id = io_ctrl_aw_bits_id; // @[Widget.scala 168:21]
  assign crFile_io_nasti_w_valid = io_ctrl_w_valid; // @[Widget.scala 168:21]
  assign crFile_io_nasti_w_bits_data = io_ctrl_w_bits_data; // @[Widget.scala 168:21]
  assign crFile_io_nasti_b_ready = io_ctrl_b_ready; // @[Widget.scala 168:21]
  assign crFile_io_nasti_ar_valid = io_ctrl_ar_valid; // @[Widget.scala 168:21]
  assign crFile_io_nasti_ar_bits_addr = io_ctrl_ar_bits_addr; // @[Widget.scala 168:21]
  assign crFile_io_nasti_ar_bits_len = io_ctrl_ar_bits_len; // @[Widget.scala 168:21]
  assign crFile_io_nasti_ar_bits_id = io_ctrl_ar_bits_id; // @[Widget.scala 168:21]
  assign crFile_io_nasti_r_ready = io_ctrl_r_ready; // @[Widget.scala 168:21]
  assign crFile_io_mcr_read_0_bits = tCycle_tCycle_mmreg[31:0]; // @[Widget.scala 152:30]
  assign crFile_io_mcr_read_1_bits = tCycle_tCycle_mmreg[63:32]; // @[Widget.scala 152:30]
  assign crFile_io_mcr_read_4_bits = DONE; // @[Lib.scala 288:24]
  assign crFile_io_mcr_read_5_bits = {{31'd0}, target_reset_i}; // @[Lib.scala 288:24]
  assign crFile_io_mcr_read_6_bits = {{31'd0}, target_io_b_i}; // @[Lib.scala 288:24]
  assign crFile_io_mcr_read_7_bits = {{31'd0}, target_io_a_i}; // @[Lib.scala 288:24]
  assign crFile_io_mcr_read_8_bits = PRECISE_PEEKABLE; // @[Lib.scala 288:24]
  assign crFile_io_mcr_write_3_ready = step_q_io_enq_ready; // @[Widget.scala 111:19 Decoupled.scala 379:17]
  always @(posedge clock) begin
    if (reset) begin // @[PeekPokeIO.scala 43:31]
      cycleHorizon <= 32'h0; // @[PeekPokeIO.scala 43:31]
    end else if (_T_8) begin // @[PeekPokeIO.scala 139:22]
      cycleHorizon <= step_bits; // @[PeekPokeIO.scala 140:20]
    end else if (tCycleAdvancing) begin // @[PeekPokeIO.scala 133:53]
      cycleHorizon <= _cycleHorizon_T_1; // @[PeekPokeIO.scala 135:20]
    end
    if (reset) begin // @[Widget.scala 146:30]
      tCycle <= 64'h0; // @[Widget.scala 146:30]
    end else if (tCycleAdvancing) begin // @[PeekPokeIO.scala 133:53]
      tCycle <= _tCycle_T_1; // @[PeekPokeIO.scala 134:14]
    end
    if (tCycle_tCycle_latchEnable) begin // @[Widget.scala 159:23]
      tCycle_tCycle_mmreg <= tCycle; // @[Widget.scala 160:17]
    end
    if (reset) begin // @[Widget.scala 127:33]
      DONE <= 32'h0; // @[Widget.scala 127:33]
    end else if (crFile_io_mcr_write_4_valid) begin // @[Lib.scala 280:32]
      DONE <= crFile_io_mcr_write_4_bits; // @[Lib.scala 281:18]
    end else begin
      DONE <= {{31'd0}, done}; // @[Widget.scala 129:44]
    end
    target_reset_i <= _GEN_13[0];
    if (reset) begin // @[PeekPokeIO.scala 81:34]
      wordsReceived <= 1'h0; // @[PeekPokeIO.scala 81:34]
    end else if (reset_poke) begin // @[PeekPokeIO.scala 84:19]
      wordsReceived <= wordsReceived + 1'h1; // @[PeekPokeIO.scala 85:23]
    end else if (_isAhead_T_1) begin // @[PeekPokeIO.scala 86:32]
      wordsReceived <= 1'h0; // @[PeekPokeIO.scala 87:23]
    end
    target_io_b_i <= _GEN_14[0];
    if (reset) begin // @[PeekPokeIO.scala 81:34]
      wordsReceived_1 <= 1'h0; // @[PeekPokeIO.scala 81:34]
    end else if (io_b_poke) begin // @[PeekPokeIO.scala 84:19]
      wordsReceived_1 <= wordsReceived_1 + 1'h1; // @[PeekPokeIO.scala 85:23]
    end else if (_isAhead_T_3) begin // @[PeekPokeIO.scala 86:32]
      wordsReceived_1 <= 1'h0; // @[PeekPokeIO.scala 87:23]
    end
    target_io_a_i <= _GEN_15[0];
    if (reset) begin // @[PeekPokeIO.scala 81:34]
      wordsReceived_2 <= 1'h0; // @[PeekPokeIO.scala 81:34]
    end else if (io_a_poke) begin // @[PeekPokeIO.scala 84:19]
      wordsReceived_2 <= wordsReceived_2 + 1'h1; // @[PeekPokeIO.scala 85:23]
    end else if (_isAhead_T_5) begin // @[PeekPokeIO.scala 86:32]
      wordsReceived_2 <= 1'h0; // @[PeekPokeIO.scala 87:23]
    end
    if (reset) begin // @[Widget.scala 127:33]
      PRECISE_PEEKABLE <= 32'h0; // @[Widget.scala 127:33]
    end else if (crFile_io_mcr_write_8_valid) begin // @[Lib.scala 280:32]
      PRECISE_PEEKABLE <= crFile_io_mcr_write_8_bits; // @[Lib.scala 281:18]
    end else begin
      PRECISE_PEEKABLE <= {{31'd0}, done}; // @[Widget.scala 129:44]
    end
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (~reset & ~(~crFile_io_mcr_write_0_valid)) begin
          $fwrite(32'h80000002,
            "Assertion failed: Register tCycle_0 is read only\n    at Lib.scala:284 assert(write(index).valid =/= true.B, s\"Register ${reg.name} is read only\")\n"
            ); // @[Lib.scala 284:13]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (~reset & ~(~crFile_io_mcr_write_1_valid)) begin
          $fwrite(32'h80000002,
            "Assertion failed: Register tCycle_1 is read only\n    at Lib.scala:284 assert(write(index).valid =/= true.B, s\"Register ${reg.name} is read only\")\n"
            ); // @[Lib.scala 284:13]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_11 & ~(~crFile_io_mcr_read_2_ready)) begin
          $fwrite(32'h80000002,
            "Assertion failed: Register ${reg.name} is write only\n    at Lib.scala:290 assert(read(index).ready === false.B, \"Register ${reg.name} is write only\")\n"
            ); // @[Lib.scala 290:13]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_11 & ~(~crFile_io_mcr_read_3_ready)) begin
          $fwrite(32'h80000002,
            "Assertion failed: Can only write to this decoupled sink\n    at Lib.scala:299 assert(read(index).ready === false.B, \"Can only write to this decoupled sink\")\n"
            ); // @[Lib.scala 299:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  cycleHorizon = _RAND_0[31:0];
  _RAND_1 = {2{`RANDOM}};
  tCycle = _RAND_1[63:0];
  _RAND_2 = {2{`RANDOM}};
  tCycle_tCycle_mmreg = _RAND_2[63:0];
  _RAND_3 = {1{`RANDOM}};
  DONE = _RAND_3[31:0];
  _RAND_4 = {1{`RANDOM}};
  target_reset_i = _RAND_4[0:0];
  _RAND_5 = {1{`RANDOM}};
  wordsReceived = _RAND_5[0:0];
  _RAND_6 = {1{`RANDOM}};
  target_io_b_i = _RAND_6[0:0];
  _RAND_7 = {1{`RANDOM}};
  wordsReceived_1 = _RAND_7[0:0];
  _RAND_8 = {1{`RANDOM}};
  target_io_a_i = _RAND_8[0:0];
  _RAND_9 = {1{`RANDOM}};
  wordsReceived_2 = _RAND_9[0:0];
  _RAND_10 = {1{`RANDOM}};
  PRECISE_PEEKABLE = _RAND_10[31:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
  always @(posedge clock) begin
    //
    if (~reset) begin
      assert(~crFile_io_mcr_write_0_valid); // @[Lib.scala 284:13]
    end
    //
    if (~reset) begin
      assert(~crFile_io_mcr_write_1_valid); // @[Lib.scala 284:13]
    end
    //
    if (_T_11) begin
      assert(~crFile_io_mcr_read_2_ready); // @[Lib.scala 290:13]
    end
    //
    if (_T_11) begin
      assert(~crFile_io_mcr_read_3_ready); // @[Lib.scala 299:11]
    end
  end
endmodule
module Queue_1(
  input           clock,
  input           reset,
  output          io_enq_ready,
  input           io_enq_valid,
  input  [1023:0] io_enq_bits,
  input           io_deq_ready,
  output          io_deq_valid,
  output [1023:0] io_deq_bits
);
`ifdef RANDOMIZE_MEM_INIT
  reg [1023:0] _RAND_0;
`endif // RANDOMIZE_MEM_INIT
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_1;
`endif // RANDOMIZE_REG_INIT
  reg [1023:0] ram [0:0]; // @[Decoupled.scala 273:95]
  wire  ram_io_deq_bits_MPORT_en; // @[Decoupled.scala 273:95 310:23]
  wire  ram_io_deq_bits_MPORT_addr; // @[Decoupled.scala 273:95 310:23]
  wire [1023:0] ram_io_deq_bits_MPORT_data; // @[Decoupled.scala 273:95]
  wire [1023:0] ram_MPORT_data; // @[Decoupled.scala 273:95 286:16 287:24]
  wire  ram_MPORT_addr; // @[Decoupled.scala 273:95 286:16 287:8]
  wire  ram_MPORT_mask; // @[Decoupled.scala 273:95 286:16 287:24]
  wire  ram_MPORT_en; // @[Decoupled.scala 273:95 51:35]
  reg  maybe_full; // @[Decoupled.scala 276:27]
  wire  empty = ~maybe_full; // @[Decoupled.scala 278:28]
  wire  do_enq = io_enq_ready & io_enq_valid; // @[Decoupled.scala 51:35]
  wire  do_deq = io_deq_ready & io_deq_valid; // @[Decoupled.scala 51:35]
  assign ram_io_deq_bits_MPORT_en = 1'h1; // @[Decoupled.scala 310:23]
  assign ram_io_deq_bits_MPORT_addr = 1'h0; // @[Decoupled.scala 310:23]
  assign ram_io_deq_bits_MPORT_data = ram[ram_io_deq_bits_MPORT_addr]; // @[Decoupled.scala 273:95]
  assign ram_MPORT_data = io_enq_bits; // @[Decoupled.scala 286:16 287:24]
  assign ram_MPORT_addr = 1'h0; // @[Decoupled.scala 286:16 287:8]
  assign ram_MPORT_mask = 1'h1; // @[Decoupled.scala 286:16 287:24]
  assign ram_MPORT_en = io_enq_ready & io_enq_valid; // @[Decoupled.scala 51:35]
  assign io_enq_ready = io_deq_ready | empty; // @[Decoupled.scala 303:16 323:{24,39}]
  assign io_deq_valid = ~empty; // @[Decoupled.scala 302:19]
  assign io_deq_bits = ram_io_deq_bits_MPORT_data; // @[Decoupled.scala 310:17]
  always @(posedge clock) begin
    if (ram_MPORT_en & ram_MPORT_mask) begin
      ram[ram_MPORT_addr] <= ram_MPORT_data; // @[Decoupled.scala 273:95]
    end
    if (reset) begin // @[Decoupled.scala 276:27]
      maybe_full <= 1'h0; // @[Decoupled.scala 276:27]
    end else if (do_enq != do_deq) begin // @[Decoupled.scala 293:27]
      maybe_full <= do_enq; // @[Decoupled.scala 294:16]
    end
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_MEM_INIT
  _RAND_0 = {32{`RANDOM}};
  for (initvar = 0; initvar < 1; initvar = initvar+1)
    ram[initvar] = _RAND_0[1023:0];
`endif // RANDOMIZE_MEM_INIT
`ifdef RANDOMIZE_REG_INIT
  _RAND_1 = {1{`RANDOM}};
  maybe_full = _RAND_1[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module MultiWidthFifo(
  input           clock,
  input           reset,
  output          io_in_ready,
  input           io_in_valid,
  input  [1023:0] io_in_bits,
  input           io_out_ready,
  output          io_out_valid,
  output [511:0]  io_out_bits
);
`ifdef RANDOMIZE_REG_INIT
  reg [1023:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
`endif // RANDOMIZE_REG_INIT
  reg [1023:0] wdata_0; // @[MultiWidthFifo.scala 26:20]
  wire [511:0] rdata_0 = wdata_0[511:0]; // @[MultiWidthFifo.scala 28:38]
  wire [511:0] rdata_1 = wdata_0[1023:512]; // @[MultiWidthFifo.scala 28:38]
  reg  tail; // @[MultiWidthFifo.scala 32:19]
  reg [1:0] size; // @[MultiWidthFifo.scala 33:19]
  wire  _T = io_in_ready & io_in_valid; // @[Decoupled.scala 51:35]
  wire  _T_1 = io_out_ready & io_out_valid; // @[Decoupled.scala 51:35]
  wire  _size_T_2 = _T & _T_1; // @[MultiWidthFifo.scala 45:21]
  wire [1:0] _size_T_4 = size + 2'h1; // @[MultiWidthFifo.scala 45:46]
  wire [1:0] _size_T_7 = size + 2'h2; // @[MultiWidthFifo.scala 46:46]
  wire [1:0] _size_T_10 = size - 2'h1; // @[MultiWidthFifo.scala 47:46]
  assign io_in_ready = size < 2'h1; // @[MultiWidthFifo.scala 53:26]
  assign io_out_valid = size > 2'h0; // @[MultiWidthFifo.scala 51:26]
  assign io_out_bits = tail ? rdata_1 : rdata_0; // @[MultiWidthFifo.scala 52:{18,18}]
  always @(posedge clock) begin
    if (_T) begin // @[MultiWidthFifo.scala 35:22]
      wdata_0 <= io_in_bits; // @[MultiWidthFifo.scala 36:19]
    end
    if (reset) begin // @[MultiWidthFifo.scala 32:19]
      tail <= 1'h0; // @[MultiWidthFifo.scala 32:19]
    end else if (_T_1) begin // @[MultiWidthFifo.scala 40:23]
      tail <= tail + 1'h1; // @[MultiWidthFifo.scala 40:30]
    end
    if (reset) begin // @[MultiWidthFifo.scala 33:19]
      size <= 2'h0; // @[MultiWidthFifo.scala 33:19]
    end else if (_size_T_2) begin // @[Mux.scala 101:16]
      size <= _size_T_4;
    end else if (_T) begin // @[Mux.scala 101:16]
      size <= _size_T_7;
    end else if (_T_1) begin // @[Mux.scala 101:16]
      size <= _size_T_10;
    end
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {32{`RANDOM}};
  wdata_0 = _RAND_0[1023:0];
  _RAND_1 = {1{`RANDOM}};
  tail = _RAND_1[0:0];
  _RAND_2 = {1{`RANDOM}};
  size = _RAND_2[1:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module PrintBridgeModule(
  input          clock,
  input          reset,
  input          streamToHostCPU_ready,
  output         streamToHostCPU_valid,
  output [511:0] streamToHostCPU_bits,
  output         io_ctrl_aw_ready,
  input          io_ctrl_aw_valid,
  input  [11:0]  io_ctrl_aw_bits_addr,
  input  [7:0]   io_ctrl_aw_bits_len,
  input          io_ctrl_aw_bits_id,
  output         io_ctrl_w_ready,
  input          io_ctrl_w_valid,
  input  [31:0]  io_ctrl_w_bits_data,
  input          io_ctrl_b_ready,
  output         io_ctrl_b_valid,
  output         io_ctrl_b_bits_id,
  output         io_ctrl_ar_ready,
  input          io_ctrl_ar_valid,
  input  [11:0]  io_ctrl_ar_bits_addr,
  input  [7:0]   io_ctrl_ar_bits_len,
  input          io_ctrl_ar_bits_id,
  input          io_ctrl_r_ready,
  output         io_ctrl_r_valid,
  output [31:0]  io_ctrl_r_bits_data,
  output         io_ctrl_r_bits_id,
  input  [527:0] hPort_hBits_synthesizedPrintf_dut_printf_1_wire_args_1,
  input  [15:0]  hPort_hBits_synthesizedPrintf_dut_printf_1_wire_args_0,
  input          hPort_hBits_synthesizedPrintf_dut_printf_1_wire_enable,
  input  [7:0]   hPort_hBits_synthesizedPrintf_dut_printf_2_wire_args_1,
  input  [15:0]  hPort_hBits_synthesizedPrintf_dut_printf_2_wire_args_0,
  input          hPort_hBits_synthesizedPrintf_dut_printf_2_wire_enable,
  input  [15:0]  hPort_hBits_synthesizedPrintf_dut_childInst_printf_wire_args_1,
  input  [15:0]  hPort_hBits_synthesizedPrintf_dut_childInst_printf_wire_args_0,
  input          hPort_hBits_synthesizedPrintf_dut_childInst_printf_wire_enable,
  input  [15:0]  hPort_hBits_synthesizedPrintf_dut_printf_wire_args_0,
  input          hPort_hBits_synthesizedPrintf_dut_printf_wire_enable,
  input          hPort_hBits_synthesizedPrintf_RationalClockBridge_clocks_0_globalReset,
  output         hPort_toHost_hReady,
  input          hPort_toHost_hValid
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
  reg [31:0] _RAND_5;
  reg [63:0] _RAND_6;
  reg [31:0] _RAND_7;
`endif // RANDOMIZE_REG_INIT
  wire  dataPipe_clock; // @[PrintBridge.scala 132:26]
  wire  dataPipe_reset; // @[PrintBridge.scala 132:26]
  wire  dataPipe_io_enq_ready; // @[PrintBridge.scala 132:26]
  wire  dataPipe_io_enq_valid; // @[PrintBridge.scala 132:26]
  wire [1023:0] dataPipe_io_enq_bits; // @[PrintBridge.scala 132:26]
  wire  dataPipe_io_deq_ready; // @[PrintBridge.scala 132:26]
  wire  dataPipe_io_deq_valid; // @[PrintBridge.scala 132:26]
  wire [1023:0] dataPipe_io_deq_bits; // @[PrintBridge.scala 132:26]
  wire  widthAdapter_clock; // @[PrintBridge.scala 160:32]
  wire  widthAdapter_reset; // @[PrintBridge.scala 160:32]
  wire  widthAdapter_io_in_ready; // @[PrintBridge.scala 160:32]
  wire  widthAdapter_io_in_valid; // @[PrintBridge.scala 160:32]
  wire [1023:0] widthAdapter_io_in_bits; // @[PrintBridge.scala 160:32]
  wire  widthAdapter_io_out_ready; // @[PrintBridge.scala 160:32]
  wire  widthAdapter_io_out_valid; // @[PrintBridge.scala 160:32]
  wire [511:0] widthAdapter_io_out_bits; // @[PrintBridge.scala 160:32]
  wire  crFile_clock; // @[Widget.scala 166:24]
  wire  crFile_reset; // @[Widget.scala 166:24]
  wire  crFile_io_nasti_aw_ready; // @[Widget.scala 166:24]
  wire  crFile_io_nasti_aw_valid; // @[Widget.scala 166:24]
  wire [11:0] crFile_io_nasti_aw_bits_addr; // @[Widget.scala 166:24]
  wire [7:0] crFile_io_nasti_aw_bits_len; // @[Widget.scala 166:24]
  wire  crFile_io_nasti_aw_bits_id; // @[Widget.scala 166:24]
  wire  crFile_io_nasti_w_ready; // @[Widget.scala 166:24]
  wire  crFile_io_nasti_w_valid; // @[Widget.scala 166:24]
  wire [31:0] crFile_io_nasti_w_bits_data; // @[Widget.scala 166:24]
  wire  crFile_io_nasti_b_ready; // @[Widget.scala 166:24]
  wire  crFile_io_nasti_b_valid; // @[Widget.scala 166:24]
  wire  crFile_io_nasti_b_bits_id; // @[Widget.scala 166:24]
  wire  crFile_io_nasti_ar_ready; // @[Widget.scala 166:24]
  wire  crFile_io_nasti_ar_valid; // @[Widget.scala 166:24]
  wire [11:0] crFile_io_nasti_ar_bits_addr; // @[Widget.scala 166:24]
  wire [7:0] crFile_io_nasti_ar_bits_len; // @[Widget.scala 166:24]
  wire  crFile_io_nasti_ar_bits_id; // @[Widget.scala 166:24]
  wire  crFile_io_nasti_r_ready; // @[Widget.scala 166:24]
  wire  crFile_io_nasti_r_valid; // @[Widget.scala 166:24]
  wire [31:0] crFile_io_nasti_r_bits_data; // @[Widget.scala 166:24]
  wire  crFile_io_nasti_r_bits_id; // @[Widget.scala 166:24]
  wire [31:0] crFile_io_mcr_read_0_bits; // @[Widget.scala 166:24]
  wire [31:0] crFile_io_mcr_read_1_bits; // @[Widget.scala 166:24]
  wire  crFile_io_mcr_read_2_ready; // @[Widget.scala 166:24]
  wire [31:0] crFile_io_mcr_read_2_bits; // @[Widget.scala 166:24]
  wire [31:0] crFile_io_mcr_read_3_bits; // @[Widget.scala 166:24]
  wire [31:0] crFile_io_mcr_read_4_bits; // @[Widget.scala 166:24]
  wire  crFile_io_mcr_read_5_ready; // @[Widget.scala 166:24]
  wire [31:0] crFile_io_mcr_read_5_bits; // @[Widget.scala 166:24]
  wire  crFile_io_mcr_write_0_valid; // @[Widget.scala 166:24]
  wire [31:0] crFile_io_mcr_write_0_bits; // @[Widget.scala 166:24]
  wire  crFile_io_mcr_write_1_valid; // @[Widget.scala 166:24]
  wire [31:0] crFile_io_mcr_write_1_bits; // @[Widget.scala 166:24]
  wire  crFile_io_mcr_write_2_valid; // @[Widget.scala 166:24]
  wire [31:0] crFile_io_mcr_write_2_bits; // @[Widget.scala 166:24]
  wire  crFile_io_mcr_write_3_valid; // @[Widget.scala 166:24]
  wire [31:0] crFile_io_mcr_write_3_bits; // @[Widget.scala 166:24]
  wire  crFile_io_mcr_write_4_valid; // @[Widget.scala 166:24]
  wire [31:0] crFile_io_mcr_write_4_bits; // @[Widget.scala 166:24]
  wire  crFile_io_mcr_write_5_valid; // @[Widget.scala 166:24]
  wire [31:0] crFile_io_mcr_write_5_bits; // @[Widget.scala 166:24]
  reg [31:0] startCycleL; // @[Widget.scala 126:29]
  reg [31:0] startCycleH; // @[Widget.scala 126:29]
  reg [31:0] endCycleL; // @[Widget.scala 126:29]
  reg [31:0] endCycleH; // @[Widget.scala 126:29]
  reg  doneInit; // @[Widget.scala 127:33]
  reg  flushNarrowPacket_1; // @[Widget.scala 127:33]
  wire  _GEN_0 = flushNarrowPacket_1 ? 1'h0 : flushNarrowPacket_1; // @[Pulsify.scala 29:{16,21} Widget.scala 127:33]
  wire [63:0] startCycle = {startCycleH,startCycleL}; // @[Cat.scala 33:92]
  wire [63:0] endCycle = {endCycleH,endCycleL}; // @[Cat.scala 33:92]
  reg [63:0] currentCycle; // @[PrintBridge.scala 100:31]
  reg [14:0] idleCycles; // @[PrintBridge.scala 101:31]
  wire  enable = startCycle <= currentCycle & currentCycle <= endCycle; // @[PrintBridge.scala 104:47]
  wire  bufferReady = widthAdapter_io_in_ready; // @[PrintBridge.scala 105:27 172:19]
  wire  readyToEnqToken = ~enable | bufferReady; // @[PrintBridge.scala 106:35]
  wire  _T = ~flushNarrowPacket_1; // @[PrintBridge.scala 113:39]
  wire  _hPort_toHost_hReady_T = doneInit & hPort_toHost_hValid; // @[Misc.scala 28:18]
  wire  _hPort_toHost_hReady_T_2 = doneInit & hPort_toHost_hValid & readyToEnqToken & _T; // @[Misc.scala 28:18]
  wire [63:0] _currentCycle_T_1 = currentCycle + 64'h1; // @[PrintBridge.scala 123:36]
  wire  valid = (hPort_hBits_synthesizedPrintf_dut_printf_wire_enable |
    hPort_hBits_synthesizedPrintf_dut_childInst_printf_wire_enable |
    hPort_hBits_synthesizedPrintf_dut_printf_2_wire_enable | hPort_hBits_synthesizedPrintf_dut_printf_1_wire_enable) & ~
    hPort_hBits_synthesizedPrintf_RationalClockBridge_clocks_0_globalReset; // @[PrintBridge.scala 49:89]
  wire [49:0] printsAsUInt_lo = {hPort_hBits_synthesizedPrintf_dut_childInst_printf_wire_args_1,
    hPort_hBits_synthesizedPrintf_dut_childInst_printf_wire_args_0,
    hPort_hBits_synthesizedPrintf_dut_childInst_printf_wire_enable,hPort_hBits_synthesizedPrintf_dut_printf_wire_args_0,
    hPort_hBits_synthesizedPrintf_dut_printf_wire_enable}; // @[Cat.scala 33:92]
  wire [620:0] _data_T = {hPort_hBits_synthesizedPrintf_dut_printf_1_wire_args_1,
    hPort_hBits_synthesizedPrintf_dut_printf_1_wire_args_0,hPort_hBits_synthesizedPrintf_dut_printf_1_wire_enable,
    hPort_hBits_synthesizedPrintf_dut_printf_2_wire_args_1,hPort_hBits_synthesizedPrintf_dut_printf_2_wire_args_0,
    hPort_hBits_synthesizedPrintf_dut_printf_2_wire_enable,printsAsUInt_lo,valid}; // @[Cat.scala 33:92]
  wire  _dataPipe_io_enq_valid_T_1 = _hPort_toHost_hReady_T_2 & valid & enable; // @[PrintBridge.scala 134:45]
  wire  idleCyclesRollover = &idleCycles; // @[PrintBridge.scala 137:41]
  wire [14:0] _idleCycles_T_1 = idleCycles + 15'h1; // @[PrintBridge.scala 141:61]
  wire [15:0] _printToken_T = {idleCycles,1'h0}; // @[Cat.scala 33:92]
  wire  _tokenValid_T_1 = _hPort_toHost_hReady_T & _T; // @[Misc.scala 25:53]
  wire  _tokenValid_T_6 = valid & idleCycles != 15'h0 | idleCyclesRollover; // @[PrintBridge.scala 150:54]
  wire  _tokenValid_T_7 = _tokenValid_T_1 & enable & _tokenValid_T_6; // @[PrintBridge.scala 149:66]
  wire [31:0] _GEN_8 = crFile_io_mcr_write_4_valid ? crFile_io_mcr_write_4_bits : {{31'd0}, doneInit}; // @[Lib.scala 280:32 281:18 Widget.scala 127:33]
  wire [31:0] _GEN_9 = crFile_io_mcr_write_5_valid ? crFile_io_mcr_write_5_bits : {{31'd0}, _GEN_0}; // @[Lib.scala 280:32 281:18]
  wire [31:0] _GEN_10 = reset ? 32'h0 : _GEN_8; // @[Widget.scala 127:{33,33}]
  wire [31:0] _GEN_11 = reset ? 32'h0 : _GEN_9; // @[Widget.scala 127:{33,33}]
  Queue_1 dataPipe ( // @[PrintBridge.scala 132:26]
    .clock(dataPipe_clock),
    .reset(dataPipe_reset),
    .io_enq_ready(dataPipe_io_enq_ready),
    .io_enq_valid(dataPipe_io_enq_valid),
    .io_enq_bits(dataPipe_io_enq_bits),
    .io_deq_ready(dataPipe_io_deq_ready),
    .io_deq_valid(dataPipe_io_deq_valid),
    .io_deq_bits(dataPipe_io_deq_bits)
  );
  MultiWidthFifo widthAdapter ( // @[PrintBridge.scala 160:32]
    .clock(widthAdapter_clock),
    .reset(widthAdapter_reset),
    .io_in_ready(widthAdapter_io_in_ready),
    .io_in_valid(widthAdapter_io_in_valid),
    .io_in_bits(widthAdapter_io_in_bits),
    .io_out_ready(widthAdapter_io_out_ready),
    .io_out_valid(widthAdapter_io_out_valid),
    .io_out_bits(widthAdapter_io_out_bits)
  );
  MCRFile_1 crFile ( // @[Widget.scala 166:24]
    .clock(crFile_clock),
    .reset(crFile_reset),
    .io_nasti_aw_ready(crFile_io_nasti_aw_ready),
    .io_nasti_aw_valid(crFile_io_nasti_aw_valid),
    .io_nasti_aw_bits_addr(crFile_io_nasti_aw_bits_addr),
    .io_nasti_aw_bits_len(crFile_io_nasti_aw_bits_len),
    .io_nasti_aw_bits_id(crFile_io_nasti_aw_bits_id),
    .io_nasti_w_ready(crFile_io_nasti_w_ready),
    .io_nasti_w_valid(crFile_io_nasti_w_valid),
    .io_nasti_w_bits_data(crFile_io_nasti_w_bits_data),
    .io_nasti_b_ready(crFile_io_nasti_b_ready),
    .io_nasti_b_valid(crFile_io_nasti_b_valid),
    .io_nasti_b_bits_id(crFile_io_nasti_b_bits_id),
    .io_nasti_ar_ready(crFile_io_nasti_ar_ready),
    .io_nasti_ar_valid(crFile_io_nasti_ar_valid),
    .io_nasti_ar_bits_addr(crFile_io_nasti_ar_bits_addr),
    .io_nasti_ar_bits_len(crFile_io_nasti_ar_bits_len),
    .io_nasti_ar_bits_id(crFile_io_nasti_ar_bits_id),
    .io_nasti_r_ready(crFile_io_nasti_r_ready),
    .io_nasti_r_valid(crFile_io_nasti_r_valid),
    .io_nasti_r_bits_data(crFile_io_nasti_r_bits_data),
    .io_nasti_r_bits_id(crFile_io_nasti_r_bits_id),
    .io_mcr_read_0_bits(crFile_io_mcr_read_0_bits),
    .io_mcr_read_1_bits(crFile_io_mcr_read_1_bits),
    .io_mcr_read_2_ready(crFile_io_mcr_read_2_ready),
    .io_mcr_read_2_bits(crFile_io_mcr_read_2_bits),
    .io_mcr_read_3_bits(crFile_io_mcr_read_3_bits),
    .io_mcr_read_4_bits(crFile_io_mcr_read_4_bits),
    .io_mcr_read_5_ready(crFile_io_mcr_read_5_ready),
    .io_mcr_read_5_bits(crFile_io_mcr_read_5_bits),
    .io_mcr_write_0_valid(crFile_io_mcr_write_0_valid),
    .io_mcr_write_0_bits(crFile_io_mcr_write_0_bits),
    .io_mcr_write_1_valid(crFile_io_mcr_write_1_valid),
    .io_mcr_write_1_bits(crFile_io_mcr_write_1_bits),
    .io_mcr_write_2_valid(crFile_io_mcr_write_2_valid),
    .io_mcr_write_2_bits(crFile_io_mcr_write_2_bits),
    .io_mcr_write_3_valid(crFile_io_mcr_write_3_valid),
    .io_mcr_write_3_bits(crFile_io_mcr_write_3_bits),
    .io_mcr_write_4_valid(crFile_io_mcr_write_4_valid),
    .io_mcr_write_4_bits(crFile_io_mcr_write_4_bits),
    .io_mcr_write_5_valid(crFile_io_mcr_write_5_valid),
    .io_mcr_write_5_bits(crFile_io_mcr_write_5_bits)
  );
  assign streamToHostCPU_valid = widthAdapter_io_out_valid; // @[PrintBridge.scala 161:17]
  assign streamToHostCPU_bits = widthAdapter_io_out_bits; // @[PrintBridge.scala 161:17]
  assign io_ctrl_aw_ready = crFile_io_nasti_aw_ready; // @[Widget.scala 168:21]
  assign io_ctrl_w_ready = crFile_io_nasti_w_ready; // @[Widget.scala 168:21]
  assign io_ctrl_b_valid = crFile_io_nasti_b_valid; // @[Widget.scala 168:21]
  assign io_ctrl_b_bits_id = crFile_io_nasti_b_bits_id; // @[Widget.scala 168:21]
  assign io_ctrl_ar_ready = crFile_io_nasti_ar_ready; // @[Widget.scala 168:21]
  assign io_ctrl_r_valid = crFile_io_nasti_r_valid; // @[Widget.scala 168:21]
  assign io_ctrl_r_bits_data = crFile_io_nasti_r_bits_data; // @[Widget.scala 168:21]
  assign io_ctrl_r_bits_id = crFile_io_nasti_r_bits_id; // @[Widget.scala 168:21]
  assign hPort_toHost_hReady = doneInit & hPort_toHost_hValid & readyToEnqToken & _T; // @[Misc.scala 28:18]
  assign dataPipe_clock = clock;
  assign dataPipe_reset = reset;
  assign dataPipe_io_enq_valid = _hPort_toHost_hReady_T_2 & valid & enable; // @[PrintBridge.scala 134:45]
  assign dataPipe_io_enq_bits = {{403'd0}, _data_T}; // @[PrintBridge.scala 129:41]
  assign dataPipe_io_deq_ready = widthAdapter_io_in_ready; // @[PrintBridge.scala 105:27 172:19]
  assign widthAdapter_clock = clock;
  assign widthAdapter_reset = reset;
  assign widthAdapter_io_in_valid = _tokenValid_T_7 | dataPipe_io_deq_valid; // @[PrintBridge.scala 150:77]
  assign widthAdapter_io_in_bits = dataPipe_io_deq_valid ? dataPipe_io_deq_bits : {{1008'd0}, _printToken_T}; // @[PrintBridge.scala 144:25]
  assign widthAdapter_io_out_ready = streamToHostCPU_ready; // @[PrintBridge.scala 161:17]
  assign crFile_clock = clock;
  assign crFile_reset = reset;
  assign crFile_io_nasti_aw_valid = io_ctrl_aw_valid; // @[Widget.scala 168:21]
  assign crFile_io_nasti_aw_bits_addr = io_ctrl_aw_bits_addr; // @[Widget.scala 168:21]
  assign crFile_io_nasti_aw_bits_len = io_ctrl_aw_bits_len; // @[Widget.scala 168:21]
  assign crFile_io_nasti_aw_bits_id = io_ctrl_aw_bits_id; // @[Widget.scala 168:21]
  assign crFile_io_nasti_w_valid = io_ctrl_w_valid; // @[Widget.scala 168:21]
  assign crFile_io_nasti_w_bits_data = io_ctrl_w_bits_data; // @[Widget.scala 168:21]
  assign crFile_io_nasti_b_ready = io_ctrl_b_ready; // @[Widget.scala 168:21]
  assign crFile_io_nasti_ar_valid = io_ctrl_ar_valid; // @[Widget.scala 168:21]
  assign crFile_io_nasti_ar_bits_addr = io_ctrl_ar_bits_addr; // @[Widget.scala 168:21]
  assign crFile_io_nasti_ar_bits_len = io_ctrl_ar_bits_len; // @[Widget.scala 168:21]
  assign crFile_io_nasti_ar_bits_id = io_ctrl_ar_bits_id; // @[Widget.scala 168:21]
  assign crFile_io_nasti_r_ready = io_ctrl_r_ready; // @[Widget.scala 168:21]
  assign crFile_io_mcr_read_0_bits = startCycleL; // @[Lib.scala 288:24]
  assign crFile_io_mcr_read_1_bits = startCycleH; // @[Lib.scala 288:24]
  assign crFile_io_mcr_read_2_bits = endCycleL; // @[Lib.scala 288:24]
  assign crFile_io_mcr_read_3_bits = endCycleH; // @[Lib.scala 288:24]
  assign crFile_io_mcr_read_4_bits = {{31'd0}, doneInit}; // @[Lib.scala 288:24]
  assign crFile_io_mcr_read_5_bits = {{31'd0}, flushNarrowPacket_1}; // @[Lib.scala 288:24]
  always @(posedge clock) begin
    if (crFile_io_mcr_write_0_valid) begin // @[Lib.scala 280:32]
      startCycleL <= crFile_io_mcr_write_0_bits; // @[Lib.scala 281:18]
    end
    if (crFile_io_mcr_write_1_valid) begin // @[Lib.scala 280:32]
      startCycleH <= crFile_io_mcr_write_1_bits; // @[Lib.scala 281:18]
    end
    if (crFile_io_mcr_write_2_valid) begin // @[Lib.scala 280:32]
      endCycleL <= crFile_io_mcr_write_2_bits; // @[Lib.scala 281:18]
    end
    if (crFile_io_mcr_write_3_valid) begin // @[Lib.scala 280:32]
      endCycleH <= crFile_io_mcr_write_3_bits; // @[Lib.scala 281:18]
    end
    doneInit <= _GEN_10[0]; // @[Widget.scala 127:{33,33}]
    flushNarrowPacket_1 <= _GEN_11[0]; // @[Widget.scala 127:{33,33}]
    if (reset) begin // @[PrintBridge.scala 100:31]
      currentCycle <= 64'h0; // @[PrintBridge.scala 100:31]
    end else if (_hPort_toHost_hReady_T_2) begin // @[PrintBridge.scala 122:18]
      currentCycle <= _currentCycle_T_1; // @[PrintBridge.scala 123:20]
    end
    if (reset) begin // @[PrintBridge.scala 101:31]
      idleCycles <= 15'h0; // @[PrintBridge.scala 101:31]
    end else if (_dataPipe_io_enq_valid_T_1 | flushNarrowPacket_1) begin // @[PrintBridge.scala 138:60]
      idleCycles <= 15'h0; // @[PrintBridge.scala 139:18]
    end else if (_hPort_toHost_hReady_T_2 & enable) begin // @[PrintBridge.scala 140:33]
      if (idleCyclesRollover) begin // @[PrintBridge.scala 141:24]
        idleCycles <= 15'h1;
      end else begin
        idleCycles <= _idleCycles_T_1;
      end
    end
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  startCycleL = _RAND_0[31:0];
  _RAND_1 = {1{`RANDOM}};
  startCycleH = _RAND_1[31:0];
  _RAND_2 = {1{`RANDOM}};
  endCycleL = _RAND_2[31:0];
  _RAND_3 = {1{`RANDOM}};
  endCycleH = _RAND_3[31:0];
  _RAND_4 = {1{`RANDOM}};
  doneInit = _RAND_4[0:0];
  _RAND_5 = {1{`RANDOM}};
  flushNarrowPacket_1 = _RAND_5[0:0];
  _RAND_6 = {2{`RANDOM}};
  currentCycle = _RAND_6[63:0];
  _RAND_7 = {1{`RANDOM}};
  idleCycles = _RAND_7[14:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module AXI4Xbar(
  input          clock,
  input          reset,
  output         auto_in_aw_ready,
  input          auto_in_aw_valid,
  input          auto_in_aw_bits_id,
  input  [21:0]  auto_in_aw_bits_addr,
  input  [7:0]   auto_in_aw_bits_len,
  input  [2:0]   auto_in_aw_bits_size,
  input  [1:0]   auto_in_aw_bits_burst,
  input          auto_in_aw_bits_lock,
  input  [3:0]   auto_in_aw_bits_cache,
  input  [2:0]   auto_in_aw_bits_prot,
  input  [3:0]   auto_in_aw_bits_qos,
  output         auto_in_w_ready,
  input          auto_in_w_valid,
  input  [511:0] auto_in_w_bits_data,
  input  [63:0]  auto_in_w_bits_strb,
  input          auto_in_w_bits_last,
  input          auto_in_b_ready,
  output         auto_in_b_valid,
  output         auto_in_ar_ready,
  input          auto_in_ar_valid,
  input          auto_in_ar_bits_id,
  input  [21:0]  auto_in_ar_bits_addr,
  input  [7:0]   auto_in_ar_bits_len,
  input  [2:0]   auto_in_ar_bits_size,
  input  [1:0]   auto_in_ar_bits_burst,
  input          auto_in_ar_bits_lock,
  input  [3:0]   auto_in_ar_bits_cache,
  input  [2:0]   auto_in_ar_bits_prot,
  input  [3:0]   auto_in_ar_bits_qos,
  input          auto_in_r_ready,
  output         auto_in_r_valid,
  input          auto_out_aw_ready,
  output         auto_out_aw_valid,
  output         auto_out_aw_bits_id,
  output [21:0]  auto_out_aw_bits_addr,
  output [7:0]   auto_out_aw_bits_len,
  output [2:0]   auto_out_aw_bits_size,
  output [1:0]   auto_out_aw_bits_burst,
  output         auto_out_aw_bits_lock,
  output [3:0]   auto_out_aw_bits_cache,
  output [2:0]   auto_out_aw_bits_prot,
  output [3:0]   auto_out_aw_bits_qos,
  input          auto_out_w_ready,
  output         auto_out_w_valid,
  output [511:0] auto_out_w_bits_data,
  output [63:0]  auto_out_w_bits_strb,
  output         auto_out_w_bits_last,
  output         auto_out_b_ready,
  input          auto_out_b_valid,
  input          auto_out_b_bits_id,
  input          auto_out_ar_ready,
  output         auto_out_ar_valid,
  output         auto_out_ar_bits_id,
  output [21:0]  auto_out_ar_bits_addr,
  output [7:0]   auto_out_ar_bits_len,
  output [2:0]   auto_out_ar_bits_size,
  output [1:0]   auto_out_ar_bits_burst,
  output         auto_out_ar_bits_lock,
  output [3:0]   auto_out_ar_bits_cache,
  output [2:0]   auto_out_ar_bits_prot,
  output [3:0]   auto_out_ar_bits_qos,
  output         auto_out_r_ready,
  input          auto_out_r_valid,
  input          auto_out_r_bits_id
);
  wire  requestROI_0_0 = ~auto_out_r_bits_id; // @[Parameters.scala 46:9]
  wire  requestBOI_0_0 = ~auto_out_b_bits_id; // @[Parameters.scala 46:9]
  wire  portsRIO_filtered_0_valid = auto_out_r_valid & requestROI_0_0; // @[Xbar.scala 242:40]
  wire  portsBIO_filtered_0_valid = auto_out_b_valid & requestBOI_0_0; // @[Xbar.scala 242:40]
  wire  _awOut_0_io_enq_bits_T_1 = ~auto_in_aw_valid; // @[Xbar.scala 276:60]
  wire  _awOut_0_io_enq_bits_T_4 = ~reset; // @[Xbar.scala 276:11]
  wire  _T_1 = ~auto_in_ar_valid; // @[Xbar.scala 276:60]
  wire  _T_14 = ~portsRIO_filtered_0_valid; // @[Xbar.scala 276:60]
  wire  _T_26 = ~portsBIO_filtered_0_valid; // @[Xbar.scala 276:60]
  assign auto_in_aw_ready = auto_out_aw_ready; // @[Nodes.scala 1212:84 LazyModule.scala 368:12]
  assign auto_in_w_ready = auto_out_w_ready; // @[Nodes.scala 1212:84 LazyModule.scala 368:12]
  assign auto_in_b_valid = auto_out_b_valid & requestBOI_0_0; // @[Xbar.scala 242:40]
  assign auto_in_ar_ready = auto_out_ar_ready; // @[Nodes.scala 1212:84 LazyModule.scala 368:12]
  assign auto_in_r_valid = auto_out_r_valid & requestROI_0_0; // @[Xbar.scala 242:40]
  assign auto_out_aw_valid = auto_in_aw_valid; // @[Xbar.scala 298:22]
  assign auto_out_aw_bits_id = auto_in_aw_bits_id; // @[Xbar.scala 95:47]
  assign auto_out_aw_bits_addr = auto_in_aw_bits_addr; // @[Nodes.scala 1215:84 LazyModule.scala 366:16]
  assign auto_out_aw_bits_len = auto_in_aw_bits_len; // @[Nodes.scala 1215:84 LazyModule.scala 366:16]
  assign auto_out_aw_bits_size = auto_in_aw_bits_size; // @[Nodes.scala 1215:84 LazyModule.scala 366:16]
  assign auto_out_aw_bits_burst = auto_in_aw_bits_burst; // @[Nodes.scala 1215:84 LazyModule.scala 366:16]
  assign auto_out_aw_bits_lock = auto_in_aw_bits_lock; // @[Nodes.scala 1215:84 LazyModule.scala 366:16]
  assign auto_out_aw_bits_cache = auto_in_aw_bits_cache; // @[Nodes.scala 1215:84 LazyModule.scala 366:16]
  assign auto_out_aw_bits_prot = auto_in_aw_bits_prot; // @[Nodes.scala 1215:84 LazyModule.scala 366:16]
  assign auto_out_aw_bits_qos = auto_in_aw_bits_qos; // @[Nodes.scala 1215:84 LazyModule.scala 366:16]
  assign auto_out_w_valid = auto_in_w_valid; // @[Xbar.scala 242:40]
  assign auto_out_w_bits_data = auto_in_w_bits_data; // @[Nodes.scala 1215:84 LazyModule.scala 366:16]
  assign auto_out_w_bits_strb = auto_in_w_bits_strb; // @[Nodes.scala 1215:84 LazyModule.scala 366:16]
  assign auto_out_w_bits_last = auto_in_w_bits_last; // @[Nodes.scala 1215:84 LazyModule.scala 366:16]
  assign auto_out_b_ready = auto_in_b_ready; // @[Nodes.scala 1215:84 LazyModule.scala 366:16]
  assign auto_out_ar_valid = auto_in_ar_valid; // @[Xbar.scala 298:22]
  assign auto_out_ar_bits_id = auto_in_ar_bits_id; // @[Xbar.scala 96:47]
  assign auto_out_ar_bits_addr = auto_in_ar_bits_addr; // @[Nodes.scala 1215:84 LazyModule.scala 366:16]
  assign auto_out_ar_bits_len = auto_in_ar_bits_len; // @[Nodes.scala 1215:84 LazyModule.scala 366:16]
  assign auto_out_ar_bits_size = auto_in_ar_bits_size; // @[Nodes.scala 1215:84 LazyModule.scala 366:16]
  assign auto_out_ar_bits_burst = auto_in_ar_bits_burst; // @[Nodes.scala 1215:84 LazyModule.scala 366:16]
  assign auto_out_ar_bits_lock = auto_in_ar_bits_lock; // @[Nodes.scala 1215:84 LazyModule.scala 366:16]
  assign auto_out_ar_bits_cache = auto_in_ar_bits_cache; // @[Nodes.scala 1215:84 LazyModule.scala 366:16]
  assign auto_out_ar_bits_prot = auto_in_ar_bits_prot; // @[Nodes.scala 1215:84 LazyModule.scala 366:16]
  assign auto_out_ar_bits_qos = auto_in_ar_bits_qos; // @[Nodes.scala 1215:84 LazyModule.scala 366:16]
  assign auto_out_r_ready = auto_in_r_ready; // @[Nodes.scala 1215:84 LazyModule.scala 366:16]
  always @(posedge clock) begin
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_awOut_0_io_enq_bits_T_4 & ~(_awOut_0_io_enq_bits_T_1 | auto_in_aw_valid)) begin
          $fwrite(32'h80000002,"Assertion failed\n    at Xbar.scala:278 assert (!anyValid || winner.reduce(_||_))\n"); // @[Xbar.scala 278:12]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_awOut_0_io_enq_bits_T_4 & ~(_T_1 | auto_in_ar_valid)) begin
          $fwrite(32'h80000002,"Assertion failed\n    at Xbar.scala:278 assert (!anyValid || winner.reduce(_||_))\n"); // @[Xbar.scala 278:12]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_awOut_0_io_enq_bits_T_4 & ~(_T_14 | portsRIO_filtered_0_valid)) begin
          $fwrite(32'h80000002,"Assertion failed\n    at Xbar.scala:278 assert (!anyValid || winner.reduce(_||_))\n"); // @[Xbar.scala 278:12]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_awOut_0_io_enq_bits_T_4 & ~(_T_26 | portsBIO_filtered_0_valid)) begin
          $fwrite(32'h80000002,"Assertion failed\n    at Xbar.scala:278 assert (!anyValid || winner.reduce(_||_))\n"); // @[Xbar.scala 278:12]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
  end
  always @(posedge clock) begin
    //
    if (~reset) begin
      assert(1'h1); // @[Xbar.scala 276:11]
    end
    //
    if (_awOut_0_io_enq_bits_T_4) begin
      assert(_awOut_0_io_enq_bits_T_1 | auto_in_aw_valid); // @[Xbar.scala 278:12]
    end
    //
    if (~reset) begin
      assert(1'h1); // @[Xbar.scala 276:11]
    end
    //
    if (_awOut_0_io_enq_bits_T_4) begin
      assert(_T_1 | auto_in_ar_valid); // @[Xbar.scala 278:12]
    end
    //
    if (~reset) begin
      assert(1'h1); // @[Xbar.scala 276:11]
    end
    //
    if (_awOut_0_io_enq_bits_T_4) begin
      assert(_T_14 | portsRIO_filtered_0_valid); // @[Xbar.scala 278:12]
    end
    //
    if (~reset) begin
      assert(1'h1); // @[Xbar.scala 276:11]
    end
    //
    if (_awOut_0_io_enq_bits_T_4) begin
      assert(_T_26 | portsBIO_filtered_0_valid); // @[Xbar.scala 278:12]
    end
  end
endmodule
module Queue_4(
  input         clock,
  input         reset,
  output        io_enq_ready,
  input         io_enq_valid,
  input         io_enq_bits_id,
  input  [21:0] io_enq_bits_addr,
  input  [7:0]  io_enq_bits_len,
  input  [2:0]  io_enq_bits_size,
  input  [1:0]  io_enq_bits_burst,
  input         io_enq_bits_lock,
  input  [3:0]  io_enq_bits_cache,
  input  [2:0]  io_enq_bits_prot,
  input  [3:0]  io_enq_bits_qos,
  input         io_deq_ready,
  output        io_deq_valid,
  output        io_deq_bits_id,
  output [21:0] io_deq_bits_addr,
  output [7:0]  io_deq_bits_len,
  output [2:0]  io_deq_bits_size,
  output [1:0]  io_deq_bits_burst,
  output        io_deq_bits_lock,
  output [3:0]  io_deq_bits_cache,
  output [2:0]  io_deq_bits_prot,
  output [3:0]  io_deq_bits_qos
);
`ifdef RANDOMIZE_MEM_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
  reg [31:0] _RAND_5;
  reg [31:0] _RAND_6;
  reg [31:0] _RAND_7;
  reg [31:0] _RAND_8;
`endif // RANDOMIZE_MEM_INIT
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_9;
  reg [31:0] _RAND_10;
  reg [31:0] _RAND_11;
`endif // RANDOMIZE_REG_INIT
  reg  ram_id [0:1]; // @[Decoupled.scala 273:95]
  wire  ram_id_io_deq_bits_MPORT_en; // @[Decoupled.scala 273:95 310:23]
  wire  ram_id_io_deq_bits_MPORT_addr; // @[Decoupled.scala 273:95 310:23]
  wire  ram_id_io_deq_bits_MPORT_data; // @[Decoupled.scala 273:95]
  wire  ram_id_MPORT_data; // @[Decoupled.scala 273:95 286:16 287:24]
  wire  ram_id_MPORT_addr; // @[Decoupled.scala 273:95 286:16 287:8]
  wire  ram_id_MPORT_mask; // @[Decoupled.scala 273:95 286:16 287:24]
  wire  ram_id_MPORT_en; // @[Decoupled.scala 273:95 51:35]
  reg [21:0] ram_addr [0:1]; // @[Decoupled.scala 273:95]
  wire  ram_addr_io_deq_bits_MPORT_en; // @[Decoupled.scala 273:95 310:23]
  wire  ram_addr_io_deq_bits_MPORT_addr; // @[Decoupled.scala 273:95 310:23]
  wire [21:0] ram_addr_io_deq_bits_MPORT_data; // @[Decoupled.scala 273:95]
  wire [21:0] ram_addr_MPORT_data; // @[Decoupled.scala 273:95 286:16 287:24]
  wire  ram_addr_MPORT_addr; // @[Decoupled.scala 273:95 286:16 287:8]
  wire  ram_addr_MPORT_mask; // @[Decoupled.scala 273:95 286:16 287:24]
  wire  ram_addr_MPORT_en; // @[Decoupled.scala 273:95 51:35]
  reg [7:0] ram_len [0:1]; // @[Decoupled.scala 273:95]
  wire  ram_len_io_deq_bits_MPORT_en; // @[Decoupled.scala 273:95 310:23]
  wire  ram_len_io_deq_bits_MPORT_addr; // @[Decoupled.scala 273:95 310:23]
  wire [7:0] ram_len_io_deq_bits_MPORT_data; // @[Decoupled.scala 273:95]
  wire [7:0] ram_len_MPORT_data; // @[Decoupled.scala 273:95 286:16 287:24]
  wire  ram_len_MPORT_addr; // @[Decoupled.scala 273:95 286:16 287:8]
  wire  ram_len_MPORT_mask; // @[Decoupled.scala 273:95 286:16 287:24]
  wire  ram_len_MPORT_en; // @[Decoupled.scala 273:95 51:35]
  reg [2:0] ram_size [0:1]; // @[Decoupled.scala 273:95]
  wire  ram_size_io_deq_bits_MPORT_en; // @[Decoupled.scala 273:95 310:23]
  wire  ram_size_io_deq_bits_MPORT_addr; // @[Decoupled.scala 273:95 310:23]
  wire [2:0] ram_size_io_deq_bits_MPORT_data; // @[Decoupled.scala 273:95]
  wire [2:0] ram_size_MPORT_data; // @[Decoupled.scala 273:95 286:16 287:24]
  wire  ram_size_MPORT_addr; // @[Decoupled.scala 273:95 286:16 287:8]
  wire  ram_size_MPORT_mask; // @[Decoupled.scala 273:95 286:16 287:24]
  wire  ram_size_MPORT_en; // @[Decoupled.scala 273:95 51:35]
  reg [1:0] ram_burst [0:1]; // @[Decoupled.scala 273:95]
  wire  ram_burst_io_deq_bits_MPORT_en; // @[Decoupled.scala 273:95 310:23]
  wire  ram_burst_io_deq_bits_MPORT_addr; // @[Decoupled.scala 273:95 310:23]
  wire [1:0] ram_burst_io_deq_bits_MPORT_data; // @[Decoupled.scala 273:95]
  wire [1:0] ram_burst_MPORT_data; // @[Decoupled.scala 273:95 286:16 287:24]
  wire  ram_burst_MPORT_addr; // @[Decoupled.scala 273:95 286:16 287:8]
  wire  ram_burst_MPORT_mask; // @[Decoupled.scala 273:95 286:16 287:24]
  wire  ram_burst_MPORT_en; // @[Decoupled.scala 273:95 51:35]
  reg  ram_lock [0:1]; // @[Decoupled.scala 273:95]
  wire  ram_lock_io_deq_bits_MPORT_en; // @[Decoupled.scala 273:95 310:23]
  wire  ram_lock_io_deq_bits_MPORT_addr; // @[Decoupled.scala 273:95 310:23]
  wire  ram_lock_io_deq_bits_MPORT_data; // @[Decoupled.scala 273:95]
  wire  ram_lock_MPORT_data; // @[Decoupled.scala 273:95 286:16 287:24]
  wire  ram_lock_MPORT_addr; // @[Decoupled.scala 273:95 286:16 287:8]
  wire  ram_lock_MPORT_mask; // @[Decoupled.scala 273:95 286:16 287:24]
  wire  ram_lock_MPORT_en; // @[Decoupled.scala 273:95 51:35]
  reg [3:0] ram_cache [0:1]; // @[Decoupled.scala 273:95]
  wire  ram_cache_io_deq_bits_MPORT_en; // @[Decoupled.scala 273:95 310:23]
  wire  ram_cache_io_deq_bits_MPORT_addr; // @[Decoupled.scala 273:95 310:23]
  wire [3:0] ram_cache_io_deq_bits_MPORT_data; // @[Decoupled.scala 273:95]
  wire [3:0] ram_cache_MPORT_data; // @[Decoupled.scala 273:95 286:16 287:24]
  wire  ram_cache_MPORT_addr; // @[Decoupled.scala 273:95 286:16 287:8]
  wire  ram_cache_MPORT_mask; // @[Decoupled.scala 273:95 286:16 287:24]
  wire  ram_cache_MPORT_en; // @[Decoupled.scala 273:95 51:35]
  reg [2:0] ram_prot [0:1]; // @[Decoupled.scala 273:95]
  wire  ram_prot_io_deq_bits_MPORT_en; // @[Decoupled.scala 273:95 310:23]
  wire  ram_prot_io_deq_bits_MPORT_addr; // @[Decoupled.scala 273:95 310:23]
  wire [2:0] ram_prot_io_deq_bits_MPORT_data; // @[Decoupled.scala 273:95]
  wire [2:0] ram_prot_MPORT_data; // @[Decoupled.scala 273:95 286:16 287:24]
  wire  ram_prot_MPORT_addr; // @[Decoupled.scala 273:95 286:16 287:8]
  wire  ram_prot_MPORT_mask; // @[Decoupled.scala 273:95 286:16 287:24]
  wire  ram_prot_MPORT_en; // @[Decoupled.scala 273:95 51:35]
  reg [3:0] ram_qos [0:1]; // @[Decoupled.scala 273:95]
  wire  ram_qos_io_deq_bits_MPORT_en; // @[Decoupled.scala 273:95 310:23]
  wire  ram_qos_io_deq_bits_MPORT_addr; // @[Decoupled.scala 273:95 310:23]
  wire [3:0] ram_qos_io_deq_bits_MPORT_data; // @[Decoupled.scala 273:95]
  wire [3:0] ram_qos_MPORT_data; // @[Decoupled.scala 273:95 286:16 287:24]
  wire  ram_qos_MPORT_addr; // @[Decoupled.scala 273:95 286:16 287:8]
  wire  ram_qos_MPORT_mask; // @[Decoupled.scala 273:95 286:16 287:24]
  wire  ram_qos_MPORT_en; // @[Decoupled.scala 273:95 51:35]
  reg  enq_ptr_value; // @[Counter.scala 61:40]
  reg  deq_ptr_value; // @[Counter.scala 61:40]
  reg  maybe_full; // @[Decoupled.scala 276:27]
  wire  ptr_match = enq_ptr_value == deq_ptr_value; // @[Decoupled.scala 277:33]
  wire  empty = ptr_match & ~maybe_full; // @[Decoupled.scala 278:25]
  wire  full = ptr_match & maybe_full; // @[Decoupled.scala 279:24]
  wire  do_enq = io_enq_ready & io_enq_valid; // @[Decoupled.scala 51:35]
  wire  do_deq = io_deq_ready & io_deq_valid; // @[Decoupled.scala 51:35]
  assign ram_id_io_deq_bits_MPORT_en = 1'h1; // @[Decoupled.scala 310:23]
  assign ram_id_io_deq_bits_MPORT_addr = deq_ptr_value; // @[Decoupled.scala 310:23]
  assign ram_id_io_deq_bits_MPORT_data = ram_id[ram_id_io_deq_bits_MPORT_addr]; // @[Decoupled.scala 273:95]
  assign ram_id_MPORT_data = io_enq_bits_id; // @[Decoupled.scala 286:16 287:24]
  assign ram_id_MPORT_addr = enq_ptr_value; // @[Decoupled.scala 286:16 287:8]
  assign ram_id_MPORT_mask = 1'h1; // @[Decoupled.scala 286:16 287:24]
  assign ram_id_MPORT_en = io_enq_ready & io_enq_valid; // @[Decoupled.scala 51:35]
  assign ram_addr_io_deq_bits_MPORT_en = 1'h1; // @[Decoupled.scala 310:23]
  assign ram_addr_io_deq_bits_MPORT_addr = deq_ptr_value; // @[Decoupled.scala 310:23]
  assign ram_addr_io_deq_bits_MPORT_data = ram_addr[ram_addr_io_deq_bits_MPORT_addr]; // @[Decoupled.scala 273:95]
  assign ram_addr_MPORT_data = io_enq_bits_addr; // @[Decoupled.scala 286:16 287:24]
  assign ram_addr_MPORT_addr = enq_ptr_value; // @[Decoupled.scala 286:16 287:8]
  assign ram_addr_MPORT_mask = 1'h1; // @[Decoupled.scala 286:16 287:24]
  assign ram_addr_MPORT_en = io_enq_ready & io_enq_valid; // @[Decoupled.scala 51:35]
  assign ram_len_io_deq_bits_MPORT_en = 1'h1; // @[Decoupled.scala 310:23]
  assign ram_len_io_deq_bits_MPORT_addr = deq_ptr_value; // @[Decoupled.scala 310:23]
  assign ram_len_io_deq_bits_MPORT_data = ram_len[ram_len_io_deq_bits_MPORT_addr]; // @[Decoupled.scala 273:95]
  assign ram_len_MPORT_data = io_enq_bits_len; // @[Decoupled.scala 286:16 287:24]
  assign ram_len_MPORT_addr = enq_ptr_value; // @[Decoupled.scala 286:16 287:8]
  assign ram_len_MPORT_mask = 1'h1; // @[Decoupled.scala 286:16 287:24]
  assign ram_len_MPORT_en = io_enq_ready & io_enq_valid; // @[Decoupled.scala 51:35]
  assign ram_size_io_deq_bits_MPORT_en = 1'h1; // @[Decoupled.scala 310:23]
  assign ram_size_io_deq_bits_MPORT_addr = deq_ptr_value; // @[Decoupled.scala 310:23]
  assign ram_size_io_deq_bits_MPORT_data = ram_size[ram_size_io_deq_bits_MPORT_addr]; // @[Decoupled.scala 273:95]
  assign ram_size_MPORT_data = io_enq_bits_size; // @[Decoupled.scala 286:16 287:24]
  assign ram_size_MPORT_addr = enq_ptr_value; // @[Decoupled.scala 286:16 287:8]
  assign ram_size_MPORT_mask = 1'h1; // @[Decoupled.scala 286:16 287:24]
  assign ram_size_MPORT_en = io_enq_ready & io_enq_valid; // @[Decoupled.scala 51:35]
  assign ram_burst_io_deq_bits_MPORT_en = 1'h1; // @[Decoupled.scala 310:23]
  assign ram_burst_io_deq_bits_MPORT_addr = deq_ptr_value; // @[Decoupled.scala 310:23]
  assign ram_burst_io_deq_bits_MPORT_data = ram_burst[ram_burst_io_deq_bits_MPORT_addr]; // @[Decoupled.scala 273:95]
  assign ram_burst_MPORT_data = io_enq_bits_burst; // @[Decoupled.scala 286:16 287:24]
  assign ram_burst_MPORT_addr = enq_ptr_value; // @[Decoupled.scala 286:16 287:8]
  assign ram_burst_MPORT_mask = 1'h1; // @[Decoupled.scala 286:16 287:24]
  assign ram_burst_MPORT_en = io_enq_ready & io_enq_valid; // @[Decoupled.scala 51:35]
  assign ram_lock_io_deq_bits_MPORT_en = 1'h1; // @[Decoupled.scala 310:23]
  assign ram_lock_io_deq_bits_MPORT_addr = deq_ptr_value; // @[Decoupled.scala 310:23]
  assign ram_lock_io_deq_bits_MPORT_data = ram_lock[ram_lock_io_deq_bits_MPORT_addr]; // @[Decoupled.scala 273:95]
  assign ram_lock_MPORT_data = io_enq_bits_lock; // @[Decoupled.scala 286:16 287:24]
  assign ram_lock_MPORT_addr = enq_ptr_value; // @[Decoupled.scala 286:16 287:8]
  assign ram_lock_MPORT_mask = 1'h1; // @[Decoupled.scala 286:16 287:24]
  assign ram_lock_MPORT_en = io_enq_ready & io_enq_valid; // @[Decoupled.scala 51:35]
  assign ram_cache_io_deq_bits_MPORT_en = 1'h1; // @[Decoupled.scala 310:23]
  assign ram_cache_io_deq_bits_MPORT_addr = deq_ptr_value; // @[Decoupled.scala 310:23]
  assign ram_cache_io_deq_bits_MPORT_data = ram_cache[ram_cache_io_deq_bits_MPORT_addr]; // @[Decoupled.scala 273:95]
  assign ram_cache_MPORT_data = io_enq_bits_cache; // @[Decoupled.scala 286:16 287:24]
  assign ram_cache_MPORT_addr = enq_ptr_value; // @[Decoupled.scala 286:16 287:8]
  assign ram_cache_MPORT_mask = 1'h1; // @[Decoupled.scala 286:16 287:24]
  assign ram_cache_MPORT_en = io_enq_ready & io_enq_valid; // @[Decoupled.scala 51:35]
  assign ram_prot_io_deq_bits_MPORT_en = 1'h1; // @[Decoupled.scala 310:23]
  assign ram_prot_io_deq_bits_MPORT_addr = deq_ptr_value; // @[Decoupled.scala 310:23]
  assign ram_prot_io_deq_bits_MPORT_data = ram_prot[ram_prot_io_deq_bits_MPORT_addr]; // @[Decoupled.scala 273:95]
  assign ram_prot_MPORT_data = io_enq_bits_prot; // @[Decoupled.scala 286:16 287:24]
  assign ram_prot_MPORT_addr = enq_ptr_value; // @[Decoupled.scala 286:16 287:8]
  assign ram_prot_MPORT_mask = 1'h1; // @[Decoupled.scala 286:16 287:24]
  assign ram_prot_MPORT_en = io_enq_ready & io_enq_valid; // @[Decoupled.scala 51:35]
  assign ram_qos_io_deq_bits_MPORT_en = 1'h1; // @[Decoupled.scala 310:23]
  assign ram_qos_io_deq_bits_MPORT_addr = deq_ptr_value; // @[Decoupled.scala 310:23]
  assign ram_qos_io_deq_bits_MPORT_data = ram_qos[ram_qos_io_deq_bits_MPORT_addr]; // @[Decoupled.scala 273:95]
  assign ram_qos_MPORT_data = io_enq_bits_qos; // @[Decoupled.scala 286:16 287:24]
  assign ram_qos_MPORT_addr = enq_ptr_value; // @[Decoupled.scala 286:16 287:8]
  assign ram_qos_MPORT_mask = 1'h1; // @[Decoupled.scala 286:16 287:24]
  assign ram_qos_MPORT_en = io_enq_ready & io_enq_valid; // @[Decoupled.scala 51:35]
  assign io_enq_ready = ~full; // @[Decoupled.scala 303:19]
  assign io_deq_valid = ~empty; // @[Decoupled.scala 302:19]
  assign io_deq_bits_id = ram_id_io_deq_bits_MPORT_data; // @[Decoupled.scala 310:17]
  assign io_deq_bits_addr = ram_addr_io_deq_bits_MPORT_data; // @[Decoupled.scala 310:17]
  assign io_deq_bits_len = ram_len_io_deq_bits_MPORT_data; // @[Decoupled.scala 310:17]
  assign io_deq_bits_size = ram_size_io_deq_bits_MPORT_data; // @[Decoupled.scala 310:17]
  assign io_deq_bits_burst = ram_burst_io_deq_bits_MPORT_data; // @[Decoupled.scala 310:17]
  assign io_deq_bits_lock = ram_lock_io_deq_bits_MPORT_data; // @[Decoupled.scala 310:17]
  assign io_deq_bits_cache = ram_cache_io_deq_bits_MPORT_data; // @[Decoupled.scala 310:17]
  assign io_deq_bits_prot = ram_prot_io_deq_bits_MPORT_data; // @[Decoupled.scala 310:17]
  assign io_deq_bits_qos = ram_qos_io_deq_bits_MPORT_data; // @[Decoupled.scala 310:17]
  always @(posedge clock) begin
    if (ram_id_MPORT_en & ram_id_MPORT_mask) begin
      ram_id[ram_id_MPORT_addr] <= ram_id_MPORT_data; // @[Decoupled.scala 273:95]
    end
    if (ram_addr_MPORT_en & ram_addr_MPORT_mask) begin
      ram_addr[ram_addr_MPORT_addr] <= ram_addr_MPORT_data; // @[Decoupled.scala 273:95]
    end
    if (ram_len_MPORT_en & ram_len_MPORT_mask) begin
      ram_len[ram_len_MPORT_addr] <= ram_len_MPORT_data; // @[Decoupled.scala 273:95]
    end
    if (ram_size_MPORT_en & ram_size_MPORT_mask) begin
      ram_size[ram_size_MPORT_addr] <= ram_size_MPORT_data; // @[Decoupled.scala 273:95]
    end
    if (ram_burst_MPORT_en & ram_burst_MPORT_mask) begin
      ram_burst[ram_burst_MPORT_addr] <= ram_burst_MPORT_data; // @[Decoupled.scala 273:95]
    end
    if (ram_lock_MPORT_en & ram_lock_MPORT_mask) begin
      ram_lock[ram_lock_MPORT_addr] <= ram_lock_MPORT_data; // @[Decoupled.scala 273:95]
    end
    if (ram_cache_MPORT_en & ram_cache_MPORT_mask) begin
      ram_cache[ram_cache_MPORT_addr] <= ram_cache_MPORT_data; // @[Decoupled.scala 273:95]
    end
    if (ram_prot_MPORT_en & ram_prot_MPORT_mask) begin
      ram_prot[ram_prot_MPORT_addr] <= ram_prot_MPORT_data; // @[Decoupled.scala 273:95]
    end
    if (ram_qos_MPORT_en & ram_qos_MPORT_mask) begin
      ram_qos[ram_qos_MPORT_addr] <= ram_qos_MPORT_data; // @[Decoupled.scala 273:95]
    end
    if (reset) begin // @[Counter.scala 61:40]
      enq_ptr_value <= 1'h0; // @[Counter.scala 61:40]
    end else if (do_enq) begin // @[Decoupled.scala 286:16]
      enq_ptr_value <= enq_ptr_value + 1'h1; // @[Counter.scala 77:15]
    end
    if (reset) begin // @[Counter.scala 61:40]
      deq_ptr_value <= 1'h0; // @[Counter.scala 61:40]
    end else if (do_deq) begin // @[Decoupled.scala 290:16]
      deq_ptr_value <= deq_ptr_value + 1'h1; // @[Counter.scala 77:15]
    end
    if (reset) begin // @[Decoupled.scala 276:27]
      maybe_full <= 1'h0; // @[Decoupled.scala 276:27]
    end else if (do_enq != do_deq) begin // @[Decoupled.scala 293:27]
      maybe_full <= do_enq; // @[Decoupled.scala 294:16]
    end
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_MEM_INIT
  _RAND_0 = {1{`RANDOM}};
  for (initvar = 0; initvar < 2; initvar = initvar+1)
    ram_id[initvar] = _RAND_0[0:0];
  _RAND_1 = {1{`RANDOM}};
  for (initvar = 0; initvar < 2; initvar = initvar+1)
    ram_addr[initvar] = _RAND_1[21:0];
  _RAND_2 = {1{`RANDOM}};
  for (initvar = 0; initvar < 2; initvar = initvar+1)
    ram_len[initvar] = _RAND_2[7:0];
  _RAND_3 = {1{`RANDOM}};
  for (initvar = 0; initvar < 2; initvar = initvar+1)
    ram_size[initvar] = _RAND_3[2:0];
  _RAND_4 = {1{`RANDOM}};
  for (initvar = 0; initvar < 2; initvar = initvar+1)
    ram_burst[initvar] = _RAND_4[1:0];
  _RAND_5 = {1{`RANDOM}};
  for (initvar = 0; initvar < 2; initvar = initvar+1)
    ram_lock[initvar] = _RAND_5[0:0];
  _RAND_6 = {1{`RANDOM}};
  for (initvar = 0; initvar < 2; initvar = initvar+1)
    ram_cache[initvar] = _RAND_6[3:0];
  _RAND_7 = {1{`RANDOM}};
  for (initvar = 0; initvar < 2; initvar = initvar+1)
    ram_prot[initvar] = _RAND_7[2:0];
  _RAND_8 = {1{`RANDOM}};
  for (initvar = 0; initvar < 2; initvar = initvar+1)
    ram_qos[initvar] = _RAND_8[3:0];
`endif // RANDOMIZE_MEM_INIT
`ifdef RANDOMIZE_REG_INIT
  _RAND_9 = {1{`RANDOM}};
  enq_ptr_value = _RAND_9[0:0];
  _RAND_10 = {1{`RANDOM}};
  deq_ptr_value = _RAND_10[0:0];
  _RAND_11 = {1{`RANDOM}};
  maybe_full = _RAND_11[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module Queue_5(
  input          clock,
  input          reset,
  output         io_enq_ready,
  input          io_enq_valid,
  input  [511:0] io_enq_bits_data,
  input  [63:0]  io_enq_bits_strb,
  input          io_enq_bits_last,
  input          io_deq_ready,
  output         io_deq_valid,
  output [511:0] io_deq_bits_data,
  output [63:0]  io_deq_bits_strb,
  output         io_deq_bits_last
);
`ifdef RANDOMIZE_MEM_INIT
  reg [511:0] _RAND_0;
  reg [63:0] _RAND_1;
  reg [31:0] _RAND_2;
`endif // RANDOMIZE_MEM_INIT
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
  reg [31:0] _RAND_5;
`endif // RANDOMIZE_REG_INIT
  reg [511:0] ram_data [0:1]; // @[Decoupled.scala 273:95]
  wire  ram_data_io_deq_bits_MPORT_en; // @[Decoupled.scala 273:95 310:23]
  wire  ram_data_io_deq_bits_MPORT_addr; // @[Decoupled.scala 273:95 310:23]
  wire [511:0] ram_data_io_deq_bits_MPORT_data; // @[Decoupled.scala 273:95]
  wire [511:0] ram_data_MPORT_data; // @[Decoupled.scala 273:95 286:16 287:24]
  wire  ram_data_MPORT_addr; // @[Decoupled.scala 273:95 286:16 287:8]
  wire  ram_data_MPORT_mask; // @[Decoupled.scala 273:95 286:16 287:24]
  wire  ram_data_MPORT_en; // @[Decoupled.scala 273:95 51:35]
  reg [63:0] ram_strb [0:1]; // @[Decoupled.scala 273:95]
  wire  ram_strb_io_deq_bits_MPORT_en; // @[Decoupled.scala 273:95 310:23]
  wire  ram_strb_io_deq_bits_MPORT_addr; // @[Decoupled.scala 273:95 310:23]
  wire [63:0] ram_strb_io_deq_bits_MPORT_data; // @[Decoupled.scala 273:95]
  wire [63:0] ram_strb_MPORT_data; // @[Decoupled.scala 273:95 286:16 287:24]
  wire  ram_strb_MPORT_addr; // @[Decoupled.scala 273:95 286:16 287:8]
  wire  ram_strb_MPORT_mask; // @[Decoupled.scala 273:95 286:16 287:24]
  wire  ram_strb_MPORT_en; // @[Decoupled.scala 273:95 51:35]
  reg  ram_last [0:1]; // @[Decoupled.scala 273:95]
  wire  ram_last_io_deq_bits_MPORT_en; // @[Decoupled.scala 273:95 310:23]
  wire  ram_last_io_deq_bits_MPORT_addr; // @[Decoupled.scala 273:95 310:23]
  wire  ram_last_io_deq_bits_MPORT_data; // @[Decoupled.scala 273:95]
  wire  ram_last_MPORT_data; // @[Decoupled.scala 273:95 286:16 287:24]
  wire  ram_last_MPORT_addr; // @[Decoupled.scala 273:95 286:16 287:8]
  wire  ram_last_MPORT_mask; // @[Decoupled.scala 273:95 286:16 287:24]
  wire  ram_last_MPORT_en; // @[Decoupled.scala 273:95 51:35]
  reg  enq_ptr_value; // @[Counter.scala 61:40]
  reg  deq_ptr_value; // @[Counter.scala 61:40]
  reg  maybe_full; // @[Decoupled.scala 276:27]
  wire  ptr_match = enq_ptr_value == deq_ptr_value; // @[Decoupled.scala 277:33]
  wire  empty = ptr_match & ~maybe_full; // @[Decoupled.scala 278:25]
  wire  full = ptr_match & maybe_full; // @[Decoupled.scala 279:24]
  wire  do_enq = io_enq_ready & io_enq_valid; // @[Decoupled.scala 51:35]
  wire  do_deq = io_deq_ready & io_deq_valid; // @[Decoupled.scala 51:35]
  assign ram_data_io_deq_bits_MPORT_en = 1'h1; // @[Decoupled.scala 310:23]
  assign ram_data_io_deq_bits_MPORT_addr = deq_ptr_value; // @[Decoupled.scala 310:23]
  assign ram_data_io_deq_bits_MPORT_data = ram_data[ram_data_io_deq_bits_MPORT_addr]; // @[Decoupled.scala 273:95]
  assign ram_data_MPORT_data = io_enq_bits_data; // @[Decoupled.scala 286:16 287:24]
  assign ram_data_MPORT_addr = enq_ptr_value; // @[Decoupled.scala 286:16 287:8]
  assign ram_data_MPORT_mask = 1'h1; // @[Decoupled.scala 286:16 287:24]
  assign ram_data_MPORT_en = io_enq_ready & io_enq_valid; // @[Decoupled.scala 51:35]
  assign ram_strb_io_deq_bits_MPORT_en = 1'h1; // @[Decoupled.scala 310:23]
  assign ram_strb_io_deq_bits_MPORT_addr = deq_ptr_value; // @[Decoupled.scala 310:23]
  assign ram_strb_io_deq_bits_MPORT_data = ram_strb[ram_strb_io_deq_bits_MPORT_addr]; // @[Decoupled.scala 273:95]
  assign ram_strb_MPORT_data = io_enq_bits_strb; // @[Decoupled.scala 286:16 287:24]
  assign ram_strb_MPORT_addr = enq_ptr_value; // @[Decoupled.scala 286:16 287:8]
  assign ram_strb_MPORT_mask = 1'h1; // @[Decoupled.scala 286:16 287:24]
  assign ram_strb_MPORT_en = io_enq_ready & io_enq_valid; // @[Decoupled.scala 51:35]
  assign ram_last_io_deq_bits_MPORT_en = 1'h1; // @[Decoupled.scala 310:23]
  assign ram_last_io_deq_bits_MPORT_addr = deq_ptr_value; // @[Decoupled.scala 310:23]
  assign ram_last_io_deq_bits_MPORT_data = ram_last[ram_last_io_deq_bits_MPORT_addr]; // @[Decoupled.scala 273:95]
  assign ram_last_MPORT_data = io_enq_bits_last; // @[Decoupled.scala 286:16 287:24]
  assign ram_last_MPORT_addr = enq_ptr_value; // @[Decoupled.scala 286:16 287:8]
  assign ram_last_MPORT_mask = 1'h1; // @[Decoupled.scala 286:16 287:24]
  assign ram_last_MPORT_en = io_enq_ready & io_enq_valid; // @[Decoupled.scala 51:35]
  assign io_enq_ready = ~full; // @[Decoupled.scala 303:19]
  assign io_deq_valid = ~empty; // @[Decoupled.scala 302:19]
  assign io_deq_bits_data = ram_data_io_deq_bits_MPORT_data; // @[Decoupled.scala 310:17]
  assign io_deq_bits_strb = ram_strb_io_deq_bits_MPORT_data; // @[Decoupled.scala 310:17]
  assign io_deq_bits_last = ram_last_io_deq_bits_MPORT_data; // @[Decoupled.scala 310:17]
  always @(posedge clock) begin
    if (ram_data_MPORT_en & ram_data_MPORT_mask) begin
      ram_data[ram_data_MPORT_addr] <= ram_data_MPORT_data; // @[Decoupled.scala 273:95]
    end
    if (ram_strb_MPORT_en & ram_strb_MPORT_mask) begin
      ram_strb[ram_strb_MPORT_addr] <= ram_strb_MPORT_data; // @[Decoupled.scala 273:95]
    end
    if (ram_last_MPORT_en & ram_last_MPORT_mask) begin
      ram_last[ram_last_MPORT_addr] <= ram_last_MPORT_data; // @[Decoupled.scala 273:95]
    end
    if (reset) begin // @[Counter.scala 61:40]
      enq_ptr_value <= 1'h0; // @[Counter.scala 61:40]
    end else if (do_enq) begin // @[Decoupled.scala 286:16]
      enq_ptr_value <= enq_ptr_value + 1'h1; // @[Counter.scala 77:15]
    end
    if (reset) begin // @[Counter.scala 61:40]
      deq_ptr_value <= 1'h0; // @[Counter.scala 61:40]
    end else if (do_deq) begin // @[Decoupled.scala 290:16]
      deq_ptr_value <= deq_ptr_value + 1'h1; // @[Counter.scala 77:15]
    end
    if (reset) begin // @[Decoupled.scala 276:27]
      maybe_full <= 1'h0; // @[Decoupled.scala 276:27]
    end else if (do_enq != do_deq) begin // @[Decoupled.scala 293:27]
      maybe_full <= do_enq; // @[Decoupled.scala 294:16]
    end
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_MEM_INIT
  _RAND_0 = {16{`RANDOM}};
  for (initvar = 0; initvar < 2; initvar = initvar+1)
    ram_data[initvar] = _RAND_0[511:0];
  _RAND_1 = {2{`RANDOM}};
  for (initvar = 0; initvar < 2; initvar = initvar+1)
    ram_strb[initvar] = _RAND_1[63:0];
  _RAND_2 = {1{`RANDOM}};
  for (initvar = 0; initvar < 2; initvar = initvar+1)
    ram_last[initvar] = _RAND_2[0:0];
`endif // RANDOMIZE_MEM_INIT
`ifdef RANDOMIZE_REG_INIT
  _RAND_3 = {1{`RANDOM}};
  enq_ptr_value = _RAND_3[0:0];
  _RAND_4 = {1{`RANDOM}};
  deq_ptr_value = _RAND_4[0:0];
  _RAND_5 = {1{`RANDOM}};
  maybe_full = _RAND_5[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module Queue_6(
  input   clock,
  input   reset,
  output  io_enq_ready,
  input   io_enq_valid,
  input   io_enq_bits_id,
  input   io_deq_ready,
  output  io_deq_valid,
  output  io_deq_bits_id
);
`ifdef RANDOMIZE_MEM_INIT
  reg [31:0] _RAND_0;
`endif // RANDOMIZE_MEM_INIT
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
`endif // RANDOMIZE_REG_INIT
  reg  ram_id [0:1]; // @[Decoupled.scala 273:95]
  wire  ram_id_io_deq_bits_MPORT_en; // @[Decoupled.scala 273:95 310:23]
  wire  ram_id_io_deq_bits_MPORT_addr; // @[Decoupled.scala 273:95 310:23]
  wire  ram_id_io_deq_bits_MPORT_data; // @[Decoupled.scala 273:95]
  wire  ram_id_MPORT_data; // @[Decoupled.scala 273:95 286:16 287:24]
  wire  ram_id_MPORT_addr; // @[Decoupled.scala 273:95 286:16 287:8]
  wire  ram_id_MPORT_mask; // @[Decoupled.scala 273:95 286:16 287:24]
  wire  ram_id_MPORT_en; // @[Decoupled.scala 273:95 51:35]
  reg  enq_ptr_value; // @[Counter.scala 61:40]
  reg  deq_ptr_value; // @[Counter.scala 61:40]
  reg  maybe_full; // @[Decoupled.scala 276:27]
  wire  ptr_match = enq_ptr_value == deq_ptr_value; // @[Decoupled.scala 277:33]
  wire  empty = ptr_match & ~maybe_full; // @[Decoupled.scala 278:25]
  wire  full = ptr_match & maybe_full; // @[Decoupled.scala 279:24]
  wire  do_enq = io_enq_ready & io_enq_valid; // @[Decoupled.scala 51:35]
  wire  do_deq = io_deq_ready & io_deq_valid; // @[Decoupled.scala 51:35]
  assign ram_id_io_deq_bits_MPORT_en = 1'h1; // @[Decoupled.scala 310:23]
  assign ram_id_io_deq_bits_MPORT_addr = deq_ptr_value; // @[Decoupled.scala 310:23]
  assign ram_id_io_deq_bits_MPORT_data = ram_id[ram_id_io_deq_bits_MPORT_addr]; // @[Decoupled.scala 273:95]
  assign ram_id_MPORT_data = io_enq_bits_id; // @[Decoupled.scala 286:16 287:24]
  assign ram_id_MPORT_addr = enq_ptr_value; // @[Decoupled.scala 286:16 287:8]
  assign ram_id_MPORT_mask = 1'h1; // @[Decoupled.scala 286:16 287:24]
  assign ram_id_MPORT_en = io_enq_ready & io_enq_valid; // @[Decoupled.scala 51:35]
  assign io_enq_ready = ~full; // @[Decoupled.scala 303:19]
  assign io_deq_valid = ~empty; // @[Decoupled.scala 302:19]
  assign io_deq_bits_id = ram_id_io_deq_bits_MPORT_data; // @[Decoupled.scala 310:17]
  always @(posedge clock) begin
    if (ram_id_MPORT_en & ram_id_MPORT_mask) begin
      ram_id[ram_id_MPORT_addr] <= ram_id_MPORT_data; // @[Decoupled.scala 273:95]
    end
    if (reset) begin // @[Counter.scala 61:40]
      enq_ptr_value <= 1'h0; // @[Counter.scala 61:40]
    end else if (do_enq) begin // @[Decoupled.scala 286:16]
      enq_ptr_value <= enq_ptr_value + 1'h1; // @[Counter.scala 77:15]
    end
    if (reset) begin // @[Counter.scala 61:40]
      deq_ptr_value <= 1'h0; // @[Counter.scala 61:40]
    end else if (do_deq) begin // @[Decoupled.scala 290:16]
      deq_ptr_value <= deq_ptr_value + 1'h1; // @[Counter.scala 77:15]
    end
    if (reset) begin // @[Decoupled.scala 276:27]
      maybe_full <= 1'h0; // @[Decoupled.scala 276:27]
    end else if (do_enq != do_deq) begin // @[Decoupled.scala 293:27]
      maybe_full <= do_enq; // @[Decoupled.scala 294:16]
    end
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_MEM_INIT
  _RAND_0 = {1{`RANDOM}};
  for (initvar = 0; initvar < 2; initvar = initvar+1)
    ram_id[initvar] = _RAND_0[0:0];
`endif // RANDOMIZE_MEM_INIT
`ifdef RANDOMIZE_REG_INIT
  _RAND_1 = {1{`RANDOM}};
  enq_ptr_value = _RAND_1[0:0];
  _RAND_2 = {1{`RANDOM}};
  deq_ptr_value = _RAND_2[0:0];
  _RAND_3 = {1{`RANDOM}};
  maybe_full = _RAND_3[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module Queue_8(
  input   clock,
  input   reset,
  output  io_enq_ready,
  input   io_enq_valid,
  input   io_enq_bits_id,
  input   io_deq_ready,
  output  io_deq_valid,
  output  io_deq_bits_id
);
`ifdef RANDOMIZE_MEM_INIT
  reg [31:0] _RAND_0;
`endif // RANDOMIZE_MEM_INIT
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
`endif // RANDOMIZE_REG_INIT
  reg  ram_id [0:1]; // @[Decoupled.scala 273:95]
  wire  ram_id_io_deq_bits_MPORT_en; // @[Decoupled.scala 273:95 310:23]
  wire  ram_id_io_deq_bits_MPORT_addr; // @[Decoupled.scala 273:95 310:23]
  wire  ram_id_io_deq_bits_MPORT_data; // @[Decoupled.scala 273:95]
  wire  ram_id_MPORT_data; // @[Decoupled.scala 273:95 286:16 287:24]
  wire  ram_id_MPORT_addr; // @[Decoupled.scala 273:95 286:16 287:8]
  wire  ram_id_MPORT_mask; // @[Decoupled.scala 273:95 286:16 287:24]
  wire  ram_id_MPORT_en; // @[Decoupled.scala 273:95 51:35]
  reg  enq_ptr_value; // @[Counter.scala 61:40]
  reg  deq_ptr_value; // @[Counter.scala 61:40]
  reg  maybe_full; // @[Decoupled.scala 276:27]
  wire  ptr_match = enq_ptr_value == deq_ptr_value; // @[Decoupled.scala 277:33]
  wire  empty = ptr_match & ~maybe_full; // @[Decoupled.scala 278:25]
  wire  full = ptr_match & maybe_full; // @[Decoupled.scala 279:24]
  wire  do_enq = io_enq_ready & io_enq_valid; // @[Decoupled.scala 51:35]
  wire  do_deq = io_deq_ready & io_deq_valid; // @[Decoupled.scala 51:35]
  assign ram_id_io_deq_bits_MPORT_en = 1'h1; // @[Decoupled.scala 310:23]
  assign ram_id_io_deq_bits_MPORT_addr = deq_ptr_value; // @[Decoupled.scala 310:23]
  assign ram_id_io_deq_bits_MPORT_data = ram_id[ram_id_io_deq_bits_MPORT_addr]; // @[Decoupled.scala 273:95]
  assign ram_id_MPORT_data = io_enq_bits_id; // @[Decoupled.scala 286:16 287:24]
  assign ram_id_MPORT_addr = enq_ptr_value; // @[Decoupled.scala 286:16 287:8]
  assign ram_id_MPORT_mask = 1'h1; // @[Decoupled.scala 286:16 287:24]
  assign ram_id_MPORT_en = io_enq_ready & io_enq_valid; // @[Decoupled.scala 51:35]
  assign io_enq_ready = ~full; // @[Decoupled.scala 303:19]
  assign io_deq_valid = ~empty; // @[Decoupled.scala 302:19]
  assign io_deq_bits_id = ram_id_io_deq_bits_MPORT_data; // @[Decoupled.scala 310:17]
  always @(posedge clock) begin
    if (ram_id_MPORT_en & ram_id_MPORT_mask) begin
      ram_id[ram_id_MPORT_addr] <= ram_id_MPORT_data; // @[Decoupled.scala 273:95]
    end
    if (reset) begin // @[Counter.scala 61:40]
      enq_ptr_value <= 1'h0; // @[Counter.scala 61:40]
    end else if (do_enq) begin // @[Decoupled.scala 286:16]
      enq_ptr_value <= enq_ptr_value + 1'h1; // @[Counter.scala 77:15]
    end
    if (reset) begin // @[Counter.scala 61:40]
      deq_ptr_value <= 1'h0; // @[Counter.scala 61:40]
    end else if (do_deq) begin // @[Decoupled.scala 290:16]
      deq_ptr_value <= deq_ptr_value + 1'h1; // @[Counter.scala 77:15]
    end
    if (reset) begin // @[Decoupled.scala 276:27]
      maybe_full <= 1'h0; // @[Decoupled.scala 276:27]
    end else if (do_enq != do_deq) begin // @[Decoupled.scala 293:27]
      maybe_full <= do_enq; // @[Decoupled.scala 294:16]
    end
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_MEM_INIT
  _RAND_0 = {1{`RANDOM}};
  for (initvar = 0; initvar < 2; initvar = initvar+1)
    ram_id[initvar] = _RAND_0[0:0];
`endif // RANDOMIZE_MEM_INIT
`ifdef RANDOMIZE_REG_INIT
  _RAND_1 = {1{`RANDOM}};
  enq_ptr_value = _RAND_1[0:0];
  _RAND_2 = {1{`RANDOM}};
  deq_ptr_value = _RAND_2[0:0];
  _RAND_3 = {1{`RANDOM}};
  maybe_full = _RAND_3[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module AXI4Buffer(
  input          clock,
  input          reset,
  output         auto_in_aw_ready,
  input          auto_in_aw_valid,
  input          auto_in_aw_bits_id,
  input  [21:0]  auto_in_aw_bits_addr,
  input  [7:0]   auto_in_aw_bits_len,
  input  [2:0]   auto_in_aw_bits_size,
  input  [1:0]   auto_in_aw_bits_burst,
  input          auto_in_aw_bits_lock,
  input  [3:0]   auto_in_aw_bits_cache,
  input  [2:0]   auto_in_aw_bits_prot,
  input  [3:0]   auto_in_aw_bits_qos,
  output         auto_in_w_ready,
  input          auto_in_w_valid,
  input  [511:0] auto_in_w_bits_data,
  input  [63:0]  auto_in_w_bits_strb,
  input          auto_in_w_bits_last,
  input          auto_in_b_ready,
  output         auto_in_b_valid,
  output         auto_in_b_bits_id,
  output         auto_in_ar_ready,
  input          auto_in_ar_valid,
  input          auto_in_ar_bits_id,
  input  [21:0]  auto_in_ar_bits_addr,
  input  [7:0]   auto_in_ar_bits_len,
  input  [2:0]   auto_in_ar_bits_size,
  input  [1:0]   auto_in_ar_bits_burst,
  input          auto_in_ar_bits_lock,
  input  [3:0]   auto_in_ar_bits_cache,
  input  [2:0]   auto_in_ar_bits_prot,
  input  [3:0]   auto_in_ar_bits_qos,
  input          auto_in_r_ready,
  output         auto_in_r_valid,
  output         auto_in_r_bits_id,
  input          auto_out_aw_ready,
  output         auto_out_aw_valid,
  output         auto_out_aw_bits_id,
  output [21:0]  auto_out_aw_bits_addr,
  output [7:0]   auto_out_aw_bits_len,
  output [2:0]   auto_out_aw_bits_size,
  output [1:0]   auto_out_aw_bits_burst,
  output         auto_out_aw_bits_lock,
  output [3:0]   auto_out_aw_bits_cache,
  output [2:0]   auto_out_aw_bits_prot,
  output [3:0]   auto_out_aw_bits_qos,
  input          auto_out_w_ready,
  output         auto_out_w_valid,
  output [511:0] auto_out_w_bits_data,
  output [63:0]  auto_out_w_bits_strb,
  output         auto_out_w_bits_last,
  output         auto_out_b_ready,
  input          auto_out_b_valid,
  input          auto_out_b_bits_id,
  input          auto_out_ar_ready,
  output         auto_out_ar_valid,
  output         auto_out_ar_bits_id,
  output [21:0]  auto_out_ar_bits_addr,
  output [7:0]   auto_out_ar_bits_len,
  output [2:0]   auto_out_ar_bits_size,
  output [1:0]   auto_out_ar_bits_burst,
  output         auto_out_ar_bits_lock,
  output [3:0]   auto_out_ar_bits_cache,
  output [2:0]   auto_out_ar_bits_prot,
  output [3:0]   auto_out_ar_bits_qos,
  output         auto_out_r_ready,
  input          auto_out_r_valid,
  input          auto_out_r_bits_id
);
  wire  x1_aw_deq_clock; // @[Decoupled.scala 375:21]
  wire  x1_aw_deq_reset; // @[Decoupled.scala 375:21]
  wire  x1_aw_deq_io_enq_ready; // @[Decoupled.scala 375:21]
  wire  x1_aw_deq_io_enq_valid; // @[Decoupled.scala 375:21]
  wire  x1_aw_deq_io_enq_bits_id; // @[Decoupled.scala 375:21]
  wire [21:0] x1_aw_deq_io_enq_bits_addr; // @[Decoupled.scala 375:21]
  wire [7:0] x1_aw_deq_io_enq_bits_len; // @[Decoupled.scala 375:21]
  wire [2:0] x1_aw_deq_io_enq_bits_size; // @[Decoupled.scala 375:21]
  wire [1:0] x1_aw_deq_io_enq_bits_burst; // @[Decoupled.scala 375:21]
  wire  x1_aw_deq_io_enq_bits_lock; // @[Decoupled.scala 375:21]
  wire [3:0] x1_aw_deq_io_enq_bits_cache; // @[Decoupled.scala 375:21]
  wire [2:0] x1_aw_deq_io_enq_bits_prot; // @[Decoupled.scala 375:21]
  wire [3:0] x1_aw_deq_io_enq_bits_qos; // @[Decoupled.scala 375:21]
  wire  x1_aw_deq_io_deq_ready; // @[Decoupled.scala 375:21]
  wire  x1_aw_deq_io_deq_valid; // @[Decoupled.scala 375:21]
  wire  x1_aw_deq_io_deq_bits_id; // @[Decoupled.scala 375:21]
  wire [21:0] x1_aw_deq_io_deq_bits_addr; // @[Decoupled.scala 375:21]
  wire [7:0] x1_aw_deq_io_deq_bits_len; // @[Decoupled.scala 375:21]
  wire [2:0] x1_aw_deq_io_deq_bits_size; // @[Decoupled.scala 375:21]
  wire [1:0] x1_aw_deq_io_deq_bits_burst; // @[Decoupled.scala 375:21]
  wire  x1_aw_deq_io_deq_bits_lock; // @[Decoupled.scala 375:21]
  wire [3:0] x1_aw_deq_io_deq_bits_cache; // @[Decoupled.scala 375:21]
  wire [2:0] x1_aw_deq_io_deq_bits_prot; // @[Decoupled.scala 375:21]
  wire [3:0] x1_aw_deq_io_deq_bits_qos; // @[Decoupled.scala 375:21]
  wire  x1_w_deq_clock; // @[Decoupled.scala 375:21]
  wire  x1_w_deq_reset; // @[Decoupled.scala 375:21]
  wire  x1_w_deq_io_enq_ready; // @[Decoupled.scala 375:21]
  wire  x1_w_deq_io_enq_valid; // @[Decoupled.scala 375:21]
  wire [511:0] x1_w_deq_io_enq_bits_data; // @[Decoupled.scala 375:21]
  wire [63:0] x1_w_deq_io_enq_bits_strb; // @[Decoupled.scala 375:21]
  wire  x1_w_deq_io_enq_bits_last; // @[Decoupled.scala 375:21]
  wire  x1_w_deq_io_deq_ready; // @[Decoupled.scala 375:21]
  wire  x1_w_deq_io_deq_valid; // @[Decoupled.scala 375:21]
  wire [511:0] x1_w_deq_io_deq_bits_data; // @[Decoupled.scala 375:21]
  wire [63:0] x1_w_deq_io_deq_bits_strb; // @[Decoupled.scala 375:21]
  wire  x1_w_deq_io_deq_bits_last; // @[Decoupled.scala 375:21]
  wire  bundleIn_0_b_deq_clock; // @[Decoupled.scala 375:21]
  wire  bundleIn_0_b_deq_reset; // @[Decoupled.scala 375:21]
  wire  bundleIn_0_b_deq_io_enq_ready; // @[Decoupled.scala 375:21]
  wire  bundleIn_0_b_deq_io_enq_valid; // @[Decoupled.scala 375:21]
  wire  bundleIn_0_b_deq_io_enq_bits_id; // @[Decoupled.scala 375:21]
  wire  bundleIn_0_b_deq_io_deq_ready; // @[Decoupled.scala 375:21]
  wire  bundleIn_0_b_deq_io_deq_valid; // @[Decoupled.scala 375:21]
  wire  bundleIn_0_b_deq_io_deq_bits_id; // @[Decoupled.scala 375:21]
  wire  x1_ar_deq_clock; // @[Decoupled.scala 375:21]
  wire  x1_ar_deq_reset; // @[Decoupled.scala 375:21]
  wire  x1_ar_deq_io_enq_ready; // @[Decoupled.scala 375:21]
  wire  x1_ar_deq_io_enq_valid; // @[Decoupled.scala 375:21]
  wire  x1_ar_deq_io_enq_bits_id; // @[Decoupled.scala 375:21]
  wire [21:0] x1_ar_deq_io_enq_bits_addr; // @[Decoupled.scala 375:21]
  wire [7:0] x1_ar_deq_io_enq_bits_len; // @[Decoupled.scala 375:21]
  wire [2:0] x1_ar_deq_io_enq_bits_size; // @[Decoupled.scala 375:21]
  wire [1:0] x1_ar_deq_io_enq_bits_burst; // @[Decoupled.scala 375:21]
  wire  x1_ar_deq_io_enq_bits_lock; // @[Decoupled.scala 375:21]
  wire [3:0] x1_ar_deq_io_enq_bits_cache; // @[Decoupled.scala 375:21]
  wire [2:0] x1_ar_deq_io_enq_bits_prot; // @[Decoupled.scala 375:21]
  wire [3:0] x1_ar_deq_io_enq_bits_qos; // @[Decoupled.scala 375:21]
  wire  x1_ar_deq_io_deq_ready; // @[Decoupled.scala 375:21]
  wire  x1_ar_deq_io_deq_valid; // @[Decoupled.scala 375:21]
  wire  x1_ar_deq_io_deq_bits_id; // @[Decoupled.scala 375:21]
  wire [21:0] x1_ar_deq_io_deq_bits_addr; // @[Decoupled.scala 375:21]
  wire [7:0] x1_ar_deq_io_deq_bits_len; // @[Decoupled.scala 375:21]
  wire [2:0] x1_ar_deq_io_deq_bits_size; // @[Decoupled.scala 375:21]
  wire [1:0] x1_ar_deq_io_deq_bits_burst; // @[Decoupled.scala 375:21]
  wire  x1_ar_deq_io_deq_bits_lock; // @[Decoupled.scala 375:21]
  wire [3:0] x1_ar_deq_io_deq_bits_cache; // @[Decoupled.scala 375:21]
  wire [2:0] x1_ar_deq_io_deq_bits_prot; // @[Decoupled.scala 375:21]
  wire [3:0] x1_ar_deq_io_deq_bits_qos; // @[Decoupled.scala 375:21]
  wire  bundleIn_0_r_deq_clock; // @[Decoupled.scala 375:21]
  wire  bundleIn_0_r_deq_reset; // @[Decoupled.scala 375:21]
  wire  bundleIn_0_r_deq_io_enq_ready; // @[Decoupled.scala 375:21]
  wire  bundleIn_0_r_deq_io_enq_valid; // @[Decoupled.scala 375:21]
  wire  bundleIn_0_r_deq_io_enq_bits_id; // @[Decoupled.scala 375:21]
  wire  bundleIn_0_r_deq_io_deq_ready; // @[Decoupled.scala 375:21]
  wire  bundleIn_0_r_deq_io_deq_valid; // @[Decoupled.scala 375:21]
  wire  bundleIn_0_r_deq_io_deq_bits_id; // @[Decoupled.scala 375:21]
  Queue_4 x1_aw_deq ( // @[Decoupled.scala 375:21]
    .clock(x1_aw_deq_clock),
    .reset(x1_aw_deq_reset),
    .io_enq_ready(x1_aw_deq_io_enq_ready),
    .io_enq_valid(x1_aw_deq_io_enq_valid),
    .io_enq_bits_id(x1_aw_deq_io_enq_bits_id),
    .io_enq_bits_addr(x1_aw_deq_io_enq_bits_addr),
    .io_enq_bits_len(x1_aw_deq_io_enq_bits_len),
    .io_enq_bits_size(x1_aw_deq_io_enq_bits_size),
    .io_enq_bits_burst(x1_aw_deq_io_enq_bits_burst),
    .io_enq_bits_lock(x1_aw_deq_io_enq_bits_lock),
    .io_enq_bits_cache(x1_aw_deq_io_enq_bits_cache),
    .io_enq_bits_prot(x1_aw_deq_io_enq_bits_prot),
    .io_enq_bits_qos(x1_aw_deq_io_enq_bits_qos),
    .io_deq_ready(x1_aw_deq_io_deq_ready),
    .io_deq_valid(x1_aw_deq_io_deq_valid),
    .io_deq_bits_id(x1_aw_deq_io_deq_bits_id),
    .io_deq_bits_addr(x1_aw_deq_io_deq_bits_addr),
    .io_deq_bits_len(x1_aw_deq_io_deq_bits_len),
    .io_deq_bits_size(x1_aw_deq_io_deq_bits_size),
    .io_deq_bits_burst(x1_aw_deq_io_deq_bits_burst),
    .io_deq_bits_lock(x1_aw_deq_io_deq_bits_lock),
    .io_deq_bits_cache(x1_aw_deq_io_deq_bits_cache),
    .io_deq_bits_prot(x1_aw_deq_io_deq_bits_prot),
    .io_deq_bits_qos(x1_aw_deq_io_deq_bits_qos)
  );
  Queue_5 x1_w_deq ( // @[Decoupled.scala 375:21]
    .clock(x1_w_deq_clock),
    .reset(x1_w_deq_reset),
    .io_enq_ready(x1_w_deq_io_enq_ready),
    .io_enq_valid(x1_w_deq_io_enq_valid),
    .io_enq_bits_data(x1_w_deq_io_enq_bits_data),
    .io_enq_bits_strb(x1_w_deq_io_enq_bits_strb),
    .io_enq_bits_last(x1_w_deq_io_enq_bits_last),
    .io_deq_ready(x1_w_deq_io_deq_ready),
    .io_deq_valid(x1_w_deq_io_deq_valid),
    .io_deq_bits_data(x1_w_deq_io_deq_bits_data),
    .io_deq_bits_strb(x1_w_deq_io_deq_bits_strb),
    .io_deq_bits_last(x1_w_deq_io_deq_bits_last)
  );
  Queue_6 bundleIn_0_b_deq ( // @[Decoupled.scala 375:21]
    .clock(bundleIn_0_b_deq_clock),
    .reset(bundleIn_0_b_deq_reset),
    .io_enq_ready(bundleIn_0_b_deq_io_enq_ready),
    .io_enq_valid(bundleIn_0_b_deq_io_enq_valid),
    .io_enq_bits_id(bundleIn_0_b_deq_io_enq_bits_id),
    .io_deq_ready(bundleIn_0_b_deq_io_deq_ready),
    .io_deq_valid(bundleIn_0_b_deq_io_deq_valid),
    .io_deq_bits_id(bundleIn_0_b_deq_io_deq_bits_id)
  );
  Queue_4 x1_ar_deq ( // @[Decoupled.scala 375:21]
    .clock(x1_ar_deq_clock),
    .reset(x1_ar_deq_reset),
    .io_enq_ready(x1_ar_deq_io_enq_ready),
    .io_enq_valid(x1_ar_deq_io_enq_valid),
    .io_enq_bits_id(x1_ar_deq_io_enq_bits_id),
    .io_enq_bits_addr(x1_ar_deq_io_enq_bits_addr),
    .io_enq_bits_len(x1_ar_deq_io_enq_bits_len),
    .io_enq_bits_size(x1_ar_deq_io_enq_bits_size),
    .io_enq_bits_burst(x1_ar_deq_io_enq_bits_burst),
    .io_enq_bits_lock(x1_ar_deq_io_enq_bits_lock),
    .io_enq_bits_cache(x1_ar_deq_io_enq_bits_cache),
    .io_enq_bits_prot(x1_ar_deq_io_enq_bits_prot),
    .io_enq_bits_qos(x1_ar_deq_io_enq_bits_qos),
    .io_deq_ready(x1_ar_deq_io_deq_ready),
    .io_deq_valid(x1_ar_deq_io_deq_valid),
    .io_deq_bits_id(x1_ar_deq_io_deq_bits_id),
    .io_deq_bits_addr(x1_ar_deq_io_deq_bits_addr),
    .io_deq_bits_len(x1_ar_deq_io_deq_bits_len),
    .io_deq_bits_size(x1_ar_deq_io_deq_bits_size),
    .io_deq_bits_burst(x1_ar_deq_io_deq_bits_burst),
    .io_deq_bits_lock(x1_ar_deq_io_deq_bits_lock),
    .io_deq_bits_cache(x1_ar_deq_io_deq_bits_cache),
    .io_deq_bits_prot(x1_ar_deq_io_deq_bits_prot),
    .io_deq_bits_qos(x1_ar_deq_io_deq_bits_qos)
  );
  Queue_8 bundleIn_0_r_deq ( // @[Decoupled.scala 375:21]
    .clock(bundleIn_0_r_deq_clock),
    .reset(bundleIn_0_r_deq_reset),
    .io_enq_ready(bundleIn_0_r_deq_io_enq_ready),
    .io_enq_valid(bundleIn_0_r_deq_io_enq_valid),
    .io_enq_bits_id(bundleIn_0_r_deq_io_enq_bits_id),
    .io_deq_ready(bundleIn_0_r_deq_io_deq_ready),
    .io_deq_valid(bundleIn_0_r_deq_io_deq_valid),
    .io_deq_bits_id(bundleIn_0_r_deq_io_deq_bits_id)
  );
  assign auto_in_aw_ready = x1_aw_deq_io_enq_ready; // @[Nodes.scala 1215:84 Decoupled.scala 379:17]
  assign auto_in_w_ready = x1_w_deq_io_enq_ready; // @[Nodes.scala 1215:84 Decoupled.scala 379:17]
  assign auto_in_b_valid = bundleIn_0_b_deq_io_deq_valid; // @[Decoupled.scala 414:19 416:15]
  assign auto_in_b_bits_id = bundleIn_0_b_deq_io_deq_bits_id; // @[Decoupled.scala 414:19 415:14]
  assign auto_in_ar_ready = x1_ar_deq_io_enq_ready; // @[Nodes.scala 1215:84 Decoupled.scala 379:17]
  assign auto_in_r_valid = bundleIn_0_r_deq_io_deq_valid; // @[Decoupled.scala 414:19 416:15]
  assign auto_in_r_bits_id = bundleIn_0_r_deq_io_deq_bits_id; // @[Decoupled.scala 414:19 415:14]
  assign auto_out_aw_valid = x1_aw_deq_io_deq_valid; // @[Decoupled.scala 414:19 416:15]
  assign auto_out_aw_bits_id = x1_aw_deq_io_deq_bits_id; // @[Decoupled.scala 414:19 415:14]
  assign auto_out_aw_bits_addr = x1_aw_deq_io_deq_bits_addr; // @[Decoupled.scala 414:19 415:14]
  assign auto_out_aw_bits_len = x1_aw_deq_io_deq_bits_len; // @[Decoupled.scala 414:19 415:14]
  assign auto_out_aw_bits_size = x1_aw_deq_io_deq_bits_size; // @[Decoupled.scala 414:19 415:14]
  assign auto_out_aw_bits_burst = x1_aw_deq_io_deq_bits_burst; // @[Decoupled.scala 414:19 415:14]
  assign auto_out_aw_bits_lock = x1_aw_deq_io_deq_bits_lock; // @[Decoupled.scala 414:19 415:14]
  assign auto_out_aw_bits_cache = x1_aw_deq_io_deq_bits_cache; // @[Decoupled.scala 414:19 415:14]
  assign auto_out_aw_bits_prot = x1_aw_deq_io_deq_bits_prot; // @[Decoupled.scala 414:19 415:14]
  assign auto_out_aw_bits_qos = x1_aw_deq_io_deq_bits_qos; // @[Decoupled.scala 414:19 415:14]
  assign auto_out_w_valid = x1_w_deq_io_deq_valid; // @[Decoupled.scala 414:19 416:15]
  assign auto_out_w_bits_data = x1_w_deq_io_deq_bits_data; // @[Decoupled.scala 414:19 415:14]
  assign auto_out_w_bits_strb = x1_w_deq_io_deq_bits_strb; // @[Decoupled.scala 414:19 415:14]
  assign auto_out_w_bits_last = x1_w_deq_io_deq_bits_last; // @[Decoupled.scala 414:19 415:14]
  assign auto_out_b_ready = bundleIn_0_b_deq_io_enq_ready; // @[Nodes.scala 1212:84 Decoupled.scala 379:17]
  assign auto_out_ar_valid = x1_ar_deq_io_deq_valid; // @[Decoupled.scala 414:19 416:15]
  assign auto_out_ar_bits_id = x1_ar_deq_io_deq_bits_id; // @[Decoupled.scala 414:19 415:14]
  assign auto_out_ar_bits_addr = x1_ar_deq_io_deq_bits_addr; // @[Decoupled.scala 414:19 415:14]
  assign auto_out_ar_bits_len = x1_ar_deq_io_deq_bits_len; // @[Decoupled.scala 414:19 415:14]
  assign auto_out_ar_bits_size = x1_ar_deq_io_deq_bits_size; // @[Decoupled.scala 414:19 415:14]
  assign auto_out_ar_bits_burst = x1_ar_deq_io_deq_bits_burst; // @[Decoupled.scala 414:19 415:14]
  assign auto_out_ar_bits_lock = x1_ar_deq_io_deq_bits_lock; // @[Decoupled.scala 414:19 415:14]
  assign auto_out_ar_bits_cache = x1_ar_deq_io_deq_bits_cache; // @[Decoupled.scala 414:19 415:14]
  assign auto_out_ar_bits_prot = x1_ar_deq_io_deq_bits_prot; // @[Decoupled.scala 414:19 415:14]
  assign auto_out_ar_bits_qos = x1_ar_deq_io_deq_bits_qos; // @[Decoupled.scala 414:19 415:14]
  assign auto_out_r_ready = bundleIn_0_r_deq_io_enq_ready; // @[Nodes.scala 1212:84 Decoupled.scala 379:17]
  assign x1_aw_deq_clock = clock;
  assign x1_aw_deq_reset = reset;
  assign x1_aw_deq_io_enq_valid = auto_in_aw_valid; // @[Nodes.scala 1215:84 LazyModule.scala 366:16]
  assign x1_aw_deq_io_enq_bits_id = auto_in_aw_bits_id; // @[Nodes.scala 1215:84 LazyModule.scala 366:16]
  assign x1_aw_deq_io_enq_bits_addr = auto_in_aw_bits_addr; // @[Nodes.scala 1215:84 LazyModule.scala 366:16]
  assign x1_aw_deq_io_enq_bits_len = auto_in_aw_bits_len; // @[Nodes.scala 1215:84 LazyModule.scala 366:16]
  assign x1_aw_deq_io_enq_bits_size = auto_in_aw_bits_size; // @[Nodes.scala 1215:84 LazyModule.scala 366:16]
  assign x1_aw_deq_io_enq_bits_burst = auto_in_aw_bits_burst; // @[Nodes.scala 1215:84 LazyModule.scala 366:16]
  assign x1_aw_deq_io_enq_bits_lock = auto_in_aw_bits_lock; // @[Nodes.scala 1215:84 LazyModule.scala 366:16]
  assign x1_aw_deq_io_enq_bits_cache = auto_in_aw_bits_cache; // @[Nodes.scala 1215:84 LazyModule.scala 366:16]
  assign x1_aw_deq_io_enq_bits_prot = auto_in_aw_bits_prot; // @[Nodes.scala 1215:84 LazyModule.scala 366:16]
  assign x1_aw_deq_io_enq_bits_qos = auto_in_aw_bits_qos; // @[Nodes.scala 1215:84 LazyModule.scala 366:16]
  assign x1_aw_deq_io_deq_ready = auto_out_aw_ready; // @[Nodes.scala 1212:84 LazyModule.scala 368:12]
  assign x1_w_deq_clock = clock;
  assign x1_w_deq_reset = reset;
  assign x1_w_deq_io_enq_valid = auto_in_w_valid; // @[Nodes.scala 1215:84 LazyModule.scala 366:16]
  assign x1_w_deq_io_enq_bits_data = auto_in_w_bits_data; // @[Nodes.scala 1215:84 LazyModule.scala 366:16]
  assign x1_w_deq_io_enq_bits_strb = auto_in_w_bits_strb; // @[Nodes.scala 1215:84 LazyModule.scala 366:16]
  assign x1_w_deq_io_enq_bits_last = auto_in_w_bits_last; // @[Nodes.scala 1215:84 LazyModule.scala 366:16]
  assign x1_w_deq_io_deq_ready = auto_out_w_ready; // @[Nodes.scala 1212:84 LazyModule.scala 368:12]
  assign bundleIn_0_b_deq_clock = clock;
  assign bundleIn_0_b_deq_reset = reset;
  assign bundleIn_0_b_deq_io_enq_valid = auto_out_b_valid; // @[Nodes.scala 1212:84 LazyModule.scala 368:12]
  assign bundleIn_0_b_deq_io_enq_bits_id = auto_out_b_bits_id; // @[Nodes.scala 1212:84 LazyModule.scala 368:12]
  assign bundleIn_0_b_deq_io_deq_ready = auto_in_b_ready; // @[Nodes.scala 1215:84 LazyModule.scala 366:16]
  assign x1_ar_deq_clock = clock;
  assign x1_ar_deq_reset = reset;
  assign x1_ar_deq_io_enq_valid = auto_in_ar_valid; // @[Nodes.scala 1215:84 LazyModule.scala 366:16]
  assign x1_ar_deq_io_enq_bits_id = auto_in_ar_bits_id; // @[Nodes.scala 1215:84 LazyModule.scala 366:16]
  assign x1_ar_deq_io_enq_bits_addr = auto_in_ar_bits_addr; // @[Nodes.scala 1215:84 LazyModule.scala 366:16]
  assign x1_ar_deq_io_enq_bits_len = auto_in_ar_bits_len; // @[Nodes.scala 1215:84 LazyModule.scala 366:16]
  assign x1_ar_deq_io_enq_bits_size = auto_in_ar_bits_size; // @[Nodes.scala 1215:84 LazyModule.scala 366:16]
  assign x1_ar_deq_io_enq_bits_burst = auto_in_ar_bits_burst; // @[Nodes.scala 1215:84 LazyModule.scala 366:16]
  assign x1_ar_deq_io_enq_bits_lock = auto_in_ar_bits_lock; // @[Nodes.scala 1215:84 LazyModule.scala 366:16]
  assign x1_ar_deq_io_enq_bits_cache = auto_in_ar_bits_cache; // @[Nodes.scala 1215:84 LazyModule.scala 366:16]
  assign x1_ar_deq_io_enq_bits_prot = auto_in_ar_bits_prot; // @[Nodes.scala 1215:84 LazyModule.scala 366:16]
  assign x1_ar_deq_io_enq_bits_qos = auto_in_ar_bits_qos; // @[Nodes.scala 1215:84 LazyModule.scala 366:16]
  assign x1_ar_deq_io_deq_ready = auto_out_ar_ready; // @[Nodes.scala 1212:84 LazyModule.scala 368:12]
  assign bundleIn_0_r_deq_clock = clock;
  assign bundleIn_0_r_deq_reset = reset;
  assign bundleIn_0_r_deq_io_enq_valid = auto_out_r_valid; // @[Nodes.scala 1212:84 LazyModule.scala 368:12]
  assign bundleIn_0_r_deq_io_enq_bits_id = auto_out_r_bits_id; // @[Nodes.scala 1212:84 LazyModule.scala 368:12]
  assign bundleIn_0_r_deq_io_deq_ready = auto_in_r_ready; // @[Nodes.scala 1215:84 LazyModule.scala 366:16]
endmodule
module BRAMFlowQueue(
  input          clock,
  input          reset,
  output         io_enq_ready,
  input          io_enq_valid,
  input  [511:0] io_enq_bits,
  input          io_deq_ready,
  output         io_deq_valid,
  output [511:0] io_deq_bits
);
`ifdef RANDOMIZE_MEM_INIT
  reg [511:0] _RAND_0;
`endif // RANDOMIZE_MEM_INIT
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
  reg [511:0] _RAND_5;
`endif // RANDOMIZE_REG_INIT
  reg [511:0] ram [0:127]; // @[Lib.scala 456:16]
  wire  ram_io_deq_bits_MPORT_en; // @[Lib.scala 456:16 465:61]
  wire [6:0] ram_io_deq_bits_MPORT_addr; // @[Lib.scala 456:16 460:26]
  wire [511:0] ram_io_deq_bits_MPORT_data; // @[Lib.scala 456:16]
  wire [511:0] ram_MPORT_data; // @[Lib.scala 456:16 457:16]
  wire [6:0] ram_MPORT_addr; // @[Lib.scala 456:16 457:16]
  wire  ram_MPORT_mask; // @[Lib.scala 456:16 457:16]
  wire  ram_MPORT_en; // @[Lib.scala 456:16 442:29]
  wire  _do_enq_T = io_enq_ready & io_enq_valid; // @[Decoupled.scala 51:35]
  reg [6:0] enq_ptr; // @[Counter.scala 61:40]
  reg [6:0] deq_ptr; // @[Counter.scala 61:40]
  wire  ptr_match = enq_ptr == deq_ptr; // @[Lib.scala 450:37]
  reg  maybe_full; // @[Lib.scala 445:36]
  wire  empty = ptr_match & ~maybe_full; // @[Lib.scala 451:39]
  wire  do_flow = empty & io_deq_ready; // @[Lib.scala 454:20]
  wire  _do_enq_T_1 = ~do_flow; // @[Lib.scala 442:32]
  wire  do_enq = _do_enq_T & ~do_flow; // @[Lib.scala 442:29]
  wire  _do_deq_T = io_deq_ready & io_deq_valid; // @[Decoupled.scala 51:35]
  wire  do_deq = _do_deq_T & _do_enq_T_1; // @[Lib.scala 443:29]
  wire [6:0] _enq_ptr_wrap_value_T_1 = enq_ptr + 7'h1; // @[Counter.scala 77:24]
  wire  wrap_wrap = deq_ptr == 7'h7f; // @[Counter.scala 73:24]
  wire [6:0] _wrap_value_T_1 = deq_ptr + 7'h1; // @[Counter.scala 77:24]
  wire  deq_done = do_deq & wrap_wrap; // @[Counter.scala 118:{16,23} 117:24]
  wire  full = ptr_match & maybe_full; // @[Lib.scala 452:39]
  wire [6:0] _atLeastTwo_T_1 = enq_ptr - deq_ptr; // @[Lib.scala 453:45]
  wire  atLeastTwo = full | _atLeastTwo_T_1 >= 7'h2; // @[Lib.scala 453:34]
  wire  ren = io_deq_ready & (atLeastTwo | ~io_deq_valid & ~empty); // @[Lib.scala 459:36]
  wire [6:0] _raddr_T_2 = deq_done ? 7'h0 : _wrap_value_T_1; // @[Lib.scala 460:44]
  reg  ram_out_valid; // @[Lib.scala 461:30]
  reg [511:0] io_deq_bits_r; // @[Reg.scala 19:16]
  assign ram_io_deq_bits_MPORT_en = 1'h1; // @[Lib.scala 465:61]
  assign ram_io_deq_bits_MPORT_addr = io_deq_valid ? _raddr_T_2 : deq_ptr; // @[Lib.scala 460:26]
  assign ram_io_deq_bits_MPORT_data = ram[ram_io_deq_bits_MPORT_addr]; // @[Lib.scala 456:16]
  assign ram_MPORT_data = io_enq_bits; // @[Lib.scala 457:16]
  assign ram_MPORT_addr = enq_ptr; // @[Lib.scala 457:16]
  assign ram_MPORT_mask = 1'h1; // @[Lib.scala 457:16]
  assign ram_MPORT_en = _do_enq_T & ~do_flow; // @[Lib.scala 442:29]
  assign io_enq_ready = ~full; // @[Lib.scala 464:19]
  assign io_deq_valid = empty ? io_enq_valid : ram_out_valid; // @[Lib.scala 463:22]
  assign io_deq_bits = empty ? io_enq_bits : io_deq_bits_r; // @[Lib.scala 465:22]
  always @(posedge clock) begin
    if (ram_MPORT_en & ram_MPORT_mask) begin
      ram[ram_MPORT_addr] <= ram_MPORT_data; // @[Lib.scala 456:16]
    end
    if (reset) begin // @[Counter.scala 61:40]
      enq_ptr <= 7'h0; // @[Counter.scala 61:40]
    end else if (do_enq) begin // @[Counter.scala 118:16]
      enq_ptr <= _enq_ptr_wrap_value_T_1; // @[Counter.scala 77:15]
    end
    if (reset) begin // @[Counter.scala 61:40]
      deq_ptr <= 7'h0; // @[Counter.scala 61:40]
    end else if (do_deq) begin // @[Counter.scala 118:16]
      deq_ptr <= _wrap_value_T_1; // @[Counter.scala 77:15]
    end
    if (reset) begin // @[Lib.scala 445:36]
      maybe_full <= 1'h0; // @[Lib.scala 445:36]
    end else if (do_enq != do_deq) begin // @[Lib.scala 448:27]
      maybe_full <= do_enq; // @[Lib.scala 448:40]
    end
    ram_out_valid <= io_deq_ready & (atLeastTwo | ~io_deq_valid & ~empty); // @[Lib.scala 459:36]
    if (ren) begin // @[Reg.scala 20:18]
      io_deq_bits_r <= ram_io_deq_bits_MPORT_data; // @[Reg.scala 20:22]
    end
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_MEM_INIT
  _RAND_0 = {16{`RANDOM}};
  for (initvar = 0; initvar < 128; initvar = initvar+1)
    ram[initvar] = _RAND_0[511:0];
`endif // RANDOMIZE_MEM_INIT
`ifdef RANDOMIZE_REG_INIT
  _RAND_1 = {1{`RANDOM}};
  enq_ptr = _RAND_1[6:0];
  _RAND_2 = {1{`RANDOM}};
  deq_ptr = _RAND_2[6:0];
  _RAND_3 = {1{`RANDOM}};
  maybe_full = _RAND_3[0:0];
  _RAND_4 = {1{`RANDOM}};
  ram_out_valid = _RAND_4[0:0];
  _RAND_5 = {16{`RANDOM}};
  io_deq_bits_r = _RAND_5[511:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module Queue_9(
  input          clock,
  input          reset,
  output         io_enq_ready,
  input          io_enq_valid,
  input  [511:0] io_enq_bits,
  input          io_deq_ready,
  output         io_deq_valid,
  output [511:0] io_deq_bits
);
`ifdef RANDOMIZE_MEM_INIT
  reg [511:0] _RAND_0;
`endif // RANDOMIZE_MEM_INIT
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_1;
`endif // RANDOMIZE_REG_INIT
  reg [511:0] ram [0:0]; // @[Decoupled.scala 273:95]
  wire  ram_io_deq_bits_MPORT_en; // @[Decoupled.scala 273:95 310:23]
  wire  ram_io_deq_bits_MPORT_addr; // @[Decoupled.scala 273:95 310:23]
  wire [511:0] ram_io_deq_bits_MPORT_data; // @[Decoupled.scala 273:95]
  wire [511:0] ram_MPORT_data; // @[Decoupled.scala 273:95 286:16 287:24]
  wire  ram_MPORT_addr; // @[Decoupled.scala 273:95 286:16 287:8]
  wire  ram_MPORT_mask; // @[Decoupled.scala 273:95 286:16 287:24]
  wire  ram_MPORT_en; // @[Decoupled.scala 273:95 51:35]
  reg  maybe_full; // @[Decoupled.scala 276:27]
  wire  empty = ~maybe_full; // @[Decoupled.scala 278:28]
  wire  do_enq = io_enq_ready & io_enq_valid; // @[Decoupled.scala 51:35]
  wire  do_deq = io_deq_ready & io_deq_valid; // @[Decoupled.scala 51:35]
  assign ram_io_deq_bits_MPORT_en = 1'h1; // @[Decoupled.scala 310:23]
  assign ram_io_deq_bits_MPORT_addr = 1'h0; // @[Decoupled.scala 310:23]
  assign ram_io_deq_bits_MPORT_data = ram[ram_io_deq_bits_MPORT_addr]; // @[Decoupled.scala 273:95]
  assign ram_MPORT_data = io_enq_bits; // @[Decoupled.scala 286:16 287:24]
  assign ram_MPORT_addr = 1'h0; // @[Decoupled.scala 286:16 287:8]
  assign ram_MPORT_mask = 1'h1; // @[Decoupled.scala 286:16 287:24]
  assign ram_MPORT_en = io_enq_ready & io_enq_valid; // @[Decoupled.scala 51:35]
  assign io_enq_ready = io_deq_ready | empty; // @[Decoupled.scala 303:16 323:{24,39}]
  assign io_deq_valid = ~empty; // @[Decoupled.scala 302:19]
  assign io_deq_bits = ram_io_deq_bits_MPORT_data; // @[Decoupled.scala 310:17]
  always @(posedge clock) begin
    if (ram_MPORT_en & ram_MPORT_mask) begin
      ram[ram_MPORT_addr] <= ram_MPORT_data; // @[Decoupled.scala 273:95]
    end
    if (reset) begin // @[Decoupled.scala 276:27]
      maybe_full <= 1'h0; // @[Decoupled.scala 276:27]
    end else if (do_enq != do_deq) begin // @[Decoupled.scala 293:27]
      maybe_full <= do_enq; // @[Decoupled.scala 294:16]
    end
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_MEM_INIT
  _RAND_0 = {16{`RANDOM}};
  for (initvar = 0; initvar < 1; initvar = initvar+1)
    ram[initvar] = _RAND_0[511:0];
`endif // RANDOMIZE_MEM_INIT
`ifdef RANDOMIZE_REG_INIT
  _RAND_1 = {1{`RANDOM}};
  maybe_full = _RAND_1[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module BRAMQueue(
  input          clock,
  input          reset,
  output         io_enq_ready,
  input          io_enq_valid,
  input  [511:0] io_enq_bits,
  input          io_deq_ready,
  output         io_deq_valid,
  output [511:0] io_deq_bits,
  output [7:0]   io_count
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
`endif // RANDOMIZE_REG_INIT
  wire  fq_clock; // @[Lib.scala 478:18]
  wire  fq_reset; // @[Lib.scala 478:18]
  wire  fq_io_enq_ready; // @[Lib.scala 478:18]
  wire  fq_io_enq_valid; // @[Lib.scala 478:18]
  wire [511:0] fq_io_enq_bits; // @[Lib.scala 478:18]
  wire  fq_io_deq_ready; // @[Lib.scala 478:18]
  wire  fq_io_deq_valid; // @[Lib.scala 478:18]
  wire [511:0] fq_io_deq_bits; // @[Lib.scala 478:18]
  wire  io_deq_q_clock; // @[Decoupled.scala 375:21]
  wire  io_deq_q_reset; // @[Decoupled.scala 375:21]
  wire  io_deq_q_io_enq_ready; // @[Decoupled.scala 375:21]
  wire  io_deq_q_io_enq_valid; // @[Decoupled.scala 375:21]
  wire [511:0] io_deq_q_io_enq_bits; // @[Decoupled.scala 375:21]
  wire  io_deq_q_io_deq_ready; // @[Decoupled.scala 375:21]
  wire  io_deq_q_io_deq_valid; // @[Decoupled.scala 375:21]
  wire [511:0] io_deq_q_io_deq_bits; // @[Decoupled.scala 375:21]
  reg [7:0] count; // @[Lib.scala 471:22]
  wire  _T = io_enq_ready & io_enq_valid; // @[Decoupled.scala 51:35]
  wire  _T_1 = io_deq_ready & io_deq_valid; // @[Decoupled.scala 51:35]
  wire [7:0] _count_T_2 = count + 8'h1; // @[Lib.scala 474:37]
  wire [7:0] _count_T_4 = count - 8'h1; // @[Lib.scala 474:50]
  BRAMFlowQueue fq ( // @[Lib.scala 478:18]
    .clock(fq_clock),
    .reset(fq_reset),
    .io_enq_ready(fq_io_enq_ready),
    .io_enq_valid(fq_io_enq_valid),
    .io_enq_bits(fq_io_enq_bits),
    .io_deq_ready(fq_io_deq_ready),
    .io_deq_valid(fq_io_deq_valid),
    .io_deq_bits(fq_io_deq_bits)
  );
  Queue_9 io_deq_q ( // @[Decoupled.scala 375:21]
    .clock(io_deq_q_clock),
    .reset(io_deq_q_reset),
    .io_enq_ready(io_deq_q_io_enq_ready),
    .io_enq_valid(io_deq_q_io_enq_valid),
    .io_enq_bits(io_deq_q_io_enq_bits),
    .io_deq_ready(io_deq_q_io_deq_ready),
    .io_deq_valid(io_deq_q_io_deq_valid),
    .io_deq_bits(io_deq_q_io_deq_bits)
  );
  assign io_enq_ready = fq_io_enq_ready; // @[Lib.scala 479:13]
  assign io_deq_valid = io_deq_q_io_deq_valid; // @[Lib.scala 480:13]
  assign io_deq_bits = io_deq_q_io_deq_bits; // @[Lib.scala 480:13]
  assign io_count = count; // @[Lib.scala 476:12]
  assign fq_clock = clock;
  assign fq_reset = reset;
  assign fq_io_enq_valid = io_enq_valid; // @[Lib.scala 479:13]
  assign fq_io_enq_bits = io_enq_bits; // @[Lib.scala 479:13]
  assign fq_io_deq_ready = io_deq_q_io_enq_ready; // @[Decoupled.scala 379:17]
  assign io_deq_q_clock = clock;
  assign io_deq_q_reset = reset;
  assign io_deq_q_io_enq_valid = fq_io_deq_valid; // @[Decoupled.scala 377:22]
  assign io_deq_q_io_enq_bits = fq_io_deq_bits; // @[Decoupled.scala 378:21]
  assign io_deq_q_io_deq_ready = io_deq_ready; // @[Lib.scala 480:13]
  always @(posedge clock) begin
    if (reset) begin // @[Lib.scala 471:22]
      count <= 8'h0; // @[Lib.scala 471:22]
    end else if (_T ^ _T_1) begin // @[Lib.scala 473:35]
      if (_T) begin // @[Lib.scala 474:17]
        count <= _count_T_2;
      end else begin
        count <= _count_T_4;
      end
    end
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  count = _RAND_0[7:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module Queue_10(
  input        clock,
  input        reset,
  output       io_enq_ready,
  input        io_enq_valid,
  input  [6:0] io_enq_bits_numBeats,
  input        io_enq_bits_isFlush,
  input        io_deq_ready,
  output       io_deq_valid,
  output [6:0] io_deq_bits_numBeats,
  output       io_deq_bits_isFlush
);
`ifdef RANDOMIZE_GARBAGE_ASSIGN
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_3;
`endif // RANDOMIZE_GARBAGE_ASSIGN
`ifdef RANDOMIZE_MEM_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_2;
`endif // RANDOMIZE_MEM_INIT
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_4;
  reg [31:0] _RAND_5;
  reg [31:0] _RAND_6;
`endif // RANDOMIZE_REG_INIT
  reg [6:0] ram_numBeats [0:95]; // @[Decoupled.scala 273:95]
  wire  ram_numBeats_io_deq_bits_MPORT_en; // @[Decoupled.scala 273:95 310:23]
  wire [6:0] ram_numBeats_io_deq_bits_MPORT_addr; // @[Decoupled.scala 273:95 310:23]
  wire [6:0] ram_numBeats_io_deq_bits_MPORT_data; // @[Decoupled.scala 273:95]
  wire [6:0] ram_numBeats_MPORT_data; // @[Decoupled.scala 273:95 286:16 287:24]
  wire [6:0] ram_numBeats_MPORT_addr; // @[Decoupled.scala 273:95 286:16 287:8]
  wire  ram_numBeats_MPORT_mask; // @[Decoupled.scala 273:95 286:16 287:24]
  wire  ram_numBeats_MPORT_en; // @[Decoupled.scala 273:95 51:35]
  reg  ram_isFlush [0:95]; // @[Decoupled.scala 273:95]
  wire  ram_isFlush_io_deq_bits_MPORT_en; // @[Decoupled.scala 273:95 310:23]
  wire [6:0] ram_isFlush_io_deq_bits_MPORT_addr; // @[Decoupled.scala 273:95 310:23]
  wire  ram_isFlush_io_deq_bits_MPORT_data; // @[Decoupled.scala 273:95]
  wire  ram_isFlush_MPORT_data; // @[Decoupled.scala 273:95 286:16 287:24]
  wire [6:0] ram_isFlush_MPORT_addr; // @[Decoupled.scala 273:95 286:16 287:8]
  wire  ram_isFlush_MPORT_mask; // @[Decoupled.scala 273:95 286:16 287:24]
  wire  ram_isFlush_MPORT_en; // @[Decoupled.scala 273:95 51:35]
  reg [6:0] enq_ptr_value; // @[Counter.scala 61:40]
  reg [6:0] deq_ptr_value; // @[Counter.scala 61:40]
  reg  maybe_full; // @[Decoupled.scala 276:27]
  wire  ptr_match = enq_ptr_value == deq_ptr_value; // @[Decoupled.scala 277:33]
  wire  empty = ptr_match & ~maybe_full; // @[Decoupled.scala 278:25]
  wire  full = ptr_match & maybe_full; // @[Decoupled.scala 279:24]
  wire  do_enq = io_enq_ready & io_enq_valid; // @[Decoupled.scala 51:35]
  wire  do_deq = io_deq_ready & io_deq_valid; // @[Decoupled.scala 51:35]
  wire  wrap = enq_ptr_value == 7'h5f; // @[Counter.scala 73:24]
  wire [6:0] _value_T_1 = enq_ptr_value + 7'h1; // @[Counter.scala 77:24]
  wire  wrap_1 = deq_ptr_value == 7'h5f; // @[Counter.scala 73:24]
  wire [6:0] _value_T_3 = deq_ptr_value + 7'h1; // @[Counter.scala 77:24]
  assign ram_numBeats_io_deq_bits_MPORT_en = 1'h1; // @[Decoupled.scala 310:23]
  assign ram_numBeats_io_deq_bits_MPORT_addr = deq_ptr_value; // @[Decoupled.scala 310:23]
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign ram_numBeats_io_deq_bits_MPORT_data = ram_numBeats[ram_numBeats_io_deq_bits_MPORT_addr]; // @[Decoupled.scala 273:95]
  `else
  assign ram_numBeats_io_deq_bits_MPORT_data = ram_numBeats_io_deq_bits_MPORT_addr >= 7'h60 ? _RAND_1[6:0] :
    ram_numBeats[ram_numBeats_io_deq_bits_MPORT_addr]; // @[Decoupled.scala 273:95]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign ram_numBeats_MPORT_data = io_enq_bits_numBeats; // @[Decoupled.scala 286:16 287:24]
  assign ram_numBeats_MPORT_addr = enq_ptr_value; // @[Decoupled.scala 286:16 287:8]
  assign ram_numBeats_MPORT_mask = 1'h1; // @[Decoupled.scala 286:16 287:24]
  assign ram_numBeats_MPORT_en = io_enq_ready & io_enq_valid; // @[Decoupled.scala 51:35]
  assign ram_isFlush_io_deq_bits_MPORT_en = 1'h1; // @[Decoupled.scala 310:23]
  assign ram_isFlush_io_deq_bits_MPORT_addr = deq_ptr_value; // @[Decoupled.scala 310:23]
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign ram_isFlush_io_deq_bits_MPORT_data = ram_isFlush[ram_isFlush_io_deq_bits_MPORT_addr]; // @[Decoupled.scala 273:95]
  `else
  assign ram_isFlush_io_deq_bits_MPORT_data = ram_isFlush_io_deq_bits_MPORT_addr >= 7'h60 ? _RAND_3[0:0] :
    ram_isFlush[ram_isFlush_io_deq_bits_MPORT_addr]; // @[Decoupled.scala 273:95]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign ram_isFlush_MPORT_data = io_enq_bits_isFlush; // @[Decoupled.scala 286:16 287:24]
  assign ram_isFlush_MPORT_addr = enq_ptr_value; // @[Decoupled.scala 286:16 287:8]
  assign ram_isFlush_MPORT_mask = 1'h1; // @[Decoupled.scala 286:16 287:24]
  assign ram_isFlush_MPORT_en = io_enq_ready & io_enq_valid; // @[Decoupled.scala 51:35]
  assign io_enq_ready = ~full; // @[Decoupled.scala 303:19]
  assign io_deq_valid = ~empty; // @[Decoupled.scala 302:19]
  assign io_deq_bits_numBeats = ram_numBeats_io_deq_bits_MPORT_data; // @[Decoupled.scala 310:17]
  assign io_deq_bits_isFlush = ram_isFlush_io_deq_bits_MPORT_data; // @[Decoupled.scala 310:17]
  always @(posedge clock) begin
    if (ram_numBeats_MPORT_en & ram_numBeats_MPORT_mask) begin
      ram_numBeats[ram_numBeats_MPORT_addr] <= ram_numBeats_MPORT_data; // @[Decoupled.scala 273:95]
    end
    if (ram_isFlush_MPORT_en & ram_isFlush_MPORT_mask) begin
      ram_isFlush[ram_isFlush_MPORT_addr] <= ram_isFlush_MPORT_data; // @[Decoupled.scala 273:95]
    end
    if (reset) begin // @[Counter.scala 61:40]
      enq_ptr_value <= 7'h0; // @[Counter.scala 61:40]
    end else if (do_enq) begin // @[Decoupled.scala 286:16]
      if (wrap) begin // @[Counter.scala 87:20]
        enq_ptr_value <= 7'h0; // @[Counter.scala 87:28]
      end else begin
        enq_ptr_value <= _value_T_1; // @[Counter.scala 77:15]
      end
    end
    if (reset) begin // @[Counter.scala 61:40]
      deq_ptr_value <= 7'h0; // @[Counter.scala 61:40]
    end else if (do_deq) begin // @[Decoupled.scala 290:16]
      if (wrap_1) begin // @[Counter.scala 87:20]
        deq_ptr_value <= 7'h0; // @[Counter.scala 87:28]
      end else begin
        deq_ptr_value <= _value_T_3; // @[Counter.scala 77:15]
      end
    end
    if (reset) begin // @[Decoupled.scala 276:27]
      maybe_full <= 1'h0; // @[Decoupled.scala 276:27]
    end else if (do_enq != do_deq) begin // @[Decoupled.scala 293:27]
      maybe_full <= do_enq; // @[Decoupled.scala 294:16]
    end
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_GARBAGE_ASSIGN
  _RAND_1 = {1{`RANDOM}};
  _RAND_3 = {1{`RANDOM}};
`endif // RANDOMIZE_GARBAGE_ASSIGN
`ifdef RANDOMIZE_MEM_INIT
  _RAND_0 = {1{`RANDOM}};
  for (initvar = 0; initvar < 96; initvar = initvar+1)
    ram_numBeats[initvar] = _RAND_0[6:0];
  _RAND_2 = {1{`RANDOM}};
  for (initvar = 0; initvar < 96; initvar = initvar+1)
    ram_isFlush[initvar] = _RAND_2[0:0];
`endif // RANDOMIZE_MEM_INIT
`ifdef RANDOMIZE_REG_INIT
  _RAND_4 = {1{`RANDOM}};
  enq_ptr_value = _RAND_4[6:0];
  _RAND_5 = {1{`RANDOM}};
  deq_ptr_value = _RAND_5[6:0];
  _RAND_6 = {1{`RANDOM}};
  maybe_full = _RAND_6[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module MCRFile_4(
  input         clock,
  input         reset,
  output        io_nasti_aw_ready,
  input         io_nasti_aw_valid,
  input  [11:0] io_nasti_aw_bits_addr,
  input  [7:0]  io_nasti_aw_bits_len,
  input         io_nasti_aw_bits_id,
  output        io_nasti_w_ready,
  input         io_nasti_w_valid,
  input  [31:0] io_nasti_w_bits_data,
  input         io_nasti_b_ready,
  output        io_nasti_b_valid,
  output        io_nasti_b_bits_id,
  output        io_nasti_ar_ready,
  input         io_nasti_ar_valid,
  input  [11:0] io_nasti_ar_bits_addr,
  input  [7:0]  io_nasti_ar_bits_len,
  input         io_nasti_ar_bits_id,
  input         io_nasti_r_ready,
  output        io_nasti_r_valid,
  output [31:0] io_nasti_r_bits_data,
  output        io_nasti_r_bits_id,
  input  [31:0] io_mcr_read_0_bits,
  input  [31:0] io_mcr_read_1_bits,
  input  [31:0] io_mcr_read_2_bits,
  input  [31:0] io_mcr_read_3_bits,
  input  [31:0] io_mcr_read_4_bits,
  input  [31:0] io_mcr_read_5_bits,
  input  [31:0] io_mcr_read_6_bits,
  output        io_mcr_write_0_valid,
  output [31:0] io_mcr_write_0_bits,
  output        io_mcr_write_1_valid,
  output [31:0] io_mcr_write_1_bits,
  output        io_mcr_write_2_valid,
  output        io_mcr_write_3_valid,
  output [31:0] io_mcr_write_3_bits,
  output        io_mcr_write_4_valid,
  output [31:0] io_mcr_write_4_bits,
  output        io_mcr_write_5_valid,
  output [31:0] io_mcr_write_5_bits,
  output        io_mcr_write_6_valid
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
  reg [31:0] _RAND_5;
  reg [31:0] _RAND_6;
  reg [31:0] _RAND_7;
  reg [31:0] _RAND_8;
`endif // RANDOMIZE_REG_INIT
  reg  arFired; // @[Lib.scala 317:26]
  reg  awFired; // @[Lib.scala 318:26]
  reg  wFired; // @[Lib.scala 319:26]
  reg  wCommited; // @[Lib.scala 320:26]
  reg  bId; // @[Lib.scala 321:22]
  reg  rId; // @[Lib.scala 322:22]
  reg [31:0] wData; // @[Lib.scala 324:22]
  reg [2:0] wIndex; // @[Lib.scala 325:22]
  reg [2:0] rIndex; // @[Lib.scala 326:22]
  wire  _T = io_nasti_aw_ready & io_nasti_aw_valid; // @[Decoupled.scala 51:35]
  wire  _T_3 = ~reset; // @[Lib.scala 333:11]
  wire  _GEN_0 = _T | awFired; // @[Lib.scala 329:26 330:13 318:26]
  wire [9:0] _GEN_1 = _T ? io_nasti_aw_bits_addr[11:2] : {{7'd0}, wIndex}; // @[Lib.scala 329:26 331:13 325:22]
  wire  _T_5 = io_nasti_w_ready & io_nasti_w_valid; // @[Decoupled.scala 51:35]
  wire  _GEN_3 = _T_5 | wFired; // @[Lib.scala 336:25 337:12 319:26]
  wire  _T_6 = io_nasti_ar_ready & io_nasti_ar_valid; // @[Decoupled.scala 51:35]
  wire  _GEN_6 = _T_6 | arFired; // @[Lib.scala 342:26 343:13 317:26]
  wire  _T_11 = io_nasti_r_ready & io_nasti_r_valid; // @[Decoupled.scala 51:35]
  wire  _T_12 = io_nasti_b_ready & io_nasti_b_valid; // @[Decoupled.scala 51:35]
  wire  _GEN_12 = _T_12 ? 1'h0 : wCommited; // @[Lib.scala 353:25 356:15 320:26]
  wire  _GEN_21 = 3'h1 == wIndex ? io_mcr_write_1_valid : io_mcr_write_0_valid; // @[Decoupled.scala 51:{35,35}]
  wire  _GEN_22 = 3'h2 == wIndex ? io_mcr_write_2_valid : _GEN_21; // @[Decoupled.scala 51:{35,35}]
  wire  _GEN_23 = 3'h3 == wIndex ? io_mcr_write_3_valid : _GEN_22; // @[Decoupled.scala 51:{35,35}]
  wire  _GEN_24 = 3'h4 == wIndex ? io_mcr_write_4_valid : _GEN_23; // @[Decoupled.scala 51:{35,35}]
  wire  _GEN_25 = 3'h5 == wIndex ? io_mcr_write_5_valid : _GEN_24; // @[Decoupled.scala 51:{35,35}]
  wire  _GEN_26 = 3'h6 == wIndex ? io_mcr_write_6_valid : _GEN_25; // @[Decoupled.scala 51:{35,35}]
  wire  _GEN_27 = _GEN_26 | _GEN_12; // @[Lib.scala 359:35 360:15]
  wire  _io_mcr_write_valid_T = awFired & wFired; // @[Lib.scala 364:41]
  wire [31:0] _GEN_36 = 3'h1 == rIndex ? io_mcr_read_1_bits : io_mcr_read_0_bits; // @[nasti.scala 218:{12,12}]
  wire [31:0] _GEN_37 = 3'h2 == rIndex ? io_mcr_read_2_bits : _GEN_36; // @[nasti.scala 218:{12,12}]
  wire [31:0] _GEN_38 = 3'h3 == rIndex ? io_mcr_read_3_bits : _GEN_37; // @[nasti.scala 218:{12,12}]
  wire [31:0] _GEN_39 = 3'h4 == rIndex ? io_mcr_read_4_bits : _GEN_38; // @[nasti.scala 218:{12,12}]
  wire [31:0] _GEN_40 = 3'h5 == rIndex ? io_mcr_read_5_bits : _GEN_39; // @[nasti.scala 218:{12,12}]
  assign io_nasti_aw_ready = ~awFired; // @[Lib.scala 376:24]
  assign io_nasti_w_ready = ~wFired; // @[Lib.scala 377:24]
  assign io_nasti_b_valid = _io_mcr_write_valid_T & wCommited; // @[Lib.scala 373:41]
  assign io_nasti_b_bits_id = bId; // @[nasti.scala 228:17 229:10]
  assign io_nasti_ar_ready = ~arFired; // @[Lib.scala 375:24]
  assign io_nasti_r_valid = arFired; // @[Lib.scala 370:31]
  assign io_nasti_r_bits_data = 3'h6 == rIndex ? io_mcr_read_6_bits : _GEN_40; // @[nasti.scala 218:{12,12}]
  assign io_nasti_r_bits_id = rId; // @[nasti.scala 216:17 217:10]
  assign io_mcr_write_0_valid = 3'h0 == wIndex & (awFired & wFired & ~wCommited); // @[Lib.scala 364:{30,30} 363:39]
  assign io_mcr_write_0_bits = wData; // @[Lib.scala 363:58]
  assign io_mcr_write_1_valid = 3'h1 == wIndex & (awFired & wFired & ~wCommited); // @[Lib.scala 364:{30,30} 363:39]
  assign io_mcr_write_1_bits = wData; // @[Lib.scala 363:58]
  assign io_mcr_write_2_valid = 3'h2 == wIndex & (awFired & wFired & ~wCommited); // @[Lib.scala 364:{30,30} 363:39]
  assign io_mcr_write_3_valid = 3'h3 == wIndex & (awFired & wFired & ~wCommited); // @[Lib.scala 364:{30,30} 363:39]
  assign io_mcr_write_3_bits = wData; // @[Lib.scala 363:58]
  assign io_mcr_write_4_valid = 3'h4 == wIndex & (awFired & wFired & ~wCommited); // @[Lib.scala 364:{30,30} 363:39]
  assign io_mcr_write_4_bits = wData; // @[Lib.scala 363:58]
  assign io_mcr_write_5_valid = 3'h5 == wIndex & (awFired & wFired & ~wCommited); // @[Lib.scala 364:{30,30} 363:39]
  assign io_mcr_write_5_bits = wData; // @[Lib.scala 363:58]
  assign io_mcr_write_6_valid = 3'h6 == wIndex & (awFired & wFired & ~wCommited); // @[Lib.scala 364:{30,30} 363:39]
  always @(posedge clock) begin
    if (reset) begin // @[Lib.scala 317:26]
      arFired <= 1'h0; // @[Lib.scala 317:26]
    end else if (_T_11) begin // @[Lib.scala 349:25]
      arFired <= 1'h0; // @[Lib.scala 350:13]
    end else begin
      arFired <= _GEN_6;
    end
    if (reset) begin // @[Lib.scala 318:26]
      awFired <= 1'h0; // @[Lib.scala 318:26]
    end else if (_T_12) begin // @[Lib.scala 353:25]
      awFired <= 1'h0; // @[Lib.scala 354:15]
    end else begin
      awFired <= _GEN_0;
    end
    if (reset) begin // @[Lib.scala 319:26]
      wFired <= 1'h0; // @[Lib.scala 319:26]
    end else if (_T_12) begin // @[Lib.scala 353:25]
      wFired <= 1'h0; // @[Lib.scala 355:15]
    end else begin
      wFired <= _GEN_3;
    end
    if (reset) begin // @[Lib.scala 320:26]
      wCommited <= 1'h0; // @[Lib.scala 320:26]
    end else begin
      wCommited <= _GEN_27;
    end
    if (_T) begin // @[Lib.scala 329:26]
      bId <= io_nasti_aw_bits_id; // @[Lib.scala 332:13]
    end
    if (_T_6) begin // @[Lib.scala 342:26]
      rId <= io_nasti_ar_bits_id; // @[Lib.scala 345:13]
    end
    if (_T_5) begin // @[Lib.scala 336:25]
      wData <= io_nasti_w_bits_data; // @[Lib.scala 338:12]
    end
    wIndex <= _GEN_1[2:0];
    if (_T_6) begin // @[Lib.scala 342:26]
      rIndex <= io_nasti_ar_bits_addr[4:2]; // @[Lib.scala 344:13]
    end
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T & ~reset & ~(io_nasti_aw_bits_len == 8'h0)) begin
          $fwrite(32'h80000002,"Assertion failed\n    at Lib.scala:333 assert(io.nasti.aw.bits.len === 0.U)\n"); // @[Lib.scala 333:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_6 & _T_3 & ~(io_nasti_ar_bits_len == 8'h0)) begin
          $fwrite(32'h80000002,
            "Assertion failed: MCRFile only support single beat reads\n    at Lib.scala:346 assert(io.nasti.ar.bits.len === 0.U, \"MCRFile only support single beat reads\")\n"
            ); // @[Lib.scala 346:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  arFired = _RAND_0[0:0];
  _RAND_1 = {1{`RANDOM}};
  awFired = _RAND_1[0:0];
  _RAND_2 = {1{`RANDOM}};
  wFired = _RAND_2[0:0];
  _RAND_3 = {1{`RANDOM}};
  wCommited = _RAND_3[0:0];
  _RAND_4 = {1{`RANDOM}};
  bId = _RAND_4[0:0];
  _RAND_5 = {1{`RANDOM}};
  rId = _RAND_5[0:0];
  _RAND_6 = {1{`RANDOM}};
  wData = _RAND_6[31:0];
  _RAND_7 = {1{`RANDOM}};
  wIndex = _RAND_7[2:0];
  _RAND_8 = {1{`RANDOM}};
  rIndex = _RAND_8[2:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
  always @(posedge clock) begin
    //
    if (_T & ~reset) begin
      assert(io_nasti_aw_bits_len == 8'h0); // @[Lib.scala 333:11]
    end
    //
    if (_T_6 & _T_3) begin
      assert(io_nasti_ar_bits_len == 8'h0); // @[Lib.scala 346:11]
    end
  end
endmodule
module FPGAManagedStreamEngine(
  input          clock,
  input          reset,
  input          auto_axi4xbar_out_aw_ready,
  output         auto_axi4xbar_out_aw_valid,
  output         auto_axi4xbar_out_aw_bits_id,
  output [21:0]  auto_axi4xbar_out_aw_bits_addr,
  output [7:0]   auto_axi4xbar_out_aw_bits_len,
  output [2:0]   auto_axi4xbar_out_aw_bits_size,
  output [1:0]   auto_axi4xbar_out_aw_bits_burst,
  output         auto_axi4xbar_out_aw_bits_lock,
  output [3:0]   auto_axi4xbar_out_aw_bits_cache,
  output [2:0]   auto_axi4xbar_out_aw_bits_prot,
  output [3:0]   auto_axi4xbar_out_aw_bits_qos,
  input          auto_axi4xbar_out_w_ready,
  output         auto_axi4xbar_out_w_valid,
  output [511:0] auto_axi4xbar_out_w_bits_data,
  output [63:0]  auto_axi4xbar_out_w_bits_strb,
  output         auto_axi4xbar_out_w_bits_last,
  output         auto_axi4xbar_out_b_ready,
  input          auto_axi4xbar_out_b_valid,
  input          auto_axi4xbar_out_b_bits_id,
  input          auto_axi4xbar_out_ar_ready,
  output         auto_axi4xbar_out_ar_valid,
  output         auto_axi4xbar_out_ar_bits_id,
  output [21:0]  auto_axi4xbar_out_ar_bits_addr,
  output [7:0]   auto_axi4xbar_out_ar_bits_len,
  output [2:0]   auto_axi4xbar_out_ar_bits_size,
  output [1:0]   auto_axi4xbar_out_ar_bits_burst,
  output         auto_axi4xbar_out_ar_bits_lock,
  output [3:0]   auto_axi4xbar_out_ar_bits_cache,
  output [2:0]   auto_axi4xbar_out_ar_bits_prot,
  output [3:0]   auto_axi4xbar_out_ar_bits_qos,
  output         auto_axi4xbar_out_r_ready,
  input          auto_axi4xbar_out_r_valid,
  input          auto_axi4xbar_out_r_bits_id,
  output         streamsToHostCPU_0_ready,
  input          streamsToHostCPU_0_valid,
  input  [511:0] streamsToHostCPU_0_bits,
  output         io_ctrl_aw_ready,
  input          io_ctrl_aw_valid,
  input  [11:0]  io_ctrl_aw_bits_addr,
  input  [7:0]   io_ctrl_aw_bits_len,
  input          io_ctrl_aw_bits_id,
  output         io_ctrl_w_ready,
  input          io_ctrl_w_valid,
  input  [31:0]  io_ctrl_w_bits_data,
  input          io_ctrl_b_ready,
  output         io_ctrl_b_valid,
  output         io_ctrl_b_bits_id,
  output         io_ctrl_ar_ready,
  input          io_ctrl_ar_valid,
  input  [11:0]  io_ctrl_ar_bits_addr,
  input  [7:0]   io_ctrl_ar_bits_len,
  input          io_ctrl_ar_bits_id,
  input          io_ctrl_r_ready,
  output         io_ctrl_r_valid,
  output [31:0]  io_ctrl_r_bits_data,
  output         io_ctrl_r_bits_id
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
  reg [31:0] _RAND_5;
  reg [31:0] _RAND_6;
  reg [31:0] _RAND_7;
  reg [31:0] _RAND_8;
  reg [31:0] _RAND_9;
  reg [31:0] _RAND_10;
  reg [31:0] _RAND_11;
  reg [31:0] _RAND_12;
  reg [31:0] _RAND_13;
`endif // RANDOMIZE_REG_INIT
  wire  axi4xbar_clock; // @[Xbar.scala 231:30]
  wire  axi4xbar_reset; // @[Xbar.scala 231:30]
  wire  axi4xbar_auto_in_aw_ready; // @[Xbar.scala 231:30]
  wire  axi4xbar_auto_in_aw_valid; // @[Xbar.scala 231:30]
  wire  axi4xbar_auto_in_aw_bits_id; // @[Xbar.scala 231:30]
  wire [21:0] axi4xbar_auto_in_aw_bits_addr; // @[Xbar.scala 231:30]
  wire [7:0] axi4xbar_auto_in_aw_bits_len; // @[Xbar.scala 231:30]
  wire [2:0] axi4xbar_auto_in_aw_bits_size; // @[Xbar.scala 231:30]
  wire [1:0] axi4xbar_auto_in_aw_bits_burst; // @[Xbar.scala 231:30]
  wire  axi4xbar_auto_in_aw_bits_lock; // @[Xbar.scala 231:30]
  wire [3:0] axi4xbar_auto_in_aw_bits_cache; // @[Xbar.scala 231:30]
  wire [2:0] axi4xbar_auto_in_aw_bits_prot; // @[Xbar.scala 231:30]
  wire [3:0] axi4xbar_auto_in_aw_bits_qos; // @[Xbar.scala 231:30]
  wire  axi4xbar_auto_in_w_ready; // @[Xbar.scala 231:30]
  wire  axi4xbar_auto_in_w_valid; // @[Xbar.scala 231:30]
  wire [511:0] axi4xbar_auto_in_w_bits_data; // @[Xbar.scala 231:30]
  wire [63:0] axi4xbar_auto_in_w_bits_strb; // @[Xbar.scala 231:30]
  wire  axi4xbar_auto_in_w_bits_last; // @[Xbar.scala 231:30]
  wire  axi4xbar_auto_in_b_ready; // @[Xbar.scala 231:30]
  wire  axi4xbar_auto_in_b_valid; // @[Xbar.scala 231:30]
  wire  axi4xbar_auto_in_ar_ready; // @[Xbar.scala 231:30]
  wire  axi4xbar_auto_in_ar_valid; // @[Xbar.scala 231:30]
  wire  axi4xbar_auto_in_ar_bits_id; // @[Xbar.scala 231:30]
  wire [21:0] axi4xbar_auto_in_ar_bits_addr; // @[Xbar.scala 231:30]
  wire [7:0] axi4xbar_auto_in_ar_bits_len; // @[Xbar.scala 231:30]
  wire [2:0] axi4xbar_auto_in_ar_bits_size; // @[Xbar.scala 231:30]
  wire [1:0] axi4xbar_auto_in_ar_bits_burst; // @[Xbar.scala 231:30]
  wire  axi4xbar_auto_in_ar_bits_lock; // @[Xbar.scala 231:30]
  wire [3:0] axi4xbar_auto_in_ar_bits_cache; // @[Xbar.scala 231:30]
  wire [2:0] axi4xbar_auto_in_ar_bits_prot; // @[Xbar.scala 231:30]
  wire [3:0] axi4xbar_auto_in_ar_bits_qos; // @[Xbar.scala 231:30]
  wire  axi4xbar_auto_in_r_ready; // @[Xbar.scala 231:30]
  wire  axi4xbar_auto_in_r_valid; // @[Xbar.scala 231:30]
  wire  axi4xbar_auto_out_aw_ready; // @[Xbar.scala 231:30]
  wire  axi4xbar_auto_out_aw_valid; // @[Xbar.scala 231:30]
  wire  axi4xbar_auto_out_aw_bits_id; // @[Xbar.scala 231:30]
  wire [21:0] axi4xbar_auto_out_aw_bits_addr; // @[Xbar.scala 231:30]
  wire [7:0] axi4xbar_auto_out_aw_bits_len; // @[Xbar.scala 231:30]
  wire [2:0] axi4xbar_auto_out_aw_bits_size; // @[Xbar.scala 231:30]
  wire [1:0] axi4xbar_auto_out_aw_bits_burst; // @[Xbar.scala 231:30]
  wire  axi4xbar_auto_out_aw_bits_lock; // @[Xbar.scala 231:30]
  wire [3:0] axi4xbar_auto_out_aw_bits_cache; // @[Xbar.scala 231:30]
  wire [2:0] axi4xbar_auto_out_aw_bits_prot; // @[Xbar.scala 231:30]
  wire [3:0] axi4xbar_auto_out_aw_bits_qos; // @[Xbar.scala 231:30]
  wire  axi4xbar_auto_out_w_ready; // @[Xbar.scala 231:30]
  wire  axi4xbar_auto_out_w_valid; // @[Xbar.scala 231:30]
  wire [511:0] axi4xbar_auto_out_w_bits_data; // @[Xbar.scala 231:30]
  wire [63:0] axi4xbar_auto_out_w_bits_strb; // @[Xbar.scala 231:30]
  wire  axi4xbar_auto_out_w_bits_last; // @[Xbar.scala 231:30]
  wire  axi4xbar_auto_out_b_ready; // @[Xbar.scala 231:30]
  wire  axi4xbar_auto_out_b_valid; // @[Xbar.scala 231:30]
  wire  axi4xbar_auto_out_b_bits_id; // @[Xbar.scala 231:30]
  wire  axi4xbar_auto_out_ar_ready; // @[Xbar.scala 231:30]
  wire  axi4xbar_auto_out_ar_valid; // @[Xbar.scala 231:30]
  wire  axi4xbar_auto_out_ar_bits_id; // @[Xbar.scala 231:30]
  wire [21:0] axi4xbar_auto_out_ar_bits_addr; // @[Xbar.scala 231:30]
  wire [7:0] axi4xbar_auto_out_ar_bits_len; // @[Xbar.scala 231:30]
  wire [2:0] axi4xbar_auto_out_ar_bits_size; // @[Xbar.scala 231:30]
  wire [1:0] axi4xbar_auto_out_ar_bits_burst; // @[Xbar.scala 231:30]
  wire  axi4xbar_auto_out_ar_bits_lock; // @[Xbar.scala 231:30]
  wire [3:0] axi4xbar_auto_out_ar_bits_cache; // @[Xbar.scala 231:30]
  wire [2:0] axi4xbar_auto_out_ar_bits_prot; // @[Xbar.scala 231:30]
  wire [3:0] axi4xbar_auto_out_ar_bits_qos; // @[Xbar.scala 231:30]
  wire  axi4xbar_auto_out_r_ready; // @[Xbar.scala 231:30]
  wire  axi4xbar_auto_out_r_valid; // @[Xbar.scala 231:30]
  wire  axi4xbar_auto_out_r_bits_id; // @[Xbar.scala 231:30]
  wire  axi4buf_clock; // @[Buffer.scala 63:29]
  wire  axi4buf_reset; // @[Buffer.scala 63:29]
  wire  axi4buf_auto_in_aw_ready; // @[Buffer.scala 63:29]
  wire  axi4buf_auto_in_aw_valid; // @[Buffer.scala 63:29]
  wire  axi4buf_auto_in_aw_bits_id; // @[Buffer.scala 63:29]
  wire [21:0] axi4buf_auto_in_aw_bits_addr; // @[Buffer.scala 63:29]
  wire [7:0] axi4buf_auto_in_aw_bits_len; // @[Buffer.scala 63:29]
  wire [2:0] axi4buf_auto_in_aw_bits_size; // @[Buffer.scala 63:29]
  wire [1:0] axi4buf_auto_in_aw_bits_burst; // @[Buffer.scala 63:29]
  wire  axi4buf_auto_in_aw_bits_lock; // @[Buffer.scala 63:29]
  wire [3:0] axi4buf_auto_in_aw_bits_cache; // @[Buffer.scala 63:29]
  wire [2:0] axi4buf_auto_in_aw_bits_prot; // @[Buffer.scala 63:29]
  wire [3:0] axi4buf_auto_in_aw_bits_qos; // @[Buffer.scala 63:29]
  wire  axi4buf_auto_in_w_ready; // @[Buffer.scala 63:29]
  wire  axi4buf_auto_in_w_valid; // @[Buffer.scala 63:29]
  wire [511:0] axi4buf_auto_in_w_bits_data; // @[Buffer.scala 63:29]
  wire [63:0] axi4buf_auto_in_w_bits_strb; // @[Buffer.scala 63:29]
  wire  axi4buf_auto_in_w_bits_last; // @[Buffer.scala 63:29]
  wire  axi4buf_auto_in_b_ready; // @[Buffer.scala 63:29]
  wire  axi4buf_auto_in_b_valid; // @[Buffer.scala 63:29]
  wire  axi4buf_auto_in_b_bits_id; // @[Buffer.scala 63:29]
  wire  axi4buf_auto_in_ar_ready; // @[Buffer.scala 63:29]
  wire  axi4buf_auto_in_ar_valid; // @[Buffer.scala 63:29]
  wire  axi4buf_auto_in_ar_bits_id; // @[Buffer.scala 63:29]
  wire [21:0] axi4buf_auto_in_ar_bits_addr; // @[Buffer.scala 63:29]
  wire [7:0] axi4buf_auto_in_ar_bits_len; // @[Buffer.scala 63:29]
  wire [2:0] axi4buf_auto_in_ar_bits_size; // @[Buffer.scala 63:29]
  wire [1:0] axi4buf_auto_in_ar_bits_burst; // @[Buffer.scala 63:29]
  wire  axi4buf_auto_in_ar_bits_lock; // @[Buffer.scala 63:29]
  wire [3:0] axi4buf_auto_in_ar_bits_cache; // @[Buffer.scala 63:29]
  wire [2:0] axi4buf_auto_in_ar_bits_prot; // @[Buffer.scala 63:29]
  wire [3:0] axi4buf_auto_in_ar_bits_qos; // @[Buffer.scala 63:29]
  wire  axi4buf_auto_in_r_ready; // @[Buffer.scala 63:29]
  wire  axi4buf_auto_in_r_valid; // @[Buffer.scala 63:29]
  wire  axi4buf_auto_in_r_bits_id; // @[Buffer.scala 63:29]
  wire  axi4buf_auto_out_aw_ready; // @[Buffer.scala 63:29]
  wire  axi4buf_auto_out_aw_valid; // @[Buffer.scala 63:29]
  wire  axi4buf_auto_out_aw_bits_id; // @[Buffer.scala 63:29]
  wire [21:0] axi4buf_auto_out_aw_bits_addr; // @[Buffer.scala 63:29]
  wire [7:0] axi4buf_auto_out_aw_bits_len; // @[Buffer.scala 63:29]
  wire [2:0] axi4buf_auto_out_aw_bits_size; // @[Buffer.scala 63:29]
  wire [1:0] axi4buf_auto_out_aw_bits_burst; // @[Buffer.scala 63:29]
  wire  axi4buf_auto_out_aw_bits_lock; // @[Buffer.scala 63:29]
  wire [3:0] axi4buf_auto_out_aw_bits_cache; // @[Buffer.scala 63:29]
  wire [2:0] axi4buf_auto_out_aw_bits_prot; // @[Buffer.scala 63:29]
  wire [3:0] axi4buf_auto_out_aw_bits_qos; // @[Buffer.scala 63:29]
  wire  axi4buf_auto_out_w_ready; // @[Buffer.scala 63:29]
  wire  axi4buf_auto_out_w_valid; // @[Buffer.scala 63:29]
  wire [511:0] axi4buf_auto_out_w_bits_data; // @[Buffer.scala 63:29]
  wire [63:0] axi4buf_auto_out_w_bits_strb; // @[Buffer.scala 63:29]
  wire  axi4buf_auto_out_w_bits_last; // @[Buffer.scala 63:29]
  wire  axi4buf_auto_out_b_ready; // @[Buffer.scala 63:29]
  wire  axi4buf_auto_out_b_valid; // @[Buffer.scala 63:29]
  wire  axi4buf_auto_out_b_bits_id; // @[Buffer.scala 63:29]
  wire  axi4buf_auto_out_ar_ready; // @[Buffer.scala 63:29]
  wire  axi4buf_auto_out_ar_valid; // @[Buffer.scala 63:29]
  wire  axi4buf_auto_out_ar_bits_id; // @[Buffer.scala 63:29]
  wire [21:0] axi4buf_auto_out_ar_bits_addr; // @[Buffer.scala 63:29]
  wire [7:0] axi4buf_auto_out_ar_bits_len; // @[Buffer.scala 63:29]
  wire [2:0] axi4buf_auto_out_ar_bits_size; // @[Buffer.scala 63:29]
  wire [1:0] axi4buf_auto_out_ar_bits_burst; // @[Buffer.scala 63:29]
  wire  axi4buf_auto_out_ar_bits_lock; // @[Buffer.scala 63:29]
  wire [3:0] axi4buf_auto_out_ar_bits_cache; // @[Buffer.scala 63:29]
  wire [2:0] axi4buf_auto_out_ar_bits_prot; // @[Buffer.scala 63:29]
  wire [3:0] axi4buf_auto_out_ar_bits_qos; // @[Buffer.scala 63:29]
  wire  axi4buf_auto_out_r_ready; // @[Buffer.scala 63:29]
  wire  axi4buf_auto_out_r_valid; // @[Buffer.scala 63:29]
  wire  axi4buf_auto_out_r_bits_id; // @[Buffer.scala 63:29]
  wire  PRINTBRIDGEMODULE_0_to_cpu_stream_outgoingQueue_clock; // @[FPGAManagedStreamEngine.scala 85:33]
  wire  PRINTBRIDGEMODULE_0_to_cpu_stream_outgoingQueue_reset; // @[FPGAManagedStreamEngine.scala 85:33]
  wire  PRINTBRIDGEMODULE_0_to_cpu_stream_outgoingQueue_io_enq_ready; // @[FPGAManagedStreamEngine.scala 85:33]
  wire  PRINTBRIDGEMODULE_0_to_cpu_stream_outgoingQueue_io_enq_valid; // @[FPGAManagedStreamEngine.scala 85:33]
  wire [511:0] PRINTBRIDGEMODULE_0_to_cpu_stream_outgoingQueue_io_enq_bits; // @[FPGAManagedStreamEngine.scala 85:33]
  wire  PRINTBRIDGEMODULE_0_to_cpu_stream_outgoingQueue_io_deq_ready; // @[FPGAManagedStreamEngine.scala 85:33]
  wire  PRINTBRIDGEMODULE_0_to_cpu_stream_outgoingQueue_io_deq_valid; // @[FPGAManagedStreamEngine.scala 85:33]
  wire [511:0] PRINTBRIDGEMODULE_0_to_cpu_stream_outgoingQueue_io_deq_bits; // @[FPGAManagedStreamEngine.scala 85:33]
  wire [7:0] PRINTBRIDGEMODULE_0_to_cpu_stream_outgoingQueue_io_count; // @[FPGAManagedStreamEngine.scala 85:33]
  wire  PRINTBRIDGEMODULE_0_to_cpu_stream_inflightBeatCounts_clock; // @[FPGAManagedStreamEngine.scala 96:38]
  wire  PRINTBRIDGEMODULE_0_to_cpu_stream_inflightBeatCounts_reset; // @[FPGAManagedStreamEngine.scala 96:38]
  wire  PRINTBRIDGEMODULE_0_to_cpu_stream_inflightBeatCounts_io_enq_ready; // @[FPGAManagedStreamEngine.scala 96:38]
  wire  PRINTBRIDGEMODULE_0_to_cpu_stream_inflightBeatCounts_io_enq_valid; // @[FPGAManagedStreamEngine.scala 96:38]
  wire [6:0] PRINTBRIDGEMODULE_0_to_cpu_stream_inflightBeatCounts_io_enq_bits_numBeats; // @[FPGAManagedStreamEngine.scala 96:38]
  wire  PRINTBRIDGEMODULE_0_to_cpu_stream_inflightBeatCounts_io_enq_bits_isFlush; // @[FPGAManagedStreamEngine.scala 96:38]
  wire  PRINTBRIDGEMODULE_0_to_cpu_stream_inflightBeatCounts_io_deq_ready; // @[FPGAManagedStreamEngine.scala 96:38]
  wire  PRINTBRIDGEMODULE_0_to_cpu_stream_inflightBeatCounts_io_deq_valid; // @[FPGAManagedStreamEngine.scala 96:38]
  wire [6:0] PRINTBRIDGEMODULE_0_to_cpu_stream_inflightBeatCounts_io_deq_bits_numBeats; // @[FPGAManagedStreamEngine.scala 96:38]
  wire  PRINTBRIDGEMODULE_0_to_cpu_stream_inflightBeatCounts_io_deq_bits_isFlush; // @[FPGAManagedStreamEngine.scala 96:38]
  wire  crFile_clock; // @[Widget.scala 166:24]
  wire  crFile_reset; // @[Widget.scala 166:24]
  wire  crFile_io_nasti_aw_ready; // @[Widget.scala 166:24]
  wire  crFile_io_nasti_aw_valid; // @[Widget.scala 166:24]
  wire [11:0] crFile_io_nasti_aw_bits_addr; // @[Widget.scala 166:24]
  wire [7:0] crFile_io_nasti_aw_bits_len; // @[Widget.scala 166:24]
  wire  crFile_io_nasti_aw_bits_id; // @[Widget.scala 166:24]
  wire  crFile_io_nasti_w_ready; // @[Widget.scala 166:24]
  wire  crFile_io_nasti_w_valid; // @[Widget.scala 166:24]
  wire [31:0] crFile_io_nasti_w_bits_data; // @[Widget.scala 166:24]
  wire  crFile_io_nasti_b_ready; // @[Widget.scala 166:24]
  wire  crFile_io_nasti_b_valid; // @[Widget.scala 166:24]
  wire  crFile_io_nasti_b_bits_id; // @[Widget.scala 166:24]
  wire  crFile_io_nasti_ar_ready; // @[Widget.scala 166:24]
  wire  crFile_io_nasti_ar_valid; // @[Widget.scala 166:24]
  wire [11:0] crFile_io_nasti_ar_bits_addr; // @[Widget.scala 166:24]
  wire [7:0] crFile_io_nasti_ar_bits_len; // @[Widget.scala 166:24]
  wire  crFile_io_nasti_ar_bits_id; // @[Widget.scala 166:24]
  wire  crFile_io_nasti_r_ready; // @[Widget.scala 166:24]
  wire  crFile_io_nasti_r_valid; // @[Widget.scala 166:24]
  wire [31:0] crFile_io_nasti_r_bits_data; // @[Widget.scala 166:24]
  wire  crFile_io_nasti_r_bits_id; // @[Widget.scala 166:24]
  wire [31:0] crFile_io_mcr_read_0_bits; // @[Widget.scala 166:24]
  wire [31:0] crFile_io_mcr_read_1_bits; // @[Widget.scala 166:24]
  wire [31:0] crFile_io_mcr_read_2_bits; // @[Widget.scala 166:24]
  wire [31:0] crFile_io_mcr_read_3_bits; // @[Widget.scala 166:24]
  wire [31:0] crFile_io_mcr_read_4_bits; // @[Widget.scala 166:24]
  wire [31:0] crFile_io_mcr_read_5_bits; // @[Widget.scala 166:24]
  wire [31:0] crFile_io_mcr_read_6_bits; // @[Widget.scala 166:24]
  wire  crFile_io_mcr_write_0_valid; // @[Widget.scala 166:24]
  wire [31:0] crFile_io_mcr_write_0_bits; // @[Widget.scala 166:24]
  wire  crFile_io_mcr_write_1_valid; // @[Widget.scala 166:24]
  wire [31:0] crFile_io_mcr_write_1_bits; // @[Widget.scala 166:24]
  wire  crFile_io_mcr_write_2_valid; // @[Widget.scala 166:24]
  wire  crFile_io_mcr_write_3_valid; // @[Widget.scala 166:24]
  wire [31:0] crFile_io_mcr_write_3_bits; // @[Widget.scala 166:24]
  wire  crFile_io_mcr_write_4_valid; // @[Widget.scala 166:24]
  wire [31:0] crFile_io_mcr_write_4_bits; // @[Widget.scala 166:24]
  wire  crFile_io_mcr_write_5_valid; // @[Widget.scala 166:24]
  wire [31:0] crFile_io_mcr_write_5_bits; // @[Widget.scala 166:24]
  wire  crFile_io_mcr_write_6_valid; // @[Widget.scala 166:24]
  reg [31:0] PRINTBRIDGEMODULE_0_to_cpu_stream_toHostPhysAddrHigh; // @[FPGAManagedStreamEngine.scala 79:35]
  reg [31:0] PRINTBRIDGEMODULE_0_to_cpu_stream_toHostPhysAddrLow; // @[FPGAManagedStreamEngine.scala 80:35]
  reg [19:0] PRINTBRIDGEMODULE_0_to_cpu_stream_bytesConsumedByCPU; // @[FPGAManagedStreamEngine.scala 81:39]
  reg [19:0] PRINTBRIDGEMODULE_0_to_cpu_stream_writeCredits; // @[FPGAManagedStreamEngine.scala 88:39]
  reg [19:0] PRINTBRIDGEMODULE_0_to_cpu_stream_readCredits; // @[FPGAManagedStreamEngine.scala 89:39]
  reg [18:0] PRINTBRIDGEMODULE_0_to_cpu_stream_writePtr; // @[FPGAManagedStreamEngine.scala 90:39]
  reg  PRINTBRIDGEMODULE_0_to_cpu_stream_doneInit; // @[FPGAManagedStreamEngine.scala 91:39]
  reg [1:0] PRINTBRIDGEMODULE_0_to_cpu_stream_state; // @[FPGAManagedStreamEngine.scala 101:59]
  reg [5:0] PRINTBRIDGEMODULE_0_to_cpu_stream_beatsToSendMinus1; // @[FPGAManagedStreamEngine.scala 102:59]
  wire [6:0] _GEN_39 = {{1'd0}, PRINTBRIDGEMODULE_0_to_cpu_stream_writePtr[11:6]}; // @[FPGAManagedStreamEngine.scala 106:21]
  wire [6:0] PRINTBRIDGEMODULE_0_to_cpu_stream_beatsToPageBoundary = 7'h40 - _GEN_39; // @[FPGAManagedStreamEngine.scala 106:21]
  wire  _PRINTBRIDGEMODULE_0_to_cpu_stream_T_4 = ~reset; // @[FPGAManagedStreamEngine.scala 107:13]
  wire [19:0] PRINTBRIDGEMODULE_0_to_cpu_stream_writeBounds_1 = {{6'd0}, PRINTBRIDGEMODULE_0_to_cpu_stream_writeCredits[
    19:6]}; // @[FPGAManagedStreamEngine.scala 113:22]
  wire [19:0] _GEN_41 = {{12'd0}, PRINTBRIDGEMODULE_0_to_cpu_stream_outgoingQueue_io_count}; // @[FPGAManagedStreamEngine.scala 119:71]
  wire [19:0] _PRINTBRIDGEMODULE_0_to_cpu_stream_writeableBeats_T_1 = _GEN_41 <
    PRINTBRIDGEMODULE_0_to_cpu_stream_writeBounds_1 ? {{12'd0}, PRINTBRIDGEMODULE_0_to_cpu_stream_outgoingQueue_io_count
    } : PRINTBRIDGEMODULE_0_to_cpu_stream_writeBounds_1; // @[FPGAManagedStreamEngine.scala 119:68]
  wire [19:0] _GEN_42 = {{13'd0}, PRINTBRIDGEMODULE_0_to_cpu_stream_beatsToPageBoundary}; // @[FPGAManagedStreamEngine.scala 119:71]
  wire [19:0] PRINTBRIDGEMODULE_0_to_cpu_stream_writeableBeats = _PRINTBRIDGEMODULE_0_to_cpu_stream_writeableBeats_T_1
     < _GEN_42 ? _PRINTBRIDGEMODULE_0_to_cpu_stream_writeableBeats_T_1 : {{13'd0},
    PRINTBRIDGEMODULE_0_to_cpu_stream_beatsToPageBoundary}; // @[FPGAManagedStreamEngine.scala 119:68]
  wire [19:0] PRINTBRIDGEMODULE_0_to_cpu_stream_writeableBeatsMinus1 = PRINTBRIDGEMODULE_0_to_cpu_stream_writeableBeats
     - 20'h1; // @[FPGAManagedStreamEngine.scala 120:49]
  reg [19:0] PRINTBRIDGEMODULE_0_to_cpu_stream_REG; // @[FPGAManagedStreamEngine.scala 126:32]
  wire  _PRINTBRIDGEMODULE_0_to_cpu_stream_T_11 = ~PRINTBRIDGEMODULE_0_to_cpu_stream_doneInit | (~(
    PRINTBRIDGEMODULE_0_to_cpu_stream_REG != 20'h0) | PRINTBRIDGEMODULE_0_to_cpu_stream_bytesConsumedByCPU == 20'h0); // @[FPGAManagedStreamEngine.scala 126:19]
  wire [19:0] _PRINTBRIDGEMODULE_0_to_cpu_stream_writeCredits_T_1 = PRINTBRIDGEMODULE_0_to_cpu_stream_writeCredits +
    PRINTBRIDGEMODULE_0_to_cpu_stream_bytesConsumedByCPU; // @[FPGAManagedStreamEngine.scala 131:44]
  wire [19:0] _PRINTBRIDGEMODULE_0_to_cpu_stream_readCredits_T_1 = PRINTBRIDGEMODULE_0_to_cpu_stream_readCredits -
    PRINTBRIDGEMODULE_0_to_cpu_stream_bytesConsumedByCPU; // @[FPGAManagedStreamEngine.scala 132:43]
  wire [19:0] _GEN_0 = PRINTBRIDGEMODULE_0_to_cpu_stream_bytesConsumedByCPU != 20'h0 ? 20'h0 :
    PRINTBRIDGEMODULE_0_to_cpu_stream_bytesConsumedByCPU; // @[FPGAManagedStreamEngine.scala 129:40 130:28 81:39]
  wire [19:0] _GEN_1 = PRINTBRIDGEMODULE_0_to_cpu_stream_bytesConsumedByCPU != 20'h0 ?
    _PRINTBRIDGEMODULE_0_to_cpu_stream_writeCredits_T_1 : PRINTBRIDGEMODULE_0_to_cpu_stream_writeCredits; // @[FPGAManagedStreamEngine.scala 129:40 131:28 88:39]
  reg  PRINTBRIDGEMODULE_0_to_cpu_stream_doFlush; // @[FPGAManagedStreamEngine.scala 135:55]
  reg  PRINTBRIDGEMODULE_0_to_cpu_stream_inFlush; // @[FPGAManagedStreamEngine.scala 135:55]
  reg [12:0] PRINTBRIDGEMODULE_0_to_cpu_stream_flushBeatsToIssue; // @[FPGAManagedStreamEngine.scala 136:55]
  reg [12:0] PRINTBRIDGEMODULE_0_to_cpu_stream_flushBeatsToAck; // @[FPGAManagedStreamEngine.scala 136:55]
  wire  _PRINTBRIDGEMODULE_0_to_cpu_stream_T_22 = _PRINTBRIDGEMODULE_0_to_cpu_stream_writeCredits_T_1 <= 20'h80000; // @[FPGAManagedStreamEngine.scala 140:45]
  wire  _GEN_3 = PRINTBRIDGEMODULE_0_to_cpu_stream_doFlush & ~PRINTBRIDGEMODULE_0_to_cpu_stream_inFlush &
    PRINTBRIDGEMODULE_0_to_cpu_stream_outgoingQueue_io_count > 8'h0 | PRINTBRIDGEMODULE_0_to_cpu_stream_inFlush; // @[FPGAManagedStreamEngine.scala 147:71 148:31 135:55]
  wire [12:0] _GEN_4 = PRINTBRIDGEMODULE_0_to_cpu_stream_doFlush & ~PRINTBRIDGEMODULE_0_to_cpu_stream_inFlush &
    PRINTBRIDGEMODULE_0_to_cpu_stream_outgoingQueue_io_count > 8'h0 ? {{5'd0},
    PRINTBRIDGEMODULE_0_to_cpu_stream_outgoingQueue_io_count} : PRINTBRIDGEMODULE_0_to_cpu_stream_flushBeatsToIssue; // @[FPGAManagedStreamEngine.scala 147:71 149:31 136:55]
  wire [12:0] _GEN_5 = PRINTBRIDGEMODULE_0_to_cpu_stream_doFlush & ~PRINTBRIDGEMODULE_0_to_cpu_stream_inFlush &
    PRINTBRIDGEMODULE_0_to_cpu_stream_outgoingQueue_io_count > 8'h0 ? {{5'd0},
    PRINTBRIDGEMODULE_0_to_cpu_stream_outgoingQueue_io_count} : PRINTBRIDGEMODULE_0_to_cpu_stream_flushBeatsToAck; // @[FPGAManagedStreamEngine.scala 147:71 150:31 136:55]
  wire  _PRINTBRIDGEMODULE_0_to_cpu_stream_start_T_2 = PRINTBRIDGEMODULE_0_to_cpu_stream_flushBeatsToIssue != 13'h0 |
    PRINTBRIDGEMODULE_0_to_cpu_stream_writeableBeats == _GEN_42; // @[FPGAManagedStreamEngine.scala 154:44]
  wire  PRINTBRIDGEMODULE_0_to_cpu_stream_start = PRINTBRIDGEMODULE_0_to_cpu_stream_inflightBeatCounts_io_enq_ready &
    _PRINTBRIDGEMODULE_0_to_cpu_stream_start_T_2; // @[FPGAManagedStreamEngine.scala 153:47]
  wire  x1_aw_ready = axi4buf_auto_in_aw_ready; // @[Nodes.scala 1212:84 LazyModule.scala 355:16]
  wire  x1_aw_valid = PRINTBRIDGEMODULE_0_to_cpu_stream_state == 2'h1; // @[FPGAManagedStreamEngine.scala 175:36]
  wire  _PRINTBRIDGEMODULE_0_to_cpu_stream_T_32 = x1_aw_ready & x1_aw_valid; // @[Decoupled.scala 51:35]
  wire [26:0] _PRINTBRIDGEMODULE_0_to_cpu_stream_writePtr_T = PRINTBRIDGEMODULE_0_to_cpu_stream_writeableBeats * 7'h40; // @[FPGAManagedStreamEngine.scala 162:61]
  wire [26:0] _GEN_44 = {{8'd0}, PRINTBRIDGEMODULE_0_to_cpu_stream_writePtr}; // @[FPGAManagedStreamEngine.scala 162:43]
  wire [26:0] _PRINTBRIDGEMODULE_0_to_cpu_stream_writePtr_T_2 = _GEN_44 + _PRINTBRIDGEMODULE_0_to_cpu_stream_writePtr_T; // @[FPGAManagedStreamEngine.scala 162:43]
  wire [26:0] _GEN_45 = {{7'd0}, _PRINTBRIDGEMODULE_0_to_cpu_stream_writeCredits_T_1}; // @[FPGAManagedStreamEngine.scala 163:68]
  wire [26:0] _PRINTBRIDGEMODULE_0_to_cpu_stream_writeCredits_T_6 = _GEN_45 -
    _PRINTBRIDGEMODULE_0_to_cpu_stream_writePtr_T; // @[FPGAManagedStreamEngine.scala 163:68]
  wire [19:0] _GEN_46 = {{7'd0}, PRINTBRIDGEMODULE_0_to_cpu_stream_flushBeatsToIssue}; // @[FPGAManagedStreamEngine.scala 164:56]
  wire [19:0] _PRINTBRIDGEMODULE_0_to_cpu_stream_flushBeatsToIssue_T_2 = _GEN_46 -
    PRINTBRIDGEMODULE_0_to_cpu_stream_writeableBeats; // @[FPGAManagedStreamEngine.scala 164:97]
  wire [19:0] _PRINTBRIDGEMODULE_0_to_cpu_stream_flushBeatsToIssue_T_3 = _GEN_46 <
    PRINTBRIDGEMODULE_0_to_cpu_stream_writeableBeats ? 20'h0 : _PRINTBRIDGEMODULE_0_to_cpu_stream_flushBeatsToIssue_T_2; // @[FPGAManagedStreamEngine.scala 164:37]
  wire [19:0] _GEN_8 = _PRINTBRIDGEMODULE_0_to_cpu_stream_T_32 ? PRINTBRIDGEMODULE_0_to_cpu_stream_writeableBeatsMinus1
     : {{14'd0}, PRINTBRIDGEMODULE_0_to_cpu_stream_beatsToSendMinus1}; // @[FPGAManagedStreamEngine.scala 159:30 161:31 102:59]
  wire [26:0] _GEN_9 = _PRINTBRIDGEMODULE_0_to_cpu_stream_T_32 ? _PRINTBRIDGEMODULE_0_to_cpu_stream_writePtr_T_2 : {{8
    'd0}, PRINTBRIDGEMODULE_0_to_cpu_stream_writePtr}; // @[FPGAManagedStreamEngine.scala 159:30 162:31 90:39]
  wire [26:0] _GEN_10 = _PRINTBRIDGEMODULE_0_to_cpu_stream_T_32 ? _PRINTBRIDGEMODULE_0_to_cpu_stream_writeCredits_T_6 :
    {{7'd0}, _GEN_1}; // @[FPGAManagedStreamEngine.scala 159:30 163:31]
  wire [19:0] _GEN_11 = _PRINTBRIDGEMODULE_0_to_cpu_stream_T_32 ?
    _PRINTBRIDGEMODULE_0_to_cpu_stream_flushBeatsToIssue_T_3 : {{7'd0},
    PRINTBRIDGEMODULE_0_to_cpu_stream_flushBeatsToIssue}; // @[FPGAManagedStreamEngine.scala 159:30 164:31 136:55]
  wire  x1_w_ready = axi4buf_auto_in_w_ready; // @[Nodes.scala 1212:84 LazyModule.scala 355:16]
  wire  _PRINTBRIDGEMODULE_0_to_cpu_stream_x1_w_valid_T = PRINTBRIDGEMODULE_0_to_cpu_stream_state == 2'h2; // @[FPGAManagedStreamEngine.scala 196:44]
  wire  x1_w_valid = PRINTBRIDGEMODULE_0_to_cpu_stream_state == 2'h2 &
    PRINTBRIDGEMODULE_0_to_cpu_stream_outgoingQueue_io_deq_valid; // @[FPGAManagedStreamEngine.scala 196:58]
  wire  _PRINTBRIDGEMODULE_0_to_cpu_stream_T_34 = x1_w_ready & x1_w_valid; // @[Decoupled.scala 51:35]
  wire  x1_w_bits_last = PRINTBRIDGEMODULE_0_to_cpu_stream_beatsToSendMinus1 == 6'h0; // @[FPGAManagedStreamEngine.scala 199:55]
  wire [1:0] _PRINTBRIDGEMODULE_0_to_cpu_stream_state_T = x1_w_bits_last ? 2'h0 : 2'h2; // @[FPGAManagedStreamEngine.scala 169:37]
  wire [5:0] _PRINTBRIDGEMODULE_0_to_cpu_stream_beatsToSendMinus1_T_1 =
    PRINTBRIDGEMODULE_0_to_cpu_stream_beatsToSendMinus1 - 6'h1; // @[FPGAManagedStreamEngine.scala 170:52]
  wire [1:0] _GEN_12 = _PRINTBRIDGEMODULE_0_to_cpu_stream_T_34 ? _PRINTBRIDGEMODULE_0_to_cpu_stream_state_T :
    PRINTBRIDGEMODULE_0_to_cpu_stream_state; // @[FPGAManagedStreamEngine.scala 168:29 169:31 101:59]
  wire [5:0] _GEN_13 = _PRINTBRIDGEMODULE_0_to_cpu_stream_T_34 ?
    _PRINTBRIDGEMODULE_0_to_cpu_stream_beatsToSendMinus1_T_1 : PRINTBRIDGEMODULE_0_to_cpu_stream_beatsToSendMinus1; // @[FPGAManagedStreamEngine.scala 168:29 170:31 102:59]
  wire [5:0] _GEN_15 = 2'h2 == PRINTBRIDGEMODULE_0_to_cpu_stream_state ? _GEN_13 :
    PRINTBRIDGEMODULE_0_to_cpu_stream_beatsToSendMinus1; // @[FPGAManagedStreamEngine.scala 144:21 102:59]
  wire [19:0] _GEN_17 = 2'h1 == PRINTBRIDGEMODULE_0_to_cpu_stream_state ? _GEN_8 : {{14'd0}, _GEN_15}; // @[FPGAManagedStreamEngine.scala 144:21]
  wire [26:0] _GEN_18 = 2'h1 == PRINTBRIDGEMODULE_0_to_cpu_stream_state ? _GEN_9 : {{8'd0},
    PRINTBRIDGEMODULE_0_to_cpu_stream_writePtr}; // @[FPGAManagedStreamEngine.scala 144:21 90:39]
  wire [26:0] _GEN_19 = 2'h1 == PRINTBRIDGEMODULE_0_to_cpu_stream_state ? _GEN_10 : {{7'd0}, _GEN_1}; // @[FPGAManagedStreamEngine.scala 144:21]
  wire [19:0] _GEN_20 = 2'h1 == PRINTBRIDGEMODULE_0_to_cpu_stream_state ? _GEN_11 : {{7'd0},
    PRINTBRIDGEMODULE_0_to_cpu_stream_flushBeatsToIssue}; // @[FPGAManagedStreamEngine.scala 144:21 136:55]
  wire  _GEN_21 = 2'h0 == PRINTBRIDGEMODULE_0_to_cpu_stream_state ? 1'h0 : PRINTBRIDGEMODULE_0_to_cpu_stream_doFlush; // @[FPGAManagedStreamEngine.scala 144:21 146:19 135:55]
  wire  _GEN_22 = 2'h0 == PRINTBRIDGEMODULE_0_to_cpu_stream_state ? _GEN_3 : PRINTBRIDGEMODULE_0_to_cpu_stream_inFlush; // @[FPGAManagedStreamEngine.scala 144:21 135:55]
  wire [19:0] _GEN_23 = 2'h0 == PRINTBRIDGEMODULE_0_to_cpu_stream_state ? {{7'd0}, _GEN_4} : _GEN_20; // @[FPGAManagedStreamEngine.scala 144:21]
  wire [12:0] _GEN_24 = 2'h0 == PRINTBRIDGEMODULE_0_to_cpu_stream_state ? _GEN_5 :
    PRINTBRIDGEMODULE_0_to_cpu_stream_flushBeatsToAck; // @[FPGAManagedStreamEngine.scala 144:21 136:55]
  wire [19:0] _GEN_26 = 2'h0 == PRINTBRIDGEMODULE_0_to_cpu_stream_state ? {{14'd0},
    PRINTBRIDGEMODULE_0_to_cpu_stream_beatsToSendMinus1} : _GEN_17; // @[FPGAManagedStreamEngine.scala 144:21 102:59]
  wire [26:0] _GEN_27 = 2'h0 == PRINTBRIDGEMODULE_0_to_cpu_stream_state ? {{8'd0},
    PRINTBRIDGEMODULE_0_to_cpu_stream_writePtr} : _GEN_18; // @[FPGAManagedStreamEngine.scala 144:21 90:39]
  wire [26:0] _GEN_28 = 2'h0 == PRINTBRIDGEMODULE_0_to_cpu_stream_state ? {{7'd0}, _GEN_1} : _GEN_19; // @[FPGAManagedStreamEngine.scala 144:21]
  wire [63:0] _PRINTBRIDGEMODULE_0_to_cpu_stream_x1_aw_bits_addr_T = {
    PRINTBRIDGEMODULE_0_to_cpu_stream_toHostPhysAddrHigh,PRINTBRIDGEMODULE_0_to_cpu_stream_toHostPhysAddrLow}; // @[Cat.scala 33:92]
  wire [63:0] _GEN_48 = {{45'd0}, PRINTBRIDGEMODULE_0_to_cpu_stream_writePtr}; // @[FPGAManagedStreamEngine.scala 177:72]
  wire [63:0] _PRINTBRIDGEMODULE_0_to_cpu_stream_x1_aw_bits_addr_T_2 =
    _PRINTBRIDGEMODULE_0_to_cpu_stream_x1_aw_bits_addr_T + _GEN_48; // @[FPGAManagedStreamEngine.scala 177:72]
  wire  x1_b_valid = axi4buf_auto_in_b_valid; // @[Nodes.scala 1212:84 LazyModule.scala 355:16]
  wire [13:0] _PRINTBRIDGEMODULE_0_to_cpu_stream_readCredits_T_2 =
    PRINTBRIDGEMODULE_0_to_cpu_stream_inflightBeatCounts_io_deq_bits_numBeats * 7'h40; // @[FPGAManagedStreamEngine.scala 208:48]
  wire [19:0] _GEN_49 = {{6'd0}, _PRINTBRIDGEMODULE_0_to_cpu_stream_readCredits_T_2}; // @[FPGAManagedStreamEngine.scala 208:36]
  wire [19:0] _PRINTBRIDGEMODULE_0_to_cpu_stream_readCredits_T_4 = PRINTBRIDGEMODULE_0_to_cpu_stream_readCredits +
    _GEN_49; // @[FPGAManagedStreamEngine.scala 208:36]
  wire [19:0] _PRINTBRIDGEMODULE_0_to_cpu_stream_readCredits_T_6 = _PRINTBRIDGEMODULE_0_to_cpu_stream_readCredits_T_4 -
    PRINTBRIDGEMODULE_0_to_cpu_stream_bytesConsumedByCPU; // @[FPGAManagedStreamEngine.scala 208:63]
  wire [12:0] _GEN_50 = {{6'd0}, PRINTBRIDGEMODULE_0_to_cpu_stream_inflightBeatCounts_io_deq_bits_numBeats}; // @[FPGAManagedStreamEngine.scala 210:50]
  wire [12:0] _PRINTBRIDGEMODULE_0_to_cpu_stream_remainingBeatsToAck_T_2 =
    PRINTBRIDGEMODULE_0_to_cpu_stream_flushBeatsToAck - _GEN_50; // @[FPGAManagedStreamEngine.scala 210:85]
  wire [12:0] PRINTBRIDGEMODULE_0_to_cpu_stream_remainingBeatsToAck = _GEN_50 <
    PRINTBRIDGEMODULE_0_to_cpu_stream_flushBeatsToAck ? _PRINTBRIDGEMODULE_0_to_cpu_stream_remainingBeatsToAck_T_2 : 13'h0
    ; // @[FPGAManagedStreamEngine.scala 210:40]
  wire  _PRINTBRIDGEMODULE_0_to_cpu_stream_T_42 = ~(PRINTBRIDGEMODULE_0_to_cpu_stream_doFlush |
    PRINTBRIDGEMODULE_0_to_cpu_stream_inFlush); // @[FPGAManagedStreamEngine.scala 232:16]
  wire [31:0] _GEN_36 = crFile_io_mcr_write_3_valid ? crFile_io_mcr_write_3_bits : {{12'd0}, _GEN_0}; // @[Lib.scala 280:32 281:18]
  wire [31:0] _GEN_37 = crFile_io_mcr_write_4_valid ? crFile_io_mcr_write_4_bits : {{31'd0},
    PRINTBRIDGEMODULE_0_to_cpu_stream_doneInit}; // @[Lib.scala 280:32 281:18 FPGAManagedStreamEngine.scala 91:39]
  wire [31:0] _GEN_38 = crFile_io_mcr_write_5_valid ? crFile_io_mcr_write_5_bits : {{31'd0}, _GEN_21}; // @[Lib.scala 280:32 281:18]
  wire [31:0] _GEN_52 = reset ? 32'h0 : _GEN_36; // @[FPGAManagedStreamEngine.scala 81:{39,39}]
  wire [26:0] _GEN_53 = reset ? 27'h80000 : _GEN_28; // @[FPGAManagedStreamEngine.scala 88:{39,39}]
  wire [26:0] _GEN_54 = reset ? 27'h0 : _GEN_27; // @[FPGAManagedStreamEngine.scala 90:{39,39}]
  wire [31:0] _GEN_55 = reset ? 32'h0 : _GEN_37; // @[FPGAManagedStreamEngine.scala 91:{39,39}]
  wire [19:0] _GEN_56 = reset ? 20'h0 : _GEN_26; // @[FPGAManagedStreamEngine.scala 102:{59,59}]
  wire [31:0] _GEN_57 = reset ? 32'h0 : _GEN_38; // @[FPGAManagedStreamEngine.scala 135:{55,55}]
  wire [19:0] _GEN_58 = reset ? 20'h0 : _GEN_23; // @[FPGAManagedStreamEngine.scala 136:{55,55}]
  AXI4Xbar axi4xbar ( // @[Xbar.scala 231:30]
    .clock(axi4xbar_clock),
    .reset(axi4xbar_reset),
    .auto_in_aw_ready(axi4xbar_auto_in_aw_ready),
    .auto_in_aw_valid(axi4xbar_auto_in_aw_valid),
    .auto_in_aw_bits_id(axi4xbar_auto_in_aw_bits_id),
    .auto_in_aw_bits_addr(axi4xbar_auto_in_aw_bits_addr),
    .auto_in_aw_bits_len(axi4xbar_auto_in_aw_bits_len),
    .auto_in_aw_bits_size(axi4xbar_auto_in_aw_bits_size),
    .auto_in_aw_bits_burst(axi4xbar_auto_in_aw_bits_burst),
    .auto_in_aw_bits_lock(axi4xbar_auto_in_aw_bits_lock),
    .auto_in_aw_bits_cache(axi4xbar_auto_in_aw_bits_cache),
    .auto_in_aw_bits_prot(axi4xbar_auto_in_aw_bits_prot),
    .auto_in_aw_bits_qos(axi4xbar_auto_in_aw_bits_qos),
    .auto_in_w_ready(axi4xbar_auto_in_w_ready),
    .auto_in_w_valid(axi4xbar_auto_in_w_valid),
    .auto_in_w_bits_data(axi4xbar_auto_in_w_bits_data),
    .auto_in_w_bits_strb(axi4xbar_auto_in_w_bits_strb),
    .auto_in_w_bits_last(axi4xbar_auto_in_w_bits_last),
    .auto_in_b_ready(axi4xbar_auto_in_b_ready),
    .auto_in_b_valid(axi4xbar_auto_in_b_valid),
    .auto_in_ar_ready(axi4xbar_auto_in_ar_ready),
    .auto_in_ar_valid(axi4xbar_auto_in_ar_valid),
    .auto_in_ar_bits_id(axi4xbar_auto_in_ar_bits_id),
    .auto_in_ar_bits_addr(axi4xbar_auto_in_ar_bits_addr),
    .auto_in_ar_bits_len(axi4xbar_auto_in_ar_bits_len),
    .auto_in_ar_bits_size(axi4xbar_auto_in_ar_bits_size),
    .auto_in_ar_bits_burst(axi4xbar_auto_in_ar_bits_burst),
    .auto_in_ar_bits_lock(axi4xbar_auto_in_ar_bits_lock),
    .auto_in_ar_bits_cache(axi4xbar_auto_in_ar_bits_cache),
    .auto_in_ar_bits_prot(axi4xbar_auto_in_ar_bits_prot),
    .auto_in_ar_bits_qos(axi4xbar_auto_in_ar_bits_qos),
    .auto_in_r_ready(axi4xbar_auto_in_r_ready),
    .auto_in_r_valid(axi4xbar_auto_in_r_valid),
    .auto_out_aw_ready(axi4xbar_auto_out_aw_ready),
    .auto_out_aw_valid(axi4xbar_auto_out_aw_valid),
    .auto_out_aw_bits_id(axi4xbar_auto_out_aw_bits_id),
    .auto_out_aw_bits_addr(axi4xbar_auto_out_aw_bits_addr),
    .auto_out_aw_bits_len(axi4xbar_auto_out_aw_bits_len),
    .auto_out_aw_bits_size(axi4xbar_auto_out_aw_bits_size),
    .auto_out_aw_bits_burst(axi4xbar_auto_out_aw_bits_burst),
    .auto_out_aw_bits_lock(axi4xbar_auto_out_aw_bits_lock),
    .auto_out_aw_bits_cache(axi4xbar_auto_out_aw_bits_cache),
    .auto_out_aw_bits_prot(axi4xbar_auto_out_aw_bits_prot),
    .auto_out_aw_bits_qos(axi4xbar_auto_out_aw_bits_qos),
    .auto_out_w_ready(axi4xbar_auto_out_w_ready),
    .auto_out_w_valid(axi4xbar_auto_out_w_valid),
    .auto_out_w_bits_data(axi4xbar_auto_out_w_bits_data),
    .auto_out_w_bits_strb(axi4xbar_auto_out_w_bits_strb),
    .auto_out_w_bits_last(axi4xbar_auto_out_w_bits_last),
    .auto_out_b_ready(axi4xbar_auto_out_b_ready),
    .auto_out_b_valid(axi4xbar_auto_out_b_valid),
    .auto_out_b_bits_id(axi4xbar_auto_out_b_bits_id),
    .auto_out_ar_ready(axi4xbar_auto_out_ar_ready),
    .auto_out_ar_valid(axi4xbar_auto_out_ar_valid),
    .auto_out_ar_bits_id(axi4xbar_auto_out_ar_bits_id),
    .auto_out_ar_bits_addr(axi4xbar_auto_out_ar_bits_addr),
    .auto_out_ar_bits_len(axi4xbar_auto_out_ar_bits_len),
    .auto_out_ar_bits_size(axi4xbar_auto_out_ar_bits_size),
    .auto_out_ar_bits_burst(axi4xbar_auto_out_ar_bits_burst),
    .auto_out_ar_bits_lock(axi4xbar_auto_out_ar_bits_lock),
    .auto_out_ar_bits_cache(axi4xbar_auto_out_ar_bits_cache),
    .auto_out_ar_bits_prot(axi4xbar_auto_out_ar_bits_prot),
    .auto_out_ar_bits_qos(axi4xbar_auto_out_ar_bits_qos),
    .auto_out_r_ready(axi4xbar_auto_out_r_ready),
    .auto_out_r_valid(axi4xbar_auto_out_r_valid),
    .auto_out_r_bits_id(axi4xbar_auto_out_r_bits_id)
  );
  AXI4Buffer axi4buf ( // @[Buffer.scala 63:29]
    .clock(axi4buf_clock),
    .reset(axi4buf_reset),
    .auto_in_aw_ready(axi4buf_auto_in_aw_ready),
    .auto_in_aw_valid(axi4buf_auto_in_aw_valid),
    .auto_in_aw_bits_id(axi4buf_auto_in_aw_bits_id),
    .auto_in_aw_bits_addr(axi4buf_auto_in_aw_bits_addr),
    .auto_in_aw_bits_len(axi4buf_auto_in_aw_bits_len),
    .auto_in_aw_bits_size(axi4buf_auto_in_aw_bits_size),
    .auto_in_aw_bits_burst(axi4buf_auto_in_aw_bits_burst),
    .auto_in_aw_bits_lock(axi4buf_auto_in_aw_bits_lock),
    .auto_in_aw_bits_cache(axi4buf_auto_in_aw_bits_cache),
    .auto_in_aw_bits_prot(axi4buf_auto_in_aw_bits_prot),
    .auto_in_aw_bits_qos(axi4buf_auto_in_aw_bits_qos),
    .auto_in_w_ready(axi4buf_auto_in_w_ready),
    .auto_in_w_valid(axi4buf_auto_in_w_valid),
    .auto_in_w_bits_data(axi4buf_auto_in_w_bits_data),
    .auto_in_w_bits_strb(axi4buf_auto_in_w_bits_strb),
    .auto_in_w_bits_last(axi4buf_auto_in_w_bits_last),
    .auto_in_b_ready(axi4buf_auto_in_b_ready),
    .auto_in_b_valid(axi4buf_auto_in_b_valid),
    .auto_in_b_bits_id(axi4buf_auto_in_b_bits_id),
    .auto_in_ar_ready(axi4buf_auto_in_ar_ready),
    .auto_in_ar_valid(axi4buf_auto_in_ar_valid),
    .auto_in_ar_bits_id(axi4buf_auto_in_ar_bits_id),
    .auto_in_ar_bits_addr(axi4buf_auto_in_ar_bits_addr),
    .auto_in_ar_bits_len(axi4buf_auto_in_ar_bits_len),
    .auto_in_ar_bits_size(axi4buf_auto_in_ar_bits_size),
    .auto_in_ar_bits_burst(axi4buf_auto_in_ar_bits_burst),
    .auto_in_ar_bits_lock(axi4buf_auto_in_ar_bits_lock),
    .auto_in_ar_bits_cache(axi4buf_auto_in_ar_bits_cache),
    .auto_in_ar_bits_prot(axi4buf_auto_in_ar_bits_prot),
    .auto_in_ar_bits_qos(axi4buf_auto_in_ar_bits_qos),
    .auto_in_r_ready(axi4buf_auto_in_r_ready),
    .auto_in_r_valid(axi4buf_auto_in_r_valid),
    .auto_in_r_bits_id(axi4buf_auto_in_r_bits_id),
    .auto_out_aw_ready(axi4buf_auto_out_aw_ready),
    .auto_out_aw_valid(axi4buf_auto_out_aw_valid),
    .auto_out_aw_bits_id(axi4buf_auto_out_aw_bits_id),
    .auto_out_aw_bits_addr(axi4buf_auto_out_aw_bits_addr),
    .auto_out_aw_bits_len(axi4buf_auto_out_aw_bits_len),
    .auto_out_aw_bits_size(axi4buf_auto_out_aw_bits_size),
    .auto_out_aw_bits_burst(axi4buf_auto_out_aw_bits_burst),
    .auto_out_aw_bits_lock(axi4buf_auto_out_aw_bits_lock),
    .auto_out_aw_bits_cache(axi4buf_auto_out_aw_bits_cache),
    .auto_out_aw_bits_prot(axi4buf_auto_out_aw_bits_prot),
    .auto_out_aw_bits_qos(axi4buf_auto_out_aw_bits_qos),
    .auto_out_w_ready(axi4buf_auto_out_w_ready),
    .auto_out_w_valid(axi4buf_auto_out_w_valid),
    .auto_out_w_bits_data(axi4buf_auto_out_w_bits_data),
    .auto_out_w_bits_strb(axi4buf_auto_out_w_bits_strb),
    .auto_out_w_bits_last(axi4buf_auto_out_w_bits_last),
    .auto_out_b_ready(axi4buf_auto_out_b_ready),
    .auto_out_b_valid(axi4buf_auto_out_b_valid),
    .auto_out_b_bits_id(axi4buf_auto_out_b_bits_id),
    .auto_out_ar_ready(axi4buf_auto_out_ar_ready),
    .auto_out_ar_valid(axi4buf_auto_out_ar_valid),
    .auto_out_ar_bits_id(axi4buf_auto_out_ar_bits_id),
    .auto_out_ar_bits_addr(axi4buf_auto_out_ar_bits_addr),
    .auto_out_ar_bits_len(axi4buf_auto_out_ar_bits_len),
    .auto_out_ar_bits_size(axi4buf_auto_out_ar_bits_size),
    .auto_out_ar_bits_burst(axi4buf_auto_out_ar_bits_burst),
    .auto_out_ar_bits_lock(axi4buf_auto_out_ar_bits_lock),
    .auto_out_ar_bits_cache(axi4buf_auto_out_ar_bits_cache),
    .auto_out_ar_bits_prot(axi4buf_auto_out_ar_bits_prot),
    .auto_out_ar_bits_qos(axi4buf_auto_out_ar_bits_qos),
    .auto_out_r_ready(axi4buf_auto_out_r_ready),
    .auto_out_r_valid(axi4buf_auto_out_r_valid),
    .auto_out_r_bits_id(axi4buf_auto_out_r_bits_id)
  );
  BRAMQueue PRINTBRIDGEMODULE_0_to_cpu_stream_outgoingQueue ( // @[FPGAManagedStreamEngine.scala 85:33]
    .clock(PRINTBRIDGEMODULE_0_to_cpu_stream_outgoingQueue_clock),
    .reset(PRINTBRIDGEMODULE_0_to_cpu_stream_outgoingQueue_reset),
    .io_enq_ready(PRINTBRIDGEMODULE_0_to_cpu_stream_outgoingQueue_io_enq_ready),
    .io_enq_valid(PRINTBRIDGEMODULE_0_to_cpu_stream_outgoingQueue_io_enq_valid),
    .io_enq_bits(PRINTBRIDGEMODULE_0_to_cpu_stream_outgoingQueue_io_enq_bits),
    .io_deq_ready(PRINTBRIDGEMODULE_0_to_cpu_stream_outgoingQueue_io_deq_ready),
    .io_deq_valid(PRINTBRIDGEMODULE_0_to_cpu_stream_outgoingQueue_io_deq_valid),
    .io_deq_bits(PRINTBRIDGEMODULE_0_to_cpu_stream_outgoingQueue_io_deq_bits),
    .io_count(PRINTBRIDGEMODULE_0_to_cpu_stream_outgoingQueue_io_count)
  );
  Queue_10 PRINTBRIDGEMODULE_0_to_cpu_stream_inflightBeatCounts ( // @[FPGAManagedStreamEngine.scala 96:38]
    .clock(PRINTBRIDGEMODULE_0_to_cpu_stream_inflightBeatCounts_clock),
    .reset(PRINTBRIDGEMODULE_0_to_cpu_stream_inflightBeatCounts_reset),
    .io_enq_ready(PRINTBRIDGEMODULE_0_to_cpu_stream_inflightBeatCounts_io_enq_ready),
    .io_enq_valid(PRINTBRIDGEMODULE_0_to_cpu_stream_inflightBeatCounts_io_enq_valid),
    .io_enq_bits_numBeats(PRINTBRIDGEMODULE_0_to_cpu_stream_inflightBeatCounts_io_enq_bits_numBeats),
    .io_enq_bits_isFlush(PRINTBRIDGEMODULE_0_to_cpu_stream_inflightBeatCounts_io_enq_bits_isFlush),
    .io_deq_ready(PRINTBRIDGEMODULE_0_to_cpu_stream_inflightBeatCounts_io_deq_ready),
    .io_deq_valid(PRINTBRIDGEMODULE_0_to_cpu_stream_inflightBeatCounts_io_deq_valid),
    .io_deq_bits_numBeats(PRINTBRIDGEMODULE_0_to_cpu_stream_inflightBeatCounts_io_deq_bits_numBeats),
    .io_deq_bits_isFlush(PRINTBRIDGEMODULE_0_to_cpu_stream_inflightBeatCounts_io_deq_bits_isFlush)
  );
  MCRFile_4 crFile ( // @[Widget.scala 166:24]
    .clock(crFile_clock),
    .reset(crFile_reset),
    .io_nasti_aw_ready(crFile_io_nasti_aw_ready),
    .io_nasti_aw_valid(crFile_io_nasti_aw_valid),
    .io_nasti_aw_bits_addr(crFile_io_nasti_aw_bits_addr),
    .io_nasti_aw_bits_len(crFile_io_nasti_aw_bits_len),
    .io_nasti_aw_bits_id(crFile_io_nasti_aw_bits_id),
    .io_nasti_w_ready(crFile_io_nasti_w_ready),
    .io_nasti_w_valid(crFile_io_nasti_w_valid),
    .io_nasti_w_bits_data(crFile_io_nasti_w_bits_data),
    .io_nasti_b_ready(crFile_io_nasti_b_ready),
    .io_nasti_b_valid(crFile_io_nasti_b_valid),
    .io_nasti_b_bits_id(crFile_io_nasti_b_bits_id),
    .io_nasti_ar_ready(crFile_io_nasti_ar_ready),
    .io_nasti_ar_valid(crFile_io_nasti_ar_valid),
    .io_nasti_ar_bits_addr(crFile_io_nasti_ar_bits_addr),
    .io_nasti_ar_bits_len(crFile_io_nasti_ar_bits_len),
    .io_nasti_ar_bits_id(crFile_io_nasti_ar_bits_id),
    .io_nasti_r_ready(crFile_io_nasti_r_ready),
    .io_nasti_r_valid(crFile_io_nasti_r_valid),
    .io_nasti_r_bits_data(crFile_io_nasti_r_bits_data),
    .io_nasti_r_bits_id(crFile_io_nasti_r_bits_id),
    .io_mcr_read_0_bits(crFile_io_mcr_read_0_bits),
    .io_mcr_read_1_bits(crFile_io_mcr_read_1_bits),
    .io_mcr_read_2_bits(crFile_io_mcr_read_2_bits),
    .io_mcr_read_3_bits(crFile_io_mcr_read_3_bits),
    .io_mcr_read_4_bits(crFile_io_mcr_read_4_bits),
    .io_mcr_read_5_bits(crFile_io_mcr_read_5_bits),
    .io_mcr_read_6_bits(crFile_io_mcr_read_6_bits),
    .io_mcr_write_0_valid(crFile_io_mcr_write_0_valid),
    .io_mcr_write_0_bits(crFile_io_mcr_write_0_bits),
    .io_mcr_write_1_valid(crFile_io_mcr_write_1_valid),
    .io_mcr_write_1_bits(crFile_io_mcr_write_1_bits),
    .io_mcr_write_2_valid(crFile_io_mcr_write_2_valid),
    .io_mcr_write_3_valid(crFile_io_mcr_write_3_valid),
    .io_mcr_write_3_bits(crFile_io_mcr_write_3_bits),
    .io_mcr_write_4_valid(crFile_io_mcr_write_4_valid),
    .io_mcr_write_4_bits(crFile_io_mcr_write_4_bits),
    .io_mcr_write_5_valid(crFile_io_mcr_write_5_valid),
    .io_mcr_write_5_bits(crFile_io_mcr_write_5_bits),
    .io_mcr_write_6_valid(crFile_io_mcr_write_6_valid)
  );
  assign auto_axi4xbar_out_aw_valid = axi4xbar_auto_out_aw_valid; // @[LazyModule.scala 368:12]
  assign auto_axi4xbar_out_aw_bits_id = axi4xbar_auto_out_aw_bits_id; // @[LazyModule.scala 368:12]
  assign auto_axi4xbar_out_aw_bits_addr = axi4xbar_auto_out_aw_bits_addr; // @[LazyModule.scala 368:12]
  assign auto_axi4xbar_out_aw_bits_len = axi4xbar_auto_out_aw_bits_len; // @[LazyModule.scala 368:12]
  assign auto_axi4xbar_out_aw_bits_size = axi4xbar_auto_out_aw_bits_size; // @[LazyModule.scala 368:12]
  assign auto_axi4xbar_out_aw_bits_burst = axi4xbar_auto_out_aw_bits_burst; // @[LazyModule.scala 368:12]
  assign auto_axi4xbar_out_aw_bits_lock = axi4xbar_auto_out_aw_bits_lock; // @[LazyModule.scala 368:12]
  assign auto_axi4xbar_out_aw_bits_cache = axi4xbar_auto_out_aw_bits_cache; // @[LazyModule.scala 368:12]
  assign auto_axi4xbar_out_aw_bits_prot = axi4xbar_auto_out_aw_bits_prot; // @[LazyModule.scala 368:12]
  assign auto_axi4xbar_out_aw_bits_qos = axi4xbar_auto_out_aw_bits_qos; // @[LazyModule.scala 368:12]
  assign auto_axi4xbar_out_w_valid = axi4xbar_auto_out_w_valid; // @[LazyModule.scala 368:12]
  assign auto_axi4xbar_out_w_bits_data = axi4xbar_auto_out_w_bits_data; // @[LazyModule.scala 368:12]
  assign auto_axi4xbar_out_w_bits_strb = axi4xbar_auto_out_w_bits_strb; // @[LazyModule.scala 368:12]
  assign auto_axi4xbar_out_w_bits_last = axi4xbar_auto_out_w_bits_last; // @[LazyModule.scala 368:12]
  assign auto_axi4xbar_out_b_ready = axi4xbar_auto_out_b_ready; // @[LazyModule.scala 368:12]
  assign auto_axi4xbar_out_ar_valid = axi4xbar_auto_out_ar_valid; // @[LazyModule.scala 368:12]
  assign auto_axi4xbar_out_ar_bits_id = axi4xbar_auto_out_ar_bits_id; // @[LazyModule.scala 368:12]
  assign auto_axi4xbar_out_ar_bits_addr = axi4xbar_auto_out_ar_bits_addr; // @[LazyModule.scala 368:12]
  assign auto_axi4xbar_out_ar_bits_len = axi4xbar_auto_out_ar_bits_len; // @[LazyModule.scala 368:12]
  assign auto_axi4xbar_out_ar_bits_size = axi4xbar_auto_out_ar_bits_size; // @[LazyModule.scala 368:12]
  assign auto_axi4xbar_out_ar_bits_burst = axi4xbar_auto_out_ar_bits_burst; // @[LazyModule.scala 368:12]
  assign auto_axi4xbar_out_ar_bits_lock = axi4xbar_auto_out_ar_bits_lock; // @[LazyModule.scala 368:12]
  assign auto_axi4xbar_out_ar_bits_cache = axi4xbar_auto_out_ar_bits_cache; // @[LazyModule.scala 368:12]
  assign auto_axi4xbar_out_ar_bits_prot = axi4xbar_auto_out_ar_bits_prot; // @[LazyModule.scala 368:12]
  assign auto_axi4xbar_out_ar_bits_qos = axi4xbar_auto_out_ar_bits_qos; // @[LazyModule.scala 368:12]
  assign auto_axi4xbar_out_r_ready = axi4xbar_auto_out_r_ready; // @[LazyModule.scala 368:12]
  assign streamsToHostCPU_0_ready = PRINTBRIDGEMODULE_0_to_cpu_stream_outgoingQueue_io_enq_ready; // @[FPGAManagedStreamEngine.scala 86:28]
  assign io_ctrl_aw_ready = crFile_io_nasti_aw_ready; // @[Widget.scala 168:21]
  assign io_ctrl_w_ready = crFile_io_nasti_w_ready; // @[Widget.scala 168:21]
  assign io_ctrl_b_valid = crFile_io_nasti_b_valid; // @[Widget.scala 168:21]
  assign io_ctrl_b_bits_id = crFile_io_nasti_b_bits_id; // @[Widget.scala 168:21]
  assign io_ctrl_ar_ready = crFile_io_nasti_ar_ready; // @[Widget.scala 168:21]
  assign io_ctrl_r_valid = crFile_io_nasti_r_valid; // @[Widget.scala 168:21]
  assign io_ctrl_r_bits_data = crFile_io_nasti_r_bits_data; // @[Widget.scala 168:21]
  assign io_ctrl_r_bits_id = crFile_io_nasti_r_bits_id; // @[Widget.scala 168:21]
  assign axi4xbar_clock = clock;
  assign axi4xbar_reset = reset;
  assign axi4xbar_auto_in_aw_valid = axi4buf_auto_out_aw_valid; // @[LazyModule.scala 353:16]
  assign axi4xbar_auto_in_aw_bits_id = axi4buf_auto_out_aw_bits_id; // @[LazyModule.scala 353:16]
  assign axi4xbar_auto_in_aw_bits_addr = axi4buf_auto_out_aw_bits_addr; // @[LazyModule.scala 353:16]
  assign axi4xbar_auto_in_aw_bits_len = axi4buf_auto_out_aw_bits_len; // @[LazyModule.scala 353:16]
  assign axi4xbar_auto_in_aw_bits_size = axi4buf_auto_out_aw_bits_size; // @[LazyModule.scala 353:16]
  assign axi4xbar_auto_in_aw_bits_burst = axi4buf_auto_out_aw_bits_burst; // @[LazyModule.scala 353:16]
  assign axi4xbar_auto_in_aw_bits_lock = axi4buf_auto_out_aw_bits_lock; // @[LazyModule.scala 353:16]
  assign axi4xbar_auto_in_aw_bits_cache = axi4buf_auto_out_aw_bits_cache; // @[LazyModule.scala 353:16]
  assign axi4xbar_auto_in_aw_bits_prot = axi4buf_auto_out_aw_bits_prot; // @[LazyModule.scala 353:16]
  assign axi4xbar_auto_in_aw_bits_qos = axi4buf_auto_out_aw_bits_qos; // @[LazyModule.scala 353:16]
  assign axi4xbar_auto_in_w_valid = axi4buf_auto_out_w_valid; // @[LazyModule.scala 353:16]
  assign axi4xbar_auto_in_w_bits_data = axi4buf_auto_out_w_bits_data; // @[LazyModule.scala 353:16]
  assign axi4xbar_auto_in_w_bits_strb = axi4buf_auto_out_w_bits_strb; // @[LazyModule.scala 353:16]
  assign axi4xbar_auto_in_w_bits_last = axi4buf_auto_out_w_bits_last; // @[LazyModule.scala 353:16]
  assign axi4xbar_auto_in_b_ready = axi4buf_auto_out_b_ready; // @[LazyModule.scala 353:16]
  assign axi4xbar_auto_in_ar_valid = axi4buf_auto_out_ar_valid; // @[LazyModule.scala 353:16]
  assign axi4xbar_auto_in_ar_bits_id = axi4buf_auto_out_ar_bits_id; // @[LazyModule.scala 353:16]
  assign axi4xbar_auto_in_ar_bits_addr = axi4buf_auto_out_ar_bits_addr; // @[LazyModule.scala 353:16]
  assign axi4xbar_auto_in_ar_bits_len = axi4buf_auto_out_ar_bits_len; // @[LazyModule.scala 353:16]
  assign axi4xbar_auto_in_ar_bits_size = axi4buf_auto_out_ar_bits_size; // @[LazyModule.scala 353:16]
  assign axi4xbar_auto_in_ar_bits_burst = axi4buf_auto_out_ar_bits_burst; // @[LazyModule.scala 353:16]
  assign axi4xbar_auto_in_ar_bits_lock = axi4buf_auto_out_ar_bits_lock; // @[LazyModule.scala 353:16]
  assign axi4xbar_auto_in_ar_bits_cache = axi4buf_auto_out_ar_bits_cache; // @[LazyModule.scala 353:16]
  assign axi4xbar_auto_in_ar_bits_prot = axi4buf_auto_out_ar_bits_prot; // @[LazyModule.scala 353:16]
  assign axi4xbar_auto_in_ar_bits_qos = axi4buf_auto_out_ar_bits_qos; // @[LazyModule.scala 353:16]
  assign axi4xbar_auto_in_r_ready = axi4buf_auto_out_r_ready; // @[LazyModule.scala 353:16]
  assign axi4xbar_auto_out_aw_ready = auto_axi4xbar_out_aw_ready; // @[LazyModule.scala 368:12]
  assign axi4xbar_auto_out_w_ready = auto_axi4xbar_out_w_ready; // @[LazyModule.scala 368:12]
  assign axi4xbar_auto_out_b_valid = auto_axi4xbar_out_b_valid; // @[LazyModule.scala 368:12]
  assign axi4xbar_auto_out_b_bits_id = auto_axi4xbar_out_b_bits_id; // @[LazyModule.scala 368:12]
  assign axi4xbar_auto_out_ar_ready = auto_axi4xbar_out_ar_ready; // @[LazyModule.scala 368:12]
  assign axi4xbar_auto_out_r_valid = auto_axi4xbar_out_r_valid; // @[LazyModule.scala 368:12]
  assign axi4xbar_auto_out_r_bits_id = auto_axi4xbar_out_r_bits_id; // @[LazyModule.scala 368:12]
  assign axi4buf_clock = clock;
  assign axi4buf_reset = reset;
  assign axi4buf_auto_in_aw_valid = PRINTBRIDGEMODULE_0_to_cpu_stream_state == 2'h1; // @[FPGAManagedStreamEngine.scala 175:36]
  assign axi4buf_auto_in_aw_bits_id = 1'h0; // @[Nodes.scala 1212:84 FPGAManagedStreamEngine.scala 176:26]
  assign axi4buf_auto_in_aw_bits_addr = _PRINTBRIDGEMODULE_0_to_cpu_stream_x1_aw_bits_addr_T_2[21:0]; // @[Nodes.scala 1212:84 FPGAManagedStreamEngine.scala 177:26]
  assign axi4buf_auto_in_aw_bits_len = PRINTBRIDGEMODULE_0_to_cpu_stream_writeableBeatsMinus1[7:0]; // @[Nodes.scala 1212:84 FPGAManagedStreamEngine.scala 178:26]
  assign axi4buf_auto_in_aw_bits_size = 3'h6; // @[Nodes.scala 1212:84 FPGAManagedStreamEngine.scala 179:26]
  assign axi4buf_auto_in_aw_bits_burst = 2'h1; // @[Nodes.scala 1212:84 FPGAManagedStreamEngine.scala 182:26]
  assign axi4buf_auto_in_aw_bits_lock = 1'h0; // @[Nodes.scala 1212:84 FPGAManagedStreamEngine.scala 190:26]
  assign axi4buf_auto_in_aw_bits_cache = 4'h2; // @[Nodes.scala 1212:84 FPGAManagedStreamEngine.scala 185:26]
  assign axi4buf_auto_in_aw_bits_prot = 3'h0; // @[Nodes.scala 1212:84 FPGAManagedStreamEngine.scala 188:26]
  assign axi4buf_auto_in_aw_bits_qos = 4'h0; // @[Nodes.scala 1212:84 FPGAManagedStreamEngine.scala 189:26]
  assign axi4buf_auto_in_w_valid = PRINTBRIDGEMODULE_0_to_cpu_stream_state == 2'h2 &
    PRINTBRIDGEMODULE_0_to_cpu_stream_outgoingQueue_io_deq_valid; // @[FPGAManagedStreamEngine.scala 196:58]
  assign axi4buf_auto_in_w_bits_data = PRINTBRIDGEMODULE_0_to_cpu_stream_outgoingQueue_io_deq_bits; // @[Nodes.scala 1212:84 FPGAManagedStreamEngine.scala 197:34]
  assign axi4buf_auto_in_w_bits_strb = 64'hffffffffffffffff; // @[Nodes.scala 1212:84 FPGAManagedStreamEngine.scala 198:34]
  assign axi4buf_auto_in_w_bits_last = PRINTBRIDGEMODULE_0_to_cpu_stream_beatsToSendMinus1 == 6'h0; // @[FPGAManagedStreamEngine.scala 199:55]
  assign axi4buf_auto_in_b_ready = 1'h1; // @[Nodes.scala 1212:84 FPGAManagedStreamEngine.scala 203:20]
  assign axi4buf_auto_in_ar_valid = 1'h0; // @[Nodes.scala 1212:84 FPGAManagedStreamEngine.scala 219:21]
  assign axi4buf_auto_in_ar_bits_id = 1'h0; // @[LazyModule.scala 355:16]
  assign axi4buf_auto_in_ar_bits_addr = 22'h0; // @[LazyModule.scala 355:16]
  assign axi4buf_auto_in_ar_bits_len = 8'h0; // @[LazyModule.scala 355:16]
  assign axi4buf_auto_in_ar_bits_size = 3'h0; // @[LazyModule.scala 355:16]
  assign axi4buf_auto_in_ar_bits_burst = 2'h0; // @[LazyModule.scala 355:16]
  assign axi4buf_auto_in_ar_bits_lock = 1'h0; // @[LazyModule.scala 355:16]
  assign axi4buf_auto_in_ar_bits_cache = 4'h0; // @[LazyModule.scala 355:16]
  assign axi4buf_auto_in_ar_bits_prot = 3'h0; // @[LazyModule.scala 355:16]
  assign axi4buf_auto_in_ar_bits_qos = 4'h0; // @[LazyModule.scala 355:16]
  assign axi4buf_auto_in_r_ready = 1'h0; // @[Nodes.scala 1212:84 FPGAManagedStreamEngine.scala 220:21]
  assign axi4buf_auto_out_aw_ready = axi4xbar_auto_in_aw_ready; // @[LazyModule.scala 353:16]
  assign axi4buf_auto_out_w_ready = axi4xbar_auto_in_w_ready; // @[LazyModule.scala 353:16]
  assign axi4buf_auto_out_b_valid = axi4xbar_auto_in_b_valid; // @[LazyModule.scala 353:16]
  assign axi4buf_auto_out_b_bits_id = 1'h0; // @[LazyModule.scala 353:16]
  assign axi4buf_auto_out_ar_ready = axi4xbar_auto_in_ar_ready; // @[LazyModule.scala 353:16]
  assign axi4buf_auto_out_r_valid = axi4xbar_auto_in_r_valid; // @[LazyModule.scala 353:16]
  assign axi4buf_auto_out_r_bits_id = 1'h0; // @[LazyModule.scala 353:16]
  assign PRINTBRIDGEMODULE_0_to_cpu_stream_outgoingQueue_clock = clock;
  assign PRINTBRIDGEMODULE_0_to_cpu_stream_outgoingQueue_reset = reset;
  assign PRINTBRIDGEMODULE_0_to_cpu_stream_outgoingQueue_io_enq_valid = streamsToHostCPU_0_valid; // @[FPGAManagedStreamEngine.scala 86:28]
  assign PRINTBRIDGEMODULE_0_to_cpu_stream_outgoingQueue_io_enq_bits = streamsToHostCPU_0_bits; // @[FPGAManagedStreamEngine.scala 86:28]
  assign PRINTBRIDGEMODULE_0_to_cpu_stream_outgoingQueue_io_deq_ready = _PRINTBRIDGEMODULE_0_to_cpu_stream_x1_w_valid_T
     & x1_w_ready; // @[FPGAManagedStreamEngine.scala 200:58]
  assign PRINTBRIDGEMODULE_0_to_cpu_stream_inflightBeatCounts_clock = clock;
  assign PRINTBRIDGEMODULE_0_to_cpu_stream_inflightBeatCounts_reset = reset;
  assign PRINTBRIDGEMODULE_0_to_cpu_stream_inflightBeatCounts_io_enq_valid = x1_aw_ready & x1_aw_valid; // @[Decoupled.scala 51:35]
  assign PRINTBRIDGEMODULE_0_to_cpu_stream_inflightBeatCounts_io_enq_bits_numBeats =
    PRINTBRIDGEMODULE_0_to_cpu_stream_writeableBeats[6:0]; // @[FPGAManagedStreamEngine.scala 193:47]
  assign PRINTBRIDGEMODULE_0_to_cpu_stream_inflightBeatCounts_io_enq_bits_isFlush =
    PRINTBRIDGEMODULE_0_to_cpu_stream_flushBeatsToIssue != 13'h0; // @[FPGAManagedStreamEngine.scala 194:68]
  assign PRINTBRIDGEMODULE_0_to_cpu_stream_inflightBeatCounts_io_deq_ready = axi4buf_auto_in_b_valid; // @[Nodes.scala 1212:84 LazyModule.scala 355:16]
  assign crFile_clock = clock;
  assign crFile_reset = reset;
  assign crFile_io_nasti_aw_valid = io_ctrl_aw_valid; // @[Widget.scala 168:21]
  assign crFile_io_nasti_aw_bits_addr = io_ctrl_aw_bits_addr; // @[Widget.scala 168:21]
  assign crFile_io_nasti_aw_bits_len = io_ctrl_aw_bits_len; // @[Widget.scala 168:21]
  assign crFile_io_nasti_aw_bits_id = io_ctrl_aw_bits_id; // @[Widget.scala 168:21]
  assign crFile_io_nasti_w_valid = io_ctrl_w_valid; // @[Widget.scala 168:21]
  assign crFile_io_nasti_w_bits_data = io_ctrl_w_bits_data; // @[Widget.scala 168:21]
  assign crFile_io_nasti_b_ready = io_ctrl_b_ready; // @[Widget.scala 168:21]
  assign crFile_io_nasti_ar_valid = io_ctrl_ar_valid; // @[Widget.scala 168:21]
  assign crFile_io_nasti_ar_bits_addr = io_ctrl_ar_bits_addr; // @[Widget.scala 168:21]
  assign crFile_io_nasti_ar_bits_len = io_ctrl_ar_bits_len; // @[Widget.scala 168:21]
  assign crFile_io_nasti_ar_bits_id = io_ctrl_ar_bits_id; // @[Widget.scala 168:21]
  assign crFile_io_nasti_r_ready = io_ctrl_r_ready; // @[Widget.scala 168:21]
  assign crFile_io_mcr_read_0_bits = PRINTBRIDGEMODULE_0_to_cpu_stream_toHostPhysAddrHigh; // @[Lib.scala 288:24]
  assign crFile_io_mcr_read_1_bits = PRINTBRIDGEMODULE_0_to_cpu_stream_toHostPhysAddrLow; // @[Lib.scala 288:24]
  assign crFile_io_mcr_read_2_bits = {{12'd0}, PRINTBRIDGEMODULE_0_to_cpu_stream_readCredits}; // @[Lib.scala 288:24]
  assign crFile_io_mcr_read_3_bits = {{12'd0}, PRINTBRIDGEMODULE_0_to_cpu_stream_bytesConsumedByCPU}; // @[Lib.scala 288:24]
  assign crFile_io_mcr_read_4_bits = {{31'd0}, PRINTBRIDGEMODULE_0_to_cpu_stream_doneInit}; // @[Lib.scala 288:24]
  assign crFile_io_mcr_read_5_bits = {{31'd0}, PRINTBRIDGEMODULE_0_to_cpu_stream_doFlush}; // @[Lib.scala 288:24]
  assign crFile_io_mcr_read_6_bits = {{31'd0}, _PRINTBRIDGEMODULE_0_to_cpu_stream_T_42}; // @[Lib.scala 288:24]
  always @(posedge clock) begin
    if (crFile_io_mcr_write_0_valid) begin // @[Lib.scala 280:32]
      PRINTBRIDGEMODULE_0_to_cpu_stream_toHostPhysAddrHigh <= crFile_io_mcr_write_0_bits; // @[Lib.scala 281:18]
    end
    if (crFile_io_mcr_write_1_valid) begin // @[Lib.scala 280:32]
      PRINTBRIDGEMODULE_0_to_cpu_stream_toHostPhysAddrLow <= crFile_io_mcr_write_1_bits; // @[Lib.scala 281:18]
    end
    PRINTBRIDGEMODULE_0_to_cpu_stream_bytesConsumedByCPU <= _GEN_52[19:0]; // @[FPGAManagedStreamEngine.scala 81:{39,39}]
    PRINTBRIDGEMODULE_0_to_cpu_stream_writeCredits <= _GEN_53[19:0]; // @[FPGAManagedStreamEngine.scala 88:{39,39}]
    if (reset) begin // @[FPGAManagedStreamEngine.scala 89:39]
      PRINTBRIDGEMODULE_0_to_cpu_stream_readCredits <= 20'h0; // @[FPGAManagedStreamEngine.scala 89:39]
    end else if (x1_b_valid) begin // @[FPGAManagedStreamEngine.scala 207:25]
      PRINTBRIDGEMODULE_0_to_cpu_stream_readCredits <= _PRINTBRIDGEMODULE_0_to_cpu_stream_readCredits_T_6; // @[FPGAManagedStreamEngine.scala 208:21]
    end else if (PRINTBRIDGEMODULE_0_to_cpu_stream_bytesConsumedByCPU != 20'h0) begin // @[FPGAManagedStreamEngine.scala 129:40]
      PRINTBRIDGEMODULE_0_to_cpu_stream_readCredits <= _PRINTBRIDGEMODULE_0_to_cpu_stream_readCredits_T_1; // @[FPGAManagedStreamEngine.scala 132:28]
    end
    PRINTBRIDGEMODULE_0_to_cpu_stream_writePtr <= _GEN_54[18:0]; // @[FPGAManagedStreamEngine.scala 90:{39,39}]
    PRINTBRIDGEMODULE_0_to_cpu_stream_doneInit <= _GEN_55[0]; // @[FPGAManagedStreamEngine.scala 91:{39,39}]
    if (reset) begin // @[FPGAManagedStreamEngine.scala 101:59]
      PRINTBRIDGEMODULE_0_to_cpu_stream_state <= 2'h0; // @[FPGAManagedStreamEngine.scala 101:59]
    end else if (2'h0 == PRINTBRIDGEMODULE_0_to_cpu_stream_state) begin // @[FPGAManagedStreamEngine.scala 144:21]
      if (PRINTBRIDGEMODULE_0_to_cpu_stream_start) begin // @[FPGAManagedStreamEngine.scala 156:23]
        PRINTBRIDGEMODULE_0_to_cpu_stream_state <= 2'h1; // @[FPGAManagedStreamEngine.scala 156:31]
      end
    end else if (2'h1 == PRINTBRIDGEMODULE_0_to_cpu_stream_state) begin // @[FPGAManagedStreamEngine.scala 144:21]
      if (_PRINTBRIDGEMODULE_0_to_cpu_stream_T_32) begin // @[FPGAManagedStreamEngine.scala 159:30]
        PRINTBRIDGEMODULE_0_to_cpu_stream_state <= 2'h2; // @[FPGAManagedStreamEngine.scala 160:31]
      end
    end else if (2'h2 == PRINTBRIDGEMODULE_0_to_cpu_stream_state) begin // @[FPGAManagedStreamEngine.scala 144:21]
      PRINTBRIDGEMODULE_0_to_cpu_stream_state <= _GEN_12;
    end
    PRINTBRIDGEMODULE_0_to_cpu_stream_beatsToSendMinus1 <= _GEN_56[5:0]; // @[FPGAManagedStreamEngine.scala 102:{59,59}]
    PRINTBRIDGEMODULE_0_to_cpu_stream_REG <= PRINTBRIDGEMODULE_0_to_cpu_stream_bytesConsumedByCPU; // @[FPGAManagedStreamEngine.scala 126:32]
    PRINTBRIDGEMODULE_0_to_cpu_stream_doFlush <= _GEN_57[0]; // @[FPGAManagedStreamEngine.scala 135:{55,55}]
    if (reset) begin // @[FPGAManagedStreamEngine.scala 135:55]
      PRINTBRIDGEMODULE_0_to_cpu_stream_inFlush <= 1'h0; // @[FPGAManagedStreamEngine.scala 135:55]
    end else if (x1_b_valid) begin // @[FPGAManagedStreamEngine.scala 207:25]
      if (PRINTBRIDGEMODULE_0_to_cpu_stream_inflightBeatCounts_io_deq_bits_isFlush) begin // @[FPGAManagedStreamEngine.scala 209:24]
        PRINTBRIDGEMODULE_0_to_cpu_stream_inFlush <= PRINTBRIDGEMODULE_0_to_cpu_stream_remainingBeatsToAck != 13'h0; // @[FPGAManagedStreamEngine.scala 212:27]
      end else begin
        PRINTBRIDGEMODULE_0_to_cpu_stream_inFlush <= _GEN_22;
      end
    end else begin
      PRINTBRIDGEMODULE_0_to_cpu_stream_inFlush <= _GEN_22;
    end
    PRINTBRIDGEMODULE_0_to_cpu_stream_flushBeatsToIssue <= _GEN_58[12:0]; // @[FPGAManagedStreamEngine.scala 136:{55,55}]
    if (reset) begin // @[FPGAManagedStreamEngine.scala 136:55]
      PRINTBRIDGEMODULE_0_to_cpu_stream_flushBeatsToAck <= 13'h0; // @[FPGAManagedStreamEngine.scala 136:55]
    end else if (x1_b_valid) begin // @[FPGAManagedStreamEngine.scala 207:25]
      if (PRINTBRIDGEMODULE_0_to_cpu_stream_inflightBeatCounts_io_deq_bits_isFlush) begin // @[FPGAManagedStreamEngine.scala 209:24]
        if (_GEN_50 < PRINTBRIDGEMODULE_0_to_cpu_stream_flushBeatsToAck) begin // @[FPGAManagedStreamEngine.scala 210:40]
          PRINTBRIDGEMODULE_0_to_cpu_stream_flushBeatsToAck <=
            _PRINTBRIDGEMODULE_0_to_cpu_stream_remainingBeatsToAck_T_2;
        end else begin
          PRINTBRIDGEMODULE_0_to_cpu_stream_flushBeatsToAck <= 13'h0;
        end
      end else begin
        PRINTBRIDGEMODULE_0_to_cpu_stream_flushBeatsToAck <= _GEN_24;
      end
    end else begin
      PRINTBRIDGEMODULE_0_to_cpu_stream_flushBeatsToAck <= _GEN_24;
    end
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (~reset & ~(PRINTBRIDGEMODULE_0_to_cpu_stream_beatsToPageBoundary > 7'h0 &
          PRINTBRIDGEMODULE_0_to_cpu_stream_beatsToPageBoundary <= 7'h40)) begin
          $fwrite(32'h80000002,
            "Assertion failed\n    at FPGAManagedStreamEngine.scala:107 assert((beatsToPageBoundary > 0.U) && (beatsToPageBoundary <= (pageBeats.U)))\n"
            ); // @[FPGAManagedStreamEngine.scala 107:13]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_PRINTBRIDGEMODULE_0_to_cpu_stream_T_4 & ~_PRINTBRIDGEMODULE_0_to_cpu_stream_T_11) begin
          $fwrite(32'h80000002,
            "Assertion failed: Back-to-back MMIO accesses, or incorrect toggling on bytesConsumedByCPU\n    at FPGAManagedStreamEngine.scala:125 assert(\n"
            ); // @[FPGAManagedStreamEngine.scala 125:13]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_PRINTBRIDGEMODULE_0_to_cpu_stream_T_4 & ~(PRINTBRIDGEMODULE_0_to_cpu_stream_readCredits >=
          PRINTBRIDGEMODULE_0_to_cpu_stream_bytesConsumedByCPU)) begin
          $fwrite(32'h80000002,
            "Assertion failed: Driver read more bytes than available in circular buffer.\n    at FPGAManagedStreamEngine.scala:138 assert(readCredits >= bytesConsumedByCPU, \"Driver read more bytes than available in circular buffer.\")\n"
            ); // @[FPGAManagedStreamEngine.scala 138:13]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_PRINTBRIDGEMODULE_0_to_cpu_stream_T_4 & ~_PRINTBRIDGEMODULE_0_to_cpu_stream_T_22) begin
          $fwrite(32'h80000002,
            "Assertion failed: Driver granted more write credit than physically allowable.\n    at FPGAManagedStreamEngine.scala:139 assert(\n"
            ); // @[FPGAManagedStreamEngine.scala 139:13]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_PRINTBRIDGEMODULE_0_to_cpu_stream_T_4 & ~(~x1_b_valid |
          PRINTBRIDGEMODULE_0_to_cpu_stream_inflightBeatCounts_io_deq_valid)) begin
          $fwrite(32'h80000002,
            "Assertion failed\n    at FPGAManagedStreamEngine.scala:216 assert(!axi4.b.valid || inflightBeatCounts.io.deq.valid)\n"
            ); // @[FPGAManagedStreamEngine.scala 216:13]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_PRINTBRIDGEMODULE_0_to_cpu_stream_T_4 & ~(~crFile_io_mcr_write_2_valid)) begin
          $fwrite(32'h80000002,
            "Assertion failed: Register PRINTBRIDGEMODULE_0_to_cpu_stream_bytesAvailable is read only\n    at Lib.scala:284 assert(write(index).valid =/= true.B, s\"Register ${reg.name} is read only\")\n"
            ); // @[Lib.scala 284:13]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_PRINTBRIDGEMODULE_0_to_cpu_stream_T_4 & ~(~crFile_io_mcr_write_6_valid)) begin
          $fwrite(32'h80000002,
            "Assertion failed: Register PRINTBRIDGEMODULE_0_to_cpu_stream_toHostStreamFlushDone is read only\n    at Lib.scala:284 assert(write(index).valid =/= true.B, s\"Register ${reg.name} is read only\")\n"
            ); // @[Lib.scala 284:13]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  PRINTBRIDGEMODULE_0_to_cpu_stream_toHostPhysAddrHigh = _RAND_0[31:0];
  _RAND_1 = {1{`RANDOM}};
  PRINTBRIDGEMODULE_0_to_cpu_stream_toHostPhysAddrLow = _RAND_1[31:0];
  _RAND_2 = {1{`RANDOM}};
  PRINTBRIDGEMODULE_0_to_cpu_stream_bytesConsumedByCPU = _RAND_2[19:0];
  _RAND_3 = {1{`RANDOM}};
  PRINTBRIDGEMODULE_0_to_cpu_stream_writeCredits = _RAND_3[19:0];
  _RAND_4 = {1{`RANDOM}};
  PRINTBRIDGEMODULE_0_to_cpu_stream_readCredits = _RAND_4[19:0];
  _RAND_5 = {1{`RANDOM}};
  PRINTBRIDGEMODULE_0_to_cpu_stream_writePtr = _RAND_5[18:0];
  _RAND_6 = {1{`RANDOM}};
  PRINTBRIDGEMODULE_0_to_cpu_stream_doneInit = _RAND_6[0:0];
  _RAND_7 = {1{`RANDOM}};
  PRINTBRIDGEMODULE_0_to_cpu_stream_state = _RAND_7[1:0];
  _RAND_8 = {1{`RANDOM}};
  PRINTBRIDGEMODULE_0_to_cpu_stream_beatsToSendMinus1 = _RAND_8[5:0];
  _RAND_9 = {1{`RANDOM}};
  PRINTBRIDGEMODULE_0_to_cpu_stream_REG = _RAND_9[19:0];
  _RAND_10 = {1{`RANDOM}};
  PRINTBRIDGEMODULE_0_to_cpu_stream_doFlush = _RAND_10[0:0];
  _RAND_11 = {1{`RANDOM}};
  PRINTBRIDGEMODULE_0_to_cpu_stream_inFlush = _RAND_11[0:0];
  _RAND_12 = {1{`RANDOM}};
  PRINTBRIDGEMODULE_0_to_cpu_stream_flushBeatsToIssue = _RAND_12[12:0];
  _RAND_13 = {1{`RANDOM}};
  PRINTBRIDGEMODULE_0_to_cpu_stream_flushBeatsToAck = _RAND_13[12:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
  always @(posedge clock) begin
    //
    if (~reset) begin
      assert(PRINTBRIDGEMODULE_0_to_cpu_stream_beatsToPageBoundary > 7'h0 &
        PRINTBRIDGEMODULE_0_to_cpu_stream_beatsToPageBoundary <= 7'h40); // @[FPGAManagedStreamEngine.scala 107:13]
    end
    //
    if (_PRINTBRIDGEMODULE_0_to_cpu_stream_T_4) begin
      assert(_PRINTBRIDGEMODULE_0_to_cpu_stream_T_11); // @[FPGAManagedStreamEngine.scala 125:13]
    end
    //
    if (_PRINTBRIDGEMODULE_0_to_cpu_stream_T_4) begin
      assert(PRINTBRIDGEMODULE_0_to_cpu_stream_readCredits >= PRINTBRIDGEMODULE_0_to_cpu_stream_bytesConsumedByCPU); // @[FPGAManagedStreamEngine.scala 138:13]
    end
    //
    if (_PRINTBRIDGEMODULE_0_to_cpu_stream_T_4) begin
      assert(_PRINTBRIDGEMODULE_0_to_cpu_stream_T_22); // @[FPGAManagedStreamEngine.scala 139:13]
    end
    //
    if (_PRINTBRIDGEMODULE_0_to_cpu_stream_T_4) begin
      assert(~x1_b_valid | PRINTBRIDGEMODULE_0_to_cpu_stream_inflightBeatCounts_io_deq_valid); // @[FPGAManagedStreamEngine.scala 216:13]
    end
    //
    if (_PRINTBRIDGEMODULE_0_to_cpu_stream_T_4) begin
      assert(~crFile_io_mcr_write_2_valid); // @[Lib.scala 284:13]
    end
    //
    if (_PRINTBRIDGEMODULE_0_to_cpu_stream_T_4) begin
      assert(~crFile_io_mcr_write_6_valid); // @[Lib.scala 284:13]
    end
  end
endmodule
module AXI4IdIndexer(
  output         auto_in_aw_ready,
  input          auto_in_aw_valid,
  input          auto_in_aw_bits_id,
  input  [21:0]  auto_in_aw_bits_addr,
  input  [7:0]   auto_in_aw_bits_len,
  input  [2:0]   auto_in_aw_bits_size,
  input  [1:0]   auto_in_aw_bits_burst,
  input          auto_in_aw_bits_lock,
  input  [3:0]   auto_in_aw_bits_cache,
  input  [2:0]   auto_in_aw_bits_prot,
  input  [3:0]   auto_in_aw_bits_qos,
  output         auto_in_w_ready,
  input          auto_in_w_valid,
  input  [511:0] auto_in_w_bits_data,
  input  [63:0]  auto_in_w_bits_strb,
  input          auto_in_w_bits_last,
  input          auto_in_b_ready,
  output         auto_in_b_valid,
  output         auto_in_b_bits_id,
  output         auto_in_ar_ready,
  input          auto_in_ar_valid,
  input          auto_in_ar_bits_id,
  input  [21:0]  auto_in_ar_bits_addr,
  input  [7:0]   auto_in_ar_bits_len,
  input  [2:0]   auto_in_ar_bits_size,
  input  [1:0]   auto_in_ar_bits_burst,
  input          auto_in_ar_bits_lock,
  input  [3:0]   auto_in_ar_bits_cache,
  input  [2:0]   auto_in_ar_bits_prot,
  input  [3:0]   auto_in_ar_bits_qos,
  input          auto_in_r_ready,
  output         auto_in_r_valid,
  output         auto_in_r_bits_id,
  input          auto_out_aw_ready,
  output         auto_out_aw_valid,
  output [3:0]   auto_out_aw_bits_id,
  output [21:0]  auto_out_aw_bits_addr,
  output [7:0]   auto_out_aw_bits_len,
  output [2:0]   auto_out_aw_bits_size,
  output [1:0]   auto_out_aw_bits_burst,
  output         auto_out_aw_bits_lock,
  output [3:0]   auto_out_aw_bits_cache,
  output [2:0]   auto_out_aw_bits_prot,
  output [3:0]   auto_out_aw_bits_qos,
  input          auto_out_w_ready,
  output         auto_out_w_valid,
  output [511:0] auto_out_w_bits_data,
  output [63:0]  auto_out_w_bits_strb,
  output         auto_out_w_bits_last,
  output         auto_out_b_ready,
  input          auto_out_b_valid,
  input  [3:0]   auto_out_b_bits_id,
  input          auto_out_ar_ready,
  output         auto_out_ar_valid,
  output [3:0]   auto_out_ar_bits_id,
  output [21:0]  auto_out_ar_bits_addr,
  output [7:0]   auto_out_ar_bits_len,
  output [2:0]   auto_out_ar_bits_size,
  output [1:0]   auto_out_ar_bits_burst,
  output         auto_out_ar_bits_lock,
  output [3:0]   auto_out_ar_bits_cache,
  output [2:0]   auto_out_ar_bits_prot,
  output [3:0]   auto_out_ar_bits_qos,
  output         auto_out_r_ready,
  input          auto_out_r_valid,
  input  [3:0]   auto_out_r_bits_id
);
  assign auto_in_aw_ready = auto_out_aw_ready; // @[Nodes.scala 1212:84 LazyModule.scala 368:12]
  assign auto_in_w_ready = auto_out_w_ready; // @[Nodes.scala 1212:84 LazyModule.scala 368:12]
  assign auto_in_b_valid = auto_out_b_valid; // @[Nodes.scala 1212:84 LazyModule.scala 368:12]
  assign auto_in_b_bits_id = auto_out_b_bits_id[0]; // @[Nodes.scala 1215:84 BundleMap.scala 247:19]
  assign auto_in_ar_ready = auto_out_ar_ready; // @[Nodes.scala 1212:84 LazyModule.scala 368:12]
  assign auto_in_r_valid = auto_out_r_valid; // @[Nodes.scala 1212:84 LazyModule.scala 368:12]
  assign auto_in_r_bits_id = auto_out_r_bits_id[0]; // @[Nodes.scala 1215:84 BundleMap.scala 247:19]
  assign auto_out_aw_valid = auto_in_aw_valid; // @[Nodes.scala 1215:84 LazyModule.scala 366:16]
  assign auto_out_aw_bits_id = {{3'd0}, auto_in_aw_bits_id}; // @[Nodes.scala 1212:84 BundleMap.scala 247:19]
  assign auto_out_aw_bits_addr = auto_in_aw_bits_addr; // @[Nodes.scala 1215:84 LazyModule.scala 366:16]
  assign auto_out_aw_bits_len = auto_in_aw_bits_len; // @[Nodes.scala 1215:84 LazyModule.scala 366:16]
  assign auto_out_aw_bits_size = auto_in_aw_bits_size; // @[Nodes.scala 1215:84 LazyModule.scala 366:16]
  assign auto_out_aw_bits_burst = auto_in_aw_bits_burst; // @[Nodes.scala 1215:84 LazyModule.scala 366:16]
  assign auto_out_aw_bits_lock = auto_in_aw_bits_lock; // @[Nodes.scala 1215:84 LazyModule.scala 366:16]
  assign auto_out_aw_bits_cache = auto_in_aw_bits_cache; // @[Nodes.scala 1215:84 LazyModule.scala 366:16]
  assign auto_out_aw_bits_prot = auto_in_aw_bits_prot; // @[Nodes.scala 1215:84 LazyModule.scala 366:16]
  assign auto_out_aw_bits_qos = auto_in_aw_bits_qos; // @[Nodes.scala 1215:84 LazyModule.scala 366:16]
  assign auto_out_w_valid = auto_in_w_valid; // @[Nodes.scala 1215:84 LazyModule.scala 366:16]
  assign auto_out_w_bits_data = auto_in_w_bits_data; // @[Nodes.scala 1215:84 LazyModule.scala 366:16]
  assign auto_out_w_bits_strb = auto_in_w_bits_strb; // @[Nodes.scala 1215:84 LazyModule.scala 366:16]
  assign auto_out_w_bits_last = auto_in_w_bits_last; // @[Nodes.scala 1215:84 LazyModule.scala 366:16]
  assign auto_out_b_ready = auto_in_b_ready; // @[Nodes.scala 1215:84 LazyModule.scala 366:16]
  assign auto_out_ar_valid = auto_in_ar_valid; // @[Nodes.scala 1215:84 LazyModule.scala 366:16]
  assign auto_out_ar_bits_id = {{3'd0}, auto_in_ar_bits_id}; // @[Nodes.scala 1212:84 BundleMap.scala 247:19]
  assign auto_out_ar_bits_addr = auto_in_ar_bits_addr; // @[Nodes.scala 1215:84 LazyModule.scala 366:16]
  assign auto_out_ar_bits_len = auto_in_ar_bits_len; // @[Nodes.scala 1215:84 LazyModule.scala 366:16]
  assign auto_out_ar_bits_size = auto_in_ar_bits_size; // @[Nodes.scala 1215:84 LazyModule.scala 366:16]
  assign auto_out_ar_bits_burst = auto_in_ar_bits_burst; // @[Nodes.scala 1215:84 LazyModule.scala 366:16]
  assign auto_out_ar_bits_lock = auto_in_ar_bits_lock; // @[Nodes.scala 1215:84 LazyModule.scala 366:16]
  assign auto_out_ar_bits_cache = auto_in_ar_bits_cache; // @[Nodes.scala 1215:84 LazyModule.scala 366:16]
  assign auto_out_ar_bits_prot = auto_in_ar_bits_prot; // @[Nodes.scala 1215:84 LazyModule.scala 366:16]
  assign auto_out_ar_bits_qos = auto_in_ar_bits_qos; // @[Nodes.scala 1215:84 LazyModule.scala 366:16]
  assign auto_out_r_ready = auto_in_r_ready; // @[Nodes.scala 1215:84 LazyModule.scala 366:16]
endmodule
module ShiftQueue(
  input        clock,
  input        reset,
  output       io_enq_ready,
  input        io_enq_valid,
  input  [7:0] io_enq_bits,
  input        io_deq_ready,
  output       io_deq_valid,
  output [7:0] io_deq_bits
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
`endif // RANDOMIZE_REG_INIT
  reg  valid_0; // @[ShiftQueue.scala 21:30]
  reg  valid_1; // @[ShiftQueue.scala 21:30]
  reg [7:0] elts_0; // @[ShiftQueue.scala 22:25]
  reg [7:0] elts_1; // @[ShiftQueue.scala 22:25]
  wire  _wen_T = io_enq_ready & io_enq_valid; // @[Decoupled.scala 51:35]
  wire  _wen_T_3 = valid_1 | _wen_T; // @[ShiftQueue.scala 30:28]
  wire  _wen_T_7 = _wen_T & ~valid_0; // @[ShiftQueue.scala 31:45]
  wire  wen = io_deq_ready ? _wen_T_3 : _wen_T_7; // @[ShiftQueue.scala 29:10]
  wire  _valid_0_T_6 = _wen_T | valid_0; // @[ShiftQueue.scala 37:45]
  wire  _wen_T_10 = _wen_T & valid_1; // @[ShiftQueue.scala 30:45]
  wire  _wen_T_13 = _wen_T & valid_0; // @[ShiftQueue.scala 31:25]
  wire  _wen_T_15 = _wen_T & valid_0 & ~valid_1; // @[ShiftQueue.scala 31:45]
  wire  wen_1 = io_deq_ready ? _wen_T_10 : _wen_T_15; // @[ShiftQueue.scala 29:10]
  wire  _valid_1_T_6 = _wen_T_13 | valid_1; // @[ShiftQueue.scala 37:45]
  assign io_enq_ready = ~valid_1; // @[ShiftQueue.scala 40:19]
  assign io_deq_valid = valid_0; // @[ShiftQueue.scala 41:16]
  assign io_deq_bits = elts_0; // @[ShiftQueue.scala 42:15]
  always @(posedge clock) begin
    if (reset) begin // @[ShiftQueue.scala 21:30]
      valid_0 <= 1'h0; // @[ShiftQueue.scala 21:30]
    end else if (io_deq_ready) begin // @[ShiftQueue.scala 35:10]
      valid_0 <= _wen_T_3;
    end else begin
      valid_0 <= _valid_0_T_6;
    end
    if (reset) begin // @[ShiftQueue.scala 21:30]
      valid_1 <= 1'h0; // @[ShiftQueue.scala 21:30]
    end else if (io_deq_ready) begin // @[ShiftQueue.scala 35:10]
      valid_1 <= _wen_T_10;
    end else begin
      valid_1 <= _valid_1_T_6;
    end
    if (wen) begin // @[ShiftQueue.scala 32:16]
      if (valid_1) begin // @[ShiftQueue.scala 27:57]
        elts_0 <= elts_1;
      end else begin
        elts_0 <= io_enq_bits;
      end
    end
    if (wen_1) begin // @[ShiftQueue.scala 32:16]
      elts_1 <= io_enq_bits; // @[ShiftQueue.scala 32:26]
    end
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  valid_0 = _RAND_0[0:0];
  _RAND_1 = {1{`RANDOM}};
  valid_1 = _RAND_1[0:0];
  _RAND_2 = {1{`RANDOM}};
  elts_0 = _RAND_2[7:0];
  _RAND_3 = {1{`RANDOM}};
  elts_1 = _RAND_3[7:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module PipeChannel(
  input        clock,
  input        reset,
  output       io_in_ready,
  input        io_in_valid,
  input  [7:0] io_in_bits,
  input        io_out_ready,
  output       io_out_valid,
  output [7:0] io_out_bits
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
`endif // RANDOMIZE_REG_INIT
  wire  tokens_clock; // @[Channel.scala 30:22]
  wire  tokens_reset; // @[Channel.scala 30:22]
  wire  tokens_io_enq_ready; // @[Channel.scala 30:22]
  wire  tokens_io_enq_valid; // @[Channel.scala 30:22]
  wire [7:0] tokens_io_enq_bits; // @[Channel.scala 30:22]
  wire  tokens_io_deq_ready; // @[Channel.scala 30:22]
  wire  tokens_io_deq_valid; // @[Channel.scala 30:22]
  wire [7:0] tokens_io_deq_bits; // @[Channel.scala 30:22]
  reg  validPrev; // @[Channel.scala 53:28]
  reg [7:0] bitsPrev; // @[Channel.scala 54:28]
  reg  firePrev; // @[Channel.scala 55:28]
  wire  _T_1 = ~validPrev | firePrev; // @[Channel.scala 56:23]
  wire  _T_4 = ~reset; // @[Channel.scala 56:11]
  ShiftQueue tokens ( // @[Channel.scala 30:22]
    .clock(tokens_clock),
    .reset(tokens_reset),
    .io_enq_ready(tokens_io_enq_ready),
    .io_enq_valid(tokens_io_enq_valid),
    .io_enq_bits(tokens_io_enq_bits),
    .io_deq_ready(tokens_io_deq_ready),
    .io_deq_valid(tokens_io_deq_valid),
    .io_deq_bits(tokens_io_deq_bits)
  );
  assign io_in_ready = tokens_io_enq_ready; // @[Channel.scala 31:17]
  assign io_out_valid = tokens_io_deq_valid; // @[Channel.scala 32:10]
  assign io_out_bits = tokens_io_deq_bits; // @[Channel.scala 32:10]
  assign tokens_clock = clock;
  assign tokens_reset = reset;
  assign tokens_io_enq_valid = io_in_valid; // @[Channel.scala 31:17]
  assign tokens_io_enq_bits = io_in_bits; // @[Channel.scala 31:17]
  assign tokens_io_deq_ready = io_out_ready; // @[Channel.scala 32:10]
  always @(posedge clock) begin
    if (reset) begin // @[Channel.scala 53:28]
      validPrev <= 1'h0; // @[Channel.scala 53:28]
    end else begin
      validPrev <= io_in_valid; // @[Channel.scala 53:28]
    end
    bitsPrev <= io_in_bits; // @[Channel.scala 54:28]
    firePrev <= io_in_valid & io_in_ready; // @[Channel.scala 55:35]
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (~reset & ~(~validPrev | firePrev | io_in_valid)) begin
          $fwrite(32'h80000002,
            "Assertion failed: valid de-asserted without handshake, violating irrevocability\n    at Channel.scala:56 assert(!validPrev || firePrev || valid,\n"
            ); // @[Channel.scala 56:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_4 & ~(_T_1 | bitsPrev == io_in_bits)) begin
          $fwrite(32'h80000002,
            "Assertion failed: bits changed without handshake, violating irrevocability\n    at Channel.scala:58 assert(!validPrev || firePrev || bitsPrev.asUInt === bits.asUInt,\n"
            ); // @[Channel.scala 58:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  validPrev = _RAND_0[0:0];
  _RAND_1 = {1{`RANDOM}};
  bitsPrev = _RAND_1[7:0];
  _RAND_2 = {1{`RANDOM}};
  firePrev = _RAND_2[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
  always @(posedge clock) begin
    //
    if (~reset) begin
      assert(~validPrev | firePrev | io_in_valid); // @[Channel.scala 56:11]
    end
    //
    if (_T_4) begin
      assert(_T_1 | bitsPrev == io_in_bits); // @[Channel.scala 58:11]
    end
  end
endmodule
module ShiftQueue_1(
  input   clock,
  input   reset,
  output  io_enq_ready,
  input   io_enq_valid,
  input   io_enq_bits,
  input   io_deq_ready,
  output  io_deq_valid,
  output  io_deq_bits
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
`endif // RANDOMIZE_REG_INIT
  reg  valid_0; // @[ShiftQueue.scala 21:30]
  reg  valid_1; // @[ShiftQueue.scala 21:30]
  reg  elts_0; // @[ShiftQueue.scala 22:25]
  reg  elts_1; // @[ShiftQueue.scala 22:25]
  wire  _wen_T = io_enq_ready & io_enq_valid; // @[Decoupled.scala 51:35]
  wire  _wen_T_3 = valid_1 | _wen_T; // @[ShiftQueue.scala 30:28]
  wire  _wen_T_7 = _wen_T & ~valid_0; // @[ShiftQueue.scala 31:45]
  wire  wen = io_deq_ready ? _wen_T_3 : _wen_T_7; // @[ShiftQueue.scala 29:10]
  wire  _valid_0_T_6 = _wen_T | valid_0; // @[ShiftQueue.scala 37:45]
  wire  _wen_T_10 = _wen_T & valid_1; // @[ShiftQueue.scala 30:45]
  wire  _wen_T_13 = _wen_T & valid_0; // @[ShiftQueue.scala 31:25]
  wire  _wen_T_15 = _wen_T & valid_0 & ~valid_1; // @[ShiftQueue.scala 31:45]
  wire  wen_1 = io_deq_ready ? _wen_T_10 : _wen_T_15; // @[ShiftQueue.scala 29:10]
  wire  _valid_1_T_6 = _wen_T_13 | valid_1; // @[ShiftQueue.scala 37:45]
  assign io_enq_ready = ~valid_1; // @[ShiftQueue.scala 40:19]
  assign io_deq_valid = valid_0; // @[ShiftQueue.scala 41:16]
  assign io_deq_bits = elts_0; // @[ShiftQueue.scala 42:15]
  always @(posedge clock) begin
    if (reset) begin // @[ShiftQueue.scala 21:30]
      valid_0 <= 1'h0; // @[ShiftQueue.scala 21:30]
    end else if (io_deq_ready) begin // @[ShiftQueue.scala 35:10]
      valid_0 <= _wen_T_3;
    end else begin
      valid_0 <= _valid_0_T_6;
    end
    if (reset) begin // @[ShiftQueue.scala 21:30]
      valid_1 <= 1'h0; // @[ShiftQueue.scala 21:30]
    end else if (io_deq_ready) begin // @[ShiftQueue.scala 35:10]
      valid_1 <= _wen_T_10;
    end else begin
      valid_1 <= _valid_1_T_6;
    end
    if (wen) begin // @[ShiftQueue.scala 32:16]
      if (valid_1) begin // @[ShiftQueue.scala 27:57]
        elts_0 <= elts_1;
      end else begin
        elts_0 <= io_enq_bits;
      end
    end
    if (wen_1) begin // @[ShiftQueue.scala 32:16]
      elts_1 <= io_enq_bits; // @[ShiftQueue.scala 32:26]
    end
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  valid_0 = _RAND_0[0:0];
  _RAND_1 = {1{`RANDOM}};
  valid_1 = _RAND_1[0:0];
  _RAND_2 = {1{`RANDOM}};
  elts_0 = _RAND_2[0:0];
  _RAND_3 = {1{`RANDOM}};
  elts_1 = _RAND_3[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module PipeChannel_1(
  input   clock,
  input   reset,
  output  io_in_ready,
  input   io_in_valid,
  input   io_in_bits,
  input   io_out_ready,
  output  io_out_valid,
  output  io_out_bits
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
`endif // RANDOMIZE_REG_INIT
  wire  tokens_clock; // @[Channel.scala 30:22]
  wire  tokens_reset; // @[Channel.scala 30:22]
  wire  tokens_io_enq_ready; // @[Channel.scala 30:22]
  wire  tokens_io_enq_valid; // @[Channel.scala 30:22]
  wire  tokens_io_enq_bits; // @[Channel.scala 30:22]
  wire  tokens_io_deq_ready; // @[Channel.scala 30:22]
  wire  tokens_io_deq_valid; // @[Channel.scala 30:22]
  wire  tokens_io_deq_bits; // @[Channel.scala 30:22]
  reg  validPrev; // @[Channel.scala 53:28]
  reg  bitsPrev; // @[Channel.scala 54:28]
  reg  firePrev; // @[Channel.scala 55:28]
  wire  _T_1 = ~validPrev | firePrev; // @[Channel.scala 56:23]
  wire  _T_4 = ~reset; // @[Channel.scala 56:11]
  ShiftQueue_1 tokens ( // @[Channel.scala 30:22]
    .clock(tokens_clock),
    .reset(tokens_reset),
    .io_enq_ready(tokens_io_enq_ready),
    .io_enq_valid(tokens_io_enq_valid),
    .io_enq_bits(tokens_io_enq_bits),
    .io_deq_ready(tokens_io_deq_ready),
    .io_deq_valid(tokens_io_deq_valid),
    .io_deq_bits(tokens_io_deq_bits)
  );
  assign io_in_ready = tokens_io_enq_ready; // @[Channel.scala 31:17]
  assign io_out_valid = tokens_io_deq_valid; // @[Channel.scala 32:10]
  assign io_out_bits = tokens_io_deq_bits; // @[Channel.scala 32:10]
  assign tokens_clock = clock;
  assign tokens_reset = reset;
  assign tokens_io_enq_valid = io_in_valid; // @[Channel.scala 31:17]
  assign tokens_io_enq_bits = io_in_bits; // @[Channel.scala 31:17]
  assign tokens_io_deq_ready = io_out_ready; // @[Channel.scala 32:10]
  always @(posedge clock) begin
    if (reset) begin // @[Channel.scala 53:28]
      validPrev <= 1'h0; // @[Channel.scala 53:28]
    end else begin
      validPrev <= io_in_valid; // @[Channel.scala 53:28]
    end
    bitsPrev <= io_in_bits; // @[Channel.scala 54:28]
    firePrev <= io_in_valid & io_in_ready; // @[Channel.scala 55:35]
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (~reset & ~(~validPrev | firePrev | io_in_valid)) begin
          $fwrite(32'h80000002,
            "Assertion failed: valid de-asserted without handshake, violating irrevocability\n    at Channel.scala:56 assert(!validPrev || firePrev || valid,\n"
            ); // @[Channel.scala 56:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_4 & ~(_T_1 | bitsPrev == io_in_bits)) begin
          $fwrite(32'h80000002,
            "Assertion failed: bits changed without handshake, violating irrevocability\n    at Channel.scala:58 assert(!validPrev || firePrev || bitsPrev.asUInt === bits.asUInt,\n"
            ); // @[Channel.scala 58:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  validPrev = _RAND_0[0:0];
  _RAND_1 = {1{`RANDOM}};
  bitsPrev = _RAND_1[0:0];
  _RAND_2 = {1{`RANDOM}};
  firePrev = _RAND_2[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
  always @(posedge clock) begin
    //
    if (~reset) begin
      assert(~validPrev | firePrev | io_in_valid); // @[Channel.scala 56:11]
    end
    //
    if (_T_4) begin
      assert(_T_1 | bitsPrev == io_in_bits); // @[Channel.scala 58:11]
    end
  end
endmodule
module ShiftQueue_3(
  input         clock,
  input         reset,
  output        io_enq_ready,
  input         io_enq_valid,
  input  [15:0] io_enq_bits,
  input         io_deq_ready,
  output        io_deq_valid,
  output [15:0] io_deq_bits
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
`endif // RANDOMIZE_REG_INIT
  reg  valid_0; // @[ShiftQueue.scala 21:30]
  reg  valid_1; // @[ShiftQueue.scala 21:30]
  reg [15:0] elts_0; // @[ShiftQueue.scala 22:25]
  reg [15:0] elts_1; // @[ShiftQueue.scala 22:25]
  wire  _wen_T = io_enq_ready & io_enq_valid; // @[Decoupled.scala 51:35]
  wire  _wen_T_3 = valid_1 | _wen_T; // @[ShiftQueue.scala 30:28]
  wire  _wen_T_7 = _wen_T & ~valid_0; // @[ShiftQueue.scala 31:45]
  wire  wen = io_deq_ready ? _wen_T_3 : _wen_T_7; // @[ShiftQueue.scala 29:10]
  wire  _valid_0_T_6 = _wen_T | valid_0; // @[ShiftQueue.scala 37:45]
  wire  _wen_T_10 = _wen_T & valid_1; // @[ShiftQueue.scala 30:45]
  wire  _wen_T_13 = _wen_T & valid_0; // @[ShiftQueue.scala 31:25]
  wire  _wen_T_15 = _wen_T & valid_0 & ~valid_1; // @[ShiftQueue.scala 31:45]
  wire  wen_1 = io_deq_ready ? _wen_T_10 : _wen_T_15; // @[ShiftQueue.scala 29:10]
  wire  _valid_1_T_6 = _wen_T_13 | valid_1; // @[ShiftQueue.scala 37:45]
  assign io_enq_ready = ~valid_1; // @[ShiftQueue.scala 40:19]
  assign io_deq_valid = valid_0; // @[ShiftQueue.scala 41:16]
  assign io_deq_bits = elts_0; // @[ShiftQueue.scala 42:15]
  always @(posedge clock) begin
    if (reset) begin // @[ShiftQueue.scala 21:30]
      valid_0 <= 1'h0; // @[ShiftQueue.scala 21:30]
    end else if (io_deq_ready) begin // @[ShiftQueue.scala 35:10]
      valid_0 <= _wen_T_3;
    end else begin
      valid_0 <= _valid_0_T_6;
    end
    if (reset) begin // @[ShiftQueue.scala 21:30]
      valid_1 <= 1'h0; // @[ShiftQueue.scala 21:30]
    end else if (io_deq_ready) begin // @[ShiftQueue.scala 35:10]
      valid_1 <= _wen_T_10;
    end else begin
      valid_1 <= _valid_1_T_6;
    end
    if (wen) begin // @[ShiftQueue.scala 32:16]
      if (valid_1) begin // @[ShiftQueue.scala 27:57]
        elts_0 <= elts_1;
      end else begin
        elts_0 <= io_enq_bits;
      end
    end
    if (wen_1) begin // @[ShiftQueue.scala 32:16]
      elts_1 <= io_enq_bits; // @[ShiftQueue.scala 32:26]
    end
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  valid_0 = _RAND_0[0:0];
  _RAND_1 = {1{`RANDOM}};
  valid_1 = _RAND_1[0:0];
  _RAND_2 = {1{`RANDOM}};
  elts_0 = _RAND_2[15:0];
  _RAND_3 = {1{`RANDOM}};
  elts_1 = _RAND_3[15:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module PipeChannel_3(
  input         clock,
  input         reset,
  output        io_in_ready,
  input         io_in_valid,
  input  [15:0] io_in_bits,
  input         io_out_ready,
  output        io_out_valid,
  output [15:0] io_out_bits
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
`endif // RANDOMIZE_REG_INIT
  wire  tokens_clock; // @[Channel.scala 30:22]
  wire  tokens_reset; // @[Channel.scala 30:22]
  wire  tokens_io_enq_ready; // @[Channel.scala 30:22]
  wire  tokens_io_enq_valid; // @[Channel.scala 30:22]
  wire [15:0] tokens_io_enq_bits; // @[Channel.scala 30:22]
  wire  tokens_io_deq_ready; // @[Channel.scala 30:22]
  wire  tokens_io_deq_valid; // @[Channel.scala 30:22]
  wire [15:0] tokens_io_deq_bits; // @[Channel.scala 30:22]
  reg  validPrev; // @[Channel.scala 53:28]
  reg [15:0] bitsPrev; // @[Channel.scala 54:28]
  reg  firePrev; // @[Channel.scala 55:28]
  wire  _T_1 = ~validPrev | firePrev; // @[Channel.scala 56:23]
  wire  _T_4 = ~reset; // @[Channel.scala 56:11]
  ShiftQueue_3 tokens ( // @[Channel.scala 30:22]
    .clock(tokens_clock),
    .reset(tokens_reset),
    .io_enq_ready(tokens_io_enq_ready),
    .io_enq_valid(tokens_io_enq_valid),
    .io_enq_bits(tokens_io_enq_bits),
    .io_deq_ready(tokens_io_deq_ready),
    .io_deq_valid(tokens_io_deq_valid),
    .io_deq_bits(tokens_io_deq_bits)
  );
  assign io_in_ready = tokens_io_enq_ready; // @[Channel.scala 31:17]
  assign io_out_valid = tokens_io_deq_valid; // @[Channel.scala 32:10]
  assign io_out_bits = tokens_io_deq_bits; // @[Channel.scala 32:10]
  assign tokens_clock = clock;
  assign tokens_reset = reset;
  assign tokens_io_enq_valid = io_in_valid; // @[Channel.scala 31:17]
  assign tokens_io_enq_bits = io_in_bits; // @[Channel.scala 31:17]
  assign tokens_io_deq_ready = io_out_ready; // @[Channel.scala 32:10]
  always @(posedge clock) begin
    if (reset) begin // @[Channel.scala 53:28]
      validPrev <= 1'h0; // @[Channel.scala 53:28]
    end else begin
      validPrev <= io_in_valid; // @[Channel.scala 53:28]
    end
    bitsPrev <= io_in_bits; // @[Channel.scala 54:28]
    firePrev <= io_in_valid & io_in_ready; // @[Channel.scala 55:35]
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (~reset & ~(~validPrev | firePrev | io_in_valid)) begin
          $fwrite(32'h80000002,
            "Assertion failed: valid de-asserted without handshake, violating irrevocability\n    at Channel.scala:56 assert(!validPrev || firePrev || valid,\n"
            ); // @[Channel.scala 56:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_4 & ~(_T_1 | bitsPrev == io_in_bits)) begin
          $fwrite(32'h80000002,
            "Assertion failed: bits changed without handshake, violating irrevocability\n    at Channel.scala:58 assert(!validPrev || firePrev || bitsPrev.asUInt === bits.asUInt,\n"
            ); // @[Channel.scala 58:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  validPrev = _RAND_0[0:0];
  _RAND_1 = {1{`RANDOM}};
  bitsPrev = _RAND_1[15:0];
  _RAND_2 = {1{`RANDOM}};
  firePrev = _RAND_2[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
  always @(posedge clock) begin
    //
    if (~reset) begin
      assert(~validPrev | firePrev | io_in_valid); // @[Channel.scala 56:11]
    end
    //
    if (_T_4) begin
      assert(_T_1 | bitsPrev == io_in_bits); // @[Channel.scala 58:11]
    end
  end
endmodule
module ShiftQueue_13(
  input          clock,
  input          reset,
  output         io_enq_ready,
  input          io_enq_valid,
  input  [527:0] io_enq_bits,
  input          io_deq_ready,
  output         io_deq_valid,
  output [527:0] io_deq_bits
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [543:0] _RAND_2;
  reg [543:0] _RAND_3;
`endif // RANDOMIZE_REG_INIT
  reg  valid_0; // @[ShiftQueue.scala 21:30]
  reg  valid_1; // @[ShiftQueue.scala 21:30]
  reg [527:0] elts_0; // @[ShiftQueue.scala 22:25]
  reg [527:0] elts_1; // @[ShiftQueue.scala 22:25]
  wire  _wen_T = io_enq_ready & io_enq_valid; // @[Decoupled.scala 51:35]
  wire  _wen_T_3 = valid_1 | _wen_T; // @[ShiftQueue.scala 30:28]
  wire  _wen_T_7 = _wen_T & ~valid_0; // @[ShiftQueue.scala 31:45]
  wire  wen = io_deq_ready ? _wen_T_3 : _wen_T_7; // @[ShiftQueue.scala 29:10]
  wire  _valid_0_T_6 = _wen_T | valid_0; // @[ShiftQueue.scala 37:45]
  wire  _wen_T_10 = _wen_T & valid_1; // @[ShiftQueue.scala 30:45]
  wire  _wen_T_13 = _wen_T & valid_0; // @[ShiftQueue.scala 31:25]
  wire  _wen_T_15 = _wen_T & valid_0 & ~valid_1; // @[ShiftQueue.scala 31:45]
  wire  wen_1 = io_deq_ready ? _wen_T_10 : _wen_T_15; // @[ShiftQueue.scala 29:10]
  wire  _valid_1_T_6 = _wen_T_13 | valid_1; // @[ShiftQueue.scala 37:45]
  assign io_enq_ready = ~valid_1; // @[ShiftQueue.scala 40:19]
  assign io_deq_valid = valid_0; // @[ShiftQueue.scala 41:16]
  assign io_deq_bits = elts_0; // @[ShiftQueue.scala 42:15]
  always @(posedge clock) begin
    if (reset) begin // @[ShiftQueue.scala 21:30]
      valid_0 <= 1'h0; // @[ShiftQueue.scala 21:30]
    end else if (io_deq_ready) begin // @[ShiftQueue.scala 35:10]
      valid_0 <= _wen_T_3;
    end else begin
      valid_0 <= _valid_0_T_6;
    end
    if (reset) begin // @[ShiftQueue.scala 21:30]
      valid_1 <= 1'h0; // @[ShiftQueue.scala 21:30]
    end else if (io_deq_ready) begin // @[ShiftQueue.scala 35:10]
      valid_1 <= _wen_T_10;
    end else begin
      valid_1 <= _valid_1_T_6;
    end
    if (wen) begin // @[ShiftQueue.scala 32:16]
      if (valid_1) begin // @[ShiftQueue.scala 27:57]
        elts_0 <= elts_1;
      end else begin
        elts_0 <= io_enq_bits;
      end
    end
    if (wen_1) begin // @[ShiftQueue.scala 32:16]
      elts_1 <= io_enq_bits; // @[ShiftQueue.scala 32:26]
    end
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  valid_0 = _RAND_0[0:0];
  _RAND_1 = {1{`RANDOM}};
  valid_1 = _RAND_1[0:0];
  _RAND_2 = {17{`RANDOM}};
  elts_0 = _RAND_2[527:0];
  _RAND_3 = {17{`RANDOM}};
  elts_1 = _RAND_3[527:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module PipeChannel_13(
  input          clock,
  input          reset,
  output         io_in_ready,
  input          io_in_valid,
  input  [527:0] io_in_bits,
  input          io_out_ready,
  output         io_out_valid,
  output [527:0] io_out_bits
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [543:0] _RAND_1;
  reg [31:0] _RAND_2;
`endif // RANDOMIZE_REG_INIT
  wire  tokens_clock; // @[Channel.scala 30:22]
  wire  tokens_reset; // @[Channel.scala 30:22]
  wire  tokens_io_enq_ready; // @[Channel.scala 30:22]
  wire  tokens_io_enq_valid; // @[Channel.scala 30:22]
  wire [527:0] tokens_io_enq_bits; // @[Channel.scala 30:22]
  wire  tokens_io_deq_ready; // @[Channel.scala 30:22]
  wire  tokens_io_deq_valid; // @[Channel.scala 30:22]
  wire [527:0] tokens_io_deq_bits; // @[Channel.scala 30:22]
  reg  validPrev; // @[Channel.scala 53:28]
  reg [527:0] bitsPrev; // @[Channel.scala 54:28]
  reg  firePrev; // @[Channel.scala 55:28]
  wire  _T_1 = ~validPrev | firePrev; // @[Channel.scala 56:23]
  wire  _T_4 = ~reset; // @[Channel.scala 56:11]
  ShiftQueue_13 tokens ( // @[Channel.scala 30:22]
    .clock(tokens_clock),
    .reset(tokens_reset),
    .io_enq_ready(tokens_io_enq_ready),
    .io_enq_valid(tokens_io_enq_valid),
    .io_enq_bits(tokens_io_enq_bits),
    .io_deq_ready(tokens_io_deq_ready),
    .io_deq_valid(tokens_io_deq_valid),
    .io_deq_bits(tokens_io_deq_bits)
  );
  assign io_in_ready = tokens_io_enq_ready; // @[Channel.scala 31:17]
  assign io_out_valid = tokens_io_deq_valid; // @[Channel.scala 32:10]
  assign io_out_bits = tokens_io_deq_bits; // @[Channel.scala 32:10]
  assign tokens_clock = clock;
  assign tokens_reset = reset;
  assign tokens_io_enq_valid = io_in_valid; // @[Channel.scala 31:17]
  assign tokens_io_enq_bits = io_in_bits; // @[Channel.scala 31:17]
  assign tokens_io_deq_ready = io_out_ready; // @[Channel.scala 32:10]
  always @(posedge clock) begin
    if (reset) begin // @[Channel.scala 53:28]
      validPrev <= 1'h0; // @[Channel.scala 53:28]
    end else begin
      validPrev <= io_in_valid; // @[Channel.scala 53:28]
    end
    bitsPrev <= io_in_bits; // @[Channel.scala 54:28]
    firePrev <= io_in_valid & io_in_ready; // @[Channel.scala 55:35]
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (~reset & ~(~validPrev | firePrev | io_in_valid)) begin
          $fwrite(32'h80000002,
            "Assertion failed: valid de-asserted without handshake, violating irrevocability\n    at Channel.scala:56 assert(!validPrev || firePrev || valid,\n"
            ); // @[Channel.scala 56:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_4 & ~(_T_1 | bitsPrev == io_in_bits)) begin
          $fwrite(32'h80000002,
            "Assertion failed: bits changed without handshake, violating irrevocability\n    at Channel.scala:58 assert(!validPrev || firePrev || bitsPrev.asUInt === bits.asUInt,\n"
            ); // @[Channel.scala 58:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  validPrev = _RAND_0[0:0];
  _RAND_1 = {17{`RANDOM}};
  bitsPrev = _RAND_1[527:0];
  _RAND_2 = {1{`RANDOM}};
  firePrev = _RAND_2[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
  always @(posedge clock) begin
    //
    if (~reset) begin
      assert(~validPrev | firePrev | io_in_valid); // @[Channel.scala 56:11]
    end
    //
    if (_T_4) begin
      assert(_T_1 | bitsPrev == io_in_bits); // @[Channel.scala 58:11]
    end
  end
endmodule
module SimWrapper(
  input          clock,
  input          reset,
  input          channelPorts_PrintfModule_synthesizedPrintf_dut_printf_1_wire_args_1_source_ready,
  output         channelPorts_PrintfModule_synthesizedPrintf_dut_printf_1_wire_args_1_source_valid,
  output [527:0] channelPorts_PrintfModule_synthesizedPrintf_dut_printf_1_wire_args_1_source_bits,
  input          channelPorts_PrintfModule_synthesizedPrintf_dut_printf_1_wire_args_0_source_ready,
  output         channelPorts_PrintfModule_synthesizedPrintf_dut_printf_1_wire_args_0_source_valid,
  output [15:0]  channelPorts_PrintfModule_synthesizedPrintf_dut_printf_1_wire_args_0_source_bits,
  input          channelPorts_PrintfModule_synthesizedPrintf_dut_printf_1_wire_enable_source_ready,
  output         channelPorts_PrintfModule_synthesizedPrintf_dut_printf_1_wire_enable_source_valid,
  output         channelPorts_PrintfModule_synthesizedPrintf_dut_printf_1_wire_enable_source_bits,
  input          channelPorts_PrintfModule_synthesizedPrintf_dut_printf_2_wire_args_1_source_ready,
  output         channelPorts_PrintfModule_synthesizedPrintf_dut_printf_2_wire_args_1_source_valid,
  output [7:0]   channelPorts_PrintfModule_synthesizedPrintf_dut_printf_2_wire_args_1_source_bits,
  input          channelPorts_PrintfModule_synthesizedPrintf_dut_printf_2_wire_args_0_source_ready,
  output         channelPorts_PrintfModule_synthesizedPrintf_dut_printf_2_wire_args_0_source_valid,
  output [15:0]  channelPorts_PrintfModule_synthesizedPrintf_dut_printf_2_wire_args_0_source_bits,
  input          channelPorts_PrintfModule_synthesizedPrintf_dut_printf_2_wire_enable_source_ready,
  output         channelPorts_PrintfModule_synthesizedPrintf_dut_printf_2_wire_enable_source_valid,
  output         channelPorts_PrintfModule_synthesizedPrintf_dut_printf_2_wire_enable_source_bits,
  input          channelPorts_PrintfModule_synthesizedPrintf_dut_childInst_printf_wire_args_1_source_ready,
  output         channelPorts_PrintfModule_synthesizedPrintf_dut_childInst_printf_wire_args_1_source_valid,
  output [15:0]  channelPorts_PrintfModule_synthesizedPrintf_dut_childInst_printf_wire_args_1_source_bits,
  input          channelPorts_PrintfModule_synthesizedPrintf_dut_childInst_printf_wire_args_0_source_ready,
  output         channelPorts_PrintfModule_synthesizedPrintf_dut_childInst_printf_wire_args_0_source_valid,
  output [15:0]  channelPorts_PrintfModule_synthesizedPrintf_dut_childInst_printf_wire_args_0_source_bits,
  input          channelPorts_PrintfModule_synthesizedPrintf_dut_childInst_printf_wire_enable_source_ready,
  output         channelPorts_PrintfModule_synthesizedPrintf_dut_childInst_printf_wire_enable_source_valid,
  output         channelPorts_PrintfModule_synthesizedPrintf_dut_childInst_printf_wire_enable_source_bits,
  input          channelPorts_PrintfModule_synthesizedPrintf_dut_printf_wire_args_0_source_ready,
  output         channelPorts_PrintfModule_synthesizedPrintf_dut_printf_wire_args_0_source_valid,
  output [15:0]  channelPorts_PrintfModule_synthesizedPrintf_dut_printf_wire_args_0_source_bits,
  input          channelPorts_PrintfModule_synthesizedPrintf_dut_printf_wire_enable_source_ready,
  output         channelPorts_PrintfModule_synthesizedPrintf_dut_printf_wire_enable_source_valid,
  output         channelPorts_PrintfModule_synthesizedPrintf_dut_printf_wire_enable_source_bits,
  input          channelPorts_PrintfModule_synthesizedPrintf_RationalClockBridge_clocks_0_globalReset_source_ready,
  output         channelPorts_PrintfModule_synthesizedPrintf_RationalClockBridge_clocks_0_globalReset_source_valid,
  output         channelPorts_PrintfModule_synthesizedPrintf_RationalClockBridge_clocks_0_globalReset_source_bits,
  output         channelPorts_PrintfModule_peekPokeBridge_io_a_sink_ready,
  input          channelPorts_PrintfModule_peekPokeBridge_io_a_sink_valid,
  input          channelPorts_PrintfModule_peekPokeBridge_io_a_sink_bits,
  output         channelPorts_PrintfModule_peekPokeBridge_io_b_sink_ready,
  input          channelPorts_PrintfModule_peekPokeBridge_io_b_sink_valid,
  input          channelPorts_PrintfModule_peekPokeBridge_io_b_sink_bits,
  output         channelPorts_PrintfModule_peekPokeBridge_reset_sink_ready,
  input          channelPorts_PrintfModule_peekPokeBridge_reset_sink_valid,
  input          channelPorts_PrintfModule_peekPokeBridge_reset_sink_bits,
  output         channelPorts_PrintfModule_RationalClockBridge_clocks_0_sink_ready
);
  wire  target_hostClock; // @[SimWrapper.scala 257:22]
  wire  target_hostReset; // @[SimWrapper.scala 257:22]
  wire  target_PrintfModule_RationalClockBridge_clocks_0_sink_ready; // @[SimWrapper.scala 257:22]
  wire  target_PrintfModule_RationalClockBridge_clocks_0_sink_bits; // @[SimWrapper.scala 257:22]
  wire  target_PrintfModule_peekPokeBridge_reset_sink_ready; // @[SimWrapper.scala 257:22]
  wire  target_PrintfModule_peekPokeBridge_reset_sink_valid; // @[SimWrapper.scala 257:22]
  wire  target_PrintfModule_peekPokeBridge_reset_sink_bits; // @[SimWrapper.scala 257:22]
  wire  target_PrintfModule_peekPokeBridge_io_b_sink_ready; // @[SimWrapper.scala 257:22]
  wire  target_PrintfModule_peekPokeBridge_io_b_sink_valid; // @[SimWrapper.scala 257:22]
  wire  target_PrintfModule_peekPokeBridge_io_a_sink_ready; // @[SimWrapper.scala 257:22]
  wire  target_PrintfModule_peekPokeBridge_io_a_sink_valid; // @[SimWrapper.scala 257:22]
  wire  target_PrintfModule_peekPokeBridge_io_a_sink_bits; // @[SimWrapper.scala 257:22]
  wire  target_PrintfModule_synthesizedPrintf_RationalClockBridge_clocks_0_globalReset_source_ready; // @[SimWrapper.scala 257:22]
  wire  target_PrintfModule_synthesizedPrintf_RationalClockBridge_clocks_0_globalReset_source_valid; // @[SimWrapper.scala 257:22]
  wire  target_PrintfModule_synthesizedPrintf_dut_printf_wire_enable_source_ready; // @[SimWrapper.scala 257:22]
  wire  target_PrintfModule_synthesizedPrintf_dut_printf_wire_enable_source_valid; // @[SimWrapper.scala 257:22]
  wire  target_PrintfModule_synthesizedPrintf_dut_printf_wire_enable_source_bits; // @[SimWrapper.scala 257:22]
  wire  target_PrintfModule_synthesizedPrintf_dut_printf_wire_args_0_source_ready; // @[SimWrapper.scala 257:22]
  wire  target_PrintfModule_synthesizedPrintf_dut_printf_wire_args_0_source_valid; // @[SimWrapper.scala 257:22]
  wire [15:0] target_PrintfModule_synthesizedPrintf_dut_printf_wire_args_0_source_bits; // @[SimWrapper.scala 257:22]
  wire  target_PrintfModule_synthesizedPrintf_dut_childInst_printf_wire_enable_source_ready; // @[SimWrapper.scala 257:22]
  wire  target_PrintfModule_synthesizedPrintf_dut_childInst_printf_wire_enable_source_valid; // @[SimWrapper.scala 257:22]
  wire  target_PrintfModule_synthesizedPrintf_dut_childInst_printf_wire_enable_source_bits; // @[SimWrapper.scala 257:22]
  wire  target_PrintfModule_synthesizedPrintf_dut_childInst_printf_wire_args_0_source_ready; // @[SimWrapper.scala 257:22]
  wire  target_PrintfModule_synthesizedPrintf_dut_childInst_printf_wire_args_0_source_valid; // @[SimWrapper.scala 257:22]
  wire [15:0] target_PrintfModule_synthesizedPrintf_dut_childInst_printf_wire_args_0_source_bits; // @[SimWrapper.scala 257:22]
  wire  target_PrintfModule_synthesizedPrintf_dut_childInst_printf_wire_args_1_source_ready; // @[SimWrapper.scala 257:22]
  wire  target_PrintfModule_synthesizedPrintf_dut_childInst_printf_wire_args_1_source_valid; // @[SimWrapper.scala 257:22]
  wire [15:0] target_PrintfModule_synthesizedPrintf_dut_childInst_printf_wire_args_1_source_bits; // @[SimWrapper.scala 257:22]
  wire  target_PrintfModule_synthesizedPrintf_dut_printf_2_wire_enable_source_ready; // @[SimWrapper.scala 257:22]
  wire  target_PrintfModule_synthesizedPrintf_dut_printf_2_wire_enable_source_valid; // @[SimWrapper.scala 257:22]
  wire  target_PrintfModule_synthesizedPrintf_dut_printf_2_wire_enable_source_bits; // @[SimWrapper.scala 257:22]
  wire  target_PrintfModule_synthesizedPrintf_dut_printf_2_wire_args_0_source_ready; // @[SimWrapper.scala 257:22]
  wire  target_PrintfModule_synthesizedPrintf_dut_printf_2_wire_args_0_source_valid; // @[SimWrapper.scala 257:22]
  wire [15:0] target_PrintfModule_synthesizedPrintf_dut_printf_2_wire_args_0_source_bits; // @[SimWrapper.scala 257:22]
  wire  target_PrintfModule_synthesizedPrintf_dut_printf_2_wire_args_1_source_ready; // @[SimWrapper.scala 257:22]
  wire  target_PrintfModule_synthesizedPrintf_dut_printf_2_wire_args_1_source_valid; // @[SimWrapper.scala 257:22]
  wire [7:0] target_PrintfModule_synthesizedPrintf_dut_printf_2_wire_args_1_source_bits; // @[SimWrapper.scala 257:22]
  wire  target_PrintfModule_synthesizedPrintf_dut_printf_1_wire_enable_source_ready; // @[SimWrapper.scala 257:22]
  wire  target_PrintfModule_synthesizedPrintf_dut_printf_1_wire_enable_source_valid; // @[SimWrapper.scala 257:22]
  wire  target_PrintfModule_synthesizedPrintf_dut_printf_1_wire_enable_source_bits; // @[SimWrapper.scala 257:22]
  wire  target_PrintfModule_synthesizedPrintf_dut_printf_1_wire_args_0_source_ready; // @[SimWrapper.scala 257:22]
  wire  target_PrintfModule_synthesizedPrintf_dut_printf_1_wire_args_0_source_valid; // @[SimWrapper.scala 257:22]
  wire [15:0] target_PrintfModule_synthesizedPrintf_dut_printf_1_wire_args_0_source_bits; // @[SimWrapper.scala 257:22]
  wire  target_PrintfModule_synthesizedPrintf_dut_printf_1_wire_args_1_source_ready; // @[SimWrapper.scala 257:22]
  wire  target_PrintfModule_synthesizedPrintf_dut_printf_1_wire_args_1_source_valid; // @[SimWrapper.scala 257:22]
  wire [527:0] target_PrintfModule_synthesizedPrintf_dut_printf_1_wire_args_1_source_bits; // @[SimWrapper.scala 257:22]
  wire  PipeChannel_synthesizedPrintf_dut_printf_2_wire_args_1_clock; // @[SimWrapper.scala 289:27]
  wire  PipeChannel_synthesizedPrintf_dut_printf_2_wire_args_1_reset; // @[SimWrapper.scala 289:27]
  wire  PipeChannel_synthesizedPrintf_dut_printf_2_wire_args_1_io_in_ready; // @[SimWrapper.scala 289:27]
  wire  PipeChannel_synthesizedPrintf_dut_printf_2_wire_args_1_io_in_valid; // @[SimWrapper.scala 289:27]
  wire [7:0] PipeChannel_synthesizedPrintf_dut_printf_2_wire_args_1_io_in_bits; // @[SimWrapper.scala 289:27]
  wire  PipeChannel_synthesizedPrintf_dut_printf_2_wire_args_1_io_out_ready; // @[SimWrapper.scala 289:27]
  wire  PipeChannel_synthesizedPrintf_dut_printf_2_wire_args_1_io_out_valid; // @[SimWrapper.scala 289:27]
  wire [7:0] PipeChannel_synthesizedPrintf_dut_printf_2_wire_args_1_io_out_bits; // @[SimWrapper.scala 289:27]
  wire  PipeChannel_peekPokeBridge_io_b_clock; // @[SimWrapper.scala 289:27]
  wire  PipeChannel_peekPokeBridge_io_b_reset; // @[SimWrapper.scala 289:27]
  wire  PipeChannel_peekPokeBridge_io_b_io_in_ready; // @[SimWrapper.scala 289:27]
  wire  PipeChannel_peekPokeBridge_io_b_io_in_valid; // @[SimWrapper.scala 289:27]
  wire  PipeChannel_peekPokeBridge_io_b_io_in_bits; // @[SimWrapper.scala 289:27]
  wire  PipeChannel_peekPokeBridge_io_b_io_out_ready; // @[SimWrapper.scala 289:27]
  wire  PipeChannel_peekPokeBridge_io_b_io_out_valid; // @[SimWrapper.scala 289:27]
  wire  PipeChannel_peekPokeBridge_io_b_io_out_bits; // @[SimWrapper.scala 289:27]
  wire  PipeChannel_synthesizedPrintf_dut_printf_2_wire_enable_clock; // @[SimWrapper.scala 289:27]
  wire  PipeChannel_synthesizedPrintf_dut_printf_2_wire_enable_reset; // @[SimWrapper.scala 289:27]
  wire  PipeChannel_synthesizedPrintf_dut_printf_2_wire_enable_io_in_ready; // @[SimWrapper.scala 289:27]
  wire  PipeChannel_synthesizedPrintf_dut_printf_2_wire_enable_io_in_valid; // @[SimWrapper.scala 289:27]
  wire  PipeChannel_synthesizedPrintf_dut_printf_2_wire_enable_io_in_bits; // @[SimWrapper.scala 289:27]
  wire  PipeChannel_synthesizedPrintf_dut_printf_2_wire_enable_io_out_ready; // @[SimWrapper.scala 289:27]
  wire  PipeChannel_synthesizedPrintf_dut_printf_2_wire_enable_io_out_valid; // @[SimWrapper.scala 289:27]
  wire  PipeChannel_synthesizedPrintf_dut_printf_2_wire_enable_io_out_bits; // @[SimWrapper.scala 289:27]
  wire  PipeChannel_synthesizedPrintf_dut_printf_2_wire_args_0_clock; // @[SimWrapper.scala 289:27]
  wire  PipeChannel_synthesizedPrintf_dut_printf_2_wire_args_0_reset; // @[SimWrapper.scala 289:27]
  wire  PipeChannel_synthesizedPrintf_dut_printf_2_wire_args_0_io_in_ready; // @[SimWrapper.scala 289:27]
  wire  PipeChannel_synthesizedPrintf_dut_printf_2_wire_args_0_io_in_valid; // @[SimWrapper.scala 289:27]
  wire [15:0] PipeChannel_synthesizedPrintf_dut_printf_2_wire_args_0_io_in_bits; // @[SimWrapper.scala 289:27]
  wire  PipeChannel_synthesizedPrintf_dut_printf_2_wire_args_0_io_out_ready; // @[SimWrapper.scala 289:27]
  wire  PipeChannel_synthesizedPrintf_dut_printf_2_wire_args_0_io_out_valid; // @[SimWrapper.scala 289:27]
  wire [15:0] PipeChannel_synthesizedPrintf_dut_printf_2_wire_args_0_io_out_bits; // @[SimWrapper.scala 289:27]
  wire  PipeChannel_synthesizedPrintf_dut_printf_wire_enable_clock; // @[SimWrapper.scala 289:27]
  wire  PipeChannel_synthesizedPrintf_dut_printf_wire_enable_reset; // @[SimWrapper.scala 289:27]
  wire  PipeChannel_synthesizedPrintf_dut_printf_wire_enable_io_in_ready; // @[SimWrapper.scala 289:27]
  wire  PipeChannel_synthesizedPrintf_dut_printf_wire_enable_io_in_valid; // @[SimWrapper.scala 289:27]
  wire  PipeChannel_synthesizedPrintf_dut_printf_wire_enable_io_in_bits; // @[SimWrapper.scala 289:27]
  wire  PipeChannel_synthesizedPrintf_dut_printf_wire_enable_io_out_ready; // @[SimWrapper.scala 289:27]
  wire  PipeChannel_synthesizedPrintf_dut_printf_wire_enable_io_out_valid; // @[SimWrapper.scala 289:27]
  wire  PipeChannel_synthesizedPrintf_dut_printf_wire_enable_io_out_bits; // @[SimWrapper.scala 289:27]
  wire  PipeChannel_synthesizedPrintf_dut_childInst_printf_wire_args_1_clock; // @[SimWrapper.scala 289:27]
  wire  PipeChannel_synthesizedPrintf_dut_childInst_printf_wire_args_1_reset; // @[SimWrapper.scala 289:27]
  wire  PipeChannel_synthesizedPrintf_dut_childInst_printf_wire_args_1_io_in_ready; // @[SimWrapper.scala 289:27]
  wire  PipeChannel_synthesizedPrintf_dut_childInst_printf_wire_args_1_io_in_valid; // @[SimWrapper.scala 289:27]
  wire [15:0] PipeChannel_synthesizedPrintf_dut_childInst_printf_wire_args_1_io_in_bits; // @[SimWrapper.scala 289:27]
  wire  PipeChannel_synthesizedPrintf_dut_childInst_printf_wire_args_1_io_out_ready; // @[SimWrapper.scala 289:27]
  wire  PipeChannel_synthesizedPrintf_dut_childInst_printf_wire_args_1_io_out_valid; // @[SimWrapper.scala 289:27]
  wire [15:0] PipeChannel_synthesizedPrintf_dut_childInst_printf_wire_args_1_io_out_bits; // @[SimWrapper.scala 289:27]
  wire  PipeChannel_synthesizedPrintf_RationalClockBridge_clocks_0_globalReset_clock; // @[SimWrapper.scala 289:27]
  wire  PipeChannel_synthesizedPrintf_RationalClockBridge_clocks_0_globalReset_reset; // @[SimWrapper.scala 289:27]
  wire  PipeChannel_synthesizedPrintf_RationalClockBridge_clocks_0_globalReset_io_in_ready; // @[SimWrapper.scala 289:27]
  wire  PipeChannel_synthesizedPrintf_RationalClockBridge_clocks_0_globalReset_io_in_valid; // @[SimWrapper.scala 289:27]
  wire  PipeChannel_synthesizedPrintf_RationalClockBridge_clocks_0_globalReset_io_in_bits; // @[SimWrapper.scala 289:27]
  wire  PipeChannel_synthesizedPrintf_RationalClockBridge_clocks_0_globalReset_io_out_ready; // @[SimWrapper.scala 289:27]
  wire  PipeChannel_synthesizedPrintf_RationalClockBridge_clocks_0_globalReset_io_out_valid; // @[SimWrapper.scala 289:27]
  wire  PipeChannel_synthesizedPrintf_RationalClockBridge_clocks_0_globalReset_io_out_bits; // @[SimWrapper.scala 289:27]
  wire  PipeChannel_synthesizedPrintf_dut_childInst_printf_wire_args_0_clock; // @[SimWrapper.scala 289:27]
  wire  PipeChannel_synthesizedPrintf_dut_childInst_printf_wire_args_0_reset; // @[SimWrapper.scala 289:27]
  wire  PipeChannel_synthesizedPrintf_dut_childInst_printf_wire_args_0_io_in_ready; // @[SimWrapper.scala 289:27]
  wire  PipeChannel_synthesizedPrintf_dut_childInst_printf_wire_args_0_io_in_valid; // @[SimWrapper.scala 289:27]
  wire [15:0] PipeChannel_synthesizedPrintf_dut_childInst_printf_wire_args_0_io_in_bits; // @[SimWrapper.scala 289:27]
  wire  PipeChannel_synthesizedPrintf_dut_childInst_printf_wire_args_0_io_out_ready; // @[SimWrapper.scala 289:27]
  wire  PipeChannel_synthesizedPrintf_dut_childInst_printf_wire_args_0_io_out_valid; // @[SimWrapper.scala 289:27]
  wire [15:0] PipeChannel_synthesizedPrintf_dut_childInst_printf_wire_args_0_io_out_bits; // @[SimWrapper.scala 289:27]
  wire  PipeChannel_synthesizedPrintf_dut_printf_1_wire_args_0_clock; // @[SimWrapper.scala 289:27]
  wire  PipeChannel_synthesizedPrintf_dut_printf_1_wire_args_0_reset; // @[SimWrapper.scala 289:27]
  wire  PipeChannel_synthesizedPrintf_dut_printf_1_wire_args_0_io_in_ready; // @[SimWrapper.scala 289:27]
  wire  PipeChannel_synthesizedPrintf_dut_printf_1_wire_args_0_io_in_valid; // @[SimWrapper.scala 289:27]
  wire [15:0] PipeChannel_synthesizedPrintf_dut_printf_1_wire_args_0_io_in_bits; // @[SimWrapper.scala 289:27]
  wire  PipeChannel_synthesizedPrintf_dut_printf_1_wire_args_0_io_out_ready; // @[SimWrapper.scala 289:27]
  wire  PipeChannel_synthesizedPrintf_dut_printf_1_wire_args_0_io_out_valid; // @[SimWrapper.scala 289:27]
  wire [15:0] PipeChannel_synthesizedPrintf_dut_printf_1_wire_args_0_io_out_bits; // @[SimWrapper.scala 289:27]
  wire  PipeChannel_synthesizedPrintf_dut_printf_1_wire_enable_clock; // @[SimWrapper.scala 289:27]
  wire  PipeChannel_synthesizedPrintf_dut_printf_1_wire_enable_reset; // @[SimWrapper.scala 289:27]
  wire  PipeChannel_synthesizedPrintf_dut_printf_1_wire_enable_io_in_ready; // @[SimWrapper.scala 289:27]
  wire  PipeChannel_synthesizedPrintf_dut_printf_1_wire_enable_io_in_valid; // @[SimWrapper.scala 289:27]
  wire  PipeChannel_synthesizedPrintf_dut_printf_1_wire_enable_io_in_bits; // @[SimWrapper.scala 289:27]
  wire  PipeChannel_synthesizedPrintf_dut_printf_1_wire_enable_io_out_ready; // @[SimWrapper.scala 289:27]
  wire  PipeChannel_synthesizedPrintf_dut_printf_1_wire_enable_io_out_valid; // @[SimWrapper.scala 289:27]
  wire  PipeChannel_synthesizedPrintf_dut_printf_1_wire_enable_io_out_bits; // @[SimWrapper.scala 289:27]
  wire  PipeChannel_peekPokeBridge_io_a_clock; // @[SimWrapper.scala 289:27]
  wire  PipeChannel_peekPokeBridge_io_a_reset; // @[SimWrapper.scala 289:27]
  wire  PipeChannel_peekPokeBridge_io_a_io_in_ready; // @[SimWrapper.scala 289:27]
  wire  PipeChannel_peekPokeBridge_io_a_io_in_valid; // @[SimWrapper.scala 289:27]
  wire  PipeChannel_peekPokeBridge_io_a_io_in_bits; // @[SimWrapper.scala 289:27]
  wire  PipeChannel_peekPokeBridge_io_a_io_out_ready; // @[SimWrapper.scala 289:27]
  wire  PipeChannel_peekPokeBridge_io_a_io_out_valid; // @[SimWrapper.scala 289:27]
  wire  PipeChannel_peekPokeBridge_io_a_io_out_bits; // @[SimWrapper.scala 289:27]
  wire  PipeChannel_synthesizedPrintf_dut_childInst_printf_wire_enable_clock; // @[SimWrapper.scala 289:27]
  wire  PipeChannel_synthesizedPrintf_dut_childInst_printf_wire_enable_reset; // @[SimWrapper.scala 289:27]
  wire  PipeChannel_synthesizedPrintf_dut_childInst_printf_wire_enable_io_in_ready; // @[SimWrapper.scala 289:27]
  wire  PipeChannel_synthesizedPrintf_dut_childInst_printf_wire_enable_io_in_valid; // @[SimWrapper.scala 289:27]
  wire  PipeChannel_synthesizedPrintf_dut_childInst_printf_wire_enable_io_in_bits; // @[SimWrapper.scala 289:27]
  wire  PipeChannel_synthesizedPrintf_dut_childInst_printf_wire_enable_io_out_ready; // @[SimWrapper.scala 289:27]
  wire  PipeChannel_synthesizedPrintf_dut_childInst_printf_wire_enable_io_out_valid; // @[SimWrapper.scala 289:27]
  wire  PipeChannel_synthesizedPrintf_dut_childInst_printf_wire_enable_io_out_bits; // @[SimWrapper.scala 289:27]
  wire  PipeChannel_peekPokeBridge_reset_clock; // @[SimWrapper.scala 289:27]
  wire  PipeChannel_peekPokeBridge_reset_reset; // @[SimWrapper.scala 289:27]
  wire  PipeChannel_peekPokeBridge_reset_io_in_ready; // @[SimWrapper.scala 289:27]
  wire  PipeChannel_peekPokeBridge_reset_io_in_valid; // @[SimWrapper.scala 289:27]
  wire  PipeChannel_peekPokeBridge_reset_io_in_bits; // @[SimWrapper.scala 289:27]
  wire  PipeChannel_peekPokeBridge_reset_io_out_ready; // @[SimWrapper.scala 289:27]
  wire  PipeChannel_peekPokeBridge_reset_io_out_valid; // @[SimWrapper.scala 289:27]
  wire  PipeChannel_peekPokeBridge_reset_io_out_bits; // @[SimWrapper.scala 289:27]
  wire  PipeChannel_synthesizedPrintf_dut_printf_1_wire_args_1_clock; // @[SimWrapper.scala 289:27]
  wire  PipeChannel_synthesizedPrintf_dut_printf_1_wire_args_1_reset; // @[SimWrapper.scala 289:27]
  wire  PipeChannel_synthesizedPrintf_dut_printf_1_wire_args_1_io_in_ready; // @[SimWrapper.scala 289:27]
  wire  PipeChannel_synthesizedPrintf_dut_printf_1_wire_args_1_io_in_valid; // @[SimWrapper.scala 289:27]
  wire [527:0] PipeChannel_synthesizedPrintf_dut_printf_1_wire_args_1_io_in_bits; // @[SimWrapper.scala 289:27]
  wire  PipeChannel_synthesizedPrintf_dut_printf_1_wire_args_1_io_out_ready; // @[SimWrapper.scala 289:27]
  wire  PipeChannel_synthesizedPrintf_dut_printf_1_wire_args_1_io_out_valid; // @[SimWrapper.scala 289:27]
  wire [527:0] PipeChannel_synthesizedPrintf_dut_printf_1_wire_args_1_io_out_bits; // @[SimWrapper.scala 289:27]
  wire  PipeChannel_synthesizedPrintf_dut_printf_wire_args_0_clock; // @[SimWrapper.scala 289:27]
  wire  PipeChannel_synthesizedPrintf_dut_printf_wire_args_0_reset; // @[SimWrapper.scala 289:27]
  wire  PipeChannel_synthesizedPrintf_dut_printf_wire_args_0_io_in_ready; // @[SimWrapper.scala 289:27]
  wire  PipeChannel_synthesizedPrintf_dut_printf_wire_args_0_io_in_valid; // @[SimWrapper.scala 289:27]
  wire [15:0] PipeChannel_synthesizedPrintf_dut_printf_wire_args_0_io_in_bits; // @[SimWrapper.scala 289:27]
  wire  PipeChannel_synthesizedPrintf_dut_printf_wire_args_0_io_out_ready; // @[SimWrapper.scala 289:27]
  wire  PipeChannel_synthesizedPrintf_dut_printf_wire_args_0_io_out_valid; // @[SimWrapper.scala 289:27]
  wire [15:0] PipeChannel_synthesizedPrintf_dut_printf_wire_args_0_io_out_bits; // @[SimWrapper.scala 289:27]
  FAMETop target ( // @[SimWrapper.scala 257:22]
    .hostClock(target_hostClock),
    .hostReset(target_hostReset),
    .PrintfModule_RationalClockBridge_clocks_0_sink_ready(target_PrintfModule_RationalClockBridge_clocks_0_sink_ready),
    .PrintfModule_RationalClockBridge_clocks_0_sink_bits(target_PrintfModule_RationalClockBridge_clocks_0_sink_bits),
    .PrintfModule_peekPokeBridge_reset_sink_ready(target_PrintfModule_peekPokeBridge_reset_sink_ready),
    .PrintfModule_peekPokeBridge_reset_sink_valid(target_PrintfModule_peekPokeBridge_reset_sink_valid),
    .PrintfModule_peekPokeBridge_reset_sink_bits(target_PrintfModule_peekPokeBridge_reset_sink_bits),
    .PrintfModule_peekPokeBridge_io_b_sink_ready(target_PrintfModule_peekPokeBridge_io_b_sink_ready),
    .PrintfModule_peekPokeBridge_io_b_sink_valid(target_PrintfModule_peekPokeBridge_io_b_sink_valid),
    .PrintfModule_peekPokeBridge_io_a_sink_ready(target_PrintfModule_peekPokeBridge_io_a_sink_ready),
    .PrintfModule_peekPokeBridge_io_a_sink_valid(target_PrintfModule_peekPokeBridge_io_a_sink_valid),
    .PrintfModule_peekPokeBridge_io_a_sink_bits(target_PrintfModule_peekPokeBridge_io_a_sink_bits),
    .PrintfModule_synthesizedPrintf_RationalClockBridge_clocks_0_globalReset_source_ready(
      target_PrintfModule_synthesizedPrintf_RationalClockBridge_clocks_0_globalReset_source_ready),
    .PrintfModule_synthesizedPrintf_RationalClockBridge_clocks_0_globalReset_source_valid(
      target_PrintfModule_synthesizedPrintf_RationalClockBridge_clocks_0_globalReset_source_valid),
    .PrintfModule_synthesizedPrintf_dut_printf_wire_enable_source_ready(
      target_PrintfModule_synthesizedPrintf_dut_printf_wire_enable_source_ready),
    .PrintfModule_synthesizedPrintf_dut_printf_wire_enable_source_valid(
      target_PrintfModule_synthesizedPrintf_dut_printf_wire_enable_source_valid),
    .PrintfModule_synthesizedPrintf_dut_printf_wire_enable_source_bits(
      target_PrintfModule_synthesizedPrintf_dut_printf_wire_enable_source_bits),
    .PrintfModule_synthesizedPrintf_dut_printf_wire_args_0_source_ready(
      target_PrintfModule_synthesizedPrintf_dut_printf_wire_args_0_source_ready),
    .PrintfModule_synthesizedPrintf_dut_printf_wire_args_0_source_valid(
      target_PrintfModule_synthesizedPrintf_dut_printf_wire_args_0_source_valid),
    .PrintfModule_synthesizedPrintf_dut_printf_wire_args_0_source_bits(
      target_PrintfModule_synthesizedPrintf_dut_printf_wire_args_0_source_bits),
    .PrintfModule_synthesizedPrintf_dut_childInst_printf_wire_enable_source_ready(
      target_PrintfModule_synthesizedPrintf_dut_childInst_printf_wire_enable_source_ready),
    .PrintfModule_synthesizedPrintf_dut_childInst_printf_wire_enable_source_valid(
      target_PrintfModule_synthesizedPrintf_dut_childInst_printf_wire_enable_source_valid),
    .PrintfModule_synthesizedPrintf_dut_childInst_printf_wire_enable_source_bits(
      target_PrintfModule_synthesizedPrintf_dut_childInst_printf_wire_enable_source_bits),
    .PrintfModule_synthesizedPrintf_dut_childInst_printf_wire_args_0_source_ready(
      target_PrintfModule_synthesizedPrintf_dut_childInst_printf_wire_args_0_source_ready),
    .PrintfModule_synthesizedPrintf_dut_childInst_printf_wire_args_0_source_valid(
      target_PrintfModule_synthesizedPrintf_dut_childInst_printf_wire_args_0_source_valid),
    .PrintfModule_synthesizedPrintf_dut_childInst_printf_wire_args_0_source_bits(
      target_PrintfModule_synthesizedPrintf_dut_childInst_printf_wire_args_0_source_bits),
    .PrintfModule_synthesizedPrintf_dut_childInst_printf_wire_args_1_source_ready(
      target_PrintfModule_synthesizedPrintf_dut_childInst_printf_wire_args_1_source_ready),
    .PrintfModule_synthesizedPrintf_dut_childInst_printf_wire_args_1_source_valid(
      target_PrintfModule_synthesizedPrintf_dut_childInst_printf_wire_args_1_source_valid),
    .PrintfModule_synthesizedPrintf_dut_childInst_printf_wire_args_1_source_bits(
      target_PrintfModule_synthesizedPrintf_dut_childInst_printf_wire_args_1_source_bits),
    .PrintfModule_synthesizedPrintf_dut_printf_2_wire_enable_source_ready(
      target_PrintfModule_synthesizedPrintf_dut_printf_2_wire_enable_source_ready),
    .PrintfModule_synthesizedPrintf_dut_printf_2_wire_enable_source_valid(
      target_PrintfModule_synthesizedPrintf_dut_printf_2_wire_enable_source_valid),
    .PrintfModule_synthesizedPrintf_dut_printf_2_wire_enable_source_bits(
      target_PrintfModule_synthesizedPrintf_dut_printf_2_wire_enable_source_bits),
    .PrintfModule_synthesizedPrintf_dut_printf_2_wire_args_0_source_ready(
      target_PrintfModule_synthesizedPrintf_dut_printf_2_wire_args_0_source_ready),
    .PrintfModule_synthesizedPrintf_dut_printf_2_wire_args_0_source_valid(
      target_PrintfModule_synthesizedPrintf_dut_printf_2_wire_args_0_source_valid),
    .PrintfModule_synthesizedPrintf_dut_printf_2_wire_args_0_source_bits(
      target_PrintfModule_synthesizedPrintf_dut_printf_2_wire_args_0_source_bits),
    .PrintfModule_synthesizedPrintf_dut_printf_2_wire_args_1_source_ready(
      target_PrintfModule_synthesizedPrintf_dut_printf_2_wire_args_1_source_ready),
    .PrintfModule_synthesizedPrintf_dut_printf_2_wire_args_1_source_valid(
      target_PrintfModule_synthesizedPrintf_dut_printf_2_wire_args_1_source_valid),
    .PrintfModule_synthesizedPrintf_dut_printf_2_wire_args_1_source_bits(
      target_PrintfModule_synthesizedPrintf_dut_printf_2_wire_args_1_source_bits),
    .PrintfModule_synthesizedPrintf_dut_printf_1_wire_enable_source_ready(
      target_PrintfModule_synthesizedPrintf_dut_printf_1_wire_enable_source_ready),
    .PrintfModule_synthesizedPrintf_dut_printf_1_wire_enable_source_valid(
      target_PrintfModule_synthesizedPrintf_dut_printf_1_wire_enable_source_valid),
    .PrintfModule_synthesizedPrintf_dut_printf_1_wire_enable_source_bits(
      target_PrintfModule_synthesizedPrintf_dut_printf_1_wire_enable_source_bits),
    .PrintfModule_synthesizedPrintf_dut_printf_1_wire_args_0_source_ready(
      target_PrintfModule_synthesizedPrintf_dut_printf_1_wire_args_0_source_ready),
    .PrintfModule_synthesizedPrintf_dut_printf_1_wire_args_0_source_valid(
      target_PrintfModule_synthesizedPrintf_dut_printf_1_wire_args_0_source_valid),
    .PrintfModule_synthesizedPrintf_dut_printf_1_wire_args_0_source_bits(
      target_PrintfModule_synthesizedPrintf_dut_printf_1_wire_args_0_source_bits),
    .PrintfModule_synthesizedPrintf_dut_printf_1_wire_args_1_source_ready(
      target_PrintfModule_synthesizedPrintf_dut_printf_1_wire_args_1_source_ready),
    .PrintfModule_synthesizedPrintf_dut_printf_1_wire_args_1_source_valid(
      target_PrintfModule_synthesizedPrintf_dut_printf_1_wire_args_1_source_valid),
    .PrintfModule_synthesizedPrintf_dut_printf_1_wire_args_1_source_bits(
      target_PrintfModule_synthesizedPrintf_dut_printf_1_wire_args_1_source_bits)
  );
  PipeChannel PipeChannel_synthesizedPrintf_dut_printf_2_wire_args_1 ( // @[SimWrapper.scala 289:27]
    .clock(PipeChannel_synthesizedPrintf_dut_printf_2_wire_args_1_clock),
    .reset(PipeChannel_synthesizedPrintf_dut_printf_2_wire_args_1_reset),
    .io_in_ready(PipeChannel_synthesizedPrintf_dut_printf_2_wire_args_1_io_in_ready),
    .io_in_valid(PipeChannel_synthesizedPrintf_dut_printf_2_wire_args_1_io_in_valid),
    .io_in_bits(PipeChannel_synthesizedPrintf_dut_printf_2_wire_args_1_io_in_bits),
    .io_out_ready(PipeChannel_synthesizedPrintf_dut_printf_2_wire_args_1_io_out_ready),
    .io_out_valid(PipeChannel_synthesizedPrintf_dut_printf_2_wire_args_1_io_out_valid),
    .io_out_bits(PipeChannel_synthesizedPrintf_dut_printf_2_wire_args_1_io_out_bits)
  );
  PipeChannel_1 PipeChannel_peekPokeBridge_io_b ( // @[SimWrapper.scala 289:27]
    .clock(PipeChannel_peekPokeBridge_io_b_clock),
    .reset(PipeChannel_peekPokeBridge_io_b_reset),
    .io_in_ready(PipeChannel_peekPokeBridge_io_b_io_in_ready),
    .io_in_valid(PipeChannel_peekPokeBridge_io_b_io_in_valid),
    .io_in_bits(PipeChannel_peekPokeBridge_io_b_io_in_bits),
    .io_out_ready(PipeChannel_peekPokeBridge_io_b_io_out_ready),
    .io_out_valid(PipeChannel_peekPokeBridge_io_b_io_out_valid),
    .io_out_bits(PipeChannel_peekPokeBridge_io_b_io_out_bits)
  );
  PipeChannel_1 PipeChannel_synthesizedPrintf_dut_printf_2_wire_enable ( // @[SimWrapper.scala 289:27]
    .clock(PipeChannel_synthesizedPrintf_dut_printf_2_wire_enable_clock),
    .reset(PipeChannel_synthesizedPrintf_dut_printf_2_wire_enable_reset),
    .io_in_ready(PipeChannel_synthesizedPrintf_dut_printf_2_wire_enable_io_in_ready),
    .io_in_valid(PipeChannel_synthesizedPrintf_dut_printf_2_wire_enable_io_in_valid),
    .io_in_bits(PipeChannel_synthesizedPrintf_dut_printf_2_wire_enable_io_in_bits),
    .io_out_ready(PipeChannel_synthesizedPrintf_dut_printf_2_wire_enable_io_out_ready),
    .io_out_valid(PipeChannel_synthesizedPrintf_dut_printf_2_wire_enable_io_out_valid),
    .io_out_bits(PipeChannel_synthesizedPrintf_dut_printf_2_wire_enable_io_out_bits)
  );
  PipeChannel_3 PipeChannel_synthesizedPrintf_dut_printf_2_wire_args_0 ( // @[SimWrapper.scala 289:27]
    .clock(PipeChannel_synthesizedPrintf_dut_printf_2_wire_args_0_clock),
    .reset(PipeChannel_synthesizedPrintf_dut_printf_2_wire_args_0_reset),
    .io_in_ready(PipeChannel_synthesizedPrintf_dut_printf_2_wire_args_0_io_in_ready),
    .io_in_valid(PipeChannel_synthesizedPrintf_dut_printf_2_wire_args_0_io_in_valid),
    .io_in_bits(PipeChannel_synthesizedPrintf_dut_printf_2_wire_args_0_io_in_bits),
    .io_out_ready(PipeChannel_synthesizedPrintf_dut_printf_2_wire_args_0_io_out_ready),
    .io_out_valid(PipeChannel_synthesizedPrintf_dut_printf_2_wire_args_0_io_out_valid),
    .io_out_bits(PipeChannel_synthesizedPrintf_dut_printf_2_wire_args_0_io_out_bits)
  );
  PipeChannel_1 PipeChannel_synthesizedPrintf_dut_printf_wire_enable ( // @[SimWrapper.scala 289:27]
    .clock(PipeChannel_synthesizedPrintf_dut_printf_wire_enable_clock),
    .reset(PipeChannel_synthesizedPrintf_dut_printf_wire_enable_reset),
    .io_in_ready(PipeChannel_synthesizedPrintf_dut_printf_wire_enable_io_in_ready),
    .io_in_valid(PipeChannel_synthesizedPrintf_dut_printf_wire_enable_io_in_valid),
    .io_in_bits(PipeChannel_synthesizedPrintf_dut_printf_wire_enable_io_in_bits),
    .io_out_ready(PipeChannel_synthesizedPrintf_dut_printf_wire_enable_io_out_ready),
    .io_out_valid(PipeChannel_synthesizedPrintf_dut_printf_wire_enable_io_out_valid),
    .io_out_bits(PipeChannel_synthesizedPrintf_dut_printf_wire_enable_io_out_bits)
  );
  PipeChannel_3 PipeChannel_synthesizedPrintf_dut_childInst_printf_wire_args_1 ( // @[SimWrapper.scala 289:27]
    .clock(PipeChannel_synthesizedPrintf_dut_childInst_printf_wire_args_1_clock),
    .reset(PipeChannel_synthesizedPrintf_dut_childInst_printf_wire_args_1_reset),
    .io_in_ready(PipeChannel_synthesizedPrintf_dut_childInst_printf_wire_args_1_io_in_ready),
    .io_in_valid(PipeChannel_synthesizedPrintf_dut_childInst_printf_wire_args_1_io_in_valid),
    .io_in_bits(PipeChannel_synthesizedPrintf_dut_childInst_printf_wire_args_1_io_in_bits),
    .io_out_ready(PipeChannel_synthesizedPrintf_dut_childInst_printf_wire_args_1_io_out_ready),
    .io_out_valid(PipeChannel_synthesizedPrintf_dut_childInst_printf_wire_args_1_io_out_valid),
    .io_out_bits(PipeChannel_synthesizedPrintf_dut_childInst_printf_wire_args_1_io_out_bits)
  );
  PipeChannel_1 PipeChannel_synthesizedPrintf_RationalClockBridge_clocks_0_globalReset ( // @[SimWrapper.scala 289:27]
    .clock(PipeChannel_synthesizedPrintf_RationalClockBridge_clocks_0_globalReset_clock),
    .reset(PipeChannel_synthesizedPrintf_RationalClockBridge_clocks_0_globalReset_reset),
    .io_in_ready(PipeChannel_synthesizedPrintf_RationalClockBridge_clocks_0_globalReset_io_in_ready),
    .io_in_valid(PipeChannel_synthesizedPrintf_RationalClockBridge_clocks_0_globalReset_io_in_valid),
    .io_in_bits(PipeChannel_synthesizedPrintf_RationalClockBridge_clocks_0_globalReset_io_in_bits),
    .io_out_ready(PipeChannel_synthesizedPrintf_RationalClockBridge_clocks_0_globalReset_io_out_ready),
    .io_out_valid(PipeChannel_synthesizedPrintf_RationalClockBridge_clocks_0_globalReset_io_out_valid),
    .io_out_bits(PipeChannel_synthesizedPrintf_RationalClockBridge_clocks_0_globalReset_io_out_bits)
  );
  PipeChannel_3 PipeChannel_synthesizedPrintf_dut_childInst_printf_wire_args_0 ( // @[SimWrapper.scala 289:27]
    .clock(PipeChannel_synthesizedPrintf_dut_childInst_printf_wire_args_0_clock),
    .reset(PipeChannel_synthesizedPrintf_dut_childInst_printf_wire_args_0_reset),
    .io_in_ready(PipeChannel_synthesizedPrintf_dut_childInst_printf_wire_args_0_io_in_ready),
    .io_in_valid(PipeChannel_synthesizedPrintf_dut_childInst_printf_wire_args_0_io_in_valid),
    .io_in_bits(PipeChannel_synthesizedPrintf_dut_childInst_printf_wire_args_0_io_in_bits),
    .io_out_ready(PipeChannel_synthesizedPrintf_dut_childInst_printf_wire_args_0_io_out_ready),
    .io_out_valid(PipeChannel_synthesizedPrintf_dut_childInst_printf_wire_args_0_io_out_valid),
    .io_out_bits(PipeChannel_synthesizedPrintf_dut_childInst_printf_wire_args_0_io_out_bits)
  );
  PipeChannel_3 PipeChannel_synthesizedPrintf_dut_printf_1_wire_args_0 ( // @[SimWrapper.scala 289:27]
    .clock(PipeChannel_synthesizedPrintf_dut_printf_1_wire_args_0_clock),
    .reset(PipeChannel_synthesizedPrintf_dut_printf_1_wire_args_0_reset),
    .io_in_ready(PipeChannel_synthesizedPrintf_dut_printf_1_wire_args_0_io_in_ready),
    .io_in_valid(PipeChannel_synthesizedPrintf_dut_printf_1_wire_args_0_io_in_valid),
    .io_in_bits(PipeChannel_synthesizedPrintf_dut_printf_1_wire_args_0_io_in_bits),
    .io_out_ready(PipeChannel_synthesizedPrintf_dut_printf_1_wire_args_0_io_out_ready),
    .io_out_valid(PipeChannel_synthesizedPrintf_dut_printf_1_wire_args_0_io_out_valid),
    .io_out_bits(PipeChannel_synthesizedPrintf_dut_printf_1_wire_args_0_io_out_bits)
  );
  PipeChannel_1 PipeChannel_synthesizedPrintf_dut_printf_1_wire_enable ( // @[SimWrapper.scala 289:27]
    .clock(PipeChannel_synthesizedPrintf_dut_printf_1_wire_enable_clock),
    .reset(PipeChannel_synthesizedPrintf_dut_printf_1_wire_enable_reset),
    .io_in_ready(PipeChannel_synthesizedPrintf_dut_printf_1_wire_enable_io_in_ready),
    .io_in_valid(PipeChannel_synthesizedPrintf_dut_printf_1_wire_enable_io_in_valid),
    .io_in_bits(PipeChannel_synthesizedPrintf_dut_printf_1_wire_enable_io_in_bits),
    .io_out_ready(PipeChannel_synthesizedPrintf_dut_printf_1_wire_enable_io_out_ready),
    .io_out_valid(PipeChannel_synthesizedPrintf_dut_printf_1_wire_enable_io_out_valid),
    .io_out_bits(PipeChannel_synthesizedPrintf_dut_printf_1_wire_enable_io_out_bits)
  );
  PipeChannel_1 PipeChannel_peekPokeBridge_io_a ( // @[SimWrapper.scala 289:27]
    .clock(PipeChannel_peekPokeBridge_io_a_clock),
    .reset(PipeChannel_peekPokeBridge_io_a_reset),
    .io_in_ready(PipeChannel_peekPokeBridge_io_a_io_in_ready),
    .io_in_valid(PipeChannel_peekPokeBridge_io_a_io_in_valid),
    .io_in_bits(PipeChannel_peekPokeBridge_io_a_io_in_bits),
    .io_out_ready(PipeChannel_peekPokeBridge_io_a_io_out_ready),
    .io_out_valid(PipeChannel_peekPokeBridge_io_a_io_out_valid),
    .io_out_bits(PipeChannel_peekPokeBridge_io_a_io_out_bits)
  );
  PipeChannel_1 PipeChannel_synthesizedPrintf_dut_childInst_printf_wire_enable ( // @[SimWrapper.scala 289:27]
    .clock(PipeChannel_synthesizedPrintf_dut_childInst_printf_wire_enable_clock),
    .reset(PipeChannel_synthesizedPrintf_dut_childInst_printf_wire_enable_reset),
    .io_in_ready(PipeChannel_synthesizedPrintf_dut_childInst_printf_wire_enable_io_in_ready),
    .io_in_valid(PipeChannel_synthesizedPrintf_dut_childInst_printf_wire_enable_io_in_valid),
    .io_in_bits(PipeChannel_synthesizedPrintf_dut_childInst_printf_wire_enable_io_in_bits),
    .io_out_ready(PipeChannel_synthesizedPrintf_dut_childInst_printf_wire_enable_io_out_ready),
    .io_out_valid(PipeChannel_synthesizedPrintf_dut_childInst_printf_wire_enable_io_out_valid),
    .io_out_bits(PipeChannel_synthesizedPrintf_dut_childInst_printf_wire_enable_io_out_bits)
  );
  PipeChannel_1 PipeChannel_peekPokeBridge_reset ( // @[SimWrapper.scala 289:27]
    .clock(PipeChannel_peekPokeBridge_reset_clock),
    .reset(PipeChannel_peekPokeBridge_reset_reset),
    .io_in_ready(PipeChannel_peekPokeBridge_reset_io_in_ready),
    .io_in_valid(PipeChannel_peekPokeBridge_reset_io_in_valid),
    .io_in_bits(PipeChannel_peekPokeBridge_reset_io_in_bits),
    .io_out_ready(PipeChannel_peekPokeBridge_reset_io_out_ready),
    .io_out_valid(PipeChannel_peekPokeBridge_reset_io_out_valid),
    .io_out_bits(PipeChannel_peekPokeBridge_reset_io_out_bits)
  );
  PipeChannel_13 PipeChannel_synthesizedPrintf_dut_printf_1_wire_args_1 ( // @[SimWrapper.scala 289:27]
    .clock(PipeChannel_synthesizedPrintf_dut_printf_1_wire_args_1_clock),
    .reset(PipeChannel_synthesizedPrintf_dut_printf_1_wire_args_1_reset),
    .io_in_ready(PipeChannel_synthesizedPrintf_dut_printf_1_wire_args_1_io_in_ready),
    .io_in_valid(PipeChannel_synthesizedPrintf_dut_printf_1_wire_args_1_io_in_valid),
    .io_in_bits(PipeChannel_synthesizedPrintf_dut_printf_1_wire_args_1_io_in_bits),
    .io_out_ready(PipeChannel_synthesizedPrintf_dut_printf_1_wire_args_1_io_out_ready),
    .io_out_valid(PipeChannel_synthesizedPrintf_dut_printf_1_wire_args_1_io_out_valid),
    .io_out_bits(PipeChannel_synthesizedPrintf_dut_printf_1_wire_args_1_io_out_bits)
  );
  PipeChannel_3 PipeChannel_synthesizedPrintf_dut_printf_wire_args_0 ( // @[SimWrapper.scala 289:27]
    .clock(PipeChannel_synthesizedPrintf_dut_printf_wire_args_0_clock),
    .reset(PipeChannel_synthesizedPrintf_dut_printf_wire_args_0_reset),
    .io_in_ready(PipeChannel_synthesizedPrintf_dut_printf_wire_args_0_io_in_ready),
    .io_in_valid(PipeChannel_synthesizedPrintf_dut_printf_wire_args_0_io_in_valid),
    .io_in_bits(PipeChannel_synthesizedPrintf_dut_printf_wire_args_0_io_in_bits),
    .io_out_ready(PipeChannel_synthesizedPrintf_dut_printf_wire_args_0_io_out_ready),
    .io_out_valid(PipeChannel_synthesizedPrintf_dut_printf_wire_args_0_io_out_valid),
    .io_out_bits(PipeChannel_synthesizedPrintf_dut_printf_wire_args_0_io_out_bits)
  );
  assign channelPorts_PrintfModule_synthesizedPrintf_dut_printf_1_wire_args_1_source_valid =
    PipeChannel_synthesizedPrintf_dut_printf_1_wire_args_1_io_out_valid; // @[SimWrapper.scala 294:72]
  assign channelPorts_PrintfModule_synthesizedPrintf_dut_printf_1_wire_args_1_source_bits =
    PipeChannel_synthesizedPrintf_dut_printf_1_wire_args_1_io_out_bits; // @[SimWrapper.scala 294:72]
  assign channelPorts_PrintfModule_synthesizedPrintf_dut_printf_1_wire_args_0_source_valid =
    PipeChannel_synthesizedPrintf_dut_printf_1_wire_args_0_io_out_valid; // @[SimWrapper.scala 294:72]
  assign channelPorts_PrintfModule_synthesizedPrintf_dut_printf_1_wire_args_0_source_bits =
    PipeChannel_synthesizedPrintf_dut_printf_1_wire_args_0_io_out_bits; // @[SimWrapper.scala 294:72]
  assign channelPorts_PrintfModule_synthesizedPrintf_dut_printf_1_wire_enable_source_valid =
    PipeChannel_synthesizedPrintf_dut_printf_1_wire_enable_io_out_valid; // @[SimWrapper.scala 294:72]
  assign channelPorts_PrintfModule_synthesizedPrintf_dut_printf_1_wire_enable_source_bits =
    PipeChannel_synthesizedPrintf_dut_printf_1_wire_enable_io_out_bits; // @[SimWrapper.scala 294:72]
  assign channelPorts_PrintfModule_synthesizedPrintf_dut_printf_2_wire_args_1_source_valid =
    PipeChannel_synthesizedPrintf_dut_printf_2_wire_args_1_io_out_valid; // @[SimWrapper.scala 294:72]
  assign channelPorts_PrintfModule_synthesizedPrintf_dut_printf_2_wire_args_1_source_bits =
    PipeChannel_synthesizedPrintf_dut_printf_2_wire_args_1_io_out_bits; // @[SimWrapper.scala 294:72]
  assign channelPorts_PrintfModule_synthesizedPrintf_dut_printf_2_wire_args_0_source_valid =
    PipeChannel_synthesizedPrintf_dut_printf_2_wire_args_0_io_out_valid; // @[SimWrapper.scala 294:72]
  assign channelPorts_PrintfModule_synthesizedPrintf_dut_printf_2_wire_args_0_source_bits =
    PipeChannel_synthesizedPrintf_dut_printf_2_wire_args_0_io_out_bits; // @[SimWrapper.scala 294:72]
  assign channelPorts_PrintfModule_synthesizedPrintf_dut_printf_2_wire_enable_source_valid =
    PipeChannel_synthesizedPrintf_dut_printf_2_wire_enable_io_out_valid; // @[SimWrapper.scala 294:72]
  assign channelPorts_PrintfModule_synthesizedPrintf_dut_printf_2_wire_enable_source_bits =
    PipeChannel_synthesizedPrintf_dut_printf_2_wire_enable_io_out_bits; // @[SimWrapper.scala 294:72]
  assign channelPorts_PrintfModule_synthesizedPrintf_dut_childInst_printf_wire_args_1_source_valid =
    PipeChannel_synthesizedPrintf_dut_childInst_printf_wire_args_1_io_out_valid; // @[SimWrapper.scala 294:72]
  assign channelPorts_PrintfModule_synthesizedPrintf_dut_childInst_printf_wire_args_1_source_bits =
    PipeChannel_synthesizedPrintf_dut_childInst_printf_wire_args_1_io_out_bits; // @[SimWrapper.scala 294:72]
  assign channelPorts_PrintfModule_synthesizedPrintf_dut_childInst_printf_wire_args_0_source_valid =
    PipeChannel_synthesizedPrintf_dut_childInst_printf_wire_args_0_io_out_valid; // @[SimWrapper.scala 294:72]
  assign channelPorts_PrintfModule_synthesizedPrintf_dut_childInst_printf_wire_args_0_source_bits =
    PipeChannel_synthesizedPrintf_dut_childInst_printf_wire_args_0_io_out_bits; // @[SimWrapper.scala 294:72]
  assign channelPorts_PrintfModule_synthesizedPrintf_dut_childInst_printf_wire_enable_source_valid =
    PipeChannel_synthesizedPrintf_dut_childInst_printf_wire_enable_io_out_valid; // @[SimWrapper.scala 294:72]
  assign channelPorts_PrintfModule_synthesizedPrintf_dut_childInst_printf_wire_enable_source_bits =
    PipeChannel_synthesizedPrintf_dut_childInst_printf_wire_enable_io_out_bits; // @[SimWrapper.scala 294:72]
  assign channelPorts_PrintfModule_synthesizedPrintf_dut_printf_wire_args_0_source_valid =
    PipeChannel_synthesizedPrintf_dut_printf_wire_args_0_io_out_valid; // @[SimWrapper.scala 294:72]
  assign channelPorts_PrintfModule_synthesizedPrintf_dut_printf_wire_args_0_source_bits =
    PipeChannel_synthesizedPrintf_dut_printf_wire_args_0_io_out_bits; // @[SimWrapper.scala 294:72]
  assign channelPorts_PrintfModule_synthesizedPrintf_dut_printf_wire_enable_source_valid =
    PipeChannel_synthesizedPrintf_dut_printf_wire_enable_io_out_valid; // @[SimWrapper.scala 294:72]
  assign channelPorts_PrintfModule_synthesizedPrintf_dut_printf_wire_enable_source_bits =
    PipeChannel_synthesizedPrintf_dut_printf_wire_enable_io_out_bits; // @[SimWrapper.scala 294:72]
  assign channelPorts_PrintfModule_synthesizedPrintf_RationalClockBridge_clocks_0_globalReset_source_valid =
    PipeChannel_synthesizedPrintf_RationalClockBridge_clocks_0_globalReset_io_out_valid; // @[SimWrapper.scala 294:72]
  assign channelPorts_PrintfModule_synthesizedPrintf_RationalClockBridge_clocks_0_globalReset_source_bits =
    PipeChannel_synthesizedPrintf_RationalClockBridge_clocks_0_globalReset_io_out_bits; // @[SimWrapper.scala 294:72]
  assign channelPorts_PrintfModule_peekPokeBridge_io_a_sink_ready = PipeChannel_peekPokeBridge_io_a_io_in_ready; // @[SimWrapper.scala 309:16]
  assign channelPorts_PrintfModule_peekPokeBridge_io_b_sink_ready = PipeChannel_peekPokeBridge_io_b_io_in_ready; // @[SimWrapper.scala 309:16]
  assign channelPorts_PrintfModule_peekPokeBridge_reset_sink_ready = PipeChannel_peekPokeBridge_reset_io_in_ready; // @[SimWrapper.scala 309:16]
  assign channelPorts_PrintfModule_RationalClockBridge_clocks_0_sink_ready =
    target_PrintfModule_RationalClockBridge_clocks_0_sink_ready; // @[SimWrapper.scala 317:23]
  assign target_hostClock = clock; // @[SimWrapper.scala 265:23]
  assign target_hostReset = reset; // @[SimWrapper.scala 264:32]
  assign target_PrintfModule_RationalClockBridge_clocks_0_sink_bits = 1'h1; // @[SimWrapper.scala 319:55]
  assign target_PrintfModule_peekPokeBridge_reset_sink_valid = PipeChannel_peekPokeBridge_reset_io_out_valid; // @[SimWrapper.scala 293:35]
  assign target_PrintfModule_peekPokeBridge_reset_sink_bits = PipeChannel_peekPokeBridge_reset_io_out_bits; // @[SimWrapper.scala 293:35]
  assign target_PrintfModule_peekPokeBridge_io_b_sink_valid = PipeChannel_peekPokeBridge_io_b_io_out_valid; // @[SimWrapper.scala 293:35]
  assign target_PrintfModule_peekPokeBridge_io_a_sink_valid = PipeChannel_peekPokeBridge_io_a_io_out_valid; // @[SimWrapper.scala 293:35]
  assign target_PrintfModule_peekPokeBridge_io_a_sink_bits = PipeChannel_peekPokeBridge_io_a_io_out_bits; // @[SimWrapper.scala 293:35]
  assign target_PrintfModule_synthesizedPrintf_RationalClockBridge_clocks_0_globalReset_source_ready =
    PipeChannel_synthesizedPrintf_RationalClockBridge_clocks_0_globalReset_io_in_ready; // @[SimWrapper.scala 309:16]
  assign target_PrintfModule_synthesizedPrintf_dut_printf_wire_enable_source_ready =
    PipeChannel_synthesizedPrintf_dut_printf_wire_enable_io_in_ready; // @[SimWrapper.scala 309:16]
  assign target_PrintfModule_synthesizedPrintf_dut_printf_wire_args_0_source_ready =
    PipeChannel_synthesizedPrintf_dut_printf_wire_args_0_io_in_ready; // @[SimWrapper.scala 309:16]
  assign target_PrintfModule_synthesizedPrintf_dut_childInst_printf_wire_enable_source_ready =
    PipeChannel_synthesizedPrintf_dut_childInst_printf_wire_enable_io_in_ready; // @[SimWrapper.scala 309:16]
  assign target_PrintfModule_synthesizedPrintf_dut_childInst_printf_wire_args_0_source_ready =
    PipeChannel_synthesizedPrintf_dut_childInst_printf_wire_args_0_io_in_ready; // @[SimWrapper.scala 309:16]
  assign target_PrintfModule_synthesizedPrintf_dut_childInst_printf_wire_args_1_source_ready =
    PipeChannel_synthesizedPrintf_dut_childInst_printf_wire_args_1_io_in_ready; // @[SimWrapper.scala 309:16]
  assign target_PrintfModule_synthesizedPrintf_dut_printf_2_wire_enable_source_ready =
    PipeChannel_synthesizedPrintf_dut_printf_2_wire_enable_io_in_ready; // @[SimWrapper.scala 309:16]
  assign target_PrintfModule_synthesizedPrintf_dut_printf_2_wire_args_0_source_ready =
    PipeChannel_synthesizedPrintf_dut_printf_2_wire_args_0_io_in_ready; // @[SimWrapper.scala 309:16]
  assign target_PrintfModule_synthesizedPrintf_dut_printf_2_wire_args_1_source_ready =
    PipeChannel_synthesizedPrintf_dut_printf_2_wire_args_1_io_in_ready; // @[SimWrapper.scala 309:16]
  assign target_PrintfModule_synthesizedPrintf_dut_printf_1_wire_enable_source_ready =
    PipeChannel_synthesizedPrintf_dut_printf_1_wire_enable_io_in_ready; // @[SimWrapper.scala 309:16]
  assign target_PrintfModule_synthesizedPrintf_dut_printf_1_wire_args_0_source_ready =
    PipeChannel_synthesizedPrintf_dut_printf_1_wire_args_0_io_in_ready; // @[SimWrapper.scala 309:16]
  assign target_PrintfModule_synthesizedPrintf_dut_printf_1_wire_args_1_source_ready =
    PipeChannel_synthesizedPrintf_dut_printf_1_wire_args_1_io_in_ready; // @[SimWrapper.scala 309:16]
  assign PipeChannel_synthesizedPrintf_dut_printf_2_wire_args_1_clock = clock;
  assign PipeChannel_synthesizedPrintf_dut_printf_2_wire_args_1_reset = reset;
  assign PipeChannel_synthesizedPrintf_dut_printf_2_wire_args_1_io_in_valid =
    target_PrintfModule_synthesizedPrintf_dut_printf_2_wire_args_1_source_valid; // @[SimWrapper.scala 307:21]
  assign PipeChannel_synthesizedPrintf_dut_printf_2_wire_args_1_io_in_bits =
    target_PrintfModule_synthesizedPrintf_dut_printf_2_wire_args_1_source_bits; // @[SimWrapper.scala 306:20]
  assign PipeChannel_synthesizedPrintf_dut_printf_2_wire_args_1_io_out_ready =
    channelPorts_PrintfModule_synthesizedPrintf_dut_printf_2_wire_args_1_source_ready; // @[SimWrapper.scala 294:72]
  assign PipeChannel_peekPokeBridge_io_b_clock = clock;
  assign PipeChannel_peekPokeBridge_io_b_reset = reset;
  assign PipeChannel_peekPokeBridge_io_b_io_in_valid = channelPorts_PrintfModule_peekPokeBridge_io_b_sink_valid; // @[SimWrapper.scala 307:21]
  assign PipeChannel_peekPokeBridge_io_b_io_in_bits = channelPorts_PrintfModule_peekPokeBridge_io_b_sink_bits; // @[SimWrapper.scala 306:20]
  assign PipeChannel_peekPokeBridge_io_b_io_out_ready = target_PrintfModule_peekPokeBridge_io_b_sink_ready; // @[SimWrapper.scala 293:35]
  assign PipeChannel_synthesizedPrintf_dut_printf_2_wire_enable_clock = clock;
  assign PipeChannel_synthesizedPrintf_dut_printf_2_wire_enable_reset = reset;
  assign PipeChannel_synthesizedPrintf_dut_printf_2_wire_enable_io_in_valid =
    target_PrintfModule_synthesizedPrintf_dut_printf_2_wire_enable_source_valid; // @[SimWrapper.scala 307:21]
  assign PipeChannel_synthesizedPrintf_dut_printf_2_wire_enable_io_in_bits =
    target_PrintfModule_synthesizedPrintf_dut_printf_2_wire_enable_source_bits; // @[SimWrapper.scala 306:20]
  assign PipeChannel_synthesizedPrintf_dut_printf_2_wire_enable_io_out_ready =
    channelPorts_PrintfModule_synthesizedPrintf_dut_printf_2_wire_enable_source_ready; // @[SimWrapper.scala 294:72]
  assign PipeChannel_synthesizedPrintf_dut_printf_2_wire_args_0_clock = clock;
  assign PipeChannel_synthesizedPrintf_dut_printf_2_wire_args_0_reset = reset;
  assign PipeChannel_synthesizedPrintf_dut_printf_2_wire_args_0_io_in_valid =
    target_PrintfModule_synthesizedPrintf_dut_printf_2_wire_args_0_source_valid; // @[SimWrapper.scala 307:21]
  assign PipeChannel_synthesizedPrintf_dut_printf_2_wire_args_0_io_in_bits =
    target_PrintfModule_synthesizedPrintf_dut_printf_2_wire_args_0_source_bits; // @[SimWrapper.scala 306:20]
  assign PipeChannel_synthesizedPrintf_dut_printf_2_wire_args_0_io_out_ready =
    channelPorts_PrintfModule_synthesizedPrintf_dut_printf_2_wire_args_0_source_ready; // @[SimWrapper.scala 294:72]
  assign PipeChannel_synthesizedPrintf_dut_printf_wire_enable_clock = clock;
  assign PipeChannel_synthesizedPrintf_dut_printf_wire_enable_reset = reset;
  assign PipeChannel_synthesizedPrintf_dut_printf_wire_enable_io_in_valid =
    target_PrintfModule_synthesizedPrintf_dut_printf_wire_enable_source_valid; // @[SimWrapper.scala 307:21]
  assign PipeChannel_synthesizedPrintf_dut_printf_wire_enable_io_in_bits =
    target_PrintfModule_synthesizedPrintf_dut_printf_wire_enable_source_bits; // @[SimWrapper.scala 306:20]
  assign PipeChannel_synthesizedPrintf_dut_printf_wire_enable_io_out_ready =
    channelPorts_PrintfModule_synthesizedPrintf_dut_printf_wire_enable_source_ready; // @[SimWrapper.scala 294:72]
  assign PipeChannel_synthesizedPrintf_dut_childInst_printf_wire_args_1_clock = clock;
  assign PipeChannel_synthesizedPrintf_dut_childInst_printf_wire_args_1_reset = reset;
  assign PipeChannel_synthesizedPrintf_dut_childInst_printf_wire_args_1_io_in_valid =
    target_PrintfModule_synthesizedPrintf_dut_childInst_printf_wire_args_1_source_valid; // @[SimWrapper.scala 307:21]
  assign PipeChannel_synthesizedPrintf_dut_childInst_printf_wire_args_1_io_in_bits =
    target_PrintfModule_synthesizedPrintf_dut_childInst_printf_wire_args_1_source_bits; // @[SimWrapper.scala 306:20]
  assign PipeChannel_synthesizedPrintf_dut_childInst_printf_wire_args_1_io_out_ready =
    channelPorts_PrintfModule_synthesizedPrintf_dut_childInst_printf_wire_args_1_source_ready; // @[SimWrapper.scala 294:72]
  assign PipeChannel_synthesizedPrintf_RationalClockBridge_clocks_0_globalReset_clock = clock;
  assign PipeChannel_synthesizedPrintf_RationalClockBridge_clocks_0_globalReset_reset = reset;
  assign PipeChannel_synthesizedPrintf_RationalClockBridge_clocks_0_globalReset_io_in_valid =
    target_PrintfModule_synthesizedPrintf_RationalClockBridge_clocks_0_globalReset_source_valid; // @[SimWrapper.scala 307:21]
  assign PipeChannel_synthesizedPrintf_RationalClockBridge_clocks_0_globalReset_io_in_bits = 1'h0; // @[SimWrapper.scala 306:20]
  assign PipeChannel_synthesizedPrintf_RationalClockBridge_clocks_0_globalReset_io_out_ready =
    channelPorts_PrintfModule_synthesizedPrintf_RationalClockBridge_clocks_0_globalReset_source_ready; // @[SimWrapper.scala 294:72]
  assign PipeChannel_synthesizedPrintf_dut_childInst_printf_wire_args_0_clock = clock;
  assign PipeChannel_synthesizedPrintf_dut_childInst_printf_wire_args_0_reset = reset;
  assign PipeChannel_synthesizedPrintf_dut_childInst_printf_wire_args_0_io_in_valid =
    target_PrintfModule_synthesizedPrintf_dut_childInst_printf_wire_args_0_source_valid; // @[SimWrapper.scala 307:21]
  assign PipeChannel_synthesizedPrintf_dut_childInst_printf_wire_args_0_io_in_bits =
    target_PrintfModule_synthesizedPrintf_dut_childInst_printf_wire_args_0_source_bits; // @[SimWrapper.scala 306:20]
  assign PipeChannel_synthesizedPrintf_dut_childInst_printf_wire_args_0_io_out_ready =
    channelPorts_PrintfModule_synthesizedPrintf_dut_childInst_printf_wire_args_0_source_ready; // @[SimWrapper.scala 294:72]
  assign PipeChannel_synthesizedPrintf_dut_printf_1_wire_args_0_clock = clock;
  assign PipeChannel_synthesizedPrintf_dut_printf_1_wire_args_0_reset = reset;
  assign PipeChannel_synthesizedPrintf_dut_printf_1_wire_args_0_io_in_valid =
    target_PrintfModule_synthesizedPrintf_dut_printf_1_wire_args_0_source_valid; // @[SimWrapper.scala 307:21]
  assign PipeChannel_synthesizedPrintf_dut_printf_1_wire_args_0_io_in_bits =
    target_PrintfModule_synthesizedPrintf_dut_printf_1_wire_args_0_source_bits; // @[SimWrapper.scala 306:20]
  assign PipeChannel_synthesizedPrintf_dut_printf_1_wire_args_0_io_out_ready =
    channelPorts_PrintfModule_synthesizedPrintf_dut_printf_1_wire_args_0_source_ready; // @[SimWrapper.scala 294:72]
  assign PipeChannel_synthesizedPrintf_dut_printf_1_wire_enable_clock = clock;
  assign PipeChannel_synthesizedPrintf_dut_printf_1_wire_enable_reset = reset;
  assign PipeChannel_synthesizedPrintf_dut_printf_1_wire_enable_io_in_valid =
    target_PrintfModule_synthesizedPrintf_dut_printf_1_wire_enable_source_valid; // @[SimWrapper.scala 307:21]
  assign PipeChannel_synthesizedPrintf_dut_printf_1_wire_enable_io_in_bits =
    target_PrintfModule_synthesizedPrintf_dut_printf_1_wire_enable_source_bits; // @[SimWrapper.scala 306:20]
  assign PipeChannel_synthesizedPrintf_dut_printf_1_wire_enable_io_out_ready =
    channelPorts_PrintfModule_synthesizedPrintf_dut_printf_1_wire_enable_source_ready; // @[SimWrapper.scala 294:72]
  assign PipeChannel_peekPokeBridge_io_a_clock = clock;
  assign PipeChannel_peekPokeBridge_io_a_reset = reset;
  assign PipeChannel_peekPokeBridge_io_a_io_in_valid = channelPorts_PrintfModule_peekPokeBridge_io_a_sink_valid; // @[SimWrapper.scala 307:21]
  assign PipeChannel_peekPokeBridge_io_a_io_in_bits = channelPorts_PrintfModule_peekPokeBridge_io_a_sink_bits; // @[SimWrapper.scala 306:20]
  assign PipeChannel_peekPokeBridge_io_a_io_out_ready = target_PrintfModule_peekPokeBridge_io_a_sink_ready; // @[SimWrapper.scala 293:35]
  assign PipeChannel_synthesizedPrintf_dut_childInst_printf_wire_enable_clock = clock;
  assign PipeChannel_synthesizedPrintf_dut_childInst_printf_wire_enable_reset = reset;
  assign PipeChannel_synthesizedPrintf_dut_childInst_printf_wire_enable_io_in_valid =
    target_PrintfModule_synthesizedPrintf_dut_childInst_printf_wire_enable_source_valid; // @[SimWrapper.scala 307:21]
  assign PipeChannel_synthesizedPrintf_dut_childInst_printf_wire_enable_io_in_bits =
    target_PrintfModule_synthesizedPrintf_dut_childInst_printf_wire_enable_source_bits; // @[SimWrapper.scala 306:20]
  assign PipeChannel_synthesizedPrintf_dut_childInst_printf_wire_enable_io_out_ready =
    channelPorts_PrintfModule_synthesizedPrintf_dut_childInst_printf_wire_enable_source_ready; // @[SimWrapper.scala 294:72]
  assign PipeChannel_peekPokeBridge_reset_clock = clock;
  assign PipeChannel_peekPokeBridge_reset_reset = reset;
  assign PipeChannel_peekPokeBridge_reset_io_in_valid = channelPorts_PrintfModule_peekPokeBridge_reset_sink_valid; // @[SimWrapper.scala 307:21]
  assign PipeChannel_peekPokeBridge_reset_io_in_bits = channelPorts_PrintfModule_peekPokeBridge_reset_sink_bits; // @[SimWrapper.scala 306:20]
  assign PipeChannel_peekPokeBridge_reset_io_out_ready = target_PrintfModule_peekPokeBridge_reset_sink_ready; // @[SimWrapper.scala 293:35]
  assign PipeChannel_synthesizedPrintf_dut_printf_1_wire_args_1_clock = clock;
  assign PipeChannel_synthesizedPrintf_dut_printf_1_wire_args_1_reset = reset;
  assign PipeChannel_synthesizedPrintf_dut_printf_1_wire_args_1_io_in_valid =
    target_PrintfModule_synthesizedPrintf_dut_printf_1_wire_args_1_source_valid; // @[SimWrapper.scala 307:21]
  assign PipeChannel_synthesizedPrintf_dut_printf_1_wire_args_1_io_in_bits =
    target_PrintfModule_synthesizedPrintf_dut_printf_1_wire_args_1_source_bits; // @[SimWrapper.scala 306:20]
  assign PipeChannel_synthesizedPrintf_dut_printf_1_wire_args_1_io_out_ready =
    channelPorts_PrintfModule_synthesizedPrintf_dut_printf_1_wire_args_1_source_ready; // @[SimWrapper.scala 294:72]
  assign PipeChannel_synthesizedPrintf_dut_printf_wire_args_0_clock = clock;
  assign PipeChannel_synthesizedPrintf_dut_printf_wire_args_0_reset = reset;
  assign PipeChannel_synthesizedPrintf_dut_printf_wire_args_0_io_in_valid =
    target_PrintfModule_synthesizedPrintf_dut_printf_wire_args_0_source_valid; // @[SimWrapper.scala 307:21]
  assign PipeChannel_synthesizedPrintf_dut_printf_wire_args_0_io_in_bits =
    target_PrintfModule_synthesizedPrintf_dut_printf_wire_args_0_source_bits; // @[SimWrapper.scala 306:20]
  assign PipeChannel_synthesizedPrintf_dut_printf_wire_args_0_io_out_ready =
    channelPorts_PrintfModule_synthesizedPrintf_dut_printf_wire_args_0_source_ready; // @[SimWrapper.scala 294:72]
endmodule
module QueueCompatibility(
  input   clock,
  input   reset,
  output  io_enq_ready,
  input   io_enq_valid,
  input   io_deq_ready,
  output  io_deq_valid
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
`endif // RANDOMIZE_REG_INIT
  reg [2:0] enq_ptr_value; // @[Counter.scala 61:40]
  reg [2:0] deq_ptr_value; // @[Counter.scala 61:40]
  reg  maybe_full; // @[Decoupled.scala 276:27]
  wire  ptr_match = enq_ptr_value == deq_ptr_value; // @[Decoupled.scala 277:33]
  wire  empty = ptr_match & ~maybe_full; // @[Decoupled.scala 278:25]
  wire  full = ptr_match & maybe_full; // @[Decoupled.scala 279:24]
  wire  do_enq = io_enq_ready & io_enq_valid; // @[Decoupled.scala 51:35]
  wire  do_deq = io_deq_ready & io_deq_valid; // @[Decoupled.scala 51:35]
  wire  wrap = enq_ptr_value == 3'h4; // @[Counter.scala 73:24]
  wire [2:0] _value_T_1 = enq_ptr_value + 3'h1; // @[Counter.scala 77:24]
  wire  wrap_1 = deq_ptr_value == 3'h4; // @[Counter.scala 73:24]
  wire [2:0] _value_T_3 = deq_ptr_value + 3'h1; // @[Counter.scala 77:24]
  assign io_enq_ready = ~full; // @[Decoupled.scala 303:19]
  assign io_deq_valid = ~empty; // @[Decoupled.scala 302:19]
  always @(posedge clock) begin
    if (reset) begin // @[Counter.scala 61:40]
      enq_ptr_value <= 3'h0; // @[Counter.scala 61:40]
    end else if (do_enq) begin // @[Decoupled.scala 286:16]
      if (wrap) begin // @[Counter.scala 87:20]
        enq_ptr_value <= 3'h0; // @[Counter.scala 87:28]
      end else begin
        enq_ptr_value <= _value_T_1; // @[Counter.scala 77:15]
      end
    end
    if (reset) begin // @[Counter.scala 61:40]
      deq_ptr_value <= 3'h0; // @[Counter.scala 61:40]
    end else if (do_deq) begin // @[Decoupled.scala 290:16]
      if (wrap_1) begin // @[Counter.scala 87:20]
        deq_ptr_value <= 3'h0; // @[Counter.scala 87:28]
      end else begin
        deq_ptr_value <= _value_T_3; // @[Counter.scala 77:15]
      end
    end
    if (reset) begin // @[Decoupled.scala 276:27]
      maybe_full <= 1'h0; // @[Decoupled.scala 276:27]
    end else if (do_enq != do_deq) begin // @[Decoupled.scala 293:27]
      maybe_full <= do_enq; // @[Decoupled.scala 294:16]
    end
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  enq_ptr_value = _RAND_0[2:0];
  _RAND_1 = {1{`RANDOM}};
  deq_ptr_value = _RAND_1[2:0];
  _RAND_2 = {1{`RANDOM}};
  maybe_full = _RAND_2[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module ReorderQueue(
  input   clock,
  input   reset,
  output  io_enq_ready,
  input   io_enq_valid,
  input   io_enq_bits_tag,
  input   io_deq_0_valid,
  input   io_deq_0_tag,
  output  io_deq_0_matches,
  input   io_deq_1_valid,
  input   io_deq_1_tag,
  output  io_deq_1_matches,
  input   io_deq_2_valid,
  input   io_deq_2_tag,
  output  io_deq_2_matches,
  input   io_deq_3_valid,
  input   io_deq_3_tag,
  output  io_deq_3_matches,
  input   io_deq_4_valid,
  input   io_deq_4_tag,
  output  io_deq_4_matches,
  input   io_deq_5_valid,
  input   io_deq_5_tag,
  output  io_deq_5_matches
);
  wire  queues_0_clock; // @[ReorderQueue.scala 84:13]
  wire  queues_0_reset; // @[ReorderQueue.scala 84:13]
  wire  queues_0_io_enq_ready; // @[ReorderQueue.scala 84:13]
  wire  queues_0_io_enq_valid; // @[ReorderQueue.scala 84:13]
  wire  queues_0_io_deq_ready; // @[ReorderQueue.scala 84:13]
  wire  queues_0_io_deq_valid; // @[ReorderQueue.scala 84:13]
  wire  queues_1_clock; // @[ReorderQueue.scala 84:13]
  wire  queues_1_reset; // @[ReorderQueue.scala 84:13]
  wire  queues_1_io_enq_ready; // @[ReorderQueue.scala 84:13]
  wire  queues_1_io_enq_valid; // @[ReorderQueue.scala 84:13]
  wire  queues_1_io_deq_ready; // @[ReorderQueue.scala 84:13]
  wire  queues_1_io_deq_valid; // @[ReorderQueue.scala 84:13]
  wire  _T = ~io_enq_bits_tag; // @[ReorderQueue.scala 92:29]
  wire  _GEN_0 = ~io_enq_bits_tag & queues_0_io_enq_ready; // @[ReorderQueue.scala 87:18 92:{42,57}]
  wire  _T_1 = ~io_deq_0_tag; // @[ReorderQueue.scala 98:23]
  wire  _GEN_1 = ~io_deq_0_tag & queues_0_io_deq_valid; // @[ReorderQueue.scala 98:36 99:23 88:30]
  wire  deqReadys__0 = io_deq_0_valid & _T_1; // @[ReorderQueue.scala 102:26]
  wire  _T_2 = ~io_deq_1_tag; // @[ReorderQueue.scala 98:23]
  wire  _GEN_3 = ~io_deq_1_tag & queues_0_io_deq_valid; // @[ReorderQueue.scala 98:36 99:23 88:30]
  wire  deqReadys__1 = io_deq_1_valid & _T_2; // @[ReorderQueue.scala 102:26]
  wire  _T_3 = ~io_deq_2_tag; // @[ReorderQueue.scala 98:23]
  wire  _GEN_5 = ~io_deq_2_tag & queues_0_io_deq_valid; // @[ReorderQueue.scala 98:36 99:23 88:30]
  wire  deqReadys__2 = io_deq_2_valid & _T_3; // @[ReorderQueue.scala 102:26]
  wire  _T_4 = ~io_deq_3_tag; // @[ReorderQueue.scala 98:23]
  wire  _GEN_7 = ~io_deq_3_tag & queues_0_io_deq_valid; // @[ReorderQueue.scala 98:36 99:23 88:30]
  wire  deqReadys__3 = io_deq_3_valid & _T_4; // @[ReorderQueue.scala 102:26]
  wire  _T_5 = ~io_deq_4_tag; // @[ReorderQueue.scala 98:23]
  wire  _GEN_9 = ~io_deq_4_tag & queues_0_io_deq_valid; // @[ReorderQueue.scala 98:36 99:23 88:30]
  wire  deqReadys__4 = io_deq_4_valid & _T_5; // @[ReorderQueue.scala 102:26]
  wire  _T_6 = ~io_deq_5_tag; // @[ReorderQueue.scala 98:23]
  wire  _GEN_11 = ~io_deq_5_tag & queues_0_io_deq_valid; // @[ReorderQueue.scala 98:36 99:23 88:30]
  wire  deqReadys__5 = io_deq_5_valid & _T_6; // @[ReorderQueue.scala 102:26]
  wire  deqReadys_1_0 = io_deq_0_valid & io_deq_0_tag; // @[ReorderQueue.scala 102:26]
  wire  deqReadys_1_1 = io_deq_1_valid & io_deq_1_tag; // @[ReorderQueue.scala 102:26]
  wire  deqReadys_1_2 = io_deq_2_valid & io_deq_2_tag; // @[ReorderQueue.scala 102:26]
  wire  deqReadys_1_3 = io_deq_3_valid & io_deq_3_tag; // @[ReorderQueue.scala 102:26]
  wire  deqReadys_1_4 = io_deq_4_valid & io_deq_4_tag; // @[ReorderQueue.scala 102:26]
  wire  deqReadys_1_5 = io_deq_5_valid & io_deq_5_tag; // @[ReorderQueue.scala 102:26]
  QueueCompatibility queues_0 ( // @[ReorderQueue.scala 84:13]
    .clock(queues_0_clock),
    .reset(queues_0_reset),
    .io_enq_ready(queues_0_io_enq_ready),
    .io_enq_valid(queues_0_io_enq_valid),
    .io_deq_ready(queues_0_io_deq_ready),
    .io_deq_valid(queues_0_io_deq_valid)
  );
  QueueCompatibility queues_1 ( // @[ReorderQueue.scala 84:13]
    .clock(queues_1_clock),
    .reset(queues_1_reset),
    .io_enq_ready(queues_1_io_enq_ready),
    .io_enq_valid(queues_1_io_enq_valid),
    .io_deq_ready(queues_1_io_deq_ready),
    .io_deq_valid(queues_1_io_deq_valid)
  );
  assign io_enq_ready = io_enq_bits_tag ? queues_1_io_enq_ready : _GEN_0; // @[ReorderQueue.scala 92:{42,57}]
  assign io_deq_0_matches = io_deq_0_tag ? queues_1_io_deq_valid : _GEN_1; // @[ReorderQueue.scala 98:36 99:23]
  assign io_deq_1_matches = io_deq_1_tag ? queues_1_io_deq_valid : _GEN_3; // @[ReorderQueue.scala 98:36 99:23]
  assign io_deq_2_matches = io_deq_2_tag ? queues_1_io_deq_valid : _GEN_5; // @[ReorderQueue.scala 98:36 99:23]
  assign io_deq_3_matches = io_deq_3_tag ? queues_1_io_deq_valid : _GEN_7; // @[ReorderQueue.scala 98:36 99:23]
  assign io_deq_4_matches = io_deq_4_tag ? queues_1_io_deq_valid : _GEN_9; // @[ReorderQueue.scala 98:36 99:23]
  assign io_deq_5_matches = io_deq_5_tag ? queues_1_io_deq_valid : _GEN_11; // @[ReorderQueue.scala 98:36 99:23]
  assign queues_0_clock = clock;
  assign queues_0_reset = reset;
  assign queues_0_io_enq_valid = io_enq_valid & _T; // @[ReorderQueue.scala 93:38]
  assign queues_0_io_deq_ready = deqReadys__0 | deqReadys__1 | deqReadys__2 | deqReadys__3 | deqReadys__4 | deqReadys__5
    ; // @[ReorderQueue.scala 104:44]
  assign queues_1_clock = clock;
  assign queues_1_reset = reset;
  assign queues_1_io_enq_valid = io_enq_valid & io_enq_bits_tag; // @[ReorderQueue.scala 93:38]
  assign queues_1_io_deq_ready = deqReadys_1_0 | deqReadys_1_1 | deqReadys_1_2 | deqReadys_1_3 | deqReadys_1_4 |
    deqReadys_1_5; // @[ReorderQueue.scala 104:44]
endmodule
module QueueCompatibility_4(
  input        clock,
  input        reset,
  output       io_enq_ready,
  input        io_enq_valid,
  input  [4:0] io_enq_bits,
  input        io_deq_ready,
  output       io_deq_valid,
  output [4:0] io_deq_bits
);
`ifdef RANDOMIZE_GARBAGE_ASSIGN
  reg [31:0] _RAND_1;
`endif // RANDOMIZE_GARBAGE_ASSIGN
`ifdef RANDOMIZE_MEM_INIT
  reg [31:0] _RAND_0;
`endif // RANDOMIZE_MEM_INIT
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
`endif // RANDOMIZE_REG_INIT
  reg [4:0] ram [0:4]; // @[Decoupled.scala 273:95]
  wire  ram_io_deq_bits_MPORT_en; // @[Decoupled.scala 273:95 310:23]
  wire [2:0] ram_io_deq_bits_MPORT_addr; // @[Decoupled.scala 273:95 310:23]
  wire [4:0] ram_io_deq_bits_MPORT_data; // @[Decoupled.scala 273:95]
  wire [4:0] ram_MPORT_data; // @[Decoupled.scala 273:95 286:16 287:24]
  wire [2:0] ram_MPORT_addr; // @[Decoupled.scala 273:95 286:16 287:8]
  wire  ram_MPORT_mask; // @[Decoupled.scala 273:95 286:16 287:24]
  wire  ram_MPORT_en; // @[Decoupled.scala 273:95 51:35]
  reg [2:0] enq_ptr_value; // @[Counter.scala 61:40]
  reg [2:0] deq_ptr_value; // @[Counter.scala 61:40]
  reg  maybe_full; // @[Decoupled.scala 276:27]
  wire  ptr_match = enq_ptr_value == deq_ptr_value; // @[Decoupled.scala 277:33]
  wire  empty = ptr_match & ~maybe_full; // @[Decoupled.scala 278:25]
  wire  full = ptr_match & maybe_full; // @[Decoupled.scala 279:24]
  wire  do_enq = io_enq_ready & io_enq_valid; // @[Decoupled.scala 51:35]
  wire  do_deq = io_deq_ready & io_deq_valid; // @[Decoupled.scala 51:35]
  wire  wrap = enq_ptr_value == 3'h4; // @[Counter.scala 73:24]
  wire [2:0] _value_T_1 = enq_ptr_value + 3'h1; // @[Counter.scala 77:24]
  wire  wrap_1 = deq_ptr_value == 3'h4; // @[Counter.scala 73:24]
  wire [2:0] _value_T_3 = deq_ptr_value + 3'h1; // @[Counter.scala 77:24]
  assign ram_io_deq_bits_MPORT_en = 1'h1; // @[Decoupled.scala 310:23]
  assign ram_io_deq_bits_MPORT_addr = deq_ptr_value; // @[Decoupled.scala 310:23]
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign ram_io_deq_bits_MPORT_data = ram[ram_io_deq_bits_MPORT_addr]; // @[Decoupled.scala 273:95]
  `else
  assign ram_io_deq_bits_MPORT_data = ram_io_deq_bits_MPORT_addr >= 3'h5 ? _RAND_1[4:0] :
    ram[ram_io_deq_bits_MPORT_addr]; // @[Decoupled.scala 273:95]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign ram_MPORT_data = io_enq_bits; // @[Decoupled.scala 286:16 287:24]
  assign ram_MPORT_addr = enq_ptr_value; // @[Decoupled.scala 286:16 287:8]
  assign ram_MPORT_mask = 1'h1; // @[Decoupled.scala 286:16 287:24]
  assign ram_MPORT_en = io_enq_ready & io_enq_valid; // @[Decoupled.scala 51:35]
  assign io_enq_ready = ~full; // @[Decoupled.scala 303:19]
  assign io_deq_valid = ~empty; // @[Decoupled.scala 302:19]
  assign io_deq_bits = ram_io_deq_bits_MPORT_data; // @[Decoupled.scala 310:17]
  always @(posedge clock) begin
    if (ram_MPORT_en & ram_MPORT_mask) begin
      ram[ram_MPORT_addr] <= ram_MPORT_data; // @[Decoupled.scala 273:95]
    end
    if (reset) begin // @[Counter.scala 61:40]
      enq_ptr_value <= 3'h0; // @[Counter.scala 61:40]
    end else if (do_enq) begin // @[Decoupled.scala 286:16]
      if (wrap) begin // @[Counter.scala 87:20]
        enq_ptr_value <= 3'h0; // @[Counter.scala 87:28]
      end else begin
        enq_ptr_value <= _value_T_1; // @[Counter.scala 77:15]
      end
    end
    if (reset) begin // @[Counter.scala 61:40]
      deq_ptr_value <= 3'h0; // @[Counter.scala 61:40]
    end else if (do_deq) begin // @[Decoupled.scala 290:16]
      if (wrap_1) begin // @[Counter.scala 87:20]
        deq_ptr_value <= 3'h0; // @[Counter.scala 87:28]
      end else begin
        deq_ptr_value <= _value_T_3; // @[Counter.scala 77:15]
      end
    end
    if (reset) begin // @[Decoupled.scala 276:27]
      maybe_full <= 1'h0; // @[Decoupled.scala 276:27]
    end else if (do_enq != do_deq) begin // @[Decoupled.scala 293:27]
      maybe_full <= do_enq; // @[Decoupled.scala 294:16]
    end
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_GARBAGE_ASSIGN
  _RAND_1 = {1{`RANDOM}};
`endif // RANDOMIZE_GARBAGE_ASSIGN
`ifdef RANDOMIZE_MEM_INIT
  _RAND_0 = {1{`RANDOM}};
  for (initvar = 0; initvar < 5; initvar = initvar+1)
    ram[initvar] = _RAND_0[4:0];
`endif // RANDOMIZE_MEM_INIT
`ifdef RANDOMIZE_REG_INIT
  _RAND_2 = {1{`RANDOM}};
  enq_ptr_value = _RAND_2[2:0];
  _RAND_3 = {1{`RANDOM}};
  deq_ptr_value = _RAND_3[2:0];
  _RAND_4 = {1{`RANDOM}};
  maybe_full = _RAND_4[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module QueueCompatibility_5(
  input        clock,
  input        reset,
  output       io_enq_ready,
  input        io_enq_valid,
  input  [7:0] io_enq_bits_len,
  input        io_enq_bits_id,
  input        io_deq_ready,
  output       io_deq_valid,
  output [7:0] io_deq_bits_len,
  output       io_deq_bits_id
);
`ifdef RANDOMIZE_MEM_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
`endif // RANDOMIZE_MEM_INIT
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_2;
`endif // RANDOMIZE_REG_INIT
  reg [7:0] ram_len [0:0]; // @[Decoupled.scala 273:95]
  wire  ram_len_io_deq_bits_MPORT_en; // @[Decoupled.scala 273:95 310:23]
  wire  ram_len_io_deq_bits_MPORT_addr; // @[Decoupled.scala 273:95 310:23]
  wire [7:0] ram_len_io_deq_bits_MPORT_data; // @[Decoupled.scala 273:95]
  wire [7:0] ram_len_MPORT_data; // @[Decoupled.scala 273:95 286:16 287:24]
  wire  ram_len_MPORT_addr; // @[Decoupled.scala 273:95 286:16 287:8]
  wire  ram_len_MPORT_mask; // @[Decoupled.scala 273:95 286:16 287:24]
  wire  ram_len_MPORT_en; // @[Decoupled.scala 273:95 51:35]
  reg  ram_id [0:0]; // @[Decoupled.scala 273:95]
  wire  ram_id_io_deq_bits_MPORT_en; // @[Decoupled.scala 273:95 310:23]
  wire  ram_id_io_deq_bits_MPORT_addr; // @[Decoupled.scala 273:95 310:23]
  wire  ram_id_io_deq_bits_MPORT_data; // @[Decoupled.scala 273:95]
  wire  ram_id_MPORT_data; // @[Decoupled.scala 273:95 286:16 287:24]
  wire  ram_id_MPORT_addr; // @[Decoupled.scala 273:95 286:16 287:8]
  wire  ram_id_MPORT_mask; // @[Decoupled.scala 273:95 286:16 287:24]
  wire  ram_id_MPORT_en; // @[Decoupled.scala 273:95 51:35]
  reg  maybe_full; // @[Decoupled.scala 276:27]
  wire  empty = ~maybe_full; // @[Decoupled.scala 278:28]
  wire  do_enq = io_enq_ready & io_enq_valid; // @[Decoupled.scala 51:35]
  wire  do_deq = io_deq_ready & io_deq_valid; // @[Decoupled.scala 51:35]
  assign ram_len_io_deq_bits_MPORT_en = 1'h1; // @[Decoupled.scala 310:23]
  assign ram_len_io_deq_bits_MPORT_addr = 1'h0; // @[Decoupled.scala 310:23]
  assign ram_len_io_deq_bits_MPORT_data = ram_len[ram_len_io_deq_bits_MPORT_addr]; // @[Decoupled.scala 273:95]
  assign ram_len_MPORT_data = io_enq_bits_len; // @[Decoupled.scala 286:16 287:24]
  assign ram_len_MPORT_addr = 1'h0; // @[Decoupled.scala 286:16 287:8]
  assign ram_len_MPORT_mask = 1'h1; // @[Decoupled.scala 286:16 287:24]
  assign ram_len_MPORT_en = io_enq_ready & io_enq_valid; // @[Decoupled.scala 51:35]
  assign ram_id_io_deq_bits_MPORT_en = 1'h1; // @[Decoupled.scala 310:23]
  assign ram_id_io_deq_bits_MPORT_addr = 1'h0; // @[Decoupled.scala 310:23]
  assign ram_id_io_deq_bits_MPORT_data = ram_id[ram_id_io_deq_bits_MPORT_addr]; // @[Decoupled.scala 273:95]
  assign ram_id_MPORT_data = io_enq_bits_id; // @[Decoupled.scala 286:16 287:24]
  assign ram_id_MPORT_addr = 1'h0; // @[Decoupled.scala 286:16 287:8]
  assign ram_id_MPORT_mask = 1'h1; // @[Decoupled.scala 286:16 287:24]
  assign ram_id_MPORT_en = io_enq_ready & io_enq_valid; // @[Decoupled.scala 51:35]
  assign io_enq_ready = ~maybe_full; // @[Decoupled.scala 303:19]
  assign io_deq_valid = ~empty; // @[Decoupled.scala 302:19]
  assign io_deq_bits_len = ram_len_io_deq_bits_MPORT_data; // @[Decoupled.scala 310:17]
  assign io_deq_bits_id = ram_id_io_deq_bits_MPORT_data; // @[Decoupled.scala 310:17]
  always @(posedge clock) begin
    if (ram_len_MPORT_en & ram_len_MPORT_mask) begin
      ram_len[ram_len_MPORT_addr] <= ram_len_MPORT_data; // @[Decoupled.scala 273:95]
    end
    if (ram_id_MPORT_en & ram_id_MPORT_mask) begin
      ram_id[ram_id_MPORT_addr] <= ram_id_MPORT_data; // @[Decoupled.scala 273:95]
    end
    if (reset) begin // @[Decoupled.scala 276:27]
      maybe_full <= 1'h0; // @[Decoupled.scala 276:27]
    end else if (do_enq != do_deq) begin // @[Decoupled.scala 293:27]
      maybe_full <= do_enq; // @[Decoupled.scala 294:16]
    end
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_MEM_INIT
  _RAND_0 = {1{`RANDOM}};
  for (initvar = 0; initvar < 1; initvar = initvar+1)
    ram_len[initvar] = _RAND_0[7:0];
  _RAND_1 = {1{`RANDOM}};
  for (initvar = 0; initvar < 1; initvar = initvar+1)
    ram_id[initvar] = _RAND_1[0:0];
`endif // RANDOMIZE_MEM_INIT
`ifdef RANDOMIZE_REG_INIT
  _RAND_2 = {1{`RANDOM}};
  maybe_full = _RAND_2[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module QueueCompatibility_6(
  input   clock,
  input   reset,
  output  io_enq_ready,
  input   io_enq_valid,
  input   io_enq_bits,
  input   io_deq_ready,
  output  io_deq_valid,
  output  io_deq_bits
);
`ifdef RANDOMIZE_MEM_INIT
  reg [31:0] _RAND_0;
`endif // RANDOMIZE_MEM_INIT
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_1;
`endif // RANDOMIZE_REG_INIT
  reg  ram [0:0]; // @[Decoupled.scala 273:95]
  wire  ram_io_deq_bits_MPORT_en; // @[Decoupled.scala 273:95 310:23]
  wire  ram_io_deq_bits_MPORT_addr; // @[Decoupled.scala 273:95 310:23]
  wire  ram_io_deq_bits_MPORT_data; // @[Decoupled.scala 273:95]
  wire  ram_MPORT_data; // @[Decoupled.scala 273:95 286:16 287:24]
  wire  ram_MPORT_addr; // @[Decoupled.scala 273:95 286:16 287:8]
  wire  ram_MPORT_mask; // @[Decoupled.scala 273:95 286:16 287:24]
  wire  ram_MPORT_en; // @[Decoupled.scala 273:95 51:35]
  reg  maybe_full; // @[Decoupled.scala 276:27]
  wire  empty = ~maybe_full; // @[Decoupled.scala 278:28]
  wire  do_enq = io_enq_ready & io_enq_valid; // @[Decoupled.scala 51:35]
  wire  do_deq = io_deq_ready & io_deq_valid; // @[Decoupled.scala 51:35]
  assign ram_io_deq_bits_MPORT_en = 1'h1; // @[Decoupled.scala 310:23]
  assign ram_io_deq_bits_MPORT_addr = 1'h0; // @[Decoupled.scala 310:23]
  assign ram_io_deq_bits_MPORT_data = ram[ram_io_deq_bits_MPORT_addr]; // @[Decoupled.scala 273:95]
  assign ram_MPORT_data = io_enq_bits; // @[Decoupled.scala 286:16 287:24]
  assign ram_MPORT_addr = 1'h0; // @[Decoupled.scala 286:16 287:8]
  assign ram_MPORT_mask = 1'h1; // @[Decoupled.scala 286:16 287:24]
  assign ram_MPORT_en = io_enq_ready & io_enq_valid; // @[Decoupled.scala 51:35]
  assign io_enq_ready = ~maybe_full; // @[Decoupled.scala 303:19]
  assign io_deq_valid = ~empty; // @[Decoupled.scala 302:19]
  assign io_deq_bits = ram_io_deq_bits_MPORT_data; // @[Decoupled.scala 310:17]
  always @(posedge clock) begin
    if (ram_MPORT_en & ram_MPORT_mask) begin
      ram[ram_MPORT_addr] <= ram_MPORT_data; // @[Decoupled.scala 273:95]
    end
    if (reset) begin // @[Decoupled.scala 276:27]
      maybe_full <= 1'h0; // @[Decoupled.scala 276:27]
    end else if (do_enq != do_deq) begin // @[Decoupled.scala 293:27]
      maybe_full <= do_enq; // @[Decoupled.scala 294:16]
    end
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_MEM_INIT
  _RAND_0 = {1{`RANDOM}};
  for (initvar = 0; initvar < 1; initvar = initvar+1)
    ram[initvar] = _RAND_0[0:0];
`endif // RANDOMIZE_MEM_INIT
`ifdef RANDOMIZE_REG_INIT
  _RAND_1 = {1{`RANDOM}};
  maybe_full = _RAND_1[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module NastiErrorSlave(
  input         clock,
  input         reset,
  output        io_aw_ready,
  input         io_aw_valid,
  input  [11:0] io_aw_bits_addr,
  input         io_aw_bits_id,
  output        io_w_ready,
  input         io_w_valid,
  input         io_w_bits_last,
  input         io_b_ready,
  output        io_b_valid,
  output        io_b_bits_id,
  output        io_ar_ready,
  input         io_ar_valid,
  input  [11:0] io_ar_bits_addr,
  input  [7:0]  io_ar_bits_len,
  input         io_ar_bits_id,
  input         io_r_ready,
  output        io_r_valid,
  output        io_r_bits_last,
  output        io_r_bits_id
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
`endif // RANDOMIZE_REG_INIT
  wire  r_queue_clock; // @[nasti.scala 363:23]
  wire  r_queue_reset; // @[nasti.scala 363:23]
  wire  r_queue_io_enq_ready; // @[nasti.scala 363:23]
  wire  r_queue_io_enq_valid; // @[nasti.scala 363:23]
  wire [7:0] r_queue_io_enq_bits_len; // @[nasti.scala 363:23]
  wire  r_queue_io_enq_bits_id; // @[nasti.scala 363:23]
  wire  r_queue_io_deq_ready; // @[nasti.scala 363:23]
  wire  r_queue_io_deq_valid; // @[nasti.scala 363:23]
  wire [7:0] r_queue_io_deq_bits_len; // @[nasti.scala 363:23]
  wire  r_queue_io_deq_bits_id; // @[nasti.scala 363:23]
  wire  b_queue_clock; // @[nasti.scala 396:23]
  wire  b_queue_reset; // @[nasti.scala 396:23]
  wire  b_queue_io_enq_ready; // @[nasti.scala 396:23]
  wire  b_queue_io_enq_valid; // @[nasti.scala 396:23]
  wire  b_queue_io_enq_bits; // @[nasti.scala 396:23]
  wire  b_queue_io_deq_ready; // @[nasti.scala 396:23]
  wire  b_queue_io_deq_valid; // @[nasti.scala 396:23]
  wire  b_queue_io_deq_bits; // @[nasti.scala 396:23]
  wire  _T = io_ar_ready & io_ar_valid; // @[Decoupled.scala 51:35]
  wire  _T_2 = ~reset; // @[nasti.scala 360:29]
  wire  _T_3 = io_aw_ready & io_aw_valid; // @[Decoupled.scala 51:35]
  reg  responding; // @[nasti.scala 366:23]
  reg [7:0] beats_left; // @[nasti.scala 367:23]
  wire  _GEN_0 = ~responding & r_queue_io_deq_valid | responding; // @[nasti.scala 369:46 370:16 366:23]
  wire [7:0] _GEN_1 = ~responding & r_queue_io_deq_valid ? r_queue_io_deq_bits_len : beats_left; // @[nasti.scala 369:46 371:16 367:23]
  wire  _io_r_bits_last_T = beats_left == 8'h0; // @[nasti.scala 378:32]
  wire  _r_queue_io_deq_ready_T = io_r_ready & io_r_valid; // @[Decoupled.scala 51:35]
  wire [7:0] _beats_left_T_1 = beats_left - 8'h1; // @[nasti.scala 386:32]
  reg  draining; // @[nasti.scala 390:21]
  wire  _GEN_6 = _T_3 | draining; // @[nasti.scala 390:21 393:{21,32}]
  wire  _T_11 = io_w_ready & io_w_valid; // @[Decoupled.scala 51:35]
  wire  _b_queue_io_enq_valid_T = ~draining; // @[nasti.scala 397:42]
  QueueCompatibility_5 r_queue ( // @[nasti.scala 363:23]
    .clock(r_queue_clock),
    .reset(r_queue_reset),
    .io_enq_ready(r_queue_io_enq_ready),
    .io_enq_valid(r_queue_io_enq_valid),
    .io_enq_bits_len(r_queue_io_enq_bits_len),
    .io_enq_bits_id(r_queue_io_enq_bits_id),
    .io_deq_ready(r_queue_io_deq_ready),
    .io_deq_valid(r_queue_io_deq_valid),
    .io_deq_bits_len(r_queue_io_deq_bits_len),
    .io_deq_bits_id(r_queue_io_deq_bits_id)
  );
  QueueCompatibility_6 b_queue ( // @[nasti.scala 396:23]
    .clock(b_queue_clock),
    .reset(b_queue_reset),
    .io_enq_ready(b_queue_io_enq_ready),
    .io_enq_valid(b_queue_io_enq_valid),
    .io_enq_bits(b_queue_io_enq_bits),
    .io_deq_ready(b_queue_io_deq_ready),
    .io_deq_valid(b_queue_io_deq_valid),
    .io_deq_bits(b_queue_io_deq_bits)
  );
  assign io_aw_ready = b_queue_io_enq_ready & _b_queue_io_enq_valid_T; // @[nasti.scala 399:39]
  assign io_w_ready = draining; // @[nasti.scala 391:14]
  assign io_b_valid = b_queue_io_deq_valid & _b_queue_io_enq_valid_T; // @[nasti.scala 400:38]
  assign io_b_bits_id = b_queue_io_deq_bits; // @[nasti.scala 401:16]
  assign io_ar_ready = r_queue_io_enq_ready; // @[nasti.scala 364:18]
  assign io_r_valid = r_queue_io_deq_valid & responding; // @[nasti.scala 374:38]
  assign io_r_bits_last = beats_left == 8'h0; // @[nasti.scala 378:32]
  assign io_r_bits_id = r_queue_io_deq_bits_id; // @[nasti.scala 375:16]
  assign r_queue_clock = clock;
  assign r_queue_reset = reset;
  assign r_queue_io_enq_valid = io_ar_valid; // @[nasti.scala 364:18]
  assign r_queue_io_enq_bits_len = io_ar_bits_len; // @[nasti.scala 364:18]
  assign r_queue_io_enq_bits_id = io_ar_bits_id; // @[nasti.scala 364:18]
  assign r_queue_io_deq_ready = _r_queue_io_deq_ready_T & io_r_bits_last; // @[nasti.scala 380:37]
  assign b_queue_clock = clock;
  assign b_queue_reset = reset;
  assign b_queue_io_enq_valid = io_aw_valid & ~draining; // @[nasti.scala 397:39]
  assign b_queue_io_enq_bits = io_aw_bits_id; // @[nasti.scala 398:23]
  assign b_queue_io_deq_ready = io_b_ready & _b_queue_io_enq_valid_T; // @[nasti.scala 403:38]
  always @(posedge clock) begin
    if (reset) begin // @[nasti.scala 366:23]
      responding <= 1'h0; // @[nasti.scala 366:23]
    end else if (_r_queue_io_deq_ready_T) begin // @[nasti.scala 382:20]
      if (_io_r_bits_last_T) begin // @[nasti.scala 383:35]
        responding <= 1'h0; // @[nasti.scala 384:18]
      end else begin
        responding <= _GEN_0;
      end
    end else begin
      responding <= _GEN_0;
    end
    if (reset) begin // @[nasti.scala 367:23]
      beats_left <= 8'h0; // @[nasti.scala 367:23]
    end else if (_r_queue_io_deq_ready_T) begin // @[nasti.scala 382:20]
      if (_io_r_bits_last_T) begin // @[nasti.scala 383:35]
        beats_left <= _GEN_1;
      end else begin
        beats_left <= _beats_left_T_1; // @[nasti.scala 386:18]
      end
    end else begin
      beats_left <= _GEN_1;
    end
    if (reset) begin // @[nasti.scala 390:21]
      draining <= 1'h0; // @[nasti.scala 390:21]
    end else if (_T_11 & io_w_bits_last) begin // @[nasti.scala 394:38]
      draining <= 1'h0; // @[nasti.scala 394:49]
    end else begin
      draining <= _GEN_6;
    end
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T & ~reset) begin
          $fwrite(32'h80000002,"Invalid read address %x\n",io_ar_bits_addr); // @[nasti.scala 360:29]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_3 & _T_2) begin
          $fwrite(32'h80000002,"Invalid write address %x\n",io_aw_bits_addr); // @[nasti.scala 361:29]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  responding = _RAND_0[0:0];
  _RAND_1 = {1{`RANDOM}};
  beats_left = _RAND_1[7:0];
  _RAND_2 = {1{`RANDOM}};
  draining = _RAND_2[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module RRArbiter(
  input        clock,
  output       io_in_0_ready,
  input        io_in_0_valid,
  input        io_in_0_bits_id,
  output       io_in_1_ready,
  input        io_in_1_valid,
  input        io_in_1_bits_id,
  output       io_in_2_ready,
  input        io_in_2_valid,
  input        io_in_2_bits_id,
  output       io_in_3_ready,
  input        io_in_3_valid,
  input        io_in_3_bits_id,
  output       io_in_4_ready,
  input        io_in_4_valid,
  input        io_in_4_bits_id,
  output       io_in_5_ready,
  input        io_in_5_valid,
  input        io_in_5_bits_id,
  input        io_out_ready,
  output       io_out_valid,
  output [1:0] io_out_bits_resp,
  output       io_out_bits_id,
  output [2:0] io_chosen
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
`endif // RANDOMIZE_REG_INIT
  wire  _GEN_1 = 3'h1 == io_chosen ? io_in_1_valid : io_in_0_valid; // @[Arbiter.scala 55:{16,16}]
  wire  _GEN_2 = 3'h2 == io_chosen ? io_in_2_valid : _GEN_1; // @[Arbiter.scala 55:{16,16}]
  wire  _GEN_3 = 3'h3 == io_chosen ? io_in_3_valid : _GEN_2; // @[Arbiter.scala 55:{16,16}]
  wire  _GEN_4 = 3'h4 == io_chosen ? io_in_4_valid : _GEN_3; // @[Arbiter.scala 55:{16,16}]
  wire  _GEN_13 = 3'h1 == io_chosen ? io_in_1_bits_id : io_in_0_bits_id; // @[Arbiter.scala 56:{15,15}]
  wire  _GEN_14 = 3'h2 == io_chosen ? io_in_2_bits_id : _GEN_13; // @[Arbiter.scala 56:{15,15}]
  wire  _GEN_15 = 3'h3 == io_chosen ? io_in_3_bits_id : _GEN_14; // @[Arbiter.scala 56:{15,15}]
  wire  _GEN_16 = 3'h4 == io_chosen ? io_in_4_bits_id : _GEN_15; // @[Arbiter.scala 56:{15,15}]
  wire  _ctrl_validMask_grantMask_lastGrant_T = io_out_ready & io_out_valid; // @[Decoupled.scala 51:35]
  reg [2:0] lastGrant; // @[Reg.scala 19:16]
  wire  grantMask_1 = 3'h1 > lastGrant; // @[Arbiter.scala 81:49]
  wire  grantMask_2 = 3'h2 > lastGrant; // @[Arbiter.scala 81:49]
  wire  grantMask_3 = 3'h3 > lastGrant; // @[Arbiter.scala 81:49]
  wire  grantMask_4 = 3'h4 > lastGrant; // @[Arbiter.scala 81:49]
  wire  grantMask_5 = 3'h5 > lastGrant; // @[Arbiter.scala 81:49]
  wire  validMask_1 = io_in_1_valid & grantMask_1; // @[Arbiter.scala 82:76]
  wire  validMask_2 = io_in_2_valid & grantMask_2; // @[Arbiter.scala 82:76]
  wire  validMask_3 = io_in_3_valid & grantMask_3; // @[Arbiter.scala 82:76]
  wire  validMask_4 = io_in_4_valid & grantMask_4; // @[Arbiter.scala 82:76]
  wire  validMask_5 = io_in_5_valid & grantMask_5; // @[Arbiter.scala 82:76]
  wire  ctrl_2 = ~validMask_1; // @[Arbiter.scala 45:78]
  wire  ctrl_3 = ~(validMask_1 | validMask_2); // @[Arbiter.scala 45:78]
  wire  ctrl_4 = ~(validMask_1 | validMask_2 | validMask_3); // @[Arbiter.scala 45:78]
  wire  ctrl_5 = ~(validMask_1 | validMask_2 | validMask_3 | validMask_4); // @[Arbiter.scala 45:78]
  wire  ctrl_6 = ~(validMask_1 | validMask_2 | validMask_3 | validMask_4 | validMask_5); // @[Arbiter.scala 45:78]
  wire  ctrl_7 = ~(validMask_1 | validMask_2 | validMask_3 | validMask_4 | validMask_5 | io_in_0_valid); // @[Arbiter.scala 45:78]
  wire  ctrl_8 = ~(validMask_1 | validMask_2 | validMask_3 | validMask_4 | validMask_5 | io_in_0_valid | io_in_1_valid); // @[Arbiter.scala 45:78]
  wire  ctrl_9 = ~(validMask_1 | validMask_2 | validMask_3 | validMask_4 | validMask_5 | io_in_0_valid | io_in_1_valid
     | io_in_2_valid); // @[Arbiter.scala 45:78]
  wire  ctrl_10 = ~(validMask_1 | validMask_2 | validMask_3 | validMask_4 | validMask_5 | io_in_0_valid | io_in_1_valid
     | io_in_2_valid | io_in_3_valid); // @[Arbiter.scala 45:78]
  wire  ctrl_11 = ~(validMask_1 | validMask_2 | validMask_3 | validMask_4 | validMask_5 | io_in_0_valid | io_in_1_valid
     | io_in_2_valid | io_in_3_valid | io_in_4_valid); // @[Arbiter.scala 45:78]
  wire  _T_3 = grantMask_1 | ctrl_7; // @[Arbiter.scala 86:50]
  wire  _T_5 = ctrl_2 & grantMask_2 | ctrl_8; // @[Arbiter.scala 86:50]
  wire  _T_7 = ctrl_3 & grantMask_3 | ctrl_9; // @[Arbiter.scala 86:50]
  wire  _T_9 = ctrl_4 & grantMask_4 | ctrl_10; // @[Arbiter.scala 86:50]
  wire  _T_11 = ctrl_5 & grantMask_5 | ctrl_11; // @[Arbiter.scala 86:50]
  wire [2:0] _GEN_25 = io_in_4_valid ? 3'h4 : 3'h5; // @[Arbiter.scala 91:{26,35} 89:41]
  wire [2:0] _GEN_26 = io_in_3_valid ? 3'h3 : _GEN_25; // @[Arbiter.scala 91:{26,35}]
  wire [2:0] _GEN_27 = io_in_2_valid ? 3'h2 : _GEN_26; // @[Arbiter.scala 91:{26,35}]
  wire [2:0] _GEN_28 = io_in_1_valid ? 3'h1 : _GEN_27; // @[Arbiter.scala 91:{26,35}]
  wire [2:0] _GEN_29 = io_in_0_valid ? 3'h0 : _GEN_28; // @[Arbiter.scala 91:{26,35}]
  wire [2:0] _GEN_30 = validMask_5 ? 3'h5 : _GEN_29; // @[Arbiter.scala 93:{24,33}]
  wire [2:0] _GEN_31 = validMask_4 ? 3'h4 : _GEN_30; // @[Arbiter.scala 93:{24,33}]
  wire [2:0] _GEN_32 = validMask_3 ? 3'h3 : _GEN_31; // @[Arbiter.scala 93:{24,33}]
  wire [2:0] _GEN_33 = validMask_2 ? 3'h2 : _GEN_32; // @[Arbiter.scala 93:{24,33}]
  assign io_in_0_ready = ctrl_6 & io_out_ready; // @[Arbiter.scala 74:21]
  assign io_in_1_ready = _T_3 & io_out_ready; // @[Arbiter.scala 74:21]
  assign io_in_2_ready = _T_5 & io_out_ready; // @[Arbiter.scala 74:21]
  assign io_in_3_ready = _T_7 & io_out_ready; // @[Arbiter.scala 74:21]
  assign io_in_4_ready = _T_9 & io_out_ready; // @[Arbiter.scala 74:21]
  assign io_in_5_ready = _T_11 & io_out_ready; // @[Arbiter.scala 74:21]
  assign io_out_valid = 3'h5 == io_chosen ? io_in_5_valid : _GEN_4; // @[Arbiter.scala 55:{16,16}]
  assign io_out_bits_resp = 3'h5 == io_chosen ? 2'h3 : 2'h0; // @[Arbiter.scala 56:{15,15}]
  assign io_out_bits_id = 3'h5 == io_chosen ? io_in_5_bits_id : _GEN_16; // @[Arbiter.scala 56:{15,15}]
  assign io_chosen = validMask_1 ? 3'h1 : _GEN_33; // @[Arbiter.scala 93:{24,33}]
  always @(posedge clock) begin
    if (_ctrl_validMask_grantMask_lastGrant_T) begin // @[Reg.scala 20:18]
      lastGrant <= io_chosen; // @[Reg.scala 20:22]
    end
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  lastGrant = _RAND_0[2:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module HellaPeekingArbiter(
  input         clock,
  input         reset,
  output        io_in_0_ready,
  input         io_in_0_valid,
  input  [31:0] io_in_0_bits_data,
  input         io_in_0_bits_id,
  output        io_in_1_ready,
  input         io_in_1_valid,
  input  [31:0] io_in_1_bits_data,
  input         io_in_1_bits_id,
  output        io_in_2_ready,
  input         io_in_2_valid,
  input  [31:0] io_in_2_bits_data,
  input         io_in_2_bits_id,
  output        io_in_3_ready,
  input         io_in_3_valid,
  input  [31:0] io_in_3_bits_data,
  input         io_in_3_bits_id,
  output        io_in_4_ready,
  input         io_in_4_valid,
  input  [31:0] io_in_4_bits_data,
  input         io_in_4_bits_id,
  output        io_in_5_ready,
  input         io_in_5_valid,
  input         io_in_5_bits_last,
  input         io_in_5_bits_id,
  input         io_out_ready,
  output        io_out_valid,
  output [1:0]  io_out_bits_resp,
  output [31:0] io_out_bits_data,
  output        io_out_bits_last,
  output        io_out_bits_id
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
`endif // RANDOMIZE_REG_INIT
  reg [2:0] lockIdx; // @[Arbiters.scala 26:24]
  reg  locked; // @[Arbiters.scala 27:23]
  wire [2:0] _choice_T_1 = lockIdx + 3'h1; // @[Arbiters.scala 31:55]
  wire [3:0] _choice_T_3 = {{1'd0}, _choice_T_1}; // @[Arbiters.scala 22:37]
  wire [2:0] _choice_T_6 = _choice_T_1 - 3'h6; // @[Arbiters.scala 22:54]
  wire  _GEN_1 = 3'h1 == _choice_T_3[2:0] ? io_in_1_valid : io_in_0_valid; // @[Arbiters.scala 22:{10,10}]
  wire  _GEN_2 = 3'h2 == _choice_T_3[2:0] ? io_in_2_valid : _GEN_1; // @[Arbiters.scala 22:{10,10}]
  wire  _GEN_3 = 3'h3 == _choice_T_3[2:0] ? io_in_3_valid : _GEN_2; // @[Arbiters.scala 22:{10,10}]
  wire  _GEN_4 = 3'h4 == _choice_T_3[2:0] ? io_in_4_valid : _GEN_3; // @[Arbiters.scala 22:{10,10}]
  wire  _GEN_5 = 3'h5 == _choice_T_3[2:0] ? io_in_5_valid : _GEN_4; // @[Arbiters.scala 22:{10,10}]
  wire  _GEN_7 = 3'h1 == _choice_T_6 ? io_in_1_valid : io_in_0_valid; // @[Arbiters.scala 22:{10,10}]
  wire  _GEN_8 = 3'h2 == _choice_T_6 ? io_in_2_valid : _GEN_7; // @[Arbiters.scala 22:{10,10}]
  wire  _GEN_9 = 3'h3 == _choice_T_6 ? io_in_3_valid : _GEN_8; // @[Arbiters.scala 22:{10,10}]
  wire  _GEN_10 = 3'h4 == _choice_T_6 ? io_in_4_valid : _GEN_9; // @[Arbiters.scala 22:{10,10}]
  wire  _GEN_11 = 3'h5 == _choice_T_6 ? io_in_5_valid : _GEN_10; // @[Arbiters.scala 22:{10,10}]
  wire  _choice_T_7 = _choice_T_1 < 3'h6 ? _GEN_5 : _GEN_11; // @[Arbiters.scala 22:10]
  wire [2:0] _choice_T_10 = 3'h1 + _choice_T_1; // @[Arbiters.scala 22:37]
  wire [2:0] _choice_T_12 = _choice_T_1 - 3'h5; // @[Arbiters.scala 22:54]
  wire  _GEN_13 = 3'h1 == _choice_T_10 ? io_in_1_valid : io_in_0_valid; // @[Arbiters.scala 22:{10,10}]
  wire  _GEN_14 = 3'h2 == _choice_T_10 ? io_in_2_valid : _GEN_13; // @[Arbiters.scala 22:{10,10}]
  wire  _GEN_15 = 3'h3 == _choice_T_10 ? io_in_3_valid : _GEN_14; // @[Arbiters.scala 22:{10,10}]
  wire  _GEN_16 = 3'h4 == _choice_T_10 ? io_in_4_valid : _GEN_15; // @[Arbiters.scala 22:{10,10}]
  wire  _GEN_17 = 3'h5 == _choice_T_10 ? io_in_5_valid : _GEN_16; // @[Arbiters.scala 22:{10,10}]
  wire  _GEN_19 = 3'h1 == _choice_T_12 ? io_in_1_valid : io_in_0_valid; // @[Arbiters.scala 22:{10,10}]
  wire  _GEN_20 = 3'h2 == _choice_T_12 ? io_in_2_valid : _GEN_19; // @[Arbiters.scala 22:{10,10}]
  wire  _GEN_21 = 3'h3 == _choice_T_12 ? io_in_3_valid : _GEN_20; // @[Arbiters.scala 22:{10,10}]
  wire  _GEN_22 = 3'h4 == _choice_T_12 ? io_in_4_valid : _GEN_21; // @[Arbiters.scala 22:{10,10}]
  wire  _GEN_23 = 3'h5 == _choice_T_12 ? io_in_5_valid : _GEN_22; // @[Arbiters.scala 22:{10,10}]
  wire  _choice_T_13 = _choice_T_1 < 3'h5 ? _GEN_17 : _GEN_23; // @[Arbiters.scala 22:10]
  wire [2:0] _choice_T_16 = 3'h2 + _choice_T_1; // @[Arbiters.scala 22:37]
  wire [2:0] _choice_T_18 = _choice_T_1 - 3'h4; // @[Arbiters.scala 22:54]
  wire  _GEN_25 = 3'h1 == _choice_T_16 ? io_in_1_valid : io_in_0_valid; // @[Arbiters.scala 22:{10,10}]
  wire  _GEN_26 = 3'h2 == _choice_T_16 ? io_in_2_valid : _GEN_25; // @[Arbiters.scala 22:{10,10}]
  wire  _GEN_27 = 3'h3 == _choice_T_16 ? io_in_3_valid : _GEN_26; // @[Arbiters.scala 22:{10,10}]
  wire  _GEN_28 = 3'h4 == _choice_T_16 ? io_in_4_valid : _GEN_27; // @[Arbiters.scala 22:{10,10}]
  wire  _GEN_29 = 3'h5 == _choice_T_16 ? io_in_5_valid : _GEN_28; // @[Arbiters.scala 22:{10,10}]
  wire  _GEN_31 = 3'h1 == _choice_T_18 ? io_in_1_valid : io_in_0_valid; // @[Arbiters.scala 22:{10,10}]
  wire  _GEN_32 = 3'h2 == _choice_T_18 ? io_in_2_valid : _GEN_31; // @[Arbiters.scala 22:{10,10}]
  wire  _GEN_33 = 3'h3 == _choice_T_18 ? io_in_3_valid : _GEN_32; // @[Arbiters.scala 22:{10,10}]
  wire  _GEN_34 = 3'h4 == _choice_T_18 ? io_in_4_valid : _GEN_33; // @[Arbiters.scala 22:{10,10}]
  wire  _GEN_35 = 3'h5 == _choice_T_18 ? io_in_5_valid : _GEN_34; // @[Arbiters.scala 22:{10,10}]
  wire  _choice_T_19 = _choice_T_1 < 3'h4 ? _GEN_29 : _GEN_35; // @[Arbiters.scala 22:10]
  wire [2:0] _choice_T_22 = 3'h3 + _choice_T_1; // @[Arbiters.scala 22:37]
  wire [2:0] _choice_T_24 = _choice_T_1 - 3'h3; // @[Arbiters.scala 22:54]
  wire  _GEN_37 = 3'h1 == _choice_T_22 ? io_in_1_valid : io_in_0_valid; // @[Arbiters.scala 22:{10,10}]
  wire  _GEN_38 = 3'h2 == _choice_T_22 ? io_in_2_valid : _GEN_37; // @[Arbiters.scala 22:{10,10}]
  wire  _GEN_39 = 3'h3 == _choice_T_22 ? io_in_3_valid : _GEN_38; // @[Arbiters.scala 22:{10,10}]
  wire  _GEN_40 = 3'h4 == _choice_T_22 ? io_in_4_valid : _GEN_39; // @[Arbiters.scala 22:{10,10}]
  wire  _GEN_41 = 3'h5 == _choice_T_22 ? io_in_5_valid : _GEN_40; // @[Arbiters.scala 22:{10,10}]
  wire  _GEN_43 = 3'h1 == _choice_T_24 ? io_in_1_valid : io_in_0_valid; // @[Arbiters.scala 22:{10,10}]
  wire  _GEN_44 = 3'h2 == _choice_T_24 ? io_in_2_valid : _GEN_43; // @[Arbiters.scala 22:{10,10}]
  wire  _GEN_45 = 3'h3 == _choice_T_24 ? io_in_3_valid : _GEN_44; // @[Arbiters.scala 22:{10,10}]
  wire  _GEN_46 = 3'h4 == _choice_T_24 ? io_in_4_valid : _GEN_45; // @[Arbiters.scala 22:{10,10}]
  wire  _GEN_47 = 3'h5 == _choice_T_24 ? io_in_5_valid : _GEN_46; // @[Arbiters.scala 22:{10,10}]
  wire  _choice_T_25 = _choice_T_1 < 3'h3 ? _GEN_41 : _GEN_47; // @[Arbiters.scala 22:10]
  wire [2:0] _choice_T_28 = 3'h4 + _choice_T_1; // @[Arbiters.scala 22:37]
  wire [2:0] _choice_T_30 = _choice_T_1 - 3'h2; // @[Arbiters.scala 22:54]
  wire  _GEN_49 = 3'h1 == _choice_T_28 ? io_in_1_valid : io_in_0_valid; // @[Arbiters.scala 22:{10,10}]
  wire  _GEN_50 = 3'h2 == _choice_T_28 ? io_in_2_valid : _GEN_49; // @[Arbiters.scala 22:{10,10}]
  wire  _GEN_51 = 3'h3 == _choice_T_28 ? io_in_3_valid : _GEN_50; // @[Arbiters.scala 22:{10,10}]
  wire  _GEN_52 = 3'h4 == _choice_T_28 ? io_in_4_valid : _GEN_51; // @[Arbiters.scala 22:{10,10}]
  wire  _GEN_53 = 3'h5 == _choice_T_28 ? io_in_5_valid : _GEN_52; // @[Arbiters.scala 22:{10,10}]
  wire  _GEN_55 = 3'h1 == _choice_T_30 ? io_in_1_valid : io_in_0_valid; // @[Arbiters.scala 22:{10,10}]
  wire  _GEN_56 = 3'h2 == _choice_T_30 ? io_in_2_valid : _GEN_55; // @[Arbiters.scala 22:{10,10}]
  wire  _GEN_57 = 3'h3 == _choice_T_30 ? io_in_3_valid : _GEN_56; // @[Arbiters.scala 22:{10,10}]
  wire  _GEN_58 = 3'h4 == _choice_T_30 ? io_in_4_valid : _GEN_57; // @[Arbiters.scala 22:{10,10}]
  wire  _GEN_59 = 3'h5 == _choice_T_30 ? io_in_5_valid : _GEN_58; // @[Arbiters.scala 22:{10,10}]
  wire  _choice_T_31 = _choice_T_1 < 3'h2 ? _GEN_53 : _GEN_59; // @[Arbiters.scala 22:10]
  wire [2:0] _choice_T_34 = 3'h5 + _choice_T_1; // @[Arbiters.scala 22:37]
  wire [2:0] _choice_T_36 = _choice_T_1 - 3'h1; // @[Arbiters.scala 22:54]
  wire [2:0] _GEN_73 = 3'h1 == _choice_T_3[2:0] ? 3'h1 : 3'h0; // @[Arbiters.scala 22:{10,10}]
  wire [2:0] _GEN_74 = 3'h2 == _choice_T_3[2:0] ? 3'h2 : _GEN_73; // @[Arbiters.scala 22:{10,10}]
  wire [2:0] _GEN_75 = 3'h3 == _choice_T_3[2:0] ? 3'h3 : _GEN_74; // @[Arbiters.scala 22:{10,10}]
  wire [2:0] _GEN_76 = 3'h4 == _choice_T_3[2:0] ? 3'h4 : _GEN_75; // @[Arbiters.scala 22:{10,10}]
  wire [2:0] _GEN_77 = 3'h5 == _choice_T_3[2:0] ? 3'h5 : _GEN_76; // @[Arbiters.scala 22:{10,10}]
  wire [2:0] _GEN_79 = 3'h1 == _choice_T_6 ? 3'h1 : 3'h0; // @[Arbiters.scala 22:{10,10}]
  wire [2:0] _GEN_80 = 3'h2 == _choice_T_6 ? 3'h2 : _GEN_79; // @[Arbiters.scala 22:{10,10}]
  wire [2:0] _GEN_81 = 3'h3 == _choice_T_6 ? 3'h3 : _GEN_80; // @[Arbiters.scala 22:{10,10}]
  wire [2:0] _GEN_82 = 3'h4 == _choice_T_6 ? 3'h4 : _GEN_81; // @[Arbiters.scala 22:{10,10}]
  wire [2:0] _GEN_83 = 3'h5 == _choice_T_6 ? 3'h5 : _GEN_82; // @[Arbiters.scala 22:{10,10}]
  wire [2:0] _choice_T_45 = _choice_T_1 < 3'h6 ? _GEN_77 : _GEN_83; // @[Arbiters.scala 22:10]
  wire [2:0] _GEN_85 = 3'h1 == _choice_T_10 ? 3'h1 : 3'h0; // @[Arbiters.scala 22:{10,10}]
  wire [2:0] _GEN_86 = 3'h2 == _choice_T_10 ? 3'h2 : _GEN_85; // @[Arbiters.scala 22:{10,10}]
  wire [2:0] _GEN_87 = 3'h3 == _choice_T_10 ? 3'h3 : _GEN_86; // @[Arbiters.scala 22:{10,10}]
  wire [2:0] _GEN_88 = 3'h4 == _choice_T_10 ? 3'h4 : _GEN_87; // @[Arbiters.scala 22:{10,10}]
  wire [2:0] _GEN_89 = 3'h5 == _choice_T_10 ? 3'h5 : _GEN_88; // @[Arbiters.scala 22:{10,10}]
  wire [2:0] _GEN_91 = 3'h1 == _choice_T_12 ? 3'h1 : 3'h0; // @[Arbiters.scala 22:{10,10}]
  wire [2:0] _GEN_92 = 3'h2 == _choice_T_12 ? 3'h2 : _GEN_91; // @[Arbiters.scala 22:{10,10}]
  wire [2:0] _GEN_93 = 3'h3 == _choice_T_12 ? 3'h3 : _GEN_92; // @[Arbiters.scala 22:{10,10}]
  wire [2:0] _GEN_94 = 3'h4 == _choice_T_12 ? 3'h4 : _GEN_93; // @[Arbiters.scala 22:{10,10}]
  wire [2:0] _GEN_95 = 3'h5 == _choice_T_12 ? 3'h5 : _GEN_94; // @[Arbiters.scala 22:{10,10}]
  wire [2:0] _choice_T_51 = _choice_T_1 < 3'h5 ? _GEN_89 : _GEN_95; // @[Arbiters.scala 22:10]
  wire [2:0] _GEN_97 = 3'h1 == _choice_T_16 ? 3'h1 : 3'h0; // @[Arbiters.scala 22:{10,10}]
  wire [2:0] _GEN_98 = 3'h2 == _choice_T_16 ? 3'h2 : _GEN_97; // @[Arbiters.scala 22:{10,10}]
  wire [2:0] _GEN_99 = 3'h3 == _choice_T_16 ? 3'h3 : _GEN_98; // @[Arbiters.scala 22:{10,10}]
  wire [2:0] _GEN_100 = 3'h4 == _choice_T_16 ? 3'h4 : _GEN_99; // @[Arbiters.scala 22:{10,10}]
  wire [2:0] _GEN_101 = 3'h5 == _choice_T_16 ? 3'h5 : _GEN_100; // @[Arbiters.scala 22:{10,10}]
  wire [2:0] _GEN_103 = 3'h1 == _choice_T_18 ? 3'h1 : 3'h0; // @[Arbiters.scala 22:{10,10}]
  wire [2:0] _GEN_104 = 3'h2 == _choice_T_18 ? 3'h2 : _GEN_103; // @[Arbiters.scala 22:{10,10}]
  wire [2:0] _GEN_105 = 3'h3 == _choice_T_18 ? 3'h3 : _GEN_104; // @[Arbiters.scala 22:{10,10}]
  wire [2:0] _GEN_106 = 3'h4 == _choice_T_18 ? 3'h4 : _GEN_105; // @[Arbiters.scala 22:{10,10}]
  wire [2:0] _GEN_107 = 3'h5 == _choice_T_18 ? 3'h5 : _GEN_106; // @[Arbiters.scala 22:{10,10}]
  wire [2:0] _choice_T_57 = _choice_T_1 < 3'h4 ? _GEN_101 : _GEN_107; // @[Arbiters.scala 22:10]
  wire [2:0] _GEN_109 = 3'h1 == _choice_T_22 ? 3'h1 : 3'h0; // @[Arbiters.scala 22:{10,10}]
  wire [2:0] _GEN_110 = 3'h2 == _choice_T_22 ? 3'h2 : _GEN_109; // @[Arbiters.scala 22:{10,10}]
  wire [2:0] _GEN_111 = 3'h3 == _choice_T_22 ? 3'h3 : _GEN_110; // @[Arbiters.scala 22:{10,10}]
  wire [2:0] _GEN_112 = 3'h4 == _choice_T_22 ? 3'h4 : _GEN_111; // @[Arbiters.scala 22:{10,10}]
  wire [2:0] _GEN_113 = 3'h5 == _choice_T_22 ? 3'h5 : _GEN_112; // @[Arbiters.scala 22:{10,10}]
  wire [2:0] _GEN_115 = 3'h1 == _choice_T_24 ? 3'h1 : 3'h0; // @[Arbiters.scala 22:{10,10}]
  wire [2:0] _GEN_116 = 3'h2 == _choice_T_24 ? 3'h2 : _GEN_115; // @[Arbiters.scala 22:{10,10}]
  wire [2:0] _GEN_117 = 3'h3 == _choice_T_24 ? 3'h3 : _GEN_116; // @[Arbiters.scala 22:{10,10}]
  wire [2:0] _GEN_118 = 3'h4 == _choice_T_24 ? 3'h4 : _GEN_117; // @[Arbiters.scala 22:{10,10}]
  wire [2:0] _GEN_119 = 3'h5 == _choice_T_24 ? 3'h5 : _GEN_118; // @[Arbiters.scala 22:{10,10}]
  wire [2:0] _choice_T_63 = _choice_T_1 < 3'h3 ? _GEN_113 : _GEN_119; // @[Arbiters.scala 22:10]
  wire [2:0] _GEN_121 = 3'h1 == _choice_T_28 ? 3'h1 : 3'h0; // @[Arbiters.scala 22:{10,10}]
  wire [2:0] _GEN_122 = 3'h2 == _choice_T_28 ? 3'h2 : _GEN_121; // @[Arbiters.scala 22:{10,10}]
  wire [2:0] _GEN_123 = 3'h3 == _choice_T_28 ? 3'h3 : _GEN_122; // @[Arbiters.scala 22:{10,10}]
  wire [2:0] _GEN_124 = 3'h4 == _choice_T_28 ? 3'h4 : _GEN_123; // @[Arbiters.scala 22:{10,10}]
  wire [2:0] _GEN_125 = 3'h5 == _choice_T_28 ? 3'h5 : _GEN_124; // @[Arbiters.scala 22:{10,10}]
  wire [2:0] _GEN_127 = 3'h1 == _choice_T_30 ? 3'h1 : 3'h0; // @[Arbiters.scala 22:{10,10}]
  wire [2:0] _GEN_128 = 3'h2 == _choice_T_30 ? 3'h2 : _GEN_127; // @[Arbiters.scala 22:{10,10}]
  wire [2:0] _GEN_129 = 3'h3 == _choice_T_30 ? 3'h3 : _GEN_128; // @[Arbiters.scala 22:{10,10}]
  wire [2:0] _GEN_130 = 3'h4 == _choice_T_30 ? 3'h4 : _GEN_129; // @[Arbiters.scala 22:{10,10}]
  wire [2:0] _GEN_131 = 3'h5 == _choice_T_30 ? 3'h5 : _GEN_130; // @[Arbiters.scala 22:{10,10}]
  wire [2:0] _choice_T_69 = _choice_T_1 < 3'h2 ? _GEN_125 : _GEN_131; // @[Arbiters.scala 22:10]
  wire [2:0] _GEN_133 = 3'h1 == _choice_T_34 ? 3'h1 : 3'h0; // @[Arbiters.scala 22:{10,10}]
  wire [2:0] _GEN_134 = 3'h2 == _choice_T_34 ? 3'h2 : _GEN_133; // @[Arbiters.scala 22:{10,10}]
  wire [2:0] _GEN_135 = 3'h3 == _choice_T_34 ? 3'h3 : _GEN_134; // @[Arbiters.scala 22:{10,10}]
  wire [2:0] _GEN_136 = 3'h4 == _choice_T_34 ? 3'h4 : _GEN_135; // @[Arbiters.scala 22:{10,10}]
  wire [2:0] _GEN_137 = 3'h5 == _choice_T_34 ? 3'h5 : _GEN_136; // @[Arbiters.scala 22:{10,10}]
  wire [2:0] _GEN_139 = 3'h1 == _choice_T_36 ? 3'h1 : 3'h0; // @[Arbiters.scala 22:{10,10}]
  wire [2:0] _GEN_140 = 3'h2 == _choice_T_36 ? 3'h2 : _GEN_139; // @[Arbiters.scala 22:{10,10}]
  wire [2:0] _GEN_141 = 3'h3 == _choice_T_36 ? 3'h3 : _GEN_140; // @[Arbiters.scala 22:{10,10}]
  wire [2:0] _GEN_142 = 3'h4 == _choice_T_36 ? 3'h4 : _GEN_141; // @[Arbiters.scala 22:{10,10}]
  wire [2:0] _GEN_143 = 3'h5 == _choice_T_36 ? 3'h5 : _GEN_142; // @[Arbiters.scala 22:{10,10}]
  wire [2:0] _choice_T_75 = _choice_T_1 < 3'h1 ? _GEN_137 : _GEN_143; // @[Arbiters.scala 22:10]
  wire [2:0] _choice_T_76 = _choice_T_31 ? _choice_T_69 : _choice_T_75; // @[Mux.scala 47:70]
  wire [2:0] _choice_T_77 = _choice_T_25 ? _choice_T_63 : _choice_T_76; // @[Mux.scala 47:70]
  wire [2:0] _choice_T_78 = _choice_T_19 ? _choice_T_57 : _choice_T_77; // @[Mux.scala 47:70]
  wire [2:0] _choice_T_79 = _choice_T_13 ? _choice_T_51 : _choice_T_78; // @[Mux.scala 47:70]
  wire [2:0] choice = _choice_T_7 ? _choice_T_45 : _choice_T_79; // @[Mux.scala 47:70]
  wire [2:0] chosen = locked ? lockIdx : choice; // @[Arbiters.scala 37:19]
  wire  _GEN_145 = 3'h1 == chosen ? io_in_1_valid : io_in_0_valid; // @[Arbiters.scala 43:{16,16}]
  wire  _GEN_146 = 3'h2 == chosen ? io_in_2_valid : _GEN_145; // @[Arbiters.scala 43:{16,16}]
  wire  _GEN_147 = 3'h3 == chosen ? io_in_3_valid : _GEN_146; // @[Arbiters.scala 43:{16,16}]
  wire  _GEN_148 = 3'h4 == chosen ? io_in_4_valid : _GEN_147; // @[Arbiters.scala 43:{16,16}]
  wire [31:0] _GEN_157 = 3'h1 == chosen ? io_in_1_bits_data : io_in_0_bits_data; // @[Arbiters.scala 44:{15,15}]
  wire [31:0] _GEN_158 = 3'h2 == chosen ? io_in_2_bits_data : _GEN_157; // @[Arbiters.scala 44:{15,15}]
  wire [31:0] _GEN_159 = 3'h3 == chosen ? io_in_3_bits_data : _GEN_158; // @[Arbiters.scala 44:{15,15}]
  wire [31:0] _GEN_160 = 3'h4 == chosen ? io_in_4_bits_data : _GEN_159; // @[Arbiters.scala 44:{15,15}]
  wire  _GEN_169 = 3'h1 == chosen ? io_in_1_bits_id : io_in_0_bits_id; // @[Arbiters.scala 44:{15,15}]
  wire  _GEN_170 = 3'h2 == chosen ? io_in_2_bits_id : _GEN_169; // @[Arbiters.scala 44:{15,15}]
  wire  _GEN_171 = 3'h3 == chosen ? io_in_3_bits_id : _GEN_170; // @[Arbiters.scala 44:{15,15}]
  wire  _GEN_172 = 3'h4 == chosen ? io_in_4_bits_id : _GEN_171; // @[Arbiters.scala 44:{15,15}]
  wire  _T = io_out_ready & io_out_valid; // @[Decoupled.scala 51:35]
  wire  _GEN_181 = ~locked | locked; // @[Arbiters.scala 60:50 62:14 27:23]
  assign io_in_0_ready = io_out_ready & chosen == 3'h0; // @[Arbiters.scala 40:36]
  assign io_in_1_ready = io_out_ready & chosen == 3'h1; // @[Arbiters.scala 40:36]
  assign io_in_2_ready = io_out_ready & chosen == 3'h2; // @[Arbiters.scala 40:36]
  assign io_in_3_ready = io_out_ready & chosen == 3'h3; // @[Arbiters.scala 40:36]
  assign io_in_4_ready = io_out_ready & chosen == 3'h4; // @[Arbiters.scala 40:36]
  assign io_in_5_ready = io_out_ready & chosen == 3'h5; // @[Arbiters.scala 40:36]
  assign io_out_valid = 3'h5 == chosen ? io_in_5_valid : _GEN_148; // @[Arbiters.scala 43:{16,16}]
  assign io_out_bits_resp = 3'h5 == chosen ? 2'h3 : 2'h0; // @[Arbiters.scala 44:{15,15}]
  assign io_out_bits_data = 3'h5 == chosen ? 32'h0 : _GEN_160; // @[Arbiters.scala 44:{15,15}]
  assign io_out_bits_last = 3'h5 == chosen ? io_in_5_bits_last : 1'h1; // @[Arbiters.scala 44:{15,15}]
  assign io_out_bits_id = 3'h5 == chosen ? io_in_5_bits_id : _GEN_172; // @[Arbiters.scala 44:{15,15}]
  always @(posedge clock) begin
    if (reset) begin // @[Arbiters.scala 26:24]
      lockIdx <= 3'h0; // @[Arbiters.scala 26:24]
    end else if (_T) begin // @[Arbiters.scala 59:22]
      if (~locked) begin // @[Arbiters.scala 60:50]
        if (_choice_T_7) begin // @[Mux.scala 47:70]
          lockIdx <= _choice_T_45;
        end else begin
          lockIdx <= _choice_T_79;
        end
      end
    end
    if (reset) begin // @[Arbiters.scala 27:23]
      locked <= 1'h0; // @[Arbiters.scala 27:23]
    end else if (_T) begin // @[Arbiters.scala 59:22]
      if (io_out_bits_last) begin // @[Arbiters.scala 65:35]
        locked <= 1'h0; // @[Arbiters.scala 66:14]
      end else begin
        locked <= _GEN_181;
      end
    end
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  lockIdx = _RAND_0[2:0];
  _RAND_1 = {1{`RANDOM}};
  locked = _RAND_1[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module NastiRouter(
  input         clock,
  input         reset,
  output        io_master_aw_ready,
  input         io_master_aw_valid,
  input  [11:0] io_master_aw_bits_addr,
  input  [7:0]  io_master_aw_bits_len,
  input         io_master_aw_bits_id,
  output        io_master_w_ready,
  input         io_master_w_valid,
  input  [31:0] io_master_w_bits_data,
  input         io_master_w_bits_last,
  input         io_master_b_ready,
  output        io_master_b_valid,
  output [1:0]  io_master_b_bits_resp,
  output        io_master_b_bits_id,
  output        io_master_ar_ready,
  input         io_master_ar_valid,
  input  [11:0] io_master_ar_bits_addr,
  input  [7:0]  io_master_ar_bits_len,
  input         io_master_ar_bits_id,
  input         io_master_r_ready,
  output        io_master_r_valid,
  output [1:0]  io_master_r_bits_resp,
  output [31:0] io_master_r_bits_data,
  output        io_master_r_bits_last,
  output        io_master_r_bits_id,
  input         io_slave_0_aw_ready,
  output        io_slave_0_aw_valid,
  output [11:0] io_slave_0_aw_bits_addr,
  output [7:0]  io_slave_0_aw_bits_len,
  output        io_slave_0_aw_bits_id,
  input         io_slave_0_w_ready,
  output        io_slave_0_w_valid,
  output [31:0] io_slave_0_w_bits_data,
  output        io_slave_0_b_ready,
  input         io_slave_0_b_valid,
  input         io_slave_0_b_bits_id,
  input         io_slave_0_ar_ready,
  output        io_slave_0_ar_valid,
  output [11:0] io_slave_0_ar_bits_addr,
  output [7:0]  io_slave_0_ar_bits_len,
  output        io_slave_0_ar_bits_id,
  output        io_slave_0_r_ready,
  input         io_slave_0_r_valid,
  input  [31:0] io_slave_0_r_bits_data,
  input         io_slave_0_r_bits_id,
  input         io_slave_1_aw_ready,
  output        io_slave_1_aw_valid,
  output [11:0] io_slave_1_aw_bits_addr,
  output [7:0]  io_slave_1_aw_bits_len,
  output        io_slave_1_aw_bits_id,
  input         io_slave_1_w_ready,
  output        io_slave_1_w_valid,
  output [31:0] io_slave_1_w_bits_data,
  output        io_slave_1_b_ready,
  input         io_slave_1_b_valid,
  input         io_slave_1_b_bits_id,
  input         io_slave_1_ar_ready,
  output        io_slave_1_ar_valid,
  output [11:0] io_slave_1_ar_bits_addr,
  output [7:0]  io_slave_1_ar_bits_len,
  output        io_slave_1_ar_bits_id,
  output        io_slave_1_r_ready,
  input         io_slave_1_r_valid,
  input  [31:0] io_slave_1_r_bits_data,
  input         io_slave_1_r_bits_id,
  input         io_slave_2_aw_ready,
  output        io_slave_2_aw_valid,
  output [11:0] io_slave_2_aw_bits_addr,
  output [7:0]  io_slave_2_aw_bits_len,
  output        io_slave_2_aw_bits_id,
  input         io_slave_2_w_ready,
  output        io_slave_2_w_valid,
  output [31:0] io_slave_2_w_bits_data,
  output        io_slave_2_b_ready,
  input         io_slave_2_b_valid,
  input         io_slave_2_b_bits_id,
  input         io_slave_2_ar_ready,
  output        io_slave_2_ar_valid,
  output [11:0] io_slave_2_ar_bits_addr,
  output [7:0]  io_slave_2_ar_bits_len,
  output        io_slave_2_ar_bits_id,
  output        io_slave_2_r_ready,
  input         io_slave_2_r_valid,
  input  [31:0] io_slave_2_r_bits_data,
  input         io_slave_2_r_bits_id,
  input         io_slave_3_aw_ready,
  output        io_slave_3_aw_valid,
  output [11:0] io_slave_3_aw_bits_addr,
  output [7:0]  io_slave_3_aw_bits_len,
  output        io_slave_3_aw_bits_id,
  input         io_slave_3_w_ready,
  output        io_slave_3_w_valid,
  output [31:0] io_slave_3_w_bits_data,
  output        io_slave_3_b_ready,
  input         io_slave_3_b_valid,
  input         io_slave_3_b_bits_id,
  input         io_slave_3_ar_ready,
  output        io_slave_3_ar_valid,
  output [11:0] io_slave_3_ar_bits_addr,
  output [7:0]  io_slave_3_ar_bits_len,
  output        io_slave_3_ar_bits_id,
  output        io_slave_3_r_ready,
  input         io_slave_3_r_valid,
  input  [31:0] io_slave_3_r_bits_data,
  input         io_slave_3_r_bits_id,
  input         io_slave_4_aw_ready,
  output        io_slave_4_aw_valid,
  output [7:0]  io_slave_4_aw_bits_len,
  output        io_slave_4_aw_bits_id,
  input         io_slave_4_w_ready,
  output        io_slave_4_w_valid,
  output [31:0] io_slave_4_w_bits_data,
  output        io_slave_4_b_ready,
  input         io_slave_4_b_valid,
  input         io_slave_4_b_bits_id,
  input         io_slave_4_ar_ready,
  output        io_slave_4_ar_valid,
  output [7:0]  io_slave_4_ar_bits_len,
  output        io_slave_4_ar_bits_id,
  output        io_slave_4_r_ready,
  input         io_slave_4_r_valid,
  input  [31:0] io_slave_4_r_bits_data,
  input         io_slave_4_r_bits_id
);
  wire  ar_queue_clock; // @[nasti.scala 431:24]
  wire  ar_queue_reset; // @[nasti.scala 431:24]
  wire  ar_queue_io_enq_ready; // @[nasti.scala 431:24]
  wire  ar_queue_io_enq_valid; // @[nasti.scala 431:24]
  wire  ar_queue_io_enq_bits_tag; // @[nasti.scala 431:24]
  wire  ar_queue_io_deq_0_valid; // @[nasti.scala 431:24]
  wire  ar_queue_io_deq_0_tag; // @[nasti.scala 431:24]
  wire  ar_queue_io_deq_0_matches; // @[nasti.scala 431:24]
  wire  ar_queue_io_deq_1_valid; // @[nasti.scala 431:24]
  wire  ar_queue_io_deq_1_tag; // @[nasti.scala 431:24]
  wire  ar_queue_io_deq_1_matches; // @[nasti.scala 431:24]
  wire  ar_queue_io_deq_2_valid; // @[nasti.scala 431:24]
  wire  ar_queue_io_deq_2_tag; // @[nasti.scala 431:24]
  wire  ar_queue_io_deq_2_matches; // @[nasti.scala 431:24]
  wire  ar_queue_io_deq_3_valid; // @[nasti.scala 431:24]
  wire  ar_queue_io_deq_3_tag; // @[nasti.scala 431:24]
  wire  ar_queue_io_deq_3_matches; // @[nasti.scala 431:24]
  wire  ar_queue_io_deq_4_valid; // @[nasti.scala 431:24]
  wire  ar_queue_io_deq_4_tag; // @[nasti.scala 431:24]
  wire  ar_queue_io_deq_4_matches; // @[nasti.scala 431:24]
  wire  ar_queue_io_deq_5_valid; // @[nasti.scala 431:24]
  wire  ar_queue_io_deq_5_tag; // @[nasti.scala 431:24]
  wire  ar_queue_io_deq_5_matches; // @[nasti.scala 431:24]
  wire  aw_queue_clock; // @[nasti.scala 434:24]
  wire  aw_queue_reset; // @[nasti.scala 434:24]
  wire  aw_queue_io_enq_ready; // @[nasti.scala 434:24]
  wire  aw_queue_io_enq_valid; // @[nasti.scala 434:24]
  wire  aw_queue_io_enq_bits_tag; // @[nasti.scala 434:24]
  wire  aw_queue_io_deq_0_valid; // @[nasti.scala 434:24]
  wire  aw_queue_io_deq_0_tag; // @[nasti.scala 434:24]
  wire  aw_queue_io_deq_0_matches; // @[nasti.scala 434:24]
  wire  aw_queue_io_deq_1_valid; // @[nasti.scala 434:24]
  wire  aw_queue_io_deq_1_tag; // @[nasti.scala 434:24]
  wire  aw_queue_io_deq_1_matches; // @[nasti.scala 434:24]
  wire  aw_queue_io_deq_2_valid; // @[nasti.scala 434:24]
  wire  aw_queue_io_deq_2_tag; // @[nasti.scala 434:24]
  wire  aw_queue_io_deq_2_matches; // @[nasti.scala 434:24]
  wire  aw_queue_io_deq_3_valid; // @[nasti.scala 434:24]
  wire  aw_queue_io_deq_3_tag; // @[nasti.scala 434:24]
  wire  aw_queue_io_deq_3_matches; // @[nasti.scala 434:24]
  wire  aw_queue_io_deq_4_valid; // @[nasti.scala 434:24]
  wire  aw_queue_io_deq_4_tag; // @[nasti.scala 434:24]
  wire  aw_queue_io_deq_4_matches; // @[nasti.scala 434:24]
  wire  aw_queue_io_deq_5_valid; // @[nasti.scala 434:24]
  wire  aw_queue_io_deq_5_tag; // @[nasti.scala 434:24]
  wire  aw_queue_io_deq_5_matches; // @[nasti.scala 434:24]
  wire  w_queue_clock; // @[nasti.scala 438:23]
  wire  w_queue_reset; // @[nasti.scala 438:23]
  wire  w_queue_io_enq_ready; // @[nasti.scala 438:23]
  wire  w_queue_io_enq_valid; // @[nasti.scala 438:23]
  wire [4:0] w_queue_io_enq_bits; // @[nasti.scala 438:23]
  wire  w_queue_io_deq_ready; // @[nasti.scala 438:23]
  wire  w_queue_io_deq_valid; // @[nasti.scala 438:23]
  wire [4:0] w_queue_io_deq_bits; // @[nasti.scala 438:23]
  wire  err_slave_clock; // @[nasti.scala 497:25]
  wire  err_slave_reset; // @[nasti.scala 497:25]
  wire  err_slave_io_aw_ready; // @[nasti.scala 497:25]
  wire  err_slave_io_aw_valid; // @[nasti.scala 497:25]
  wire [11:0] err_slave_io_aw_bits_addr; // @[nasti.scala 497:25]
  wire  err_slave_io_aw_bits_id; // @[nasti.scala 497:25]
  wire  err_slave_io_w_ready; // @[nasti.scala 497:25]
  wire  err_slave_io_w_valid; // @[nasti.scala 497:25]
  wire  err_slave_io_w_bits_last; // @[nasti.scala 497:25]
  wire  err_slave_io_b_ready; // @[nasti.scala 497:25]
  wire  err_slave_io_b_valid; // @[nasti.scala 497:25]
  wire  err_slave_io_b_bits_id; // @[nasti.scala 497:25]
  wire  err_slave_io_ar_ready; // @[nasti.scala 497:25]
  wire  err_slave_io_ar_valid; // @[nasti.scala 497:25]
  wire [11:0] err_slave_io_ar_bits_addr; // @[nasti.scala 497:25]
  wire [7:0] err_slave_io_ar_bits_len; // @[nasti.scala 497:25]
  wire  err_slave_io_ar_bits_id; // @[nasti.scala 497:25]
  wire  err_slave_io_r_ready; // @[nasti.scala 497:25]
  wire  err_slave_io_r_valid; // @[nasti.scala 497:25]
  wire  err_slave_io_r_bits_last; // @[nasti.scala 497:25]
  wire  err_slave_io_r_bits_id; // @[nasti.scala 497:25]
  wire  b_arb_clock; // @[nasti.scala 509:21]
  wire  b_arb_io_in_0_ready; // @[nasti.scala 509:21]
  wire  b_arb_io_in_0_valid; // @[nasti.scala 509:21]
  wire  b_arb_io_in_0_bits_id; // @[nasti.scala 509:21]
  wire  b_arb_io_in_1_ready; // @[nasti.scala 509:21]
  wire  b_arb_io_in_1_valid; // @[nasti.scala 509:21]
  wire  b_arb_io_in_1_bits_id; // @[nasti.scala 509:21]
  wire  b_arb_io_in_2_ready; // @[nasti.scala 509:21]
  wire  b_arb_io_in_2_valid; // @[nasti.scala 509:21]
  wire  b_arb_io_in_2_bits_id; // @[nasti.scala 509:21]
  wire  b_arb_io_in_3_ready; // @[nasti.scala 509:21]
  wire  b_arb_io_in_3_valid; // @[nasti.scala 509:21]
  wire  b_arb_io_in_3_bits_id; // @[nasti.scala 509:21]
  wire  b_arb_io_in_4_ready; // @[nasti.scala 509:21]
  wire  b_arb_io_in_4_valid; // @[nasti.scala 509:21]
  wire  b_arb_io_in_4_bits_id; // @[nasti.scala 509:21]
  wire  b_arb_io_in_5_ready; // @[nasti.scala 509:21]
  wire  b_arb_io_in_5_valid; // @[nasti.scala 509:21]
  wire  b_arb_io_in_5_bits_id; // @[nasti.scala 509:21]
  wire  b_arb_io_out_ready; // @[nasti.scala 509:21]
  wire  b_arb_io_out_valid; // @[nasti.scala 509:21]
  wire [1:0] b_arb_io_out_bits_resp; // @[nasti.scala 509:21]
  wire  b_arb_io_out_bits_id; // @[nasti.scala 509:21]
  wire [2:0] b_arb_io_chosen; // @[nasti.scala 509:21]
  wire  r_arb_clock; // @[nasti.scala 510:21]
  wire  r_arb_reset; // @[nasti.scala 510:21]
  wire  r_arb_io_in_0_ready; // @[nasti.scala 510:21]
  wire  r_arb_io_in_0_valid; // @[nasti.scala 510:21]
  wire [31:0] r_arb_io_in_0_bits_data; // @[nasti.scala 510:21]
  wire  r_arb_io_in_0_bits_id; // @[nasti.scala 510:21]
  wire  r_arb_io_in_1_ready; // @[nasti.scala 510:21]
  wire  r_arb_io_in_1_valid; // @[nasti.scala 510:21]
  wire [31:0] r_arb_io_in_1_bits_data; // @[nasti.scala 510:21]
  wire  r_arb_io_in_1_bits_id; // @[nasti.scala 510:21]
  wire  r_arb_io_in_2_ready; // @[nasti.scala 510:21]
  wire  r_arb_io_in_2_valid; // @[nasti.scala 510:21]
  wire [31:0] r_arb_io_in_2_bits_data; // @[nasti.scala 510:21]
  wire  r_arb_io_in_2_bits_id; // @[nasti.scala 510:21]
  wire  r_arb_io_in_3_ready; // @[nasti.scala 510:21]
  wire  r_arb_io_in_3_valid; // @[nasti.scala 510:21]
  wire [31:0] r_arb_io_in_3_bits_data; // @[nasti.scala 510:21]
  wire  r_arb_io_in_3_bits_id; // @[nasti.scala 510:21]
  wire  r_arb_io_in_4_ready; // @[nasti.scala 510:21]
  wire  r_arb_io_in_4_valid; // @[nasti.scala 510:21]
  wire [31:0] r_arb_io_in_4_bits_data; // @[nasti.scala 510:21]
  wire  r_arb_io_in_4_bits_id; // @[nasti.scala 510:21]
  wire  r_arb_io_in_5_ready; // @[nasti.scala 510:21]
  wire  r_arb_io_in_5_valid; // @[nasti.scala 510:21]
  wire  r_arb_io_in_5_bits_last; // @[nasti.scala 510:21]
  wire  r_arb_io_in_5_bits_id; // @[nasti.scala 510:21]
  wire  r_arb_io_out_ready; // @[nasti.scala 510:21]
  wire  r_arb_io_out_valid; // @[nasti.scala 510:21]
  wire [1:0] r_arb_io_out_bits_resp; // @[nasti.scala 510:21]
  wire [31:0] r_arb_io_out_bits_data; // @[nasti.scala 510:21]
  wire  r_arb_io_out_bits_last; // @[nasti.scala 510:21]
  wire  r_arb_io_out_bits_id; // @[nasti.scala 510:21]
  wire  _ar_route_T_1 = io_master_ar_bits_addr < 12'h40; // @[addrmap.scala 17:56]
  wire  _ar_route_T_5 = 12'h40 <= io_master_ar_bits_addr & io_master_ar_bits_addr < 12'h60; // @[addrmap.scala 17:51]
  wire  _ar_route_T_8 = 12'h60 <= io_master_ar_bits_addr & io_master_ar_bits_addr < 12'h80; // @[addrmap.scala 17:51]
  wire  _ar_route_T_11 = 12'h80 <= io_master_ar_bits_addr & io_master_ar_bits_addr < 12'ha0; // @[addrmap.scala 17:51]
  wire  _ar_route_T_14 = 12'ha0 <= io_master_ar_bits_addr & io_master_ar_bits_addr < 12'ha4; // @[addrmap.scala 17:51]
  wire [4:0] ar_route = {_ar_route_T_14,_ar_route_T_11,_ar_route_T_8,_ar_route_T_5,_ar_route_T_1}; // @[Cat.scala 33:92]
  wire  _aw_route_T_1 = io_master_aw_bits_addr < 12'h40; // @[addrmap.scala 17:56]
  wire  _aw_route_T_5 = 12'h40 <= io_master_aw_bits_addr & io_master_aw_bits_addr < 12'h60; // @[addrmap.scala 17:51]
  wire  _aw_route_T_8 = 12'h60 <= io_master_aw_bits_addr & io_master_aw_bits_addr < 12'h80; // @[addrmap.scala 17:51]
  wire  _aw_route_T_11 = 12'h80 <= io_master_aw_bits_addr & io_master_aw_bits_addr < 12'ha0; // @[addrmap.scala 17:51]
  wire  _aw_route_T_14 = 12'ha0 <= io_master_aw_bits_addr & io_master_aw_bits_addr < 12'ha4; // @[addrmap.scala 17:51]
  wire [1:0] aw_route_lo = {_aw_route_T_5,_aw_route_T_1}; // @[Cat.scala 33:92]
  wire [2:0] aw_route_hi = {_aw_route_T_14,_aw_route_T_11,_aw_route_T_8}; // @[Cat.scala 33:92]
  wire [4:0] gen = {_aw_route_T_14,_aw_route_T_11,_aw_route_T_8,_aw_route_T_5,_aw_route_T_1}; // @[Cat.scala 33:92]
  wire  ar_noroute = ~(|ar_route); // @[nasti.scala 493:20]
  wire  _GEN_0 = ar_route[0] & io_slave_0_ar_ready; // @[nasti.scala 482:{24,35} compatibility.scala 76:26]
  wire  _GEN_3 = ar_route[1] ? io_slave_1_ar_ready : _GEN_0; // @[nasti.scala 482:{24,35}]
  wire  _GEN_6 = ar_route[2] ? io_slave_2_ar_ready : _GEN_3; // @[nasti.scala 482:{24,35}]
  wire  _GEN_9 = ar_route[3] ? io_slave_3_ar_ready : _GEN_6; // @[nasti.scala 482:{24,35}]
  wire  _GEN_12 = ar_route[4] ? io_slave_4_ar_ready : _GEN_9; // @[nasti.scala 482:{24,35}]
  wire  ar_ready = ar_noroute ? err_slave_io_ar_ready : _GEN_12; // @[nasti.scala 505:{21,32}]
  wire  aw_noroute = ~(|gen); // @[nasti.scala 494:20]
  wire  _GEN_1 = gen[0] & io_slave_0_aw_ready; // @[nasti.scala 486:{24,35} compatibility.scala 76:26]
  wire  _GEN_4 = gen[1] ? io_slave_1_aw_ready : _GEN_1; // @[nasti.scala 486:{24,35}]
  wire  _GEN_7 = gen[2] ? io_slave_2_aw_ready : _GEN_4; // @[nasti.scala 486:{24,35}]
  wire  _GEN_10 = gen[3] ? io_slave_3_aw_ready : _GEN_7; // @[nasti.scala 486:{24,35}]
  wire  _GEN_13 = gen[4] ? io_slave_4_aw_ready : _GEN_10; // @[nasti.scala 486:{24,35}]
  wire  aw_ready = aw_noroute ? err_slave_io_aw_ready : _GEN_13; // @[nasti.scala 506:{21,32}]
  wire  w_noroute = ~(|w_queue_io_deq_bits); // @[nasti.scala 495:20]
  wire  _GEN_2 = w_queue_io_deq_bits[0] & io_slave_0_w_ready; // @[nasti.scala 490:{23,33} compatibility.scala 76:26]
  wire  _GEN_5 = w_queue_io_deq_bits[1] ? io_slave_1_w_ready : _GEN_2; // @[nasti.scala 490:{23,33}]
  wire  _GEN_8 = w_queue_io_deq_bits[2] ? io_slave_2_w_ready : _GEN_5; // @[nasti.scala 490:{23,33}]
  wire  _GEN_11 = w_queue_io_deq_bits[3] ? io_slave_3_w_ready : _GEN_8; // @[nasti.scala 490:{23,33}]
  wire  _GEN_14 = w_queue_io_deq_bits[4] ? io_slave_4_w_ready : _GEN_11; // @[nasti.scala 490:{23,33}]
  wire  w_ready = w_noroute ? err_slave_io_w_ready : _GEN_14; // @[nasti.scala 507:{21,32}]
  wire  ar_valid = io_master_ar_valid & ar_queue_io_enq_ready; // @[Misc.scala 25:53]
  wire  aw_valid = io_master_aw_valid & w_queue_io_enq_ready & aw_queue_io_enq_ready; // @[Misc.scala 25:53]
  wire  w_valid = io_master_w_valid & w_queue_io_deq_valid; // @[Misc.scala 25:53]
  wire  _T_18 = ~reset; // @[nasti.scala 526:11]
  wire  _ar_queue_io_deq_5_valid_T = err_slave_io_r_ready & err_slave_io_r_valid; // @[Decoupled.scala 51:35]
  ReorderQueue ar_queue ( // @[nasti.scala 431:24]
    .clock(ar_queue_clock),
    .reset(ar_queue_reset),
    .io_enq_ready(ar_queue_io_enq_ready),
    .io_enq_valid(ar_queue_io_enq_valid),
    .io_enq_bits_tag(ar_queue_io_enq_bits_tag),
    .io_deq_0_valid(ar_queue_io_deq_0_valid),
    .io_deq_0_tag(ar_queue_io_deq_0_tag),
    .io_deq_0_matches(ar_queue_io_deq_0_matches),
    .io_deq_1_valid(ar_queue_io_deq_1_valid),
    .io_deq_1_tag(ar_queue_io_deq_1_tag),
    .io_deq_1_matches(ar_queue_io_deq_1_matches),
    .io_deq_2_valid(ar_queue_io_deq_2_valid),
    .io_deq_2_tag(ar_queue_io_deq_2_tag),
    .io_deq_2_matches(ar_queue_io_deq_2_matches),
    .io_deq_3_valid(ar_queue_io_deq_3_valid),
    .io_deq_3_tag(ar_queue_io_deq_3_tag),
    .io_deq_3_matches(ar_queue_io_deq_3_matches),
    .io_deq_4_valid(ar_queue_io_deq_4_valid),
    .io_deq_4_tag(ar_queue_io_deq_4_tag),
    .io_deq_4_matches(ar_queue_io_deq_4_matches),
    .io_deq_5_valid(ar_queue_io_deq_5_valid),
    .io_deq_5_tag(ar_queue_io_deq_5_tag),
    .io_deq_5_matches(ar_queue_io_deq_5_matches)
  );
  ReorderQueue aw_queue ( // @[nasti.scala 434:24]
    .clock(aw_queue_clock),
    .reset(aw_queue_reset),
    .io_enq_ready(aw_queue_io_enq_ready),
    .io_enq_valid(aw_queue_io_enq_valid),
    .io_enq_bits_tag(aw_queue_io_enq_bits_tag),
    .io_deq_0_valid(aw_queue_io_deq_0_valid),
    .io_deq_0_tag(aw_queue_io_deq_0_tag),
    .io_deq_0_matches(aw_queue_io_deq_0_matches),
    .io_deq_1_valid(aw_queue_io_deq_1_valid),
    .io_deq_1_tag(aw_queue_io_deq_1_tag),
    .io_deq_1_matches(aw_queue_io_deq_1_matches),
    .io_deq_2_valid(aw_queue_io_deq_2_valid),
    .io_deq_2_tag(aw_queue_io_deq_2_tag),
    .io_deq_2_matches(aw_queue_io_deq_2_matches),
    .io_deq_3_valid(aw_queue_io_deq_3_valid),
    .io_deq_3_tag(aw_queue_io_deq_3_tag),
    .io_deq_3_matches(aw_queue_io_deq_3_matches),
    .io_deq_4_valid(aw_queue_io_deq_4_valid),
    .io_deq_4_tag(aw_queue_io_deq_4_tag),
    .io_deq_4_matches(aw_queue_io_deq_4_matches),
    .io_deq_5_valid(aw_queue_io_deq_5_valid),
    .io_deq_5_tag(aw_queue_io_deq_5_tag),
    .io_deq_5_matches(aw_queue_io_deq_5_matches)
  );
  QueueCompatibility_4 w_queue ( // @[nasti.scala 438:23]
    .clock(w_queue_clock),
    .reset(w_queue_reset),
    .io_enq_ready(w_queue_io_enq_ready),
    .io_enq_valid(w_queue_io_enq_valid),
    .io_enq_bits(w_queue_io_enq_bits),
    .io_deq_ready(w_queue_io_deq_ready),
    .io_deq_valid(w_queue_io_deq_valid),
    .io_deq_bits(w_queue_io_deq_bits)
  );
  NastiErrorSlave err_slave ( // @[nasti.scala 497:25]
    .clock(err_slave_clock),
    .reset(err_slave_reset),
    .io_aw_ready(err_slave_io_aw_ready),
    .io_aw_valid(err_slave_io_aw_valid),
    .io_aw_bits_addr(err_slave_io_aw_bits_addr),
    .io_aw_bits_id(err_slave_io_aw_bits_id),
    .io_w_ready(err_slave_io_w_ready),
    .io_w_valid(err_slave_io_w_valid),
    .io_w_bits_last(err_slave_io_w_bits_last),
    .io_b_ready(err_slave_io_b_ready),
    .io_b_valid(err_slave_io_b_valid),
    .io_b_bits_id(err_slave_io_b_bits_id),
    .io_ar_ready(err_slave_io_ar_ready),
    .io_ar_valid(err_slave_io_ar_valid),
    .io_ar_bits_addr(err_slave_io_ar_bits_addr),
    .io_ar_bits_len(err_slave_io_ar_bits_len),
    .io_ar_bits_id(err_slave_io_ar_bits_id),
    .io_r_ready(err_slave_io_r_ready),
    .io_r_valid(err_slave_io_r_valid),
    .io_r_bits_last(err_slave_io_r_bits_last),
    .io_r_bits_id(err_slave_io_r_bits_id)
  );
  RRArbiter b_arb ( // @[nasti.scala 509:21]
    .clock(b_arb_clock),
    .io_in_0_ready(b_arb_io_in_0_ready),
    .io_in_0_valid(b_arb_io_in_0_valid),
    .io_in_0_bits_id(b_arb_io_in_0_bits_id),
    .io_in_1_ready(b_arb_io_in_1_ready),
    .io_in_1_valid(b_arb_io_in_1_valid),
    .io_in_1_bits_id(b_arb_io_in_1_bits_id),
    .io_in_2_ready(b_arb_io_in_2_ready),
    .io_in_2_valid(b_arb_io_in_2_valid),
    .io_in_2_bits_id(b_arb_io_in_2_bits_id),
    .io_in_3_ready(b_arb_io_in_3_ready),
    .io_in_3_valid(b_arb_io_in_3_valid),
    .io_in_3_bits_id(b_arb_io_in_3_bits_id),
    .io_in_4_ready(b_arb_io_in_4_ready),
    .io_in_4_valid(b_arb_io_in_4_valid),
    .io_in_4_bits_id(b_arb_io_in_4_bits_id),
    .io_in_5_ready(b_arb_io_in_5_ready),
    .io_in_5_valid(b_arb_io_in_5_valid),
    .io_in_5_bits_id(b_arb_io_in_5_bits_id),
    .io_out_ready(b_arb_io_out_ready),
    .io_out_valid(b_arb_io_out_valid),
    .io_out_bits_resp(b_arb_io_out_bits_resp),
    .io_out_bits_id(b_arb_io_out_bits_id),
    .io_chosen(b_arb_io_chosen)
  );
  HellaPeekingArbiter r_arb ( // @[nasti.scala 510:21]
    .clock(r_arb_clock),
    .reset(r_arb_reset),
    .io_in_0_ready(r_arb_io_in_0_ready),
    .io_in_0_valid(r_arb_io_in_0_valid),
    .io_in_0_bits_data(r_arb_io_in_0_bits_data),
    .io_in_0_bits_id(r_arb_io_in_0_bits_id),
    .io_in_1_ready(r_arb_io_in_1_ready),
    .io_in_1_valid(r_arb_io_in_1_valid),
    .io_in_1_bits_data(r_arb_io_in_1_bits_data),
    .io_in_1_bits_id(r_arb_io_in_1_bits_id),
    .io_in_2_ready(r_arb_io_in_2_ready),
    .io_in_2_valid(r_arb_io_in_2_valid),
    .io_in_2_bits_data(r_arb_io_in_2_bits_data),
    .io_in_2_bits_id(r_arb_io_in_2_bits_id),
    .io_in_3_ready(r_arb_io_in_3_ready),
    .io_in_3_valid(r_arb_io_in_3_valid),
    .io_in_3_bits_data(r_arb_io_in_3_bits_data),
    .io_in_3_bits_id(r_arb_io_in_3_bits_id),
    .io_in_4_ready(r_arb_io_in_4_ready),
    .io_in_4_valid(r_arb_io_in_4_valid),
    .io_in_4_bits_data(r_arb_io_in_4_bits_data),
    .io_in_4_bits_id(r_arb_io_in_4_bits_id),
    .io_in_5_ready(r_arb_io_in_5_ready),
    .io_in_5_valid(r_arb_io_in_5_valid),
    .io_in_5_bits_last(r_arb_io_in_5_bits_last),
    .io_in_5_bits_id(r_arb_io_in_5_bits_id),
    .io_out_ready(r_arb_io_out_ready),
    .io_out_valid(r_arb_io_out_valid),
    .io_out_bits_resp(r_arb_io_out_bits_resp),
    .io_out_bits_data(r_arb_io_out_bits_data),
    .io_out_bits_last(r_arb_io_out_bits_last),
    .io_out_bits_id(r_arb_io_out_bits_id)
  );
  assign io_master_aw_ready = w_queue_io_enq_ready & aw_queue_io_enq_ready & aw_ready; // @[Misc.scala 25:53]
  assign io_master_w_ready = w_queue_io_deq_valid & w_ready; // @[Misc.scala 25:53]
  assign io_master_b_valid = b_arb_io_out_valid; // @[nasti.scala 532:15]
  assign io_master_b_bits_resp = b_arb_io_out_bits_resp; // @[nasti.scala 532:15]
  assign io_master_b_bits_id = b_arb_io_out_bits_id; // @[nasti.scala 532:15]
  assign io_master_ar_ready = ar_queue_io_enq_ready & ar_ready; // @[Misc.scala 25:53]
  assign io_master_r_valid = r_arb_io_out_valid; // @[nasti.scala 533:15]
  assign io_master_r_bits_resp = r_arb_io_out_bits_resp; // @[nasti.scala 533:15]
  assign io_master_r_bits_data = r_arb_io_out_bits_data; // @[nasti.scala 533:15]
  assign io_master_r_bits_last = r_arb_io_out_bits_last; // @[nasti.scala 533:15]
  assign io_master_r_bits_id = r_arb_io_out_bits_id; // @[nasti.scala 533:15]
  assign io_slave_0_aw_valid = aw_valid & gen[0]; // @[nasti.scala 484:28]
  assign io_slave_0_aw_bits_addr = io_master_aw_bits_addr; // @[nasti.scala 485:15]
  assign io_slave_0_aw_bits_len = io_master_aw_bits_len; // @[nasti.scala 485:15]
  assign io_slave_0_aw_bits_id = io_master_aw_bits_id; // @[nasti.scala 485:15]
  assign io_slave_0_w_valid = w_valid & w_queue_io_deq_bits[0]; // @[nasti.scala 488:26]
  assign io_slave_0_w_bits_data = io_master_w_bits_data; // @[nasti.scala 489:14]
  assign io_slave_0_b_ready = b_arb_io_in_0_ready; // @[nasti.scala 518:20]
  assign io_slave_0_ar_valid = ar_valid & ar_route[0]; // @[nasti.scala 480:28]
  assign io_slave_0_ar_bits_addr = io_master_ar_bits_addr; // @[nasti.scala 481:15]
  assign io_slave_0_ar_bits_len = io_master_ar_bits_len; // @[nasti.scala 481:15]
  assign io_slave_0_ar_bits_id = io_master_ar_bits_id; // @[nasti.scala 481:15]
  assign io_slave_0_r_ready = r_arb_io_in_0_ready; // @[nasti.scala 522:20]
  assign io_slave_1_aw_valid = aw_valid & gen[1]; // @[nasti.scala 484:28]
  assign io_slave_1_aw_bits_addr = io_master_aw_bits_addr; // @[nasti.scala 485:15]
  assign io_slave_1_aw_bits_len = io_master_aw_bits_len; // @[nasti.scala 485:15]
  assign io_slave_1_aw_bits_id = io_master_aw_bits_id; // @[nasti.scala 485:15]
  assign io_slave_1_w_valid = w_valid & w_queue_io_deq_bits[1]; // @[nasti.scala 488:26]
  assign io_slave_1_w_bits_data = io_master_w_bits_data; // @[nasti.scala 489:14]
  assign io_slave_1_b_ready = b_arb_io_in_1_ready; // @[nasti.scala 518:20]
  assign io_slave_1_ar_valid = ar_valid & ar_route[1]; // @[nasti.scala 480:28]
  assign io_slave_1_ar_bits_addr = io_master_ar_bits_addr; // @[nasti.scala 481:15]
  assign io_slave_1_ar_bits_len = io_master_ar_bits_len; // @[nasti.scala 481:15]
  assign io_slave_1_ar_bits_id = io_master_ar_bits_id; // @[nasti.scala 481:15]
  assign io_slave_1_r_ready = r_arb_io_in_1_ready; // @[nasti.scala 522:20]
  assign io_slave_2_aw_valid = aw_valid & gen[2]; // @[nasti.scala 484:28]
  assign io_slave_2_aw_bits_addr = io_master_aw_bits_addr; // @[nasti.scala 485:15]
  assign io_slave_2_aw_bits_len = io_master_aw_bits_len; // @[nasti.scala 485:15]
  assign io_slave_2_aw_bits_id = io_master_aw_bits_id; // @[nasti.scala 485:15]
  assign io_slave_2_w_valid = w_valid & w_queue_io_deq_bits[2]; // @[nasti.scala 488:26]
  assign io_slave_2_w_bits_data = io_master_w_bits_data; // @[nasti.scala 489:14]
  assign io_slave_2_b_ready = b_arb_io_in_2_ready; // @[nasti.scala 518:20]
  assign io_slave_2_ar_valid = ar_valid & ar_route[2]; // @[nasti.scala 480:28]
  assign io_slave_2_ar_bits_addr = io_master_ar_bits_addr; // @[nasti.scala 481:15]
  assign io_slave_2_ar_bits_len = io_master_ar_bits_len; // @[nasti.scala 481:15]
  assign io_slave_2_ar_bits_id = io_master_ar_bits_id; // @[nasti.scala 481:15]
  assign io_slave_2_r_ready = r_arb_io_in_2_ready; // @[nasti.scala 522:20]
  assign io_slave_3_aw_valid = aw_valid & gen[3]; // @[nasti.scala 484:28]
  assign io_slave_3_aw_bits_addr = io_master_aw_bits_addr; // @[nasti.scala 485:15]
  assign io_slave_3_aw_bits_len = io_master_aw_bits_len; // @[nasti.scala 485:15]
  assign io_slave_3_aw_bits_id = io_master_aw_bits_id; // @[nasti.scala 485:15]
  assign io_slave_3_w_valid = w_valid & w_queue_io_deq_bits[3]; // @[nasti.scala 488:26]
  assign io_slave_3_w_bits_data = io_master_w_bits_data; // @[nasti.scala 489:14]
  assign io_slave_3_b_ready = b_arb_io_in_3_ready; // @[nasti.scala 518:20]
  assign io_slave_3_ar_valid = ar_valid & ar_route[3]; // @[nasti.scala 480:28]
  assign io_slave_3_ar_bits_addr = io_master_ar_bits_addr; // @[nasti.scala 481:15]
  assign io_slave_3_ar_bits_len = io_master_ar_bits_len; // @[nasti.scala 481:15]
  assign io_slave_3_ar_bits_id = io_master_ar_bits_id; // @[nasti.scala 481:15]
  assign io_slave_3_r_ready = r_arb_io_in_3_ready; // @[nasti.scala 522:20]
  assign io_slave_4_aw_valid = aw_valid & gen[4]; // @[nasti.scala 484:28]
  assign io_slave_4_aw_bits_len = io_master_aw_bits_len; // @[nasti.scala 485:15]
  assign io_slave_4_aw_bits_id = io_master_aw_bits_id; // @[nasti.scala 485:15]
  assign io_slave_4_w_valid = w_valid & w_queue_io_deq_bits[4]; // @[nasti.scala 488:26]
  assign io_slave_4_w_bits_data = io_master_w_bits_data; // @[nasti.scala 489:14]
  assign io_slave_4_b_ready = b_arb_io_in_4_ready; // @[nasti.scala 518:20]
  assign io_slave_4_ar_valid = ar_valid & ar_route[4]; // @[nasti.scala 480:28]
  assign io_slave_4_ar_bits_len = io_master_ar_bits_len; // @[nasti.scala 481:15]
  assign io_slave_4_ar_bits_id = io_master_ar_bits_id; // @[nasti.scala 481:15]
  assign io_slave_4_r_ready = r_arb_io_in_4_ready; // @[nasti.scala 522:20]
  assign ar_queue_clock = clock;
  assign ar_queue_reset = reset;
  assign ar_queue_io_enq_valid = io_master_ar_valid & ar_ready; // @[Misc.scala 25:53]
  assign ar_queue_io_enq_bits_tag = io_master_ar_bits_id; // @[nasti.scala 459:28]
  assign ar_queue_io_deq_0_valid = io_slave_0_r_ready & io_slave_0_r_valid; // @[Decoupled.scala 51:35]
  assign ar_queue_io_deq_0_tag = io_slave_0_r_bits_id; // @[nasti.scala 524:28]
  assign ar_queue_io_deq_1_valid = io_slave_1_r_ready & io_slave_1_r_valid; // @[Decoupled.scala 51:35]
  assign ar_queue_io_deq_1_tag = io_slave_1_r_bits_id; // @[nasti.scala 524:28]
  assign ar_queue_io_deq_2_valid = io_slave_2_r_ready & io_slave_2_r_valid; // @[Decoupled.scala 51:35]
  assign ar_queue_io_deq_2_tag = io_slave_2_r_bits_id; // @[nasti.scala 524:28]
  assign ar_queue_io_deq_3_valid = io_slave_3_r_ready & io_slave_3_r_valid; // @[Decoupled.scala 51:35]
  assign ar_queue_io_deq_3_tag = io_slave_3_r_bits_id; // @[nasti.scala 524:28]
  assign ar_queue_io_deq_4_valid = io_slave_4_r_ready & io_slave_4_r_valid; // @[Decoupled.scala 51:35]
  assign ar_queue_io_deq_4_tag = io_slave_4_r_bits_id; // @[nasti.scala 524:28]
  assign ar_queue_io_deq_5_valid = _ar_queue_io_deq_5_valid_T & err_slave_io_r_bits_last; // @[nasti.scala 523:54]
  assign ar_queue_io_deq_5_tag = err_slave_io_r_bits_id; // @[nasti.scala 524:28]
  assign aw_queue_clock = clock;
  assign aw_queue_reset = reset;
  assign aw_queue_io_enq_valid = io_master_aw_valid & w_queue_io_enq_ready & aw_ready; // @[Misc.scala 25:53]
  assign aw_queue_io_enq_bits_tag = io_master_aw_bits_id; // @[nasti.scala 463:28]
  assign aw_queue_io_deq_0_valid = io_slave_0_b_ready & io_slave_0_b_valid; // @[Decoupled.scala 51:35]
  assign aw_queue_io_deq_0_tag = io_slave_0_b_bits_id; // @[nasti.scala 520:28]
  assign aw_queue_io_deq_1_valid = io_slave_1_b_ready & io_slave_1_b_valid; // @[Decoupled.scala 51:35]
  assign aw_queue_io_deq_1_tag = io_slave_1_b_bits_id; // @[nasti.scala 520:28]
  assign aw_queue_io_deq_2_valid = io_slave_2_b_ready & io_slave_2_b_valid; // @[Decoupled.scala 51:35]
  assign aw_queue_io_deq_2_tag = io_slave_2_b_bits_id; // @[nasti.scala 520:28]
  assign aw_queue_io_deq_3_valid = io_slave_3_b_ready & io_slave_3_b_valid; // @[Decoupled.scala 51:35]
  assign aw_queue_io_deq_3_tag = io_slave_3_b_bits_id; // @[nasti.scala 520:28]
  assign aw_queue_io_deq_4_valid = io_slave_4_b_ready & io_slave_4_b_valid; // @[Decoupled.scala 51:35]
  assign aw_queue_io_deq_4_tag = io_slave_4_b_bits_id; // @[nasti.scala 520:28]
  assign aw_queue_io_deq_5_valid = err_slave_io_b_ready & err_slave_io_b_valid; // @[Decoupled.scala 51:35]
  assign aw_queue_io_deq_5_tag = err_slave_io_b_bits_id; // @[nasti.scala 520:28]
  assign w_queue_clock = clock;
  assign w_queue_reset = reset;
  assign w_queue_io_enq_valid = io_master_aw_valid & aw_queue_io_enq_ready & aw_ready; // @[Misc.scala 25:53]
  assign w_queue_io_enq_bits = {aw_route_hi,aw_route_lo}; // @[Cat.scala 33:92]
  assign w_queue_io_deq_ready = io_master_w_valid & w_ready & io_master_w_bits_last; // @[Misc.scala 25:53]
  assign err_slave_clock = clock;
  assign err_slave_reset = reset;
  assign err_slave_io_aw_valid = aw_valid & aw_noroute; // @[nasti.scala 500:37]
  assign err_slave_io_aw_bits_addr = io_master_aw_bits_addr; // @[nasti.scala 501:24]
  assign err_slave_io_aw_bits_id = io_master_aw_bits_id; // @[nasti.scala 501:24]
  assign err_slave_io_w_valid = w_valid & w_noroute; // @[nasti.scala 502:35]
  assign err_slave_io_w_bits_last = io_master_w_bits_last; // @[nasti.scala 503:23]
  assign err_slave_io_b_ready = b_arb_io_in_5_ready; // @[nasti.scala 518:20]
  assign err_slave_io_ar_valid = ar_valid & ar_noroute; // @[nasti.scala 498:37]
  assign err_slave_io_ar_bits_addr = io_master_ar_bits_addr; // @[nasti.scala 499:24]
  assign err_slave_io_ar_bits_len = io_master_ar_bits_len; // @[nasti.scala 499:24]
  assign err_slave_io_ar_bits_id = io_master_ar_bits_id; // @[nasti.scala 499:24]
  assign err_slave_io_r_ready = r_arb_io_in_5_ready; // @[nasti.scala 522:20]
  assign b_arb_clock = clock;
  assign b_arb_io_in_0_valid = io_slave_0_b_valid; // @[nasti.scala 518:20]
  assign b_arb_io_in_0_bits_id = io_slave_0_b_bits_id; // @[nasti.scala 518:20]
  assign b_arb_io_in_1_valid = io_slave_1_b_valid; // @[nasti.scala 518:20]
  assign b_arb_io_in_1_bits_id = io_slave_1_b_bits_id; // @[nasti.scala 518:20]
  assign b_arb_io_in_2_valid = io_slave_2_b_valid; // @[nasti.scala 518:20]
  assign b_arb_io_in_2_bits_id = io_slave_2_b_bits_id; // @[nasti.scala 518:20]
  assign b_arb_io_in_3_valid = io_slave_3_b_valid; // @[nasti.scala 518:20]
  assign b_arb_io_in_3_bits_id = io_slave_3_b_bits_id; // @[nasti.scala 518:20]
  assign b_arb_io_in_4_valid = io_slave_4_b_valid; // @[nasti.scala 518:20]
  assign b_arb_io_in_4_bits_id = io_slave_4_b_bits_id; // @[nasti.scala 518:20]
  assign b_arb_io_in_5_valid = err_slave_io_b_valid; // @[nasti.scala 518:20]
  assign b_arb_io_in_5_bits_id = err_slave_io_b_bits_id; // @[nasti.scala 518:20]
  assign b_arb_io_out_ready = io_master_b_ready; // @[nasti.scala 532:15]
  assign r_arb_clock = clock;
  assign r_arb_reset = reset;
  assign r_arb_io_in_0_valid = io_slave_0_r_valid; // @[nasti.scala 522:20]
  assign r_arb_io_in_0_bits_data = io_slave_0_r_bits_data; // @[nasti.scala 522:20]
  assign r_arb_io_in_0_bits_id = io_slave_0_r_bits_id; // @[nasti.scala 522:20]
  assign r_arb_io_in_1_valid = io_slave_1_r_valid; // @[nasti.scala 522:20]
  assign r_arb_io_in_1_bits_data = io_slave_1_r_bits_data; // @[nasti.scala 522:20]
  assign r_arb_io_in_1_bits_id = io_slave_1_r_bits_id; // @[nasti.scala 522:20]
  assign r_arb_io_in_2_valid = io_slave_2_r_valid; // @[nasti.scala 522:20]
  assign r_arb_io_in_2_bits_data = io_slave_2_r_bits_data; // @[nasti.scala 522:20]
  assign r_arb_io_in_2_bits_id = io_slave_2_r_bits_id; // @[nasti.scala 522:20]
  assign r_arb_io_in_3_valid = io_slave_3_r_valid; // @[nasti.scala 522:20]
  assign r_arb_io_in_3_bits_data = io_slave_3_r_bits_data; // @[nasti.scala 522:20]
  assign r_arb_io_in_3_bits_id = io_slave_3_r_bits_id; // @[nasti.scala 522:20]
  assign r_arb_io_in_4_valid = io_slave_4_r_valid; // @[nasti.scala 522:20]
  assign r_arb_io_in_4_bits_data = io_slave_4_r_bits_data; // @[nasti.scala 522:20]
  assign r_arb_io_in_4_bits_id = io_slave_4_r_bits_id; // @[nasti.scala 522:20]
  assign r_arb_io_in_5_valid = err_slave_io_r_valid; // @[nasti.scala 522:20]
  assign r_arb_io_in_5_bits_last = err_slave_io_r_bits_last; // @[nasti.scala 522:20]
  assign r_arb_io_in_5_bits_id = err_slave_io_r_bits_id; // @[nasti.scala 522:20]
  assign r_arb_io_out_ready = io_master_r_ready; // @[nasti.scala 533:15]
  always @(posedge clock) begin
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (~reset & ~(~aw_queue_io_deq_0_valid | aw_queue_io_deq_0_matches)) begin
          $fwrite(32'h80000002,
            "Assertion failed: aw_queue 0 tried to dequeue untracked transaction\n    at nasti.scala:526 assert(!aw_queue.io.deq(i).valid || aw_queue.io.deq(i).matches,\n"
            ); // @[nasti.scala 526:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_18 & ~(~ar_queue_io_deq_0_valid | ar_queue_io_deq_0_matches)) begin
          $fwrite(32'h80000002,
            "Assertion failed: ar_queue 0 tried to dequeue untracked transaction\n    at nasti.scala:528 assert(!ar_queue.io.deq(i).valid || ar_queue.io.deq(i).matches,\n"
            ); // @[nasti.scala 528:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (~reset & ~(~aw_queue_io_deq_1_valid | aw_queue_io_deq_1_matches)) begin
          $fwrite(32'h80000002,
            "Assertion failed: aw_queue 1 tried to dequeue untracked transaction\n    at nasti.scala:526 assert(!aw_queue.io.deq(i).valid || aw_queue.io.deq(i).matches,\n"
            ); // @[nasti.scala 526:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_18 & ~(~ar_queue_io_deq_1_valid | ar_queue_io_deq_1_matches)) begin
          $fwrite(32'h80000002,
            "Assertion failed: ar_queue 1 tried to dequeue untracked transaction\n    at nasti.scala:528 assert(!ar_queue.io.deq(i).valid || ar_queue.io.deq(i).matches,\n"
            ); // @[nasti.scala 528:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (~reset & ~(~aw_queue_io_deq_2_valid | aw_queue_io_deq_2_matches)) begin
          $fwrite(32'h80000002,
            "Assertion failed: aw_queue 2 tried to dequeue untracked transaction\n    at nasti.scala:526 assert(!aw_queue.io.deq(i).valid || aw_queue.io.deq(i).matches,\n"
            ); // @[nasti.scala 526:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_18 & ~(~ar_queue_io_deq_2_valid | ar_queue_io_deq_2_matches)) begin
          $fwrite(32'h80000002,
            "Assertion failed: ar_queue 2 tried to dequeue untracked transaction\n    at nasti.scala:528 assert(!ar_queue.io.deq(i).valid || ar_queue.io.deq(i).matches,\n"
            ); // @[nasti.scala 528:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (~reset & ~(~aw_queue_io_deq_3_valid | aw_queue_io_deq_3_matches)) begin
          $fwrite(32'h80000002,
            "Assertion failed: aw_queue 3 tried to dequeue untracked transaction\n    at nasti.scala:526 assert(!aw_queue.io.deq(i).valid || aw_queue.io.deq(i).matches,\n"
            ); // @[nasti.scala 526:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_18 & ~(~ar_queue_io_deq_3_valid | ar_queue_io_deq_3_matches)) begin
          $fwrite(32'h80000002,
            "Assertion failed: ar_queue 3 tried to dequeue untracked transaction\n    at nasti.scala:528 assert(!ar_queue.io.deq(i).valid || ar_queue.io.deq(i).matches,\n"
            ); // @[nasti.scala 528:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (~reset & ~(~aw_queue_io_deq_4_valid | aw_queue_io_deq_4_matches)) begin
          $fwrite(32'h80000002,
            "Assertion failed: aw_queue 4 tried to dequeue untracked transaction\n    at nasti.scala:526 assert(!aw_queue.io.deq(i).valid || aw_queue.io.deq(i).matches,\n"
            ); // @[nasti.scala 526:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_18 & ~(~ar_queue_io_deq_4_valid | ar_queue_io_deq_4_matches)) begin
          $fwrite(32'h80000002,
            "Assertion failed: ar_queue 4 tried to dequeue untracked transaction\n    at nasti.scala:528 assert(!ar_queue.io.deq(i).valid || ar_queue.io.deq(i).matches,\n"
            ); // @[nasti.scala 528:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (~reset & ~(~aw_queue_io_deq_5_valid | aw_queue_io_deq_5_matches)) begin
          $fwrite(32'h80000002,
            "Assertion failed: aw_queue 5 tried to dequeue untracked transaction\n    at nasti.scala:526 assert(!aw_queue.io.deq(i).valid || aw_queue.io.deq(i).matches,\n"
            ); // @[nasti.scala 526:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_18 & ~(~ar_queue_io_deq_5_valid | ar_queue_io_deq_5_matches)) begin
          $fwrite(32'h80000002,
            "Assertion failed: ar_queue 5 tried to dequeue untracked transaction\n    at nasti.scala:528 assert(!ar_queue.io.deq(i).valid || ar_queue.io.deq(i).matches,\n"
            ); // @[nasti.scala 528:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
  end
  always @(posedge clock) begin
    //
    if (~reset) begin
      assert(~aw_queue_io_deq_0_valid | aw_queue_io_deq_0_matches); // @[nasti.scala 526:11]
    end
    //
    if (_T_18) begin
      assert(~ar_queue_io_deq_0_valid | ar_queue_io_deq_0_matches); // @[nasti.scala 528:11]
    end
    //
    if (~reset) begin
      assert(~aw_queue_io_deq_1_valid | aw_queue_io_deq_1_matches); // @[nasti.scala 526:11]
    end
    //
    if (_T_18) begin
      assert(~ar_queue_io_deq_1_valid | ar_queue_io_deq_1_matches); // @[nasti.scala 528:11]
    end
    //
    if (~reset) begin
      assert(~aw_queue_io_deq_2_valid | aw_queue_io_deq_2_matches); // @[nasti.scala 526:11]
    end
    //
    if (_T_18) begin
      assert(~ar_queue_io_deq_2_valid | ar_queue_io_deq_2_matches); // @[nasti.scala 528:11]
    end
    //
    if (~reset) begin
      assert(~aw_queue_io_deq_3_valid | aw_queue_io_deq_3_matches); // @[nasti.scala 526:11]
    end
    //
    if (_T_18) begin
      assert(~ar_queue_io_deq_3_valid | ar_queue_io_deq_3_matches); // @[nasti.scala 528:11]
    end
    //
    if (~reset) begin
      assert(~aw_queue_io_deq_4_valid | aw_queue_io_deq_4_matches); // @[nasti.scala 526:11]
    end
    //
    if (_T_18) begin
      assert(~ar_queue_io_deq_4_valid | ar_queue_io_deq_4_matches); // @[nasti.scala 528:11]
    end
    //
    if (~reset) begin
      assert(~aw_queue_io_deq_5_valid | aw_queue_io_deq_5_matches); // @[nasti.scala 526:11]
    end
    //
    if (_T_18) begin
      assert(~ar_queue_io_deq_5_valid | ar_queue_io_deq_5_matches); // @[nasti.scala 528:11]
    end
  end
endmodule
module NastiCrossbar(
  input         clock,
  input         reset,
  output        io_masters_0_aw_ready,
  input         io_masters_0_aw_valid,
  input  [11:0] io_masters_0_aw_bits_addr,
  input  [7:0]  io_masters_0_aw_bits_len,
  input         io_masters_0_aw_bits_id,
  output        io_masters_0_w_ready,
  input         io_masters_0_w_valid,
  input  [31:0] io_masters_0_w_bits_data,
  input         io_masters_0_w_bits_last,
  input         io_masters_0_b_ready,
  output        io_masters_0_b_valid,
  output [1:0]  io_masters_0_b_bits_resp,
  output        io_masters_0_b_bits_id,
  output        io_masters_0_ar_ready,
  input         io_masters_0_ar_valid,
  input  [11:0] io_masters_0_ar_bits_addr,
  input  [7:0]  io_masters_0_ar_bits_len,
  input         io_masters_0_ar_bits_id,
  input         io_masters_0_r_ready,
  output        io_masters_0_r_valid,
  output [1:0]  io_masters_0_r_bits_resp,
  output [31:0] io_masters_0_r_bits_data,
  output        io_masters_0_r_bits_last,
  output        io_masters_0_r_bits_id,
  input         io_slaves_0_aw_ready,
  output        io_slaves_0_aw_valid,
  output [11:0] io_slaves_0_aw_bits_addr,
  output [7:0]  io_slaves_0_aw_bits_len,
  output        io_slaves_0_aw_bits_id,
  input         io_slaves_0_w_ready,
  output        io_slaves_0_w_valid,
  output [31:0] io_slaves_0_w_bits_data,
  output        io_slaves_0_b_ready,
  input         io_slaves_0_b_valid,
  input         io_slaves_0_b_bits_id,
  input         io_slaves_0_ar_ready,
  output        io_slaves_0_ar_valid,
  output [11:0] io_slaves_0_ar_bits_addr,
  output [7:0]  io_slaves_0_ar_bits_len,
  output        io_slaves_0_ar_bits_id,
  output        io_slaves_0_r_ready,
  input         io_slaves_0_r_valid,
  input  [31:0] io_slaves_0_r_bits_data,
  input         io_slaves_0_r_bits_id,
  input         io_slaves_1_aw_ready,
  output        io_slaves_1_aw_valid,
  output [11:0] io_slaves_1_aw_bits_addr,
  output [7:0]  io_slaves_1_aw_bits_len,
  output        io_slaves_1_aw_bits_id,
  input         io_slaves_1_w_ready,
  output        io_slaves_1_w_valid,
  output [31:0] io_slaves_1_w_bits_data,
  output        io_slaves_1_b_ready,
  input         io_slaves_1_b_valid,
  input         io_slaves_1_b_bits_id,
  input         io_slaves_1_ar_ready,
  output        io_slaves_1_ar_valid,
  output [11:0] io_slaves_1_ar_bits_addr,
  output [7:0]  io_slaves_1_ar_bits_len,
  output        io_slaves_1_ar_bits_id,
  output        io_slaves_1_r_ready,
  input         io_slaves_1_r_valid,
  input  [31:0] io_slaves_1_r_bits_data,
  input         io_slaves_1_r_bits_id,
  input         io_slaves_2_aw_ready,
  output        io_slaves_2_aw_valid,
  output [11:0] io_slaves_2_aw_bits_addr,
  output [7:0]  io_slaves_2_aw_bits_len,
  output        io_slaves_2_aw_bits_id,
  input         io_slaves_2_w_ready,
  output        io_slaves_2_w_valid,
  output [31:0] io_slaves_2_w_bits_data,
  output        io_slaves_2_b_ready,
  input         io_slaves_2_b_valid,
  input         io_slaves_2_b_bits_id,
  input         io_slaves_2_ar_ready,
  output        io_slaves_2_ar_valid,
  output [11:0] io_slaves_2_ar_bits_addr,
  output [7:0]  io_slaves_2_ar_bits_len,
  output        io_slaves_2_ar_bits_id,
  output        io_slaves_2_r_ready,
  input         io_slaves_2_r_valid,
  input  [31:0] io_slaves_2_r_bits_data,
  input         io_slaves_2_r_bits_id,
  input         io_slaves_3_aw_ready,
  output        io_slaves_3_aw_valid,
  output [11:0] io_slaves_3_aw_bits_addr,
  output [7:0]  io_slaves_3_aw_bits_len,
  output        io_slaves_3_aw_bits_id,
  input         io_slaves_3_w_ready,
  output        io_slaves_3_w_valid,
  output [31:0] io_slaves_3_w_bits_data,
  output        io_slaves_3_b_ready,
  input         io_slaves_3_b_valid,
  input         io_slaves_3_b_bits_id,
  input         io_slaves_3_ar_ready,
  output        io_slaves_3_ar_valid,
  output [11:0] io_slaves_3_ar_bits_addr,
  output [7:0]  io_slaves_3_ar_bits_len,
  output        io_slaves_3_ar_bits_id,
  output        io_slaves_3_r_ready,
  input         io_slaves_3_r_valid,
  input  [31:0] io_slaves_3_r_bits_data,
  input         io_slaves_3_r_bits_id,
  input         io_slaves_4_aw_ready,
  output        io_slaves_4_aw_valid,
  output [7:0]  io_slaves_4_aw_bits_len,
  output        io_slaves_4_aw_bits_id,
  input         io_slaves_4_w_ready,
  output        io_slaves_4_w_valid,
  output [31:0] io_slaves_4_w_bits_data,
  output        io_slaves_4_b_ready,
  input         io_slaves_4_b_valid,
  input         io_slaves_4_b_bits_id,
  input         io_slaves_4_ar_ready,
  output        io_slaves_4_ar_valid,
  output [7:0]  io_slaves_4_ar_bits_len,
  output        io_slaves_4_ar_bits_id,
  output        io_slaves_4_r_ready,
  input         io_slaves_4_r_valid,
  input  [31:0] io_slaves_4_r_bits_data,
  input         io_slaves_4_r_bits_id
);
  wire  router_clock; // @[nasti.scala 549:24]
  wire  router_reset; // @[nasti.scala 549:24]
  wire  router_io_master_aw_ready; // @[nasti.scala 549:24]
  wire  router_io_master_aw_valid; // @[nasti.scala 549:24]
  wire [11:0] router_io_master_aw_bits_addr; // @[nasti.scala 549:24]
  wire [7:0] router_io_master_aw_bits_len; // @[nasti.scala 549:24]
  wire  router_io_master_aw_bits_id; // @[nasti.scala 549:24]
  wire  router_io_master_w_ready; // @[nasti.scala 549:24]
  wire  router_io_master_w_valid; // @[nasti.scala 549:24]
  wire [31:0] router_io_master_w_bits_data; // @[nasti.scala 549:24]
  wire  router_io_master_w_bits_last; // @[nasti.scala 549:24]
  wire  router_io_master_b_ready; // @[nasti.scala 549:24]
  wire  router_io_master_b_valid; // @[nasti.scala 549:24]
  wire [1:0] router_io_master_b_bits_resp; // @[nasti.scala 549:24]
  wire  router_io_master_b_bits_id; // @[nasti.scala 549:24]
  wire  router_io_master_ar_ready; // @[nasti.scala 549:24]
  wire  router_io_master_ar_valid; // @[nasti.scala 549:24]
  wire [11:0] router_io_master_ar_bits_addr; // @[nasti.scala 549:24]
  wire [7:0] router_io_master_ar_bits_len; // @[nasti.scala 549:24]
  wire  router_io_master_ar_bits_id; // @[nasti.scala 549:24]
  wire  router_io_master_r_ready; // @[nasti.scala 549:24]
  wire  router_io_master_r_valid; // @[nasti.scala 549:24]
  wire [1:0] router_io_master_r_bits_resp; // @[nasti.scala 549:24]
  wire [31:0] router_io_master_r_bits_data; // @[nasti.scala 549:24]
  wire  router_io_master_r_bits_last; // @[nasti.scala 549:24]
  wire  router_io_master_r_bits_id; // @[nasti.scala 549:24]
  wire  router_io_slave_0_aw_ready; // @[nasti.scala 549:24]
  wire  router_io_slave_0_aw_valid; // @[nasti.scala 549:24]
  wire [11:0] router_io_slave_0_aw_bits_addr; // @[nasti.scala 549:24]
  wire [7:0] router_io_slave_0_aw_bits_len; // @[nasti.scala 549:24]
  wire  router_io_slave_0_aw_bits_id; // @[nasti.scala 549:24]
  wire  router_io_slave_0_w_ready; // @[nasti.scala 549:24]
  wire  router_io_slave_0_w_valid; // @[nasti.scala 549:24]
  wire [31:0] router_io_slave_0_w_bits_data; // @[nasti.scala 549:24]
  wire  router_io_slave_0_b_ready; // @[nasti.scala 549:24]
  wire  router_io_slave_0_b_valid; // @[nasti.scala 549:24]
  wire  router_io_slave_0_b_bits_id; // @[nasti.scala 549:24]
  wire  router_io_slave_0_ar_ready; // @[nasti.scala 549:24]
  wire  router_io_slave_0_ar_valid; // @[nasti.scala 549:24]
  wire [11:0] router_io_slave_0_ar_bits_addr; // @[nasti.scala 549:24]
  wire [7:0] router_io_slave_0_ar_bits_len; // @[nasti.scala 549:24]
  wire  router_io_slave_0_ar_bits_id; // @[nasti.scala 549:24]
  wire  router_io_slave_0_r_ready; // @[nasti.scala 549:24]
  wire  router_io_slave_0_r_valid; // @[nasti.scala 549:24]
  wire [31:0] router_io_slave_0_r_bits_data; // @[nasti.scala 549:24]
  wire  router_io_slave_0_r_bits_id; // @[nasti.scala 549:24]
  wire  router_io_slave_1_aw_ready; // @[nasti.scala 549:24]
  wire  router_io_slave_1_aw_valid; // @[nasti.scala 549:24]
  wire [11:0] router_io_slave_1_aw_bits_addr; // @[nasti.scala 549:24]
  wire [7:0] router_io_slave_1_aw_bits_len; // @[nasti.scala 549:24]
  wire  router_io_slave_1_aw_bits_id; // @[nasti.scala 549:24]
  wire  router_io_slave_1_w_ready; // @[nasti.scala 549:24]
  wire  router_io_slave_1_w_valid; // @[nasti.scala 549:24]
  wire [31:0] router_io_slave_1_w_bits_data; // @[nasti.scala 549:24]
  wire  router_io_slave_1_b_ready; // @[nasti.scala 549:24]
  wire  router_io_slave_1_b_valid; // @[nasti.scala 549:24]
  wire  router_io_slave_1_b_bits_id; // @[nasti.scala 549:24]
  wire  router_io_slave_1_ar_ready; // @[nasti.scala 549:24]
  wire  router_io_slave_1_ar_valid; // @[nasti.scala 549:24]
  wire [11:0] router_io_slave_1_ar_bits_addr; // @[nasti.scala 549:24]
  wire [7:0] router_io_slave_1_ar_bits_len; // @[nasti.scala 549:24]
  wire  router_io_slave_1_ar_bits_id; // @[nasti.scala 549:24]
  wire  router_io_slave_1_r_ready; // @[nasti.scala 549:24]
  wire  router_io_slave_1_r_valid; // @[nasti.scala 549:24]
  wire [31:0] router_io_slave_1_r_bits_data; // @[nasti.scala 549:24]
  wire  router_io_slave_1_r_bits_id; // @[nasti.scala 549:24]
  wire  router_io_slave_2_aw_ready; // @[nasti.scala 549:24]
  wire  router_io_slave_2_aw_valid; // @[nasti.scala 549:24]
  wire [11:0] router_io_slave_2_aw_bits_addr; // @[nasti.scala 549:24]
  wire [7:0] router_io_slave_2_aw_bits_len; // @[nasti.scala 549:24]
  wire  router_io_slave_2_aw_bits_id; // @[nasti.scala 549:24]
  wire  router_io_slave_2_w_ready; // @[nasti.scala 549:24]
  wire  router_io_slave_2_w_valid; // @[nasti.scala 549:24]
  wire [31:0] router_io_slave_2_w_bits_data; // @[nasti.scala 549:24]
  wire  router_io_slave_2_b_ready; // @[nasti.scala 549:24]
  wire  router_io_slave_2_b_valid; // @[nasti.scala 549:24]
  wire  router_io_slave_2_b_bits_id; // @[nasti.scala 549:24]
  wire  router_io_slave_2_ar_ready; // @[nasti.scala 549:24]
  wire  router_io_slave_2_ar_valid; // @[nasti.scala 549:24]
  wire [11:0] router_io_slave_2_ar_bits_addr; // @[nasti.scala 549:24]
  wire [7:0] router_io_slave_2_ar_bits_len; // @[nasti.scala 549:24]
  wire  router_io_slave_2_ar_bits_id; // @[nasti.scala 549:24]
  wire  router_io_slave_2_r_ready; // @[nasti.scala 549:24]
  wire  router_io_slave_2_r_valid; // @[nasti.scala 549:24]
  wire [31:0] router_io_slave_2_r_bits_data; // @[nasti.scala 549:24]
  wire  router_io_slave_2_r_bits_id; // @[nasti.scala 549:24]
  wire  router_io_slave_3_aw_ready; // @[nasti.scala 549:24]
  wire  router_io_slave_3_aw_valid; // @[nasti.scala 549:24]
  wire [11:0] router_io_slave_3_aw_bits_addr; // @[nasti.scala 549:24]
  wire [7:0] router_io_slave_3_aw_bits_len; // @[nasti.scala 549:24]
  wire  router_io_slave_3_aw_bits_id; // @[nasti.scala 549:24]
  wire  router_io_slave_3_w_ready; // @[nasti.scala 549:24]
  wire  router_io_slave_3_w_valid; // @[nasti.scala 549:24]
  wire [31:0] router_io_slave_3_w_bits_data; // @[nasti.scala 549:24]
  wire  router_io_slave_3_b_ready; // @[nasti.scala 549:24]
  wire  router_io_slave_3_b_valid; // @[nasti.scala 549:24]
  wire  router_io_slave_3_b_bits_id; // @[nasti.scala 549:24]
  wire  router_io_slave_3_ar_ready; // @[nasti.scala 549:24]
  wire  router_io_slave_3_ar_valid; // @[nasti.scala 549:24]
  wire [11:0] router_io_slave_3_ar_bits_addr; // @[nasti.scala 549:24]
  wire [7:0] router_io_slave_3_ar_bits_len; // @[nasti.scala 549:24]
  wire  router_io_slave_3_ar_bits_id; // @[nasti.scala 549:24]
  wire  router_io_slave_3_r_ready; // @[nasti.scala 549:24]
  wire  router_io_slave_3_r_valid; // @[nasti.scala 549:24]
  wire [31:0] router_io_slave_3_r_bits_data; // @[nasti.scala 549:24]
  wire  router_io_slave_3_r_bits_id; // @[nasti.scala 549:24]
  wire  router_io_slave_4_aw_ready; // @[nasti.scala 549:24]
  wire  router_io_slave_4_aw_valid; // @[nasti.scala 549:24]
  wire [7:0] router_io_slave_4_aw_bits_len; // @[nasti.scala 549:24]
  wire  router_io_slave_4_aw_bits_id; // @[nasti.scala 549:24]
  wire  router_io_slave_4_w_ready; // @[nasti.scala 549:24]
  wire  router_io_slave_4_w_valid; // @[nasti.scala 549:24]
  wire [31:0] router_io_slave_4_w_bits_data; // @[nasti.scala 549:24]
  wire  router_io_slave_4_b_ready; // @[nasti.scala 549:24]
  wire  router_io_slave_4_b_valid; // @[nasti.scala 549:24]
  wire  router_io_slave_4_b_bits_id; // @[nasti.scala 549:24]
  wire  router_io_slave_4_ar_ready; // @[nasti.scala 549:24]
  wire  router_io_slave_4_ar_valid; // @[nasti.scala 549:24]
  wire [7:0] router_io_slave_4_ar_bits_len; // @[nasti.scala 549:24]
  wire  router_io_slave_4_ar_bits_id; // @[nasti.scala 549:24]
  wire  router_io_slave_4_r_ready; // @[nasti.scala 549:24]
  wire  router_io_slave_4_r_valid; // @[nasti.scala 549:24]
  wire [31:0] router_io_slave_4_r_bits_data; // @[nasti.scala 549:24]
  wire  router_io_slave_4_r_bits_id; // @[nasti.scala 549:24]
  NastiRouter router ( // @[nasti.scala 549:24]
    .clock(router_clock),
    .reset(router_reset),
    .io_master_aw_ready(router_io_master_aw_ready),
    .io_master_aw_valid(router_io_master_aw_valid),
    .io_master_aw_bits_addr(router_io_master_aw_bits_addr),
    .io_master_aw_bits_len(router_io_master_aw_bits_len),
    .io_master_aw_bits_id(router_io_master_aw_bits_id),
    .io_master_w_ready(router_io_master_w_ready),
    .io_master_w_valid(router_io_master_w_valid),
    .io_master_w_bits_data(router_io_master_w_bits_data),
    .io_master_w_bits_last(router_io_master_w_bits_last),
    .io_master_b_ready(router_io_master_b_ready),
    .io_master_b_valid(router_io_master_b_valid),
    .io_master_b_bits_resp(router_io_master_b_bits_resp),
    .io_master_b_bits_id(router_io_master_b_bits_id),
    .io_master_ar_ready(router_io_master_ar_ready),
    .io_master_ar_valid(router_io_master_ar_valid),
    .io_master_ar_bits_addr(router_io_master_ar_bits_addr),
    .io_master_ar_bits_len(router_io_master_ar_bits_len),
    .io_master_ar_bits_id(router_io_master_ar_bits_id),
    .io_master_r_ready(router_io_master_r_ready),
    .io_master_r_valid(router_io_master_r_valid),
    .io_master_r_bits_resp(router_io_master_r_bits_resp),
    .io_master_r_bits_data(router_io_master_r_bits_data),
    .io_master_r_bits_last(router_io_master_r_bits_last),
    .io_master_r_bits_id(router_io_master_r_bits_id),
    .io_slave_0_aw_ready(router_io_slave_0_aw_ready),
    .io_slave_0_aw_valid(router_io_slave_0_aw_valid),
    .io_slave_0_aw_bits_addr(router_io_slave_0_aw_bits_addr),
    .io_slave_0_aw_bits_len(router_io_slave_0_aw_bits_len),
    .io_slave_0_aw_bits_id(router_io_slave_0_aw_bits_id),
    .io_slave_0_w_ready(router_io_slave_0_w_ready),
    .io_slave_0_w_valid(router_io_slave_0_w_valid),
    .io_slave_0_w_bits_data(router_io_slave_0_w_bits_data),
    .io_slave_0_b_ready(router_io_slave_0_b_ready),
    .io_slave_0_b_valid(router_io_slave_0_b_valid),
    .io_slave_0_b_bits_id(router_io_slave_0_b_bits_id),
    .io_slave_0_ar_ready(router_io_slave_0_ar_ready),
    .io_slave_0_ar_valid(router_io_slave_0_ar_valid),
    .io_slave_0_ar_bits_addr(router_io_slave_0_ar_bits_addr),
    .io_slave_0_ar_bits_len(router_io_slave_0_ar_bits_len),
    .io_slave_0_ar_bits_id(router_io_slave_0_ar_bits_id),
    .io_slave_0_r_ready(router_io_slave_0_r_ready),
    .io_slave_0_r_valid(router_io_slave_0_r_valid),
    .io_slave_0_r_bits_data(router_io_slave_0_r_bits_data),
    .io_slave_0_r_bits_id(router_io_slave_0_r_bits_id),
    .io_slave_1_aw_ready(router_io_slave_1_aw_ready),
    .io_slave_1_aw_valid(router_io_slave_1_aw_valid),
    .io_slave_1_aw_bits_addr(router_io_slave_1_aw_bits_addr),
    .io_slave_1_aw_bits_len(router_io_slave_1_aw_bits_len),
    .io_slave_1_aw_bits_id(router_io_slave_1_aw_bits_id),
    .io_slave_1_w_ready(router_io_slave_1_w_ready),
    .io_slave_1_w_valid(router_io_slave_1_w_valid),
    .io_slave_1_w_bits_data(router_io_slave_1_w_bits_data),
    .io_slave_1_b_ready(router_io_slave_1_b_ready),
    .io_slave_1_b_valid(router_io_slave_1_b_valid),
    .io_slave_1_b_bits_id(router_io_slave_1_b_bits_id),
    .io_slave_1_ar_ready(router_io_slave_1_ar_ready),
    .io_slave_1_ar_valid(router_io_slave_1_ar_valid),
    .io_slave_1_ar_bits_addr(router_io_slave_1_ar_bits_addr),
    .io_slave_1_ar_bits_len(router_io_slave_1_ar_bits_len),
    .io_slave_1_ar_bits_id(router_io_slave_1_ar_bits_id),
    .io_slave_1_r_ready(router_io_slave_1_r_ready),
    .io_slave_1_r_valid(router_io_slave_1_r_valid),
    .io_slave_1_r_bits_data(router_io_slave_1_r_bits_data),
    .io_slave_1_r_bits_id(router_io_slave_1_r_bits_id),
    .io_slave_2_aw_ready(router_io_slave_2_aw_ready),
    .io_slave_2_aw_valid(router_io_slave_2_aw_valid),
    .io_slave_2_aw_bits_addr(router_io_slave_2_aw_bits_addr),
    .io_slave_2_aw_bits_len(router_io_slave_2_aw_bits_len),
    .io_slave_2_aw_bits_id(router_io_slave_2_aw_bits_id),
    .io_slave_2_w_ready(router_io_slave_2_w_ready),
    .io_slave_2_w_valid(router_io_slave_2_w_valid),
    .io_slave_2_w_bits_data(router_io_slave_2_w_bits_data),
    .io_slave_2_b_ready(router_io_slave_2_b_ready),
    .io_slave_2_b_valid(router_io_slave_2_b_valid),
    .io_slave_2_b_bits_id(router_io_slave_2_b_bits_id),
    .io_slave_2_ar_ready(router_io_slave_2_ar_ready),
    .io_slave_2_ar_valid(router_io_slave_2_ar_valid),
    .io_slave_2_ar_bits_addr(router_io_slave_2_ar_bits_addr),
    .io_slave_2_ar_bits_len(router_io_slave_2_ar_bits_len),
    .io_slave_2_ar_bits_id(router_io_slave_2_ar_bits_id),
    .io_slave_2_r_ready(router_io_slave_2_r_ready),
    .io_slave_2_r_valid(router_io_slave_2_r_valid),
    .io_slave_2_r_bits_data(router_io_slave_2_r_bits_data),
    .io_slave_2_r_bits_id(router_io_slave_2_r_bits_id),
    .io_slave_3_aw_ready(router_io_slave_3_aw_ready),
    .io_slave_3_aw_valid(router_io_slave_3_aw_valid),
    .io_slave_3_aw_bits_addr(router_io_slave_3_aw_bits_addr),
    .io_slave_3_aw_bits_len(router_io_slave_3_aw_bits_len),
    .io_slave_3_aw_bits_id(router_io_slave_3_aw_bits_id),
    .io_slave_3_w_ready(router_io_slave_3_w_ready),
    .io_slave_3_w_valid(router_io_slave_3_w_valid),
    .io_slave_3_w_bits_data(router_io_slave_3_w_bits_data),
    .io_slave_3_b_ready(router_io_slave_3_b_ready),
    .io_slave_3_b_valid(router_io_slave_3_b_valid),
    .io_slave_3_b_bits_id(router_io_slave_3_b_bits_id),
    .io_slave_3_ar_ready(router_io_slave_3_ar_ready),
    .io_slave_3_ar_valid(router_io_slave_3_ar_valid),
    .io_slave_3_ar_bits_addr(router_io_slave_3_ar_bits_addr),
    .io_slave_3_ar_bits_len(router_io_slave_3_ar_bits_len),
    .io_slave_3_ar_bits_id(router_io_slave_3_ar_bits_id),
    .io_slave_3_r_ready(router_io_slave_3_r_ready),
    .io_slave_3_r_valid(router_io_slave_3_r_valid),
    .io_slave_3_r_bits_data(router_io_slave_3_r_bits_data),
    .io_slave_3_r_bits_id(router_io_slave_3_r_bits_id),
    .io_slave_4_aw_ready(router_io_slave_4_aw_ready),
    .io_slave_4_aw_valid(router_io_slave_4_aw_valid),
    .io_slave_4_aw_bits_len(router_io_slave_4_aw_bits_len),
    .io_slave_4_aw_bits_id(router_io_slave_4_aw_bits_id),
    .io_slave_4_w_ready(router_io_slave_4_w_ready),
    .io_slave_4_w_valid(router_io_slave_4_w_valid),
    .io_slave_4_w_bits_data(router_io_slave_4_w_bits_data),
    .io_slave_4_b_ready(router_io_slave_4_b_ready),
    .io_slave_4_b_valid(router_io_slave_4_b_valid),
    .io_slave_4_b_bits_id(router_io_slave_4_b_bits_id),
    .io_slave_4_ar_ready(router_io_slave_4_ar_ready),
    .io_slave_4_ar_valid(router_io_slave_4_ar_valid),
    .io_slave_4_ar_bits_len(router_io_slave_4_ar_bits_len),
    .io_slave_4_ar_bits_id(router_io_slave_4_ar_bits_id),
    .io_slave_4_r_ready(router_io_slave_4_r_ready),
    .io_slave_4_r_valid(router_io_slave_4_r_valid),
    .io_slave_4_r_bits_data(router_io_slave_4_r_bits_data),
    .io_slave_4_r_bits_id(router_io_slave_4_r_bits_id)
  );
  assign io_masters_0_aw_ready = router_io_master_aw_ready; // @[nasti.scala 550:22]
  assign io_masters_0_w_ready = router_io_master_w_ready; // @[nasti.scala 550:22]
  assign io_masters_0_b_valid = router_io_master_b_valid; // @[nasti.scala 550:22]
  assign io_masters_0_b_bits_resp = router_io_master_b_bits_resp; // @[nasti.scala 550:22]
  assign io_masters_0_b_bits_id = router_io_master_b_bits_id; // @[nasti.scala 550:22]
  assign io_masters_0_ar_ready = router_io_master_ar_ready; // @[nasti.scala 550:22]
  assign io_masters_0_r_valid = router_io_master_r_valid; // @[nasti.scala 550:22]
  assign io_masters_0_r_bits_resp = router_io_master_r_bits_resp; // @[nasti.scala 550:22]
  assign io_masters_0_r_bits_data = router_io_master_r_bits_data; // @[nasti.scala 550:22]
  assign io_masters_0_r_bits_last = router_io_master_r_bits_last; // @[nasti.scala 550:22]
  assign io_masters_0_r_bits_id = router_io_master_r_bits_id; // @[nasti.scala 550:22]
  assign io_slaves_0_aw_valid = router_io_slave_0_aw_valid; // @[nasti.scala 551:15]
  assign io_slaves_0_aw_bits_addr = router_io_slave_0_aw_bits_addr; // @[nasti.scala 551:15]
  assign io_slaves_0_aw_bits_len = router_io_slave_0_aw_bits_len; // @[nasti.scala 551:15]
  assign io_slaves_0_aw_bits_id = router_io_slave_0_aw_bits_id; // @[nasti.scala 551:15]
  assign io_slaves_0_w_valid = router_io_slave_0_w_valid; // @[nasti.scala 551:15]
  assign io_slaves_0_w_bits_data = router_io_slave_0_w_bits_data; // @[nasti.scala 551:15]
  assign io_slaves_0_b_ready = router_io_slave_0_b_ready; // @[nasti.scala 551:15]
  assign io_slaves_0_ar_valid = router_io_slave_0_ar_valid; // @[nasti.scala 551:15]
  assign io_slaves_0_ar_bits_addr = router_io_slave_0_ar_bits_addr; // @[nasti.scala 551:15]
  assign io_slaves_0_ar_bits_len = router_io_slave_0_ar_bits_len; // @[nasti.scala 551:15]
  assign io_slaves_0_ar_bits_id = router_io_slave_0_ar_bits_id; // @[nasti.scala 551:15]
  assign io_slaves_0_r_ready = router_io_slave_0_r_ready; // @[nasti.scala 551:15]
  assign io_slaves_1_aw_valid = router_io_slave_1_aw_valid; // @[nasti.scala 551:15]
  assign io_slaves_1_aw_bits_addr = router_io_slave_1_aw_bits_addr; // @[nasti.scala 551:15]
  assign io_slaves_1_aw_bits_len = router_io_slave_1_aw_bits_len; // @[nasti.scala 551:15]
  assign io_slaves_1_aw_bits_id = router_io_slave_1_aw_bits_id; // @[nasti.scala 551:15]
  assign io_slaves_1_w_valid = router_io_slave_1_w_valid; // @[nasti.scala 551:15]
  assign io_slaves_1_w_bits_data = router_io_slave_1_w_bits_data; // @[nasti.scala 551:15]
  assign io_slaves_1_b_ready = router_io_slave_1_b_ready; // @[nasti.scala 551:15]
  assign io_slaves_1_ar_valid = router_io_slave_1_ar_valid; // @[nasti.scala 551:15]
  assign io_slaves_1_ar_bits_addr = router_io_slave_1_ar_bits_addr; // @[nasti.scala 551:15]
  assign io_slaves_1_ar_bits_len = router_io_slave_1_ar_bits_len; // @[nasti.scala 551:15]
  assign io_slaves_1_ar_bits_id = router_io_slave_1_ar_bits_id; // @[nasti.scala 551:15]
  assign io_slaves_1_r_ready = router_io_slave_1_r_ready; // @[nasti.scala 551:15]
  assign io_slaves_2_aw_valid = router_io_slave_2_aw_valid; // @[nasti.scala 551:15]
  assign io_slaves_2_aw_bits_addr = router_io_slave_2_aw_bits_addr; // @[nasti.scala 551:15]
  assign io_slaves_2_aw_bits_len = router_io_slave_2_aw_bits_len; // @[nasti.scala 551:15]
  assign io_slaves_2_aw_bits_id = router_io_slave_2_aw_bits_id; // @[nasti.scala 551:15]
  assign io_slaves_2_w_valid = router_io_slave_2_w_valid; // @[nasti.scala 551:15]
  assign io_slaves_2_w_bits_data = router_io_slave_2_w_bits_data; // @[nasti.scala 551:15]
  assign io_slaves_2_b_ready = router_io_slave_2_b_ready; // @[nasti.scala 551:15]
  assign io_slaves_2_ar_valid = router_io_slave_2_ar_valid; // @[nasti.scala 551:15]
  assign io_slaves_2_ar_bits_addr = router_io_slave_2_ar_bits_addr; // @[nasti.scala 551:15]
  assign io_slaves_2_ar_bits_len = router_io_slave_2_ar_bits_len; // @[nasti.scala 551:15]
  assign io_slaves_2_ar_bits_id = router_io_slave_2_ar_bits_id; // @[nasti.scala 551:15]
  assign io_slaves_2_r_ready = router_io_slave_2_r_ready; // @[nasti.scala 551:15]
  assign io_slaves_3_aw_valid = router_io_slave_3_aw_valid; // @[nasti.scala 551:15]
  assign io_slaves_3_aw_bits_addr = router_io_slave_3_aw_bits_addr; // @[nasti.scala 551:15]
  assign io_slaves_3_aw_bits_len = router_io_slave_3_aw_bits_len; // @[nasti.scala 551:15]
  assign io_slaves_3_aw_bits_id = router_io_slave_3_aw_bits_id; // @[nasti.scala 551:15]
  assign io_slaves_3_w_valid = router_io_slave_3_w_valid; // @[nasti.scala 551:15]
  assign io_slaves_3_w_bits_data = router_io_slave_3_w_bits_data; // @[nasti.scala 551:15]
  assign io_slaves_3_b_ready = router_io_slave_3_b_ready; // @[nasti.scala 551:15]
  assign io_slaves_3_ar_valid = router_io_slave_3_ar_valid; // @[nasti.scala 551:15]
  assign io_slaves_3_ar_bits_addr = router_io_slave_3_ar_bits_addr; // @[nasti.scala 551:15]
  assign io_slaves_3_ar_bits_len = router_io_slave_3_ar_bits_len; // @[nasti.scala 551:15]
  assign io_slaves_3_ar_bits_id = router_io_slave_3_ar_bits_id; // @[nasti.scala 551:15]
  assign io_slaves_3_r_ready = router_io_slave_3_r_ready; // @[nasti.scala 551:15]
  assign io_slaves_4_aw_valid = router_io_slave_4_aw_valid; // @[nasti.scala 551:15]
  assign io_slaves_4_aw_bits_len = router_io_slave_4_aw_bits_len; // @[nasti.scala 551:15]
  assign io_slaves_4_aw_bits_id = router_io_slave_4_aw_bits_id; // @[nasti.scala 551:15]
  assign io_slaves_4_w_valid = router_io_slave_4_w_valid; // @[nasti.scala 551:15]
  assign io_slaves_4_w_bits_data = router_io_slave_4_w_bits_data; // @[nasti.scala 551:15]
  assign io_slaves_4_b_ready = router_io_slave_4_b_ready; // @[nasti.scala 551:15]
  assign io_slaves_4_ar_valid = router_io_slave_4_ar_valid; // @[nasti.scala 551:15]
  assign io_slaves_4_ar_bits_len = router_io_slave_4_ar_bits_len; // @[nasti.scala 551:15]
  assign io_slaves_4_ar_bits_id = router_io_slave_4_ar_bits_id; // @[nasti.scala 551:15]
  assign io_slaves_4_r_ready = router_io_slave_4_r_ready; // @[nasti.scala 551:15]
  assign router_clock = clock;
  assign router_reset = reset;
  assign router_io_master_aw_valid = io_masters_0_aw_valid; // @[nasti.scala 550:22]
  assign router_io_master_aw_bits_addr = io_masters_0_aw_bits_addr; // @[nasti.scala 550:22]
  assign router_io_master_aw_bits_len = io_masters_0_aw_bits_len; // @[nasti.scala 550:22]
  assign router_io_master_aw_bits_id = io_masters_0_aw_bits_id; // @[nasti.scala 550:22]
  assign router_io_master_w_valid = io_masters_0_w_valid; // @[nasti.scala 550:22]
  assign router_io_master_w_bits_data = io_masters_0_w_bits_data; // @[nasti.scala 550:22]
  assign router_io_master_w_bits_last = io_masters_0_w_bits_last; // @[nasti.scala 550:22]
  assign router_io_master_b_ready = io_masters_0_b_ready; // @[nasti.scala 550:22]
  assign router_io_master_ar_valid = io_masters_0_ar_valid; // @[nasti.scala 550:22]
  assign router_io_master_ar_bits_addr = io_masters_0_ar_bits_addr; // @[nasti.scala 550:22]
  assign router_io_master_ar_bits_len = io_masters_0_ar_bits_len; // @[nasti.scala 550:22]
  assign router_io_master_ar_bits_id = io_masters_0_ar_bits_id; // @[nasti.scala 550:22]
  assign router_io_master_r_ready = io_masters_0_r_ready; // @[nasti.scala 550:22]
  assign router_io_slave_0_aw_ready = io_slaves_0_aw_ready; // @[nasti.scala 551:15]
  assign router_io_slave_0_w_ready = io_slaves_0_w_ready; // @[nasti.scala 551:15]
  assign router_io_slave_0_b_valid = io_slaves_0_b_valid; // @[nasti.scala 551:15]
  assign router_io_slave_0_b_bits_id = io_slaves_0_b_bits_id; // @[nasti.scala 551:15]
  assign router_io_slave_0_ar_ready = io_slaves_0_ar_ready; // @[nasti.scala 551:15]
  assign router_io_slave_0_r_valid = io_slaves_0_r_valid; // @[nasti.scala 551:15]
  assign router_io_slave_0_r_bits_data = io_slaves_0_r_bits_data; // @[nasti.scala 551:15]
  assign router_io_slave_0_r_bits_id = io_slaves_0_r_bits_id; // @[nasti.scala 551:15]
  assign router_io_slave_1_aw_ready = io_slaves_1_aw_ready; // @[nasti.scala 551:15]
  assign router_io_slave_1_w_ready = io_slaves_1_w_ready; // @[nasti.scala 551:15]
  assign router_io_slave_1_b_valid = io_slaves_1_b_valid; // @[nasti.scala 551:15]
  assign router_io_slave_1_b_bits_id = io_slaves_1_b_bits_id; // @[nasti.scala 551:15]
  assign router_io_slave_1_ar_ready = io_slaves_1_ar_ready; // @[nasti.scala 551:15]
  assign router_io_slave_1_r_valid = io_slaves_1_r_valid; // @[nasti.scala 551:15]
  assign router_io_slave_1_r_bits_data = io_slaves_1_r_bits_data; // @[nasti.scala 551:15]
  assign router_io_slave_1_r_bits_id = io_slaves_1_r_bits_id; // @[nasti.scala 551:15]
  assign router_io_slave_2_aw_ready = io_slaves_2_aw_ready; // @[nasti.scala 551:15]
  assign router_io_slave_2_w_ready = io_slaves_2_w_ready; // @[nasti.scala 551:15]
  assign router_io_slave_2_b_valid = io_slaves_2_b_valid; // @[nasti.scala 551:15]
  assign router_io_slave_2_b_bits_id = io_slaves_2_b_bits_id; // @[nasti.scala 551:15]
  assign router_io_slave_2_ar_ready = io_slaves_2_ar_ready; // @[nasti.scala 551:15]
  assign router_io_slave_2_r_valid = io_slaves_2_r_valid; // @[nasti.scala 551:15]
  assign router_io_slave_2_r_bits_data = io_slaves_2_r_bits_data; // @[nasti.scala 551:15]
  assign router_io_slave_2_r_bits_id = io_slaves_2_r_bits_id; // @[nasti.scala 551:15]
  assign router_io_slave_3_aw_ready = io_slaves_3_aw_ready; // @[nasti.scala 551:15]
  assign router_io_slave_3_w_ready = io_slaves_3_w_ready; // @[nasti.scala 551:15]
  assign router_io_slave_3_b_valid = io_slaves_3_b_valid; // @[nasti.scala 551:15]
  assign router_io_slave_3_b_bits_id = io_slaves_3_b_bits_id; // @[nasti.scala 551:15]
  assign router_io_slave_3_ar_ready = io_slaves_3_ar_ready; // @[nasti.scala 551:15]
  assign router_io_slave_3_r_valid = io_slaves_3_r_valid; // @[nasti.scala 551:15]
  assign router_io_slave_3_r_bits_data = io_slaves_3_r_bits_data; // @[nasti.scala 551:15]
  assign router_io_slave_3_r_bits_id = io_slaves_3_r_bits_id; // @[nasti.scala 551:15]
  assign router_io_slave_4_aw_ready = io_slaves_4_aw_ready; // @[nasti.scala 551:15]
  assign router_io_slave_4_w_ready = io_slaves_4_w_ready; // @[nasti.scala 551:15]
  assign router_io_slave_4_b_valid = io_slaves_4_b_valid; // @[nasti.scala 551:15]
  assign router_io_slave_4_b_bits_id = io_slaves_4_b_bits_id; // @[nasti.scala 551:15]
  assign router_io_slave_4_ar_ready = io_slaves_4_ar_ready; // @[nasti.scala 551:15]
  assign router_io_slave_4_r_valid = io_slaves_4_r_valid; // @[nasti.scala 551:15]
  assign router_io_slave_4_r_bits_data = io_slaves_4_r_bits_data; // @[nasti.scala 551:15]
  assign router_io_slave_4_r_bits_id = io_slaves_4_r_bits_id; // @[nasti.scala 551:15]
endmodule
module NastiRecursiveInterconnect(
  input         clock,
  input         reset,
  output        io_masters_0_aw_ready,
  input         io_masters_0_aw_valid,
  input  [11:0] io_masters_0_aw_bits_addr,
  input  [7:0]  io_masters_0_aw_bits_len,
  input         io_masters_0_aw_bits_id,
  output        io_masters_0_w_ready,
  input         io_masters_0_w_valid,
  input  [31:0] io_masters_0_w_bits_data,
  input         io_masters_0_w_bits_last,
  input         io_masters_0_b_ready,
  output        io_masters_0_b_valid,
  output [1:0]  io_masters_0_b_bits_resp,
  output        io_masters_0_b_bits_id,
  output        io_masters_0_ar_ready,
  input         io_masters_0_ar_valid,
  input  [11:0] io_masters_0_ar_bits_addr,
  input  [7:0]  io_masters_0_ar_bits_len,
  input         io_masters_0_ar_bits_id,
  input         io_masters_0_r_ready,
  output        io_masters_0_r_valid,
  output [1:0]  io_masters_0_r_bits_resp,
  output [31:0] io_masters_0_r_bits_data,
  output        io_masters_0_r_bits_last,
  output        io_masters_0_r_bits_id,
  input         io_slaves_0_aw_ready,
  output        io_slaves_0_aw_valid,
  output [11:0] io_slaves_0_aw_bits_addr,
  output [7:0]  io_slaves_0_aw_bits_len,
  output        io_slaves_0_aw_bits_id,
  input         io_slaves_0_w_ready,
  output        io_slaves_0_w_valid,
  output [31:0] io_slaves_0_w_bits_data,
  output        io_slaves_0_b_ready,
  input         io_slaves_0_b_valid,
  input         io_slaves_0_b_bits_id,
  input         io_slaves_0_ar_ready,
  output        io_slaves_0_ar_valid,
  output [11:0] io_slaves_0_ar_bits_addr,
  output [7:0]  io_slaves_0_ar_bits_len,
  output        io_slaves_0_ar_bits_id,
  output        io_slaves_0_r_ready,
  input         io_slaves_0_r_valid,
  input  [31:0] io_slaves_0_r_bits_data,
  input         io_slaves_0_r_bits_id,
  input         io_slaves_1_aw_ready,
  output        io_slaves_1_aw_valid,
  output [11:0] io_slaves_1_aw_bits_addr,
  output [7:0]  io_slaves_1_aw_bits_len,
  output        io_slaves_1_aw_bits_id,
  input         io_slaves_1_w_ready,
  output        io_slaves_1_w_valid,
  output [31:0] io_slaves_1_w_bits_data,
  output        io_slaves_1_b_ready,
  input         io_slaves_1_b_valid,
  input         io_slaves_1_b_bits_id,
  input         io_slaves_1_ar_ready,
  output        io_slaves_1_ar_valid,
  output [11:0] io_slaves_1_ar_bits_addr,
  output [7:0]  io_slaves_1_ar_bits_len,
  output        io_slaves_1_ar_bits_id,
  output        io_slaves_1_r_ready,
  input         io_slaves_1_r_valid,
  input  [31:0] io_slaves_1_r_bits_data,
  input         io_slaves_1_r_bits_id,
  input         io_slaves_2_aw_ready,
  output        io_slaves_2_aw_valid,
  output [11:0] io_slaves_2_aw_bits_addr,
  output [7:0]  io_slaves_2_aw_bits_len,
  output        io_slaves_2_aw_bits_id,
  input         io_slaves_2_w_ready,
  output        io_slaves_2_w_valid,
  output [31:0] io_slaves_2_w_bits_data,
  output        io_slaves_2_b_ready,
  input         io_slaves_2_b_valid,
  input         io_slaves_2_b_bits_id,
  input         io_slaves_2_ar_ready,
  output        io_slaves_2_ar_valid,
  output [11:0] io_slaves_2_ar_bits_addr,
  output [7:0]  io_slaves_2_ar_bits_len,
  output        io_slaves_2_ar_bits_id,
  output        io_slaves_2_r_ready,
  input         io_slaves_2_r_valid,
  input  [31:0] io_slaves_2_r_bits_data,
  input         io_slaves_2_r_bits_id,
  input         io_slaves_3_aw_ready,
  output        io_slaves_3_aw_valid,
  output [11:0] io_slaves_3_aw_bits_addr,
  output [7:0]  io_slaves_3_aw_bits_len,
  output        io_slaves_3_aw_bits_id,
  input         io_slaves_3_w_ready,
  output        io_slaves_3_w_valid,
  output [31:0] io_slaves_3_w_bits_data,
  output        io_slaves_3_b_ready,
  input         io_slaves_3_b_valid,
  input         io_slaves_3_b_bits_id,
  input         io_slaves_3_ar_ready,
  output        io_slaves_3_ar_valid,
  output [11:0] io_slaves_3_ar_bits_addr,
  output [7:0]  io_slaves_3_ar_bits_len,
  output        io_slaves_3_ar_bits_id,
  output        io_slaves_3_r_ready,
  input         io_slaves_3_r_valid,
  input  [31:0] io_slaves_3_r_bits_data,
  input         io_slaves_3_r_bits_id,
  input         io_slaves_4_aw_ready,
  output        io_slaves_4_aw_valid,
  output [7:0]  io_slaves_4_aw_bits_len,
  output        io_slaves_4_aw_bits_id,
  input         io_slaves_4_w_ready,
  output        io_slaves_4_w_valid,
  output [31:0] io_slaves_4_w_bits_data,
  output        io_slaves_4_b_ready,
  input         io_slaves_4_b_valid,
  input         io_slaves_4_b_bits_id,
  input         io_slaves_4_ar_ready,
  output        io_slaves_4_ar_valid,
  output [7:0]  io_slaves_4_ar_bits_len,
  output        io_slaves_4_ar_bits_id,
  output        io_slaves_4_r_ready,
  input         io_slaves_4_r_valid,
  input  [31:0] io_slaves_4_r_bits_data,
  input         io_slaves_4_r_bits_id
);
  wire  xbar_clock; // @[nasti.scala 590:20]
  wire  xbar_reset; // @[nasti.scala 590:20]
  wire  xbar_io_masters_0_aw_ready; // @[nasti.scala 590:20]
  wire  xbar_io_masters_0_aw_valid; // @[nasti.scala 590:20]
  wire [11:0] xbar_io_masters_0_aw_bits_addr; // @[nasti.scala 590:20]
  wire [7:0] xbar_io_masters_0_aw_bits_len; // @[nasti.scala 590:20]
  wire  xbar_io_masters_0_aw_bits_id; // @[nasti.scala 590:20]
  wire  xbar_io_masters_0_w_ready; // @[nasti.scala 590:20]
  wire  xbar_io_masters_0_w_valid; // @[nasti.scala 590:20]
  wire [31:0] xbar_io_masters_0_w_bits_data; // @[nasti.scala 590:20]
  wire  xbar_io_masters_0_w_bits_last; // @[nasti.scala 590:20]
  wire  xbar_io_masters_0_b_ready; // @[nasti.scala 590:20]
  wire  xbar_io_masters_0_b_valid; // @[nasti.scala 590:20]
  wire [1:0] xbar_io_masters_0_b_bits_resp; // @[nasti.scala 590:20]
  wire  xbar_io_masters_0_b_bits_id; // @[nasti.scala 590:20]
  wire  xbar_io_masters_0_ar_ready; // @[nasti.scala 590:20]
  wire  xbar_io_masters_0_ar_valid; // @[nasti.scala 590:20]
  wire [11:0] xbar_io_masters_0_ar_bits_addr; // @[nasti.scala 590:20]
  wire [7:0] xbar_io_masters_0_ar_bits_len; // @[nasti.scala 590:20]
  wire  xbar_io_masters_0_ar_bits_id; // @[nasti.scala 590:20]
  wire  xbar_io_masters_0_r_ready; // @[nasti.scala 590:20]
  wire  xbar_io_masters_0_r_valid; // @[nasti.scala 590:20]
  wire [1:0] xbar_io_masters_0_r_bits_resp; // @[nasti.scala 590:20]
  wire [31:0] xbar_io_masters_0_r_bits_data; // @[nasti.scala 590:20]
  wire  xbar_io_masters_0_r_bits_last; // @[nasti.scala 590:20]
  wire  xbar_io_masters_0_r_bits_id; // @[nasti.scala 590:20]
  wire  xbar_io_slaves_0_aw_ready; // @[nasti.scala 590:20]
  wire  xbar_io_slaves_0_aw_valid; // @[nasti.scala 590:20]
  wire [11:0] xbar_io_slaves_0_aw_bits_addr; // @[nasti.scala 590:20]
  wire [7:0] xbar_io_slaves_0_aw_bits_len; // @[nasti.scala 590:20]
  wire  xbar_io_slaves_0_aw_bits_id; // @[nasti.scala 590:20]
  wire  xbar_io_slaves_0_w_ready; // @[nasti.scala 590:20]
  wire  xbar_io_slaves_0_w_valid; // @[nasti.scala 590:20]
  wire [31:0] xbar_io_slaves_0_w_bits_data; // @[nasti.scala 590:20]
  wire  xbar_io_slaves_0_b_ready; // @[nasti.scala 590:20]
  wire  xbar_io_slaves_0_b_valid; // @[nasti.scala 590:20]
  wire  xbar_io_slaves_0_b_bits_id; // @[nasti.scala 590:20]
  wire  xbar_io_slaves_0_ar_ready; // @[nasti.scala 590:20]
  wire  xbar_io_slaves_0_ar_valid; // @[nasti.scala 590:20]
  wire [11:0] xbar_io_slaves_0_ar_bits_addr; // @[nasti.scala 590:20]
  wire [7:0] xbar_io_slaves_0_ar_bits_len; // @[nasti.scala 590:20]
  wire  xbar_io_slaves_0_ar_bits_id; // @[nasti.scala 590:20]
  wire  xbar_io_slaves_0_r_ready; // @[nasti.scala 590:20]
  wire  xbar_io_slaves_0_r_valid; // @[nasti.scala 590:20]
  wire [31:0] xbar_io_slaves_0_r_bits_data; // @[nasti.scala 590:20]
  wire  xbar_io_slaves_0_r_bits_id; // @[nasti.scala 590:20]
  wire  xbar_io_slaves_1_aw_ready; // @[nasti.scala 590:20]
  wire  xbar_io_slaves_1_aw_valid; // @[nasti.scala 590:20]
  wire [11:0] xbar_io_slaves_1_aw_bits_addr; // @[nasti.scala 590:20]
  wire [7:0] xbar_io_slaves_1_aw_bits_len; // @[nasti.scala 590:20]
  wire  xbar_io_slaves_1_aw_bits_id; // @[nasti.scala 590:20]
  wire  xbar_io_slaves_1_w_ready; // @[nasti.scala 590:20]
  wire  xbar_io_slaves_1_w_valid; // @[nasti.scala 590:20]
  wire [31:0] xbar_io_slaves_1_w_bits_data; // @[nasti.scala 590:20]
  wire  xbar_io_slaves_1_b_ready; // @[nasti.scala 590:20]
  wire  xbar_io_slaves_1_b_valid; // @[nasti.scala 590:20]
  wire  xbar_io_slaves_1_b_bits_id; // @[nasti.scala 590:20]
  wire  xbar_io_slaves_1_ar_ready; // @[nasti.scala 590:20]
  wire  xbar_io_slaves_1_ar_valid; // @[nasti.scala 590:20]
  wire [11:0] xbar_io_slaves_1_ar_bits_addr; // @[nasti.scala 590:20]
  wire [7:0] xbar_io_slaves_1_ar_bits_len; // @[nasti.scala 590:20]
  wire  xbar_io_slaves_1_ar_bits_id; // @[nasti.scala 590:20]
  wire  xbar_io_slaves_1_r_ready; // @[nasti.scala 590:20]
  wire  xbar_io_slaves_1_r_valid; // @[nasti.scala 590:20]
  wire [31:0] xbar_io_slaves_1_r_bits_data; // @[nasti.scala 590:20]
  wire  xbar_io_slaves_1_r_bits_id; // @[nasti.scala 590:20]
  wire  xbar_io_slaves_2_aw_ready; // @[nasti.scala 590:20]
  wire  xbar_io_slaves_2_aw_valid; // @[nasti.scala 590:20]
  wire [11:0] xbar_io_slaves_2_aw_bits_addr; // @[nasti.scala 590:20]
  wire [7:0] xbar_io_slaves_2_aw_bits_len; // @[nasti.scala 590:20]
  wire  xbar_io_slaves_2_aw_bits_id; // @[nasti.scala 590:20]
  wire  xbar_io_slaves_2_w_ready; // @[nasti.scala 590:20]
  wire  xbar_io_slaves_2_w_valid; // @[nasti.scala 590:20]
  wire [31:0] xbar_io_slaves_2_w_bits_data; // @[nasti.scala 590:20]
  wire  xbar_io_slaves_2_b_ready; // @[nasti.scala 590:20]
  wire  xbar_io_slaves_2_b_valid; // @[nasti.scala 590:20]
  wire  xbar_io_slaves_2_b_bits_id; // @[nasti.scala 590:20]
  wire  xbar_io_slaves_2_ar_ready; // @[nasti.scala 590:20]
  wire  xbar_io_slaves_2_ar_valid; // @[nasti.scala 590:20]
  wire [11:0] xbar_io_slaves_2_ar_bits_addr; // @[nasti.scala 590:20]
  wire [7:0] xbar_io_slaves_2_ar_bits_len; // @[nasti.scala 590:20]
  wire  xbar_io_slaves_2_ar_bits_id; // @[nasti.scala 590:20]
  wire  xbar_io_slaves_2_r_ready; // @[nasti.scala 590:20]
  wire  xbar_io_slaves_2_r_valid; // @[nasti.scala 590:20]
  wire [31:0] xbar_io_slaves_2_r_bits_data; // @[nasti.scala 590:20]
  wire  xbar_io_slaves_2_r_bits_id; // @[nasti.scala 590:20]
  wire  xbar_io_slaves_3_aw_ready; // @[nasti.scala 590:20]
  wire  xbar_io_slaves_3_aw_valid; // @[nasti.scala 590:20]
  wire [11:0] xbar_io_slaves_3_aw_bits_addr; // @[nasti.scala 590:20]
  wire [7:0] xbar_io_slaves_3_aw_bits_len; // @[nasti.scala 590:20]
  wire  xbar_io_slaves_3_aw_bits_id; // @[nasti.scala 590:20]
  wire  xbar_io_slaves_3_w_ready; // @[nasti.scala 590:20]
  wire  xbar_io_slaves_3_w_valid; // @[nasti.scala 590:20]
  wire [31:0] xbar_io_slaves_3_w_bits_data; // @[nasti.scala 590:20]
  wire  xbar_io_slaves_3_b_ready; // @[nasti.scala 590:20]
  wire  xbar_io_slaves_3_b_valid; // @[nasti.scala 590:20]
  wire  xbar_io_slaves_3_b_bits_id; // @[nasti.scala 590:20]
  wire  xbar_io_slaves_3_ar_ready; // @[nasti.scala 590:20]
  wire  xbar_io_slaves_3_ar_valid; // @[nasti.scala 590:20]
  wire [11:0] xbar_io_slaves_3_ar_bits_addr; // @[nasti.scala 590:20]
  wire [7:0] xbar_io_slaves_3_ar_bits_len; // @[nasti.scala 590:20]
  wire  xbar_io_slaves_3_ar_bits_id; // @[nasti.scala 590:20]
  wire  xbar_io_slaves_3_r_ready; // @[nasti.scala 590:20]
  wire  xbar_io_slaves_3_r_valid; // @[nasti.scala 590:20]
  wire [31:0] xbar_io_slaves_3_r_bits_data; // @[nasti.scala 590:20]
  wire  xbar_io_slaves_3_r_bits_id; // @[nasti.scala 590:20]
  wire  xbar_io_slaves_4_aw_ready; // @[nasti.scala 590:20]
  wire  xbar_io_slaves_4_aw_valid; // @[nasti.scala 590:20]
  wire [7:0] xbar_io_slaves_4_aw_bits_len; // @[nasti.scala 590:20]
  wire  xbar_io_slaves_4_aw_bits_id; // @[nasti.scala 590:20]
  wire  xbar_io_slaves_4_w_ready; // @[nasti.scala 590:20]
  wire  xbar_io_slaves_4_w_valid; // @[nasti.scala 590:20]
  wire [31:0] xbar_io_slaves_4_w_bits_data; // @[nasti.scala 590:20]
  wire  xbar_io_slaves_4_b_ready; // @[nasti.scala 590:20]
  wire  xbar_io_slaves_4_b_valid; // @[nasti.scala 590:20]
  wire  xbar_io_slaves_4_b_bits_id; // @[nasti.scala 590:20]
  wire  xbar_io_slaves_4_ar_ready; // @[nasti.scala 590:20]
  wire  xbar_io_slaves_4_ar_valid; // @[nasti.scala 590:20]
  wire [7:0] xbar_io_slaves_4_ar_bits_len; // @[nasti.scala 590:20]
  wire  xbar_io_slaves_4_ar_bits_id; // @[nasti.scala 590:20]
  wire  xbar_io_slaves_4_r_ready; // @[nasti.scala 590:20]
  wire  xbar_io_slaves_4_r_valid; // @[nasti.scala 590:20]
  wire [31:0] xbar_io_slaves_4_r_bits_data; // @[nasti.scala 590:20]
  wire  xbar_io_slaves_4_r_bits_id; // @[nasti.scala 590:20]
  NastiCrossbar xbar ( // @[nasti.scala 590:20]
    .clock(xbar_clock),
    .reset(xbar_reset),
    .io_masters_0_aw_ready(xbar_io_masters_0_aw_ready),
    .io_masters_0_aw_valid(xbar_io_masters_0_aw_valid),
    .io_masters_0_aw_bits_addr(xbar_io_masters_0_aw_bits_addr),
    .io_masters_0_aw_bits_len(xbar_io_masters_0_aw_bits_len),
    .io_masters_0_aw_bits_id(xbar_io_masters_0_aw_bits_id),
    .io_masters_0_w_ready(xbar_io_masters_0_w_ready),
    .io_masters_0_w_valid(xbar_io_masters_0_w_valid),
    .io_masters_0_w_bits_data(xbar_io_masters_0_w_bits_data),
    .io_masters_0_w_bits_last(xbar_io_masters_0_w_bits_last),
    .io_masters_0_b_ready(xbar_io_masters_0_b_ready),
    .io_masters_0_b_valid(xbar_io_masters_0_b_valid),
    .io_masters_0_b_bits_resp(xbar_io_masters_0_b_bits_resp),
    .io_masters_0_b_bits_id(xbar_io_masters_0_b_bits_id),
    .io_masters_0_ar_ready(xbar_io_masters_0_ar_ready),
    .io_masters_0_ar_valid(xbar_io_masters_0_ar_valid),
    .io_masters_0_ar_bits_addr(xbar_io_masters_0_ar_bits_addr),
    .io_masters_0_ar_bits_len(xbar_io_masters_0_ar_bits_len),
    .io_masters_0_ar_bits_id(xbar_io_masters_0_ar_bits_id),
    .io_masters_0_r_ready(xbar_io_masters_0_r_ready),
    .io_masters_0_r_valid(xbar_io_masters_0_r_valid),
    .io_masters_0_r_bits_resp(xbar_io_masters_0_r_bits_resp),
    .io_masters_0_r_bits_data(xbar_io_masters_0_r_bits_data),
    .io_masters_0_r_bits_last(xbar_io_masters_0_r_bits_last),
    .io_masters_0_r_bits_id(xbar_io_masters_0_r_bits_id),
    .io_slaves_0_aw_ready(xbar_io_slaves_0_aw_ready),
    .io_slaves_0_aw_valid(xbar_io_slaves_0_aw_valid),
    .io_slaves_0_aw_bits_addr(xbar_io_slaves_0_aw_bits_addr),
    .io_slaves_0_aw_bits_len(xbar_io_slaves_0_aw_bits_len),
    .io_slaves_0_aw_bits_id(xbar_io_slaves_0_aw_bits_id),
    .io_slaves_0_w_ready(xbar_io_slaves_0_w_ready),
    .io_slaves_0_w_valid(xbar_io_slaves_0_w_valid),
    .io_slaves_0_w_bits_data(xbar_io_slaves_0_w_bits_data),
    .io_slaves_0_b_ready(xbar_io_slaves_0_b_ready),
    .io_slaves_0_b_valid(xbar_io_slaves_0_b_valid),
    .io_slaves_0_b_bits_id(xbar_io_slaves_0_b_bits_id),
    .io_slaves_0_ar_ready(xbar_io_slaves_0_ar_ready),
    .io_slaves_0_ar_valid(xbar_io_slaves_0_ar_valid),
    .io_slaves_0_ar_bits_addr(xbar_io_slaves_0_ar_bits_addr),
    .io_slaves_0_ar_bits_len(xbar_io_slaves_0_ar_bits_len),
    .io_slaves_0_ar_bits_id(xbar_io_slaves_0_ar_bits_id),
    .io_slaves_0_r_ready(xbar_io_slaves_0_r_ready),
    .io_slaves_0_r_valid(xbar_io_slaves_0_r_valid),
    .io_slaves_0_r_bits_data(xbar_io_slaves_0_r_bits_data),
    .io_slaves_0_r_bits_id(xbar_io_slaves_0_r_bits_id),
    .io_slaves_1_aw_ready(xbar_io_slaves_1_aw_ready),
    .io_slaves_1_aw_valid(xbar_io_slaves_1_aw_valid),
    .io_slaves_1_aw_bits_addr(xbar_io_slaves_1_aw_bits_addr),
    .io_slaves_1_aw_bits_len(xbar_io_slaves_1_aw_bits_len),
    .io_slaves_1_aw_bits_id(xbar_io_slaves_1_aw_bits_id),
    .io_slaves_1_w_ready(xbar_io_slaves_1_w_ready),
    .io_slaves_1_w_valid(xbar_io_slaves_1_w_valid),
    .io_slaves_1_w_bits_data(xbar_io_slaves_1_w_bits_data),
    .io_slaves_1_b_ready(xbar_io_slaves_1_b_ready),
    .io_slaves_1_b_valid(xbar_io_slaves_1_b_valid),
    .io_slaves_1_b_bits_id(xbar_io_slaves_1_b_bits_id),
    .io_slaves_1_ar_ready(xbar_io_slaves_1_ar_ready),
    .io_slaves_1_ar_valid(xbar_io_slaves_1_ar_valid),
    .io_slaves_1_ar_bits_addr(xbar_io_slaves_1_ar_bits_addr),
    .io_slaves_1_ar_bits_len(xbar_io_slaves_1_ar_bits_len),
    .io_slaves_1_ar_bits_id(xbar_io_slaves_1_ar_bits_id),
    .io_slaves_1_r_ready(xbar_io_slaves_1_r_ready),
    .io_slaves_1_r_valid(xbar_io_slaves_1_r_valid),
    .io_slaves_1_r_bits_data(xbar_io_slaves_1_r_bits_data),
    .io_slaves_1_r_bits_id(xbar_io_slaves_1_r_bits_id),
    .io_slaves_2_aw_ready(xbar_io_slaves_2_aw_ready),
    .io_slaves_2_aw_valid(xbar_io_slaves_2_aw_valid),
    .io_slaves_2_aw_bits_addr(xbar_io_slaves_2_aw_bits_addr),
    .io_slaves_2_aw_bits_len(xbar_io_slaves_2_aw_bits_len),
    .io_slaves_2_aw_bits_id(xbar_io_slaves_2_aw_bits_id),
    .io_slaves_2_w_ready(xbar_io_slaves_2_w_ready),
    .io_slaves_2_w_valid(xbar_io_slaves_2_w_valid),
    .io_slaves_2_w_bits_data(xbar_io_slaves_2_w_bits_data),
    .io_slaves_2_b_ready(xbar_io_slaves_2_b_ready),
    .io_slaves_2_b_valid(xbar_io_slaves_2_b_valid),
    .io_slaves_2_b_bits_id(xbar_io_slaves_2_b_bits_id),
    .io_slaves_2_ar_ready(xbar_io_slaves_2_ar_ready),
    .io_slaves_2_ar_valid(xbar_io_slaves_2_ar_valid),
    .io_slaves_2_ar_bits_addr(xbar_io_slaves_2_ar_bits_addr),
    .io_slaves_2_ar_bits_len(xbar_io_slaves_2_ar_bits_len),
    .io_slaves_2_ar_bits_id(xbar_io_slaves_2_ar_bits_id),
    .io_slaves_2_r_ready(xbar_io_slaves_2_r_ready),
    .io_slaves_2_r_valid(xbar_io_slaves_2_r_valid),
    .io_slaves_2_r_bits_data(xbar_io_slaves_2_r_bits_data),
    .io_slaves_2_r_bits_id(xbar_io_slaves_2_r_bits_id),
    .io_slaves_3_aw_ready(xbar_io_slaves_3_aw_ready),
    .io_slaves_3_aw_valid(xbar_io_slaves_3_aw_valid),
    .io_slaves_3_aw_bits_addr(xbar_io_slaves_3_aw_bits_addr),
    .io_slaves_3_aw_bits_len(xbar_io_slaves_3_aw_bits_len),
    .io_slaves_3_aw_bits_id(xbar_io_slaves_3_aw_bits_id),
    .io_slaves_3_w_ready(xbar_io_slaves_3_w_ready),
    .io_slaves_3_w_valid(xbar_io_slaves_3_w_valid),
    .io_slaves_3_w_bits_data(xbar_io_slaves_3_w_bits_data),
    .io_slaves_3_b_ready(xbar_io_slaves_3_b_ready),
    .io_slaves_3_b_valid(xbar_io_slaves_3_b_valid),
    .io_slaves_3_b_bits_id(xbar_io_slaves_3_b_bits_id),
    .io_slaves_3_ar_ready(xbar_io_slaves_3_ar_ready),
    .io_slaves_3_ar_valid(xbar_io_slaves_3_ar_valid),
    .io_slaves_3_ar_bits_addr(xbar_io_slaves_3_ar_bits_addr),
    .io_slaves_3_ar_bits_len(xbar_io_slaves_3_ar_bits_len),
    .io_slaves_3_ar_bits_id(xbar_io_slaves_3_ar_bits_id),
    .io_slaves_3_r_ready(xbar_io_slaves_3_r_ready),
    .io_slaves_3_r_valid(xbar_io_slaves_3_r_valid),
    .io_slaves_3_r_bits_data(xbar_io_slaves_3_r_bits_data),
    .io_slaves_3_r_bits_id(xbar_io_slaves_3_r_bits_id),
    .io_slaves_4_aw_ready(xbar_io_slaves_4_aw_ready),
    .io_slaves_4_aw_valid(xbar_io_slaves_4_aw_valid),
    .io_slaves_4_aw_bits_len(xbar_io_slaves_4_aw_bits_len),
    .io_slaves_4_aw_bits_id(xbar_io_slaves_4_aw_bits_id),
    .io_slaves_4_w_ready(xbar_io_slaves_4_w_ready),
    .io_slaves_4_w_valid(xbar_io_slaves_4_w_valid),
    .io_slaves_4_w_bits_data(xbar_io_slaves_4_w_bits_data),
    .io_slaves_4_b_ready(xbar_io_slaves_4_b_ready),
    .io_slaves_4_b_valid(xbar_io_slaves_4_b_valid),
    .io_slaves_4_b_bits_id(xbar_io_slaves_4_b_bits_id),
    .io_slaves_4_ar_ready(xbar_io_slaves_4_ar_ready),
    .io_slaves_4_ar_valid(xbar_io_slaves_4_ar_valid),
    .io_slaves_4_ar_bits_len(xbar_io_slaves_4_ar_bits_len),
    .io_slaves_4_ar_bits_id(xbar_io_slaves_4_ar_bits_id),
    .io_slaves_4_r_ready(xbar_io_slaves_4_r_ready),
    .io_slaves_4_r_valid(xbar_io_slaves_4_r_valid),
    .io_slaves_4_r_bits_data(xbar_io_slaves_4_r_bits_data),
    .io_slaves_4_r_bits_id(xbar_io_slaves_4_r_bits_id)
  );
  assign io_masters_0_aw_ready = xbar_io_masters_0_aw_ready; // @[nasti.scala 591:19]
  assign io_masters_0_w_ready = xbar_io_masters_0_w_ready; // @[nasti.scala 591:19]
  assign io_masters_0_b_valid = xbar_io_masters_0_b_valid; // @[nasti.scala 591:19]
  assign io_masters_0_b_bits_resp = xbar_io_masters_0_b_bits_resp; // @[nasti.scala 591:19]
  assign io_masters_0_b_bits_id = xbar_io_masters_0_b_bits_id; // @[nasti.scala 591:19]
  assign io_masters_0_ar_ready = xbar_io_masters_0_ar_ready; // @[nasti.scala 591:19]
  assign io_masters_0_r_valid = xbar_io_masters_0_r_valid; // @[nasti.scala 591:19]
  assign io_masters_0_r_bits_resp = xbar_io_masters_0_r_bits_resp; // @[nasti.scala 591:19]
  assign io_masters_0_r_bits_data = xbar_io_masters_0_r_bits_data; // @[nasti.scala 591:19]
  assign io_masters_0_r_bits_last = xbar_io_masters_0_r_bits_last; // @[nasti.scala 591:19]
  assign io_masters_0_r_bits_id = xbar_io_masters_0_r_bits_id; // @[nasti.scala 591:19]
  assign io_slaves_0_aw_valid = xbar_io_slaves_0_aw_valid; // @[nasti.scala 593:13]
  assign io_slaves_0_aw_bits_addr = xbar_io_slaves_0_aw_bits_addr; // @[nasti.scala 593:13]
  assign io_slaves_0_aw_bits_len = xbar_io_slaves_0_aw_bits_len; // @[nasti.scala 593:13]
  assign io_slaves_0_aw_bits_id = xbar_io_slaves_0_aw_bits_id; // @[nasti.scala 593:13]
  assign io_slaves_0_w_valid = xbar_io_slaves_0_w_valid; // @[nasti.scala 593:13]
  assign io_slaves_0_w_bits_data = xbar_io_slaves_0_w_bits_data; // @[nasti.scala 593:13]
  assign io_slaves_0_b_ready = xbar_io_slaves_0_b_ready; // @[nasti.scala 593:13]
  assign io_slaves_0_ar_valid = xbar_io_slaves_0_ar_valid; // @[nasti.scala 593:13]
  assign io_slaves_0_ar_bits_addr = xbar_io_slaves_0_ar_bits_addr; // @[nasti.scala 593:13]
  assign io_slaves_0_ar_bits_len = xbar_io_slaves_0_ar_bits_len; // @[nasti.scala 593:13]
  assign io_slaves_0_ar_bits_id = xbar_io_slaves_0_ar_bits_id; // @[nasti.scala 593:13]
  assign io_slaves_0_r_ready = xbar_io_slaves_0_r_ready; // @[nasti.scala 593:13]
  assign io_slaves_1_aw_valid = xbar_io_slaves_1_aw_valid; // @[nasti.scala 593:13]
  assign io_slaves_1_aw_bits_addr = xbar_io_slaves_1_aw_bits_addr; // @[nasti.scala 593:13]
  assign io_slaves_1_aw_bits_len = xbar_io_slaves_1_aw_bits_len; // @[nasti.scala 593:13]
  assign io_slaves_1_aw_bits_id = xbar_io_slaves_1_aw_bits_id; // @[nasti.scala 593:13]
  assign io_slaves_1_w_valid = xbar_io_slaves_1_w_valid; // @[nasti.scala 593:13]
  assign io_slaves_1_w_bits_data = xbar_io_slaves_1_w_bits_data; // @[nasti.scala 593:13]
  assign io_slaves_1_b_ready = xbar_io_slaves_1_b_ready; // @[nasti.scala 593:13]
  assign io_slaves_1_ar_valid = xbar_io_slaves_1_ar_valid; // @[nasti.scala 593:13]
  assign io_slaves_1_ar_bits_addr = xbar_io_slaves_1_ar_bits_addr; // @[nasti.scala 593:13]
  assign io_slaves_1_ar_bits_len = xbar_io_slaves_1_ar_bits_len; // @[nasti.scala 593:13]
  assign io_slaves_1_ar_bits_id = xbar_io_slaves_1_ar_bits_id; // @[nasti.scala 593:13]
  assign io_slaves_1_r_ready = xbar_io_slaves_1_r_ready; // @[nasti.scala 593:13]
  assign io_slaves_2_aw_valid = xbar_io_slaves_2_aw_valid; // @[nasti.scala 593:13]
  assign io_slaves_2_aw_bits_addr = xbar_io_slaves_2_aw_bits_addr; // @[nasti.scala 593:13]
  assign io_slaves_2_aw_bits_len = xbar_io_slaves_2_aw_bits_len; // @[nasti.scala 593:13]
  assign io_slaves_2_aw_bits_id = xbar_io_slaves_2_aw_bits_id; // @[nasti.scala 593:13]
  assign io_slaves_2_w_valid = xbar_io_slaves_2_w_valid; // @[nasti.scala 593:13]
  assign io_slaves_2_w_bits_data = xbar_io_slaves_2_w_bits_data; // @[nasti.scala 593:13]
  assign io_slaves_2_b_ready = xbar_io_slaves_2_b_ready; // @[nasti.scala 593:13]
  assign io_slaves_2_ar_valid = xbar_io_slaves_2_ar_valid; // @[nasti.scala 593:13]
  assign io_slaves_2_ar_bits_addr = xbar_io_slaves_2_ar_bits_addr; // @[nasti.scala 593:13]
  assign io_slaves_2_ar_bits_len = xbar_io_slaves_2_ar_bits_len; // @[nasti.scala 593:13]
  assign io_slaves_2_ar_bits_id = xbar_io_slaves_2_ar_bits_id; // @[nasti.scala 593:13]
  assign io_slaves_2_r_ready = xbar_io_slaves_2_r_ready; // @[nasti.scala 593:13]
  assign io_slaves_3_aw_valid = xbar_io_slaves_3_aw_valid; // @[nasti.scala 593:13]
  assign io_slaves_3_aw_bits_addr = xbar_io_slaves_3_aw_bits_addr; // @[nasti.scala 593:13]
  assign io_slaves_3_aw_bits_len = xbar_io_slaves_3_aw_bits_len; // @[nasti.scala 593:13]
  assign io_slaves_3_aw_bits_id = xbar_io_slaves_3_aw_bits_id; // @[nasti.scala 593:13]
  assign io_slaves_3_w_valid = xbar_io_slaves_3_w_valid; // @[nasti.scala 593:13]
  assign io_slaves_3_w_bits_data = xbar_io_slaves_3_w_bits_data; // @[nasti.scala 593:13]
  assign io_slaves_3_b_ready = xbar_io_slaves_3_b_ready; // @[nasti.scala 593:13]
  assign io_slaves_3_ar_valid = xbar_io_slaves_3_ar_valid; // @[nasti.scala 593:13]
  assign io_slaves_3_ar_bits_addr = xbar_io_slaves_3_ar_bits_addr; // @[nasti.scala 593:13]
  assign io_slaves_3_ar_bits_len = xbar_io_slaves_3_ar_bits_len; // @[nasti.scala 593:13]
  assign io_slaves_3_ar_bits_id = xbar_io_slaves_3_ar_bits_id; // @[nasti.scala 593:13]
  assign io_slaves_3_r_ready = xbar_io_slaves_3_r_ready; // @[nasti.scala 593:13]
  assign io_slaves_4_aw_valid = xbar_io_slaves_4_aw_valid; // @[nasti.scala 593:13]
  assign io_slaves_4_aw_bits_len = xbar_io_slaves_4_aw_bits_len; // @[nasti.scala 593:13]
  assign io_slaves_4_aw_bits_id = xbar_io_slaves_4_aw_bits_id; // @[nasti.scala 593:13]
  assign io_slaves_4_w_valid = xbar_io_slaves_4_w_valid; // @[nasti.scala 593:13]
  assign io_slaves_4_w_bits_data = xbar_io_slaves_4_w_bits_data; // @[nasti.scala 593:13]
  assign io_slaves_4_b_ready = xbar_io_slaves_4_b_ready; // @[nasti.scala 593:13]
  assign io_slaves_4_ar_valid = xbar_io_slaves_4_ar_valid; // @[nasti.scala 593:13]
  assign io_slaves_4_ar_bits_len = xbar_io_slaves_4_ar_bits_len; // @[nasti.scala 593:13]
  assign io_slaves_4_ar_bits_id = xbar_io_slaves_4_ar_bits_id; // @[nasti.scala 593:13]
  assign io_slaves_4_r_ready = xbar_io_slaves_4_r_ready; // @[nasti.scala 593:13]
  assign xbar_clock = clock;
  assign xbar_reset = reset;
  assign xbar_io_masters_0_aw_valid = io_masters_0_aw_valid; // @[nasti.scala 591:19]
  assign xbar_io_masters_0_aw_bits_addr = io_masters_0_aw_bits_addr; // @[nasti.scala 591:19]
  assign xbar_io_masters_0_aw_bits_len = io_masters_0_aw_bits_len; // @[nasti.scala 591:19]
  assign xbar_io_masters_0_aw_bits_id = io_masters_0_aw_bits_id; // @[nasti.scala 591:19]
  assign xbar_io_masters_0_w_valid = io_masters_0_w_valid; // @[nasti.scala 591:19]
  assign xbar_io_masters_0_w_bits_data = io_masters_0_w_bits_data; // @[nasti.scala 591:19]
  assign xbar_io_masters_0_w_bits_last = io_masters_0_w_bits_last; // @[nasti.scala 591:19]
  assign xbar_io_masters_0_b_ready = io_masters_0_b_ready; // @[nasti.scala 591:19]
  assign xbar_io_masters_0_ar_valid = io_masters_0_ar_valid; // @[nasti.scala 591:19]
  assign xbar_io_masters_0_ar_bits_addr = io_masters_0_ar_bits_addr; // @[nasti.scala 591:19]
  assign xbar_io_masters_0_ar_bits_len = io_masters_0_ar_bits_len; // @[nasti.scala 591:19]
  assign xbar_io_masters_0_ar_bits_id = io_masters_0_ar_bits_id; // @[nasti.scala 591:19]
  assign xbar_io_masters_0_r_ready = io_masters_0_r_ready; // @[nasti.scala 591:19]
  assign xbar_io_slaves_0_aw_ready = io_slaves_0_aw_ready; // @[nasti.scala 593:13]
  assign xbar_io_slaves_0_w_ready = io_slaves_0_w_ready; // @[nasti.scala 593:13]
  assign xbar_io_slaves_0_b_valid = io_slaves_0_b_valid; // @[nasti.scala 593:13]
  assign xbar_io_slaves_0_b_bits_id = io_slaves_0_b_bits_id; // @[nasti.scala 593:13]
  assign xbar_io_slaves_0_ar_ready = io_slaves_0_ar_ready; // @[nasti.scala 593:13]
  assign xbar_io_slaves_0_r_valid = io_slaves_0_r_valid; // @[nasti.scala 593:13]
  assign xbar_io_slaves_0_r_bits_data = io_slaves_0_r_bits_data; // @[nasti.scala 593:13]
  assign xbar_io_slaves_0_r_bits_id = io_slaves_0_r_bits_id; // @[nasti.scala 593:13]
  assign xbar_io_slaves_1_aw_ready = io_slaves_1_aw_ready; // @[nasti.scala 593:13]
  assign xbar_io_slaves_1_w_ready = io_slaves_1_w_ready; // @[nasti.scala 593:13]
  assign xbar_io_slaves_1_b_valid = io_slaves_1_b_valid; // @[nasti.scala 593:13]
  assign xbar_io_slaves_1_b_bits_id = io_slaves_1_b_bits_id; // @[nasti.scala 593:13]
  assign xbar_io_slaves_1_ar_ready = io_slaves_1_ar_ready; // @[nasti.scala 593:13]
  assign xbar_io_slaves_1_r_valid = io_slaves_1_r_valid; // @[nasti.scala 593:13]
  assign xbar_io_slaves_1_r_bits_data = io_slaves_1_r_bits_data; // @[nasti.scala 593:13]
  assign xbar_io_slaves_1_r_bits_id = io_slaves_1_r_bits_id; // @[nasti.scala 593:13]
  assign xbar_io_slaves_2_aw_ready = io_slaves_2_aw_ready; // @[nasti.scala 593:13]
  assign xbar_io_slaves_2_w_ready = io_slaves_2_w_ready; // @[nasti.scala 593:13]
  assign xbar_io_slaves_2_b_valid = io_slaves_2_b_valid; // @[nasti.scala 593:13]
  assign xbar_io_slaves_2_b_bits_id = io_slaves_2_b_bits_id; // @[nasti.scala 593:13]
  assign xbar_io_slaves_2_ar_ready = io_slaves_2_ar_ready; // @[nasti.scala 593:13]
  assign xbar_io_slaves_2_r_valid = io_slaves_2_r_valid; // @[nasti.scala 593:13]
  assign xbar_io_slaves_2_r_bits_data = io_slaves_2_r_bits_data; // @[nasti.scala 593:13]
  assign xbar_io_slaves_2_r_bits_id = io_slaves_2_r_bits_id; // @[nasti.scala 593:13]
  assign xbar_io_slaves_3_aw_ready = io_slaves_3_aw_ready; // @[nasti.scala 593:13]
  assign xbar_io_slaves_3_w_ready = io_slaves_3_w_ready; // @[nasti.scala 593:13]
  assign xbar_io_slaves_3_b_valid = io_slaves_3_b_valid; // @[nasti.scala 593:13]
  assign xbar_io_slaves_3_b_bits_id = io_slaves_3_b_bits_id; // @[nasti.scala 593:13]
  assign xbar_io_slaves_3_ar_ready = io_slaves_3_ar_ready; // @[nasti.scala 593:13]
  assign xbar_io_slaves_3_r_valid = io_slaves_3_r_valid; // @[nasti.scala 593:13]
  assign xbar_io_slaves_3_r_bits_data = io_slaves_3_r_bits_data; // @[nasti.scala 593:13]
  assign xbar_io_slaves_3_r_bits_id = io_slaves_3_r_bits_id; // @[nasti.scala 593:13]
  assign xbar_io_slaves_4_aw_ready = io_slaves_4_aw_ready; // @[nasti.scala 593:13]
  assign xbar_io_slaves_4_w_ready = io_slaves_4_w_ready; // @[nasti.scala 593:13]
  assign xbar_io_slaves_4_b_valid = io_slaves_4_b_valid; // @[nasti.scala 593:13]
  assign xbar_io_slaves_4_b_bits_id = io_slaves_4_b_bits_id; // @[nasti.scala 593:13]
  assign xbar_io_slaves_4_ar_ready = io_slaves_4_ar_ready; // @[nasti.scala 593:13]
  assign xbar_io_slaves_4_r_valid = io_slaves_4_r_valid; // @[nasti.scala 593:13]
  assign xbar_io_slaves_4_r_bits_data = io_slaves_4_r_bits_data; // @[nasti.scala 593:13]
  assign xbar_io_slaves_4_r_bits_id = io_slaves_4_r_bits_id; // @[nasti.scala 593:13]
endmodule
module FPGATop(
  input          clock,
  input          reset,
  output         ctrl_aw_ready,
  input          ctrl_aw_valid,
  input  [11:0]  ctrl_aw_bits_addr,
  input  [7:0]   ctrl_aw_bits_len,
  input  [2:0]   ctrl_aw_bits_size,
  input  [1:0]   ctrl_aw_bits_burst,
  input          ctrl_aw_bits_lock,
  input  [3:0]   ctrl_aw_bits_cache,
  input  [2:0]   ctrl_aw_bits_prot,
  input  [3:0]   ctrl_aw_bits_qos,
  input  [3:0]   ctrl_aw_bits_region,
  input          ctrl_aw_bits_id,
  input          ctrl_aw_bits_user,
  output         ctrl_w_ready,
  input          ctrl_w_valid,
  input  [31:0]  ctrl_w_bits_data,
  input          ctrl_w_bits_last,
  input          ctrl_w_bits_id,
  input  [3:0]   ctrl_w_bits_strb,
  input          ctrl_w_bits_user,
  input          ctrl_b_ready,
  output         ctrl_b_valid,
  output [1:0]   ctrl_b_bits_resp,
  output         ctrl_b_bits_id,
  output         ctrl_b_bits_user,
  output         ctrl_ar_ready,
  input          ctrl_ar_valid,
  input  [11:0]  ctrl_ar_bits_addr,
  input  [7:0]   ctrl_ar_bits_len,
  input  [2:0]   ctrl_ar_bits_size,
  input  [1:0]   ctrl_ar_bits_burst,
  input          ctrl_ar_bits_lock,
  input  [3:0]   ctrl_ar_bits_cache,
  input  [2:0]   ctrl_ar_bits_prot,
  input  [3:0]   ctrl_ar_bits_qos,
  input  [3:0]   ctrl_ar_bits_region,
  input          ctrl_ar_bits_id,
  input          ctrl_ar_bits_user,
  input          ctrl_r_ready,
  output         ctrl_r_valid,
  output [1:0]   ctrl_r_bits_resp,
  output [31:0]  ctrl_r_bits_data,
  output         ctrl_r_bits_last,
  output         ctrl_r_bits_id,
  output         ctrl_r_bits_user,
  input          fpga_managed_axi4_aw_ready,
  output         fpga_managed_axi4_aw_valid,
  output [3:0]   fpga_managed_axi4_aw_bits_id,
  output [21:0]  fpga_managed_axi4_aw_bits_addr,
  output [7:0]   fpga_managed_axi4_aw_bits_len,
  output [2:0]   fpga_managed_axi4_aw_bits_size,
  output [1:0]   fpga_managed_axi4_aw_bits_burst,
  output         fpga_managed_axi4_aw_bits_lock,
  output [3:0]   fpga_managed_axi4_aw_bits_cache,
  output [2:0]   fpga_managed_axi4_aw_bits_prot,
  output [3:0]   fpga_managed_axi4_aw_bits_qos,
  input          fpga_managed_axi4_w_ready,
  output         fpga_managed_axi4_w_valid,
  output [511:0] fpga_managed_axi4_w_bits_data,
  output [63:0]  fpga_managed_axi4_w_bits_strb,
  output         fpga_managed_axi4_w_bits_last,
  output         fpga_managed_axi4_b_ready,
  input          fpga_managed_axi4_b_valid,
  input  [3:0]   fpga_managed_axi4_b_bits_id,
  input  [1:0]   fpga_managed_axi4_b_bits_resp,
  input          fpga_managed_axi4_ar_ready,
  output         fpga_managed_axi4_ar_valid,
  output [3:0]   fpga_managed_axi4_ar_bits_id,
  output [21:0]  fpga_managed_axi4_ar_bits_addr,
  output [7:0]   fpga_managed_axi4_ar_bits_len,
  output [2:0]   fpga_managed_axi4_ar_bits_size,
  output [1:0]   fpga_managed_axi4_ar_bits_burst,
  output         fpga_managed_axi4_ar_bits_lock,
  output [3:0]   fpga_managed_axi4_ar_bits_cache,
  output [2:0]   fpga_managed_axi4_ar_bits_prot,
  output [3:0]   fpga_managed_axi4_ar_bits_qos,
  output         fpga_managed_axi4_r_ready,
  input          fpga_managed_axi4_r_valid,
  input  [3:0]   fpga_managed_axi4_r_bits_id,
  input  [511:0] fpga_managed_axi4_r_bits_data,
  input  [1:0]   fpga_managed_axi4_r_bits_resp,
  input          fpga_managed_axi4_r_bits_last
);
  wire  SimulationMaster_0_clock; // @[Widget.scala 303:23]
  wire  SimulationMaster_0_reset; // @[Widget.scala 303:23]
  wire  SimulationMaster_0_io_ctrl_aw_ready; // @[Widget.scala 303:23]
  wire  SimulationMaster_0_io_ctrl_aw_valid; // @[Widget.scala 303:23]
  wire [7:0] SimulationMaster_0_io_ctrl_aw_bits_len; // @[Widget.scala 303:23]
  wire  SimulationMaster_0_io_ctrl_aw_bits_id; // @[Widget.scala 303:23]
  wire  SimulationMaster_0_io_ctrl_w_ready; // @[Widget.scala 303:23]
  wire  SimulationMaster_0_io_ctrl_w_valid; // @[Widget.scala 303:23]
  wire [31:0] SimulationMaster_0_io_ctrl_w_bits_data; // @[Widget.scala 303:23]
  wire  SimulationMaster_0_io_ctrl_b_ready; // @[Widget.scala 303:23]
  wire  SimulationMaster_0_io_ctrl_b_valid; // @[Widget.scala 303:23]
  wire  SimulationMaster_0_io_ctrl_b_bits_id; // @[Widget.scala 303:23]
  wire  SimulationMaster_0_io_ctrl_ar_ready; // @[Widget.scala 303:23]
  wire  SimulationMaster_0_io_ctrl_ar_valid; // @[Widget.scala 303:23]
  wire [7:0] SimulationMaster_0_io_ctrl_ar_bits_len; // @[Widget.scala 303:23]
  wire  SimulationMaster_0_io_ctrl_ar_bits_id; // @[Widget.scala 303:23]
  wire  SimulationMaster_0_io_ctrl_r_ready; // @[Widget.scala 303:23]
  wire  SimulationMaster_0_io_ctrl_r_valid; // @[Widget.scala 303:23]
  wire [31:0] SimulationMaster_0_io_ctrl_r_bits_data; // @[Widget.scala 303:23]
  wire  SimulationMaster_0_io_ctrl_r_bits_id; // @[Widget.scala 303:23]
  wire  ClockBridgeModule_0_clock; // @[Widget.scala 303:23]
  wire  ClockBridgeModule_0_reset; // @[Widget.scala 303:23]
  wire  ClockBridgeModule_0_io_ctrl_aw_ready; // @[Widget.scala 303:23]
  wire  ClockBridgeModule_0_io_ctrl_aw_valid; // @[Widget.scala 303:23]
  wire [11:0] ClockBridgeModule_0_io_ctrl_aw_bits_addr; // @[Widget.scala 303:23]
  wire [7:0] ClockBridgeModule_0_io_ctrl_aw_bits_len; // @[Widget.scala 303:23]
  wire  ClockBridgeModule_0_io_ctrl_aw_bits_id; // @[Widget.scala 303:23]
  wire  ClockBridgeModule_0_io_ctrl_w_ready; // @[Widget.scala 303:23]
  wire  ClockBridgeModule_0_io_ctrl_w_valid; // @[Widget.scala 303:23]
  wire [31:0] ClockBridgeModule_0_io_ctrl_w_bits_data; // @[Widget.scala 303:23]
  wire  ClockBridgeModule_0_io_ctrl_b_ready; // @[Widget.scala 303:23]
  wire  ClockBridgeModule_0_io_ctrl_b_valid; // @[Widget.scala 303:23]
  wire  ClockBridgeModule_0_io_ctrl_b_bits_id; // @[Widget.scala 303:23]
  wire  ClockBridgeModule_0_io_ctrl_ar_ready; // @[Widget.scala 303:23]
  wire  ClockBridgeModule_0_io_ctrl_ar_valid; // @[Widget.scala 303:23]
  wire [11:0] ClockBridgeModule_0_io_ctrl_ar_bits_addr; // @[Widget.scala 303:23]
  wire [7:0] ClockBridgeModule_0_io_ctrl_ar_bits_len; // @[Widget.scala 303:23]
  wire  ClockBridgeModule_0_io_ctrl_ar_bits_id; // @[Widget.scala 303:23]
  wire  ClockBridgeModule_0_io_ctrl_r_ready; // @[Widget.scala 303:23]
  wire  ClockBridgeModule_0_io_ctrl_r_valid; // @[Widget.scala 303:23]
  wire [31:0] ClockBridgeModule_0_io_ctrl_r_bits_data; // @[Widget.scala 303:23]
  wire  ClockBridgeModule_0_io_ctrl_r_bits_id; // @[Widget.scala 303:23]
  wire  ClockBridgeModule_0_hPort_clocks_ready; // @[Widget.scala 303:23]
  wire  ClockBridgeModule_0_hPort_clocks_valid; // @[Widget.scala 303:23]
  wire  ClockBridgeModule_0_hPort_clocks_bits_0; // @[Widget.scala 303:23]
  wire  PeekPokeBridgeModule_0_clock; // @[Widget.scala 303:23]
  wire  PeekPokeBridgeModule_0_reset; // @[Widget.scala 303:23]
  wire  PeekPokeBridgeModule_0_io_ctrl_aw_ready; // @[Widget.scala 303:23]
  wire  PeekPokeBridgeModule_0_io_ctrl_aw_valid; // @[Widget.scala 303:23]
  wire [11:0] PeekPokeBridgeModule_0_io_ctrl_aw_bits_addr; // @[Widget.scala 303:23]
  wire [7:0] PeekPokeBridgeModule_0_io_ctrl_aw_bits_len; // @[Widget.scala 303:23]
  wire  PeekPokeBridgeModule_0_io_ctrl_aw_bits_id; // @[Widget.scala 303:23]
  wire  PeekPokeBridgeModule_0_io_ctrl_w_ready; // @[Widget.scala 303:23]
  wire  PeekPokeBridgeModule_0_io_ctrl_w_valid; // @[Widget.scala 303:23]
  wire [31:0] PeekPokeBridgeModule_0_io_ctrl_w_bits_data; // @[Widget.scala 303:23]
  wire  PeekPokeBridgeModule_0_io_ctrl_b_ready; // @[Widget.scala 303:23]
  wire  PeekPokeBridgeModule_0_io_ctrl_b_valid; // @[Widget.scala 303:23]
  wire  PeekPokeBridgeModule_0_io_ctrl_b_bits_id; // @[Widget.scala 303:23]
  wire  PeekPokeBridgeModule_0_io_ctrl_ar_ready; // @[Widget.scala 303:23]
  wire  PeekPokeBridgeModule_0_io_ctrl_ar_valid; // @[Widget.scala 303:23]
  wire [11:0] PeekPokeBridgeModule_0_io_ctrl_ar_bits_addr; // @[Widget.scala 303:23]
  wire [7:0] PeekPokeBridgeModule_0_io_ctrl_ar_bits_len; // @[Widget.scala 303:23]
  wire  PeekPokeBridgeModule_0_io_ctrl_ar_bits_id; // @[Widget.scala 303:23]
  wire  PeekPokeBridgeModule_0_io_ctrl_r_ready; // @[Widget.scala 303:23]
  wire  PeekPokeBridgeModule_0_io_ctrl_r_valid; // @[Widget.scala 303:23]
  wire [31:0] PeekPokeBridgeModule_0_io_ctrl_r_bits_data; // @[Widget.scala 303:23]
  wire  PeekPokeBridgeModule_0_io_ctrl_r_bits_id; // @[Widget.scala 303:23]
  wire  PeekPokeBridgeModule_0_hPort_io_a_ready; // @[Widget.scala 303:23]
  wire  PeekPokeBridgeModule_0_hPort_io_a_valid; // @[Widget.scala 303:23]
  wire  PeekPokeBridgeModule_0_hPort_io_a_bits; // @[Widget.scala 303:23]
  wire  PeekPokeBridgeModule_0_hPort_io_b_ready; // @[Widget.scala 303:23]
  wire  PeekPokeBridgeModule_0_hPort_io_b_valid; // @[Widget.scala 303:23]
  wire  PeekPokeBridgeModule_0_hPort_io_b_bits; // @[Widget.scala 303:23]
  wire  PeekPokeBridgeModule_0_hPort_reset_ready; // @[Widget.scala 303:23]
  wire  PeekPokeBridgeModule_0_hPort_reset_valid; // @[Widget.scala 303:23]
  wire  PeekPokeBridgeModule_0_hPort_reset_bits; // @[Widget.scala 303:23]
  wire  PrintBridgeModule_0_clock; // @[Widget.scala 303:23]
  wire  PrintBridgeModule_0_reset; // @[Widget.scala 303:23]
  wire  PrintBridgeModule_0_streamToHostCPU_ready; // @[Widget.scala 303:23]
  wire  PrintBridgeModule_0_streamToHostCPU_valid; // @[Widget.scala 303:23]
  wire [511:0] PrintBridgeModule_0_streamToHostCPU_bits; // @[Widget.scala 303:23]
  wire  PrintBridgeModule_0_io_ctrl_aw_ready; // @[Widget.scala 303:23]
  wire  PrintBridgeModule_0_io_ctrl_aw_valid; // @[Widget.scala 303:23]
  wire [11:0] PrintBridgeModule_0_io_ctrl_aw_bits_addr; // @[Widget.scala 303:23]
  wire [7:0] PrintBridgeModule_0_io_ctrl_aw_bits_len; // @[Widget.scala 303:23]
  wire  PrintBridgeModule_0_io_ctrl_aw_bits_id; // @[Widget.scala 303:23]
  wire  PrintBridgeModule_0_io_ctrl_w_ready; // @[Widget.scala 303:23]
  wire  PrintBridgeModule_0_io_ctrl_w_valid; // @[Widget.scala 303:23]
  wire [31:0] PrintBridgeModule_0_io_ctrl_w_bits_data; // @[Widget.scala 303:23]
  wire  PrintBridgeModule_0_io_ctrl_b_ready; // @[Widget.scala 303:23]
  wire  PrintBridgeModule_0_io_ctrl_b_valid; // @[Widget.scala 303:23]
  wire  PrintBridgeModule_0_io_ctrl_b_bits_id; // @[Widget.scala 303:23]
  wire  PrintBridgeModule_0_io_ctrl_ar_ready; // @[Widget.scala 303:23]
  wire  PrintBridgeModule_0_io_ctrl_ar_valid; // @[Widget.scala 303:23]
  wire [11:0] PrintBridgeModule_0_io_ctrl_ar_bits_addr; // @[Widget.scala 303:23]
  wire [7:0] PrintBridgeModule_0_io_ctrl_ar_bits_len; // @[Widget.scala 303:23]
  wire  PrintBridgeModule_0_io_ctrl_ar_bits_id; // @[Widget.scala 303:23]
  wire  PrintBridgeModule_0_io_ctrl_r_ready; // @[Widget.scala 303:23]
  wire  PrintBridgeModule_0_io_ctrl_r_valid; // @[Widget.scala 303:23]
  wire [31:0] PrintBridgeModule_0_io_ctrl_r_bits_data; // @[Widget.scala 303:23]
  wire  PrintBridgeModule_0_io_ctrl_r_bits_id; // @[Widget.scala 303:23]
  wire [527:0] PrintBridgeModule_0_hPort_hBits_synthesizedPrintf_dut_printf_1_wire_args_1; // @[Widget.scala 303:23]
  wire [15:0] PrintBridgeModule_0_hPort_hBits_synthesizedPrintf_dut_printf_1_wire_args_0; // @[Widget.scala 303:23]
  wire  PrintBridgeModule_0_hPort_hBits_synthesizedPrintf_dut_printf_1_wire_enable; // @[Widget.scala 303:23]
  wire [7:0] PrintBridgeModule_0_hPort_hBits_synthesizedPrintf_dut_printf_2_wire_args_1; // @[Widget.scala 303:23]
  wire [15:0] PrintBridgeModule_0_hPort_hBits_synthesizedPrintf_dut_printf_2_wire_args_0; // @[Widget.scala 303:23]
  wire  PrintBridgeModule_0_hPort_hBits_synthesizedPrintf_dut_printf_2_wire_enable; // @[Widget.scala 303:23]
  wire [15:0] PrintBridgeModule_0_hPort_hBits_synthesizedPrintf_dut_childInst_printf_wire_args_1; // @[Widget.scala 303:23]
  wire [15:0] PrintBridgeModule_0_hPort_hBits_synthesizedPrintf_dut_childInst_printf_wire_args_0; // @[Widget.scala 303:23]
  wire  PrintBridgeModule_0_hPort_hBits_synthesizedPrintf_dut_childInst_printf_wire_enable; // @[Widget.scala 303:23]
  wire [15:0] PrintBridgeModule_0_hPort_hBits_synthesizedPrintf_dut_printf_wire_args_0; // @[Widget.scala 303:23]
  wire  PrintBridgeModule_0_hPort_hBits_synthesizedPrintf_dut_printf_wire_enable; // @[Widget.scala 303:23]
  wire  PrintBridgeModule_0_hPort_hBits_synthesizedPrintf_RationalClockBridge_clocks_0_globalReset; // @[Widget.scala 303:23]
  wire  PrintBridgeModule_0_hPort_toHost_hReady; // @[Widget.scala 303:23]
  wire  PrintBridgeModule_0_hPort_toHost_hValid; // @[Widget.scala 303:23]
  wire  FPGAManagedStreamEngine_0_clock; // @[Widget.scala 303:23]
  wire  FPGAManagedStreamEngine_0_reset; // @[Widget.scala 303:23]
  wire  FPGAManagedStreamEngine_0_auto_axi4xbar_out_aw_ready; // @[Widget.scala 303:23]
  wire  FPGAManagedStreamEngine_0_auto_axi4xbar_out_aw_valid; // @[Widget.scala 303:23]
  wire  FPGAManagedStreamEngine_0_auto_axi4xbar_out_aw_bits_id; // @[Widget.scala 303:23]
  wire [21:0] FPGAManagedStreamEngine_0_auto_axi4xbar_out_aw_bits_addr; // @[Widget.scala 303:23]
  wire [7:0] FPGAManagedStreamEngine_0_auto_axi4xbar_out_aw_bits_len; // @[Widget.scala 303:23]
  wire [2:0] FPGAManagedStreamEngine_0_auto_axi4xbar_out_aw_bits_size; // @[Widget.scala 303:23]
  wire [1:0] FPGAManagedStreamEngine_0_auto_axi4xbar_out_aw_bits_burst; // @[Widget.scala 303:23]
  wire  FPGAManagedStreamEngine_0_auto_axi4xbar_out_aw_bits_lock; // @[Widget.scala 303:23]
  wire [3:0] FPGAManagedStreamEngine_0_auto_axi4xbar_out_aw_bits_cache; // @[Widget.scala 303:23]
  wire [2:0] FPGAManagedStreamEngine_0_auto_axi4xbar_out_aw_bits_prot; // @[Widget.scala 303:23]
  wire [3:0] FPGAManagedStreamEngine_0_auto_axi4xbar_out_aw_bits_qos; // @[Widget.scala 303:23]
  wire  FPGAManagedStreamEngine_0_auto_axi4xbar_out_w_ready; // @[Widget.scala 303:23]
  wire  FPGAManagedStreamEngine_0_auto_axi4xbar_out_w_valid; // @[Widget.scala 303:23]
  wire [511:0] FPGAManagedStreamEngine_0_auto_axi4xbar_out_w_bits_data; // @[Widget.scala 303:23]
  wire [63:0] FPGAManagedStreamEngine_0_auto_axi4xbar_out_w_bits_strb; // @[Widget.scala 303:23]
  wire  FPGAManagedStreamEngine_0_auto_axi4xbar_out_w_bits_last; // @[Widget.scala 303:23]
  wire  FPGAManagedStreamEngine_0_auto_axi4xbar_out_b_ready; // @[Widget.scala 303:23]
  wire  FPGAManagedStreamEngine_0_auto_axi4xbar_out_b_valid; // @[Widget.scala 303:23]
  wire  FPGAManagedStreamEngine_0_auto_axi4xbar_out_b_bits_id; // @[Widget.scala 303:23]
  wire  FPGAManagedStreamEngine_0_auto_axi4xbar_out_ar_ready; // @[Widget.scala 303:23]
  wire  FPGAManagedStreamEngine_0_auto_axi4xbar_out_ar_valid; // @[Widget.scala 303:23]
  wire  FPGAManagedStreamEngine_0_auto_axi4xbar_out_ar_bits_id; // @[Widget.scala 303:23]
  wire [21:0] FPGAManagedStreamEngine_0_auto_axi4xbar_out_ar_bits_addr; // @[Widget.scala 303:23]
  wire [7:0] FPGAManagedStreamEngine_0_auto_axi4xbar_out_ar_bits_len; // @[Widget.scala 303:23]
  wire [2:0] FPGAManagedStreamEngine_0_auto_axi4xbar_out_ar_bits_size; // @[Widget.scala 303:23]
  wire [1:0] FPGAManagedStreamEngine_0_auto_axi4xbar_out_ar_bits_burst; // @[Widget.scala 303:23]
  wire  FPGAManagedStreamEngine_0_auto_axi4xbar_out_ar_bits_lock; // @[Widget.scala 303:23]
  wire [3:0] FPGAManagedStreamEngine_0_auto_axi4xbar_out_ar_bits_cache; // @[Widget.scala 303:23]
  wire [2:0] FPGAManagedStreamEngine_0_auto_axi4xbar_out_ar_bits_prot; // @[Widget.scala 303:23]
  wire [3:0] FPGAManagedStreamEngine_0_auto_axi4xbar_out_ar_bits_qos; // @[Widget.scala 303:23]
  wire  FPGAManagedStreamEngine_0_auto_axi4xbar_out_r_ready; // @[Widget.scala 303:23]
  wire  FPGAManagedStreamEngine_0_auto_axi4xbar_out_r_valid; // @[Widget.scala 303:23]
  wire  FPGAManagedStreamEngine_0_auto_axi4xbar_out_r_bits_id; // @[Widget.scala 303:23]
  wire  FPGAManagedStreamEngine_0_streamsToHostCPU_0_ready; // @[Widget.scala 303:23]
  wire  FPGAManagedStreamEngine_0_streamsToHostCPU_0_valid; // @[Widget.scala 303:23]
  wire [511:0] FPGAManagedStreamEngine_0_streamsToHostCPU_0_bits; // @[Widget.scala 303:23]
  wire  FPGAManagedStreamEngine_0_io_ctrl_aw_ready; // @[Widget.scala 303:23]
  wire  FPGAManagedStreamEngine_0_io_ctrl_aw_valid; // @[Widget.scala 303:23]
  wire [11:0] FPGAManagedStreamEngine_0_io_ctrl_aw_bits_addr; // @[Widget.scala 303:23]
  wire [7:0] FPGAManagedStreamEngine_0_io_ctrl_aw_bits_len; // @[Widget.scala 303:23]
  wire  FPGAManagedStreamEngine_0_io_ctrl_aw_bits_id; // @[Widget.scala 303:23]
  wire  FPGAManagedStreamEngine_0_io_ctrl_w_ready; // @[Widget.scala 303:23]
  wire  FPGAManagedStreamEngine_0_io_ctrl_w_valid; // @[Widget.scala 303:23]
  wire [31:0] FPGAManagedStreamEngine_0_io_ctrl_w_bits_data; // @[Widget.scala 303:23]
  wire  FPGAManagedStreamEngine_0_io_ctrl_b_ready; // @[Widget.scala 303:23]
  wire  FPGAManagedStreamEngine_0_io_ctrl_b_valid; // @[Widget.scala 303:23]
  wire  FPGAManagedStreamEngine_0_io_ctrl_b_bits_id; // @[Widget.scala 303:23]
  wire  FPGAManagedStreamEngine_0_io_ctrl_ar_ready; // @[Widget.scala 303:23]
  wire  FPGAManagedStreamEngine_0_io_ctrl_ar_valid; // @[Widget.scala 303:23]
  wire [11:0] FPGAManagedStreamEngine_0_io_ctrl_ar_bits_addr; // @[Widget.scala 303:23]
  wire [7:0] FPGAManagedStreamEngine_0_io_ctrl_ar_bits_len; // @[Widget.scala 303:23]
  wire  FPGAManagedStreamEngine_0_io_ctrl_ar_bits_id; // @[Widget.scala 303:23]
  wire  FPGAManagedStreamEngine_0_io_ctrl_r_ready; // @[Widget.scala 303:23]
  wire  FPGAManagedStreamEngine_0_io_ctrl_r_valid; // @[Widget.scala 303:23]
  wire [31:0] FPGAManagedStreamEngine_0_io_ctrl_r_bits_data; // @[Widget.scala 303:23]
  wire  FPGAManagedStreamEngine_0_io_ctrl_r_bits_id; // @[Widget.scala 303:23]
  wire  axi4index_auto_in_aw_ready; // @[IdIndexer.scala 94:31]
  wire  axi4index_auto_in_aw_valid; // @[IdIndexer.scala 94:31]
  wire  axi4index_auto_in_aw_bits_id; // @[IdIndexer.scala 94:31]
  wire [21:0] axi4index_auto_in_aw_bits_addr; // @[IdIndexer.scala 94:31]
  wire [7:0] axi4index_auto_in_aw_bits_len; // @[IdIndexer.scala 94:31]
  wire [2:0] axi4index_auto_in_aw_bits_size; // @[IdIndexer.scala 94:31]
  wire [1:0] axi4index_auto_in_aw_bits_burst; // @[IdIndexer.scala 94:31]
  wire  axi4index_auto_in_aw_bits_lock; // @[IdIndexer.scala 94:31]
  wire [3:0] axi4index_auto_in_aw_bits_cache; // @[IdIndexer.scala 94:31]
  wire [2:0] axi4index_auto_in_aw_bits_prot; // @[IdIndexer.scala 94:31]
  wire [3:0] axi4index_auto_in_aw_bits_qos; // @[IdIndexer.scala 94:31]
  wire  axi4index_auto_in_w_ready; // @[IdIndexer.scala 94:31]
  wire  axi4index_auto_in_w_valid; // @[IdIndexer.scala 94:31]
  wire [511:0] axi4index_auto_in_w_bits_data; // @[IdIndexer.scala 94:31]
  wire [63:0] axi4index_auto_in_w_bits_strb; // @[IdIndexer.scala 94:31]
  wire  axi4index_auto_in_w_bits_last; // @[IdIndexer.scala 94:31]
  wire  axi4index_auto_in_b_ready; // @[IdIndexer.scala 94:31]
  wire  axi4index_auto_in_b_valid; // @[IdIndexer.scala 94:31]
  wire  axi4index_auto_in_b_bits_id; // @[IdIndexer.scala 94:31]
  wire  axi4index_auto_in_ar_ready; // @[IdIndexer.scala 94:31]
  wire  axi4index_auto_in_ar_valid; // @[IdIndexer.scala 94:31]
  wire  axi4index_auto_in_ar_bits_id; // @[IdIndexer.scala 94:31]
  wire [21:0] axi4index_auto_in_ar_bits_addr; // @[IdIndexer.scala 94:31]
  wire [7:0] axi4index_auto_in_ar_bits_len; // @[IdIndexer.scala 94:31]
  wire [2:0] axi4index_auto_in_ar_bits_size; // @[IdIndexer.scala 94:31]
  wire [1:0] axi4index_auto_in_ar_bits_burst; // @[IdIndexer.scala 94:31]
  wire  axi4index_auto_in_ar_bits_lock; // @[IdIndexer.scala 94:31]
  wire [3:0] axi4index_auto_in_ar_bits_cache; // @[IdIndexer.scala 94:31]
  wire [2:0] axi4index_auto_in_ar_bits_prot; // @[IdIndexer.scala 94:31]
  wire [3:0] axi4index_auto_in_ar_bits_qos; // @[IdIndexer.scala 94:31]
  wire  axi4index_auto_in_r_ready; // @[IdIndexer.scala 94:31]
  wire  axi4index_auto_in_r_valid; // @[IdIndexer.scala 94:31]
  wire  axi4index_auto_in_r_bits_id; // @[IdIndexer.scala 94:31]
  wire  axi4index_auto_out_aw_ready; // @[IdIndexer.scala 94:31]
  wire  axi4index_auto_out_aw_valid; // @[IdIndexer.scala 94:31]
  wire [3:0] axi4index_auto_out_aw_bits_id; // @[IdIndexer.scala 94:31]
  wire [21:0] axi4index_auto_out_aw_bits_addr; // @[IdIndexer.scala 94:31]
  wire [7:0] axi4index_auto_out_aw_bits_len; // @[IdIndexer.scala 94:31]
  wire [2:0] axi4index_auto_out_aw_bits_size; // @[IdIndexer.scala 94:31]
  wire [1:0] axi4index_auto_out_aw_bits_burst; // @[IdIndexer.scala 94:31]
  wire  axi4index_auto_out_aw_bits_lock; // @[IdIndexer.scala 94:31]
  wire [3:0] axi4index_auto_out_aw_bits_cache; // @[IdIndexer.scala 94:31]
  wire [2:0] axi4index_auto_out_aw_bits_prot; // @[IdIndexer.scala 94:31]
  wire [3:0] axi4index_auto_out_aw_bits_qos; // @[IdIndexer.scala 94:31]
  wire  axi4index_auto_out_w_ready; // @[IdIndexer.scala 94:31]
  wire  axi4index_auto_out_w_valid; // @[IdIndexer.scala 94:31]
  wire [511:0] axi4index_auto_out_w_bits_data; // @[IdIndexer.scala 94:31]
  wire [63:0] axi4index_auto_out_w_bits_strb; // @[IdIndexer.scala 94:31]
  wire  axi4index_auto_out_w_bits_last; // @[IdIndexer.scala 94:31]
  wire  axi4index_auto_out_b_ready; // @[IdIndexer.scala 94:31]
  wire  axi4index_auto_out_b_valid; // @[IdIndexer.scala 94:31]
  wire [3:0] axi4index_auto_out_b_bits_id; // @[IdIndexer.scala 94:31]
  wire  axi4index_auto_out_ar_ready; // @[IdIndexer.scala 94:31]
  wire  axi4index_auto_out_ar_valid; // @[IdIndexer.scala 94:31]
  wire [3:0] axi4index_auto_out_ar_bits_id; // @[IdIndexer.scala 94:31]
  wire [21:0] axi4index_auto_out_ar_bits_addr; // @[IdIndexer.scala 94:31]
  wire [7:0] axi4index_auto_out_ar_bits_len; // @[IdIndexer.scala 94:31]
  wire [2:0] axi4index_auto_out_ar_bits_size; // @[IdIndexer.scala 94:31]
  wire [1:0] axi4index_auto_out_ar_bits_burst; // @[IdIndexer.scala 94:31]
  wire  axi4index_auto_out_ar_bits_lock; // @[IdIndexer.scala 94:31]
  wire [3:0] axi4index_auto_out_ar_bits_cache; // @[IdIndexer.scala 94:31]
  wire [2:0] axi4index_auto_out_ar_bits_prot; // @[IdIndexer.scala 94:31]
  wire [3:0] axi4index_auto_out_ar_bits_qos; // @[IdIndexer.scala 94:31]
  wire  axi4index_auto_out_r_ready; // @[IdIndexer.scala 94:31]
  wire  axi4index_auto_out_r_valid; // @[IdIndexer.scala 94:31]
  wire [3:0] axi4index_auto_out_r_bits_id; // @[IdIndexer.scala 94:31]
  wire  axi4buf_clock; // @[Buffer.scala 63:29]
  wire  axi4buf_reset; // @[Buffer.scala 63:29]
  wire  axi4buf_auto_in_aw_ready; // @[Buffer.scala 63:29]
  wire  axi4buf_auto_in_aw_valid; // @[Buffer.scala 63:29]
  wire  axi4buf_auto_in_aw_bits_id; // @[Buffer.scala 63:29]
  wire [21:0] axi4buf_auto_in_aw_bits_addr; // @[Buffer.scala 63:29]
  wire [7:0] axi4buf_auto_in_aw_bits_len; // @[Buffer.scala 63:29]
  wire [2:0] axi4buf_auto_in_aw_bits_size; // @[Buffer.scala 63:29]
  wire [1:0] axi4buf_auto_in_aw_bits_burst; // @[Buffer.scala 63:29]
  wire  axi4buf_auto_in_aw_bits_lock; // @[Buffer.scala 63:29]
  wire [3:0] axi4buf_auto_in_aw_bits_cache; // @[Buffer.scala 63:29]
  wire [2:0] axi4buf_auto_in_aw_bits_prot; // @[Buffer.scala 63:29]
  wire [3:0] axi4buf_auto_in_aw_bits_qos; // @[Buffer.scala 63:29]
  wire  axi4buf_auto_in_w_ready; // @[Buffer.scala 63:29]
  wire  axi4buf_auto_in_w_valid; // @[Buffer.scala 63:29]
  wire [511:0] axi4buf_auto_in_w_bits_data; // @[Buffer.scala 63:29]
  wire [63:0] axi4buf_auto_in_w_bits_strb; // @[Buffer.scala 63:29]
  wire  axi4buf_auto_in_w_bits_last; // @[Buffer.scala 63:29]
  wire  axi4buf_auto_in_b_ready; // @[Buffer.scala 63:29]
  wire  axi4buf_auto_in_b_valid; // @[Buffer.scala 63:29]
  wire  axi4buf_auto_in_b_bits_id; // @[Buffer.scala 63:29]
  wire  axi4buf_auto_in_ar_ready; // @[Buffer.scala 63:29]
  wire  axi4buf_auto_in_ar_valid; // @[Buffer.scala 63:29]
  wire  axi4buf_auto_in_ar_bits_id; // @[Buffer.scala 63:29]
  wire [21:0] axi4buf_auto_in_ar_bits_addr; // @[Buffer.scala 63:29]
  wire [7:0] axi4buf_auto_in_ar_bits_len; // @[Buffer.scala 63:29]
  wire [2:0] axi4buf_auto_in_ar_bits_size; // @[Buffer.scala 63:29]
  wire [1:0] axi4buf_auto_in_ar_bits_burst; // @[Buffer.scala 63:29]
  wire  axi4buf_auto_in_ar_bits_lock; // @[Buffer.scala 63:29]
  wire [3:0] axi4buf_auto_in_ar_bits_cache; // @[Buffer.scala 63:29]
  wire [2:0] axi4buf_auto_in_ar_bits_prot; // @[Buffer.scala 63:29]
  wire [3:0] axi4buf_auto_in_ar_bits_qos; // @[Buffer.scala 63:29]
  wire  axi4buf_auto_in_r_ready; // @[Buffer.scala 63:29]
  wire  axi4buf_auto_in_r_valid; // @[Buffer.scala 63:29]
  wire  axi4buf_auto_in_r_bits_id; // @[Buffer.scala 63:29]
  wire  axi4buf_auto_out_aw_ready; // @[Buffer.scala 63:29]
  wire  axi4buf_auto_out_aw_valid; // @[Buffer.scala 63:29]
  wire  axi4buf_auto_out_aw_bits_id; // @[Buffer.scala 63:29]
  wire [21:0] axi4buf_auto_out_aw_bits_addr; // @[Buffer.scala 63:29]
  wire [7:0] axi4buf_auto_out_aw_bits_len; // @[Buffer.scala 63:29]
  wire [2:0] axi4buf_auto_out_aw_bits_size; // @[Buffer.scala 63:29]
  wire [1:0] axi4buf_auto_out_aw_bits_burst; // @[Buffer.scala 63:29]
  wire  axi4buf_auto_out_aw_bits_lock; // @[Buffer.scala 63:29]
  wire [3:0] axi4buf_auto_out_aw_bits_cache; // @[Buffer.scala 63:29]
  wire [2:0] axi4buf_auto_out_aw_bits_prot; // @[Buffer.scala 63:29]
  wire [3:0] axi4buf_auto_out_aw_bits_qos; // @[Buffer.scala 63:29]
  wire  axi4buf_auto_out_w_ready; // @[Buffer.scala 63:29]
  wire  axi4buf_auto_out_w_valid; // @[Buffer.scala 63:29]
  wire [511:0] axi4buf_auto_out_w_bits_data; // @[Buffer.scala 63:29]
  wire [63:0] axi4buf_auto_out_w_bits_strb; // @[Buffer.scala 63:29]
  wire  axi4buf_auto_out_w_bits_last; // @[Buffer.scala 63:29]
  wire  axi4buf_auto_out_b_ready; // @[Buffer.scala 63:29]
  wire  axi4buf_auto_out_b_valid; // @[Buffer.scala 63:29]
  wire  axi4buf_auto_out_b_bits_id; // @[Buffer.scala 63:29]
  wire  axi4buf_auto_out_ar_ready; // @[Buffer.scala 63:29]
  wire  axi4buf_auto_out_ar_valid; // @[Buffer.scala 63:29]
  wire  axi4buf_auto_out_ar_bits_id; // @[Buffer.scala 63:29]
  wire [21:0] axi4buf_auto_out_ar_bits_addr; // @[Buffer.scala 63:29]
  wire [7:0] axi4buf_auto_out_ar_bits_len; // @[Buffer.scala 63:29]
  wire [2:0] axi4buf_auto_out_ar_bits_size; // @[Buffer.scala 63:29]
  wire [1:0] axi4buf_auto_out_ar_bits_burst; // @[Buffer.scala 63:29]
  wire  axi4buf_auto_out_ar_bits_lock; // @[Buffer.scala 63:29]
  wire [3:0] axi4buf_auto_out_ar_bits_cache; // @[Buffer.scala 63:29]
  wire [2:0] axi4buf_auto_out_ar_bits_prot; // @[Buffer.scala 63:29]
  wire [3:0] axi4buf_auto_out_ar_bits_qos; // @[Buffer.scala 63:29]
  wire  axi4buf_auto_out_r_ready; // @[Buffer.scala 63:29]
  wire  axi4buf_auto_out_r_valid; // @[Buffer.scala 63:29]
  wire  axi4buf_auto_out_r_bits_id; // @[Buffer.scala 63:29]
  wire  sim_clock; // @[FPGATop.scala 400:21]
  wire  sim_reset; // @[FPGATop.scala 400:21]
  wire  sim_channelPorts_PrintfModule_synthesizedPrintf_dut_printf_1_wire_args_1_source_ready; // @[FPGATop.scala 400:21]
  wire  sim_channelPorts_PrintfModule_synthesizedPrintf_dut_printf_1_wire_args_1_source_valid; // @[FPGATop.scala 400:21]
  wire [527:0] sim_channelPorts_PrintfModule_synthesizedPrintf_dut_printf_1_wire_args_1_source_bits; // @[FPGATop.scala 400:21]
  wire  sim_channelPorts_PrintfModule_synthesizedPrintf_dut_printf_1_wire_args_0_source_ready; // @[FPGATop.scala 400:21]
  wire  sim_channelPorts_PrintfModule_synthesizedPrintf_dut_printf_1_wire_args_0_source_valid; // @[FPGATop.scala 400:21]
  wire [15:0] sim_channelPorts_PrintfModule_synthesizedPrintf_dut_printf_1_wire_args_0_source_bits; // @[FPGATop.scala 400:21]
  wire  sim_channelPorts_PrintfModule_synthesizedPrintf_dut_printf_1_wire_enable_source_ready; // @[FPGATop.scala 400:21]
  wire  sim_channelPorts_PrintfModule_synthesizedPrintf_dut_printf_1_wire_enable_source_valid; // @[FPGATop.scala 400:21]
  wire  sim_channelPorts_PrintfModule_synthesizedPrintf_dut_printf_1_wire_enable_source_bits; // @[FPGATop.scala 400:21]
  wire  sim_channelPorts_PrintfModule_synthesizedPrintf_dut_printf_2_wire_args_1_source_ready; // @[FPGATop.scala 400:21]
  wire  sim_channelPorts_PrintfModule_synthesizedPrintf_dut_printf_2_wire_args_1_source_valid; // @[FPGATop.scala 400:21]
  wire [7:0] sim_channelPorts_PrintfModule_synthesizedPrintf_dut_printf_2_wire_args_1_source_bits; // @[FPGATop.scala 400:21]
  wire  sim_channelPorts_PrintfModule_synthesizedPrintf_dut_printf_2_wire_args_0_source_ready; // @[FPGATop.scala 400:21]
  wire  sim_channelPorts_PrintfModule_synthesizedPrintf_dut_printf_2_wire_args_0_source_valid; // @[FPGATop.scala 400:21]
  wire [15:0] sim_channelPorts_PrintfModule_synthesizedPrintf_dut_printf_2_wire_args_0_source_bits; // @[FPGATop.scala 400:21]
  wire  sim_channelPorts_PrintfModule_synthesizedPrintf_dut_printf_2_wire_enable_source_ready; // @[FPGATop.scala 400:21]
  wire  sim_channelPorts_PrintfModule_synthesizedPrintf_dut_printf_2_wire_enable_source_valid; // @[FPGATop.scala 400:21]
  wire  sim_channelPorts_PrintfModule_synthesizedPrintf_dut_printf_2_wire_enable_source_bits; // @[FPGATop.scala 400:21]
  wire  sim_channelPorts_PrintfModule_synthesizedPrintf_dut_childInst_printf_wire_args_1_source_ready; // @[FPGATop.scala 400:21]
  wire  sim_channelPorts_PrintfModule_synthesizedPrintf_dut_childInst_printf_wire_args_1_source_valid; // @[FPGATop.scala 400:21]
  wire [15:0] sim_channelPorts_PrintfModule_synthesizedPrintf_dut_childInst_printf_wire_args_1_source_bits; // @[FPGATop.scala 400:21]
  wire  sim_channelPorts_PrintfModule_synthesizedPrintf_dut_childInst_printf_wire_args_0_source_ready; // @[FPGATop.scala 400:21]
  wire  sim_channelPorts_PrintfModule_synthesizedPrintf_dut_childInst_printf_wire_args_0_source_valid; // @[FPGATop.scala 400:21]
  wire [15:0] sim_channelPorts_PrintfModule_synthesizedPrintf_dut_childInst_printf_wire_args_0_source_bits; // @[FPGATop.scala 400:21]
  wire  sim_channelPorts_PrintfModule_synthesizedPrintf_dut_childInst_printf_wire_enable_source_ready; // @[FPGATop.scala 400:21]
  wire  sim_channelPorts_PrintfModule_synthesizedPrintf_dut_childInst_printf_wire_enable_source_valid; // @[FPGATop.scala 400:21]
  wire  sim_channelPorts_PrintfModule_synthesizedPrintf_dut_childInst_printf_wire_enable_source_bits; // @[FPGATop.scala 400:21]
  wire  sim_channelPorts_PrintfModule_synthesizedPrintf_dut_printf_wire_args_0_source_ready; // @[FPGATop.scala 400:21]
  wire  sim_channelPorts_PrintfModule_synthesizedPrintf_dut_printf_wire_args_0_source_valid; // @[FPGATop.scala 400:21]
  wire [15:0] sim_channelPorts_PrintfModule_synthesizedPrintf_dut_printf_wire_args_0_source_bits; // @[FPGATop.scala 400:21]
  wire  sim_channelPorts_PrintfModule_synthesizedPrintf_dut_printf_wire_enable_source_ready; // @[FPGATop.scala 400:21]
  wire  sim_channelPorts_PrintfModule_synthesizedPrintf_dut_printf_wire_enable_source_valid; // @[FPGATop.scala 400:21]
  wire  sim_channelPorts_PrintfModule_synthesizedPrintf_dut_printf_wire_enable_source_bits; // @[FPGATop.scala 400:21]
  wire  sim_channelPorts_PrintfModule_synthesizedPrintf_RationalClockBridge_clocks_0_globalReset_source_ready; // @[FPGATop.scala 400:21]
  wire  sim_channelPorts_PrintfModule_synthesizedPrintf_RationalClockBridge_clocks_0_globalReset_source_valid; // @[FPGATop.scala 400:21]
  wire  sim_channelPorts_PrintfModule_synthesizedPrintf_RationalClockBridge_clocks_0_globalReset_source_bits; // @[FPGATop.scala 400:21]
  wire  sim_channelPorts_PrintfModule_peekPokeBridge_io_a_sink_ready; // @[FPGATop.scala 400:21]
  wire  sim_channelPorts_PrintfModule_peekPokeBridge_io_a_sink_valid; // @[FPGATop.scala 400:21]
  wire  sim_channelPorts_PrintfModule_peekPokeBridge_io_a_sink_bits; // @[FPGATop.scala 400:21]
  wire  sim_channelPorts_PrintfModule_peekPokeBridge_io_b_sink_ready; // @[FPGATop.scala 400:21]
  wire  sim_channelPorts_PrintfModule_peekPokeBridge_io_b_sink_valid; // @[FPGATop.scala 400:21]
  wire  sim_channelPorts_PrintfModule_peekPokeBridge_io_b_sink_bits; // @[FPGATop.scala 400:21]
  wire  sim_channelPorts_PrintfModule_peekPokeBridge_reset_sink_ready; // @[FPGATop.scala 400:21]
  wire  sim_channelPorts_PrintfModule_peekPokeBridge_reset_sink_valid; // @[FPGATop.scala 400:21]
  wire  sim_channelPorts_PrintfModule_peekPokeBridge_reset_sink_bits; // @[FPGATop.scala 400:21]
  wire  sim_channelPorts_PrintfModule_RationalClockBridge_clocks_0_sink_ready; // @[FPGATop.scala 400:21]
  wire  ctrlInterconnect_clock; // @[Widget.scala 324:34]
  wire  ctrlInterconnect_reset; // @[Widget.scala 324:34]
  wire  ctrlInterconnect_io_masters_0_aw_ready; // @[Widget.scala 324:34]
  wire  ctrlInterconnect_io_masters_0_aw_valid; // @[Widget.scala 324:34]
  wire [11:0] ctrlInterconnect_io_masters_0_aw_bits_addr; // @[Widget.scala 324:34]
  wire [7:0] ctrlInterconnect_io_masters_0_aw_bits_len; // @[Widget.scala 324:34]
  wire  ctrlInterconnect_io_masters_0_aw_bits_id; // @[Widget.scala 324:34]
  wire  ctrlInterconnect_io_masters_0_w_ready; // @[Widget.scala 324:34]
  wire  ctrlInterconnect_io_masters_0_w_valid; // @[Widget.scala 324:34]
  wire [31:0] ctrlInterconnect_io_masters_0_w_bits_data; // @[Widget.scala 324:34]
  wire  ctrlInterconnect_io_masters_0_w_bits_last; // @[Widget.scala 324:34]
  wire  ctrlInterconnect_io_masters_0_b_ready; // @[Widget.scala 324:34]
  wire  ctrlInterconnect_io_masters_0_b_valid; // @[Widget.scala 324:34]
  wire [1:0] ctrlInterconnect_io_masters_0_b_bits_resp; // @[Widget.scala 324:34]
  wire  ctrlInterconnect_io_masters_0_b_bits_id; // @[Widget.scala 324:34]
  wire  ctrlInterconnect_io_masters_0_ar_ready; // @[Widget.scala 324:34]
  wire  ctrlInterconnect_io_masters_0_ar_valid; // @[Widget.scala 324:34]
  wire [11:0] ctrlInterconnect_io_masters_0_ar_bits_addr; // @[Widget.scala 324:34]
  wire [7:0] ctrlInterconnect_io_masters_0_ar_bits_len; // @[Widget.scala 324:34]
  wire  ctrlInterconnect_io_masters_0_ar_bits_id; // @[Widget.scala 324:34]
  wire  ctrlInterconnect_io_masters_0_r_ready; // @[Widget.scala 324:34]
  wire  ctrlInterconnect_io_masters_0_r_valid; // @[Widget.scala 324:34]
  wire [1:0] ctrlInterconnect_io_masters_0_r_bits_resp; // @[Widget.scala 324:34]
  wire [31:0] ctrlInterconnect_io_masters_0_r_bits_data; // @[Widget.scala 324:34]
  wire  ctrlInterconnect_io_masters_0_r_bits_last; // @[Widget.scala 324:34]
  wire  ctrlInterconnect_io_masters_0_r_bits_id; // @[Widget.scala 324:34]
  wire  ctrlInterconnect_io_slaves_0_aw_ready; // @[Widget.scala 324:34]
  wire  ctrlInterconnect_io_slaves_0_aw_valid; // @[Widget.scala 324:34]
  wire [11:0] ctrlInterconnect_io_slaves_0_aw_bits_addr; // @[Widget.scala 324:34]
  wire [7:0] ctrlInterconnect_io_slaves_0_aw_bits_len; // @[Widget.scala 324:34]
  wire  ctrlInterconnect_io_slaves_0_aw_bits_id; // @[Widget.scala 324:34]
  wire  ctrlInterconnect_io_slaves_0_w_ready; // @[Widget.scala 324:34]
  wire  ctrlInterconnect_io_slaves_0_w_valid; // @[Widget.scala 324:34]
  wire [31:0] ctrlInterconnect_io_slaves_0_w_bits_data; // @[Widget.scala 324:34]
  wire  ctrlInterconnect_io_slaves_0_b_ready; // @[Widget.scala 324:34]
  wire  ctrlInterconnect_io_slaves_0_b_valid; // @[Widget.scala 324:34]
  wire  ctrlInterconnect_io_slaves_0_b_bits_id; // @[Widget.scala 324:34]
  wire  ctrlInterconnect_io_slaves_0_ar_ready; // @[Widget.scala 324:34]
  wire  ctrlInterconnect_io_slaves_0_ar_valid; // @[Widget.scala 324:34]
  wire [11:0] ctrlInterconnect_io_slaves_0_ar_bits_addr; // @[Widget.scala 324:34]
  wire [7:0] ctrlInterconnect_io_slaves_0_ar_bits_len; // @[Widget.scala 324:34]
  wire  ctrlInterconnect_io_slaves_0_ar_bits_id; // @[Widget.scala 324:34]
  wire  ctrlInterconnect_io_slaves_0_r_ready; // @[Widget.scala 324:34]
  wire  ctrlInterconnect_io_slaves_0_r_valid; // @[Widget.scala 324:34]
  wire [31:0] ctrlInterconnect_io_slaves_0_r_bits_data; // @[Widget.scala 324:34]
  wire  ctrlInterconnect_io_slaves_0_r_bits_id; // @[Widget.scala 324:34]
  wire  ctrlInterconnect_io_slaves_1_aw_ready; // @[Widget.scala 324:34]
  wire  ctrlInterconnect_io_slaves_1_aw_valid; // @[Widget.scala 324:34]
  wire [11:0] ctrlInterconnect_io_slaves_1_aw_bits_addr; // @[Widget.scala 324:34]
  wire [7:0] ctrlInterconnect_io_slaves_1_aw_bits_len; // @[Widget.scala 324:34]
  wire  ctrlInterconnect_io_slaves_1_aw_bits_id; // @[Widget.scala 324:34]
  wire  ctrlInterconnect_io_slaves_1_w_ready; // @[Widget.scala 324:34]
  wire  ctrlInterconnect_io_slaves_1_w_valid; // @[Widget.scala 324:34]
  wire [31:0] ctrlInterconnect_io_slaves_1_w_bits_data; // @[Widget.scala 324:34]
  wire  ctrlInterconnect_io_slaves_1_b_ready; // @[Widget.scala 324:34]
  wire  ctrlInterconnect_io_slaves_1_b_valid; // @[Widget.scala 324:34]
  wire  ctrlInterconnect_io_slaves_1_b_bits_id; // @[Widget.scala 324:34]
  wire  ctrlInterconnect_io_slaves_1_ar_ready; // @[Widget.scala 324:34]
  wire  ctrlInterconnect_io_slaves_1_ar_valid; // @[Widget.scala 324:34]
  wire [11:0] ctrlInterconnect_io_slaves_1_ar_bits_addr; // @[Widget.scala 324:34]
  wire [7:0] ctrlInterconnect_io_slaves_1_ar_bits_len; // @[Widget.scala 324:34]
  wire  ctrlInterconnect_io_slaves_1_ar_bits_id; // @[Widget.scala 324:34]
  wire  ctrlInterconnect_io_slaves_1_r_ready; // @[Widget.scala 324:34]
  wire  ctrlInterconnect_io_slaves_1_r_valid; // @[Widget.scala 324:34]
  wire [31:0] ctrlInterconnect_io_slaves_1_r_bits_data; // @[Widget.scala 324:34]
  wire  ctrlInterconnect_io_slaves_1_r_bits_id; // @[Widget.scala 324:34]
  wire  ctrlInterconnect_io_slaves_2_aw_ready; // @[Widget.scala 324:34]
  wire  ctrlInterconnect_io_slaves_2_aw_valid; // @[Widget.scala 324:34]
  wire [11:0] ctrlInterconnect_io_slaves_2_aw_bits_addr; // @[Widget.scala 324:34]
  wire [7:0] ctrlInterconnect_io_slaves_2_aw_bits_len; // @[Widget.scala 324:34]
  wire  ctrlInterconnect_io_slaves_2_aw_bits_id; // @[Widget.scala 324:34]
  wire  ctrlInterconnect_io_slaves_2_w_ready; // @[Widget.scala 324:34]
  wire  ctrlInterconnect_io_slaves_2_w_valid; // @[Widget.scala 324:34]
  wire [31:0] ctrlInterconnect_io_slaves_2_w_bits_data; // @[Widget.scala 324:34]
  wire  ctrlInterconnect_io_slaves_2_b_ready; // @[Widget.scala 324:34]
  wire  ctrlInterconnect_io_slaves_2_b_valid; // @[Widget.scala 324:34]
  wire  ctrlInterconnect_io_slaves_2_b_bits_id; // @[Widget.scala 324:34]
  wire  ctrlInterconnect_io_slaves_2_ar_ready; // @[Widget.scala 324:34]
  wire  ctrlInterconnect_io_slaves_2_ar_valid; // @[Widget.scala 324:34]
  wire [11:0] ctrlInterconnect_io_slaves_2_ar_bits_addr; // @[Widget.scala 324:34]
  wire [7:0] ctrlInterconnect_io_slaves_2_ar_bits_len; // @[Widget.scala 324:34]
  wire  ctrlInterconnect_io_slaves_2_ar_bits_id; // @[Widget.scala 324:34]
  wire  ctrlInterconnect_io_slaves_2_r_ready; // @[Widget.scala 324:34]
  wire  ctrlInterconnect_io_slaves_2_r_valid; // @[Widget.scala 324:34]
  wire [31:0] ctrlInterconnect_io_slaves_2_r_bits_data; // @[Widget.scala 324:34]
  wire  ctrlInterconnect_io_slaves_2_r_bits_id; // @[Widget.scala 324:34]
  wire  ctrlInterconnect_io_slaves_3_aw_ready; // @[Widget.scala 324:34]
  wire  ctrlInterconnect_io_slaves_3_aw_valid; // @[Widget.scala 324:34]
  wire [11:0] ctrlInterconnect_io_slaves_3_aw_bits_addr; // @[Widget.scala 324:34]
  wire [7:0] ctrlInterconnect_io_slaves_3_aw_bits_len; // @[Widget.scala 324:34]
  wire  ctrlInterconnect_io_slaves_3_aw_bits_id; // @[Widget.scala 324:34]
  wire  ctrlInterconnect_io_slaves_3_w_ready; // @[Widget.scala 324:34]
  wire  ctrlInterconnect_io_slaves_3_w_valid; // @[Widget.scala 324:34]
  wire [31:0] ctrlInterconnect_io_slaves_3_w_bits_data; // @[Widget.scala 324:34]
  wire  ctrlInterconnect_io_slaves_3_b_ready; // @[Widget.scala 324:34]
  wire  ctrlInterconnect_io_slaves_3_b_valid; // @[Widget.scala 324:34]
  wire  ctrlInterconnect_io_slaves_3_b_bits_id; // @[Widget.scala 324:34]
  wire  ctrlInterconnect_io_slaves_3_ar_ready; // @[Widget.scala 324:34]
  wire  ctrlInterconnect_io_slaves_3_ar_valid; // @[Widget.scala 324:34]
  wire [11:0] ctrlInterconnect_io_slaves_3_ar_bits_addr; // @[Widget.scala 324:34]
  wire [7:0] ctrlInterconnect_io_slaves_3_ar_bits_len; // @[Widget.scala 324:34]
  wire  ctrlInterconnect_io_slaves_3_ar_bits_id; // @[Widget.scala 324:34]
  wire  ctrlInterconnect_io_slaves_3_r_ready; // @[Widget.scala 324:34]
  wire  ctrlInterconnect_io_slaves_3_r_valid; // @[Widget.scala 324:34]
  wire [31:0] ctrlInterconnect_io_slaves_3_r_bits_data; // @[Widget.scala 324:34]
  wire  ctrlInterconnect_io_slaves_3_r_bits_id; // @[Widget.scala 324:34]
  wire  ctrlInterconnect_io_slaves_4_aw_ready; // @[Widget.scala 324:34]
  wire  ctrlInterconnect_io_slaves_4_aw_valid; // @[Widget.scala 324:34]
  wire [7:0] ctrlInterconnect_io_slaves_4_aw_bits_len; // @[Widget.scala 324:34]
  wire  ctrlInterconnect_io_slaves_4_aw_bits_id; // @[Widget.scala 324:34]
  wire  ctrlInterconnect_io_slaves_4_w_ready; // @[Widget.scala 324:34]
  wire  ctrlInterconnect_io_slaves_4_w_valid; // @[Widget.scala 324:34]
  wire [31:0] ctrlInterconnect_io_slaves_4_w_bits_data; // @[Widget.scala 324:34]
  wire  ctrlInterconnect_io_slaves_4_b_ready; // @[Widget.scala 324:34]
  wire  ctrlInterconnect_io_slaves_4_b_valid; // @[Widget.scala 324:34]
  wire  ctrlInterconnect_io_slaves_4_b_bits_id; // @[Widget.scala 324:34]
  wire  ctrlInterconnect_io_slaves_4_ar_ready; // @[Widget.scala 324:34]
  wire  ctrlInterconnect_io_slaves_4_ar_valid; // @[Widget.scala 324:34]
  wire [7:0] ctrlInterconnect_io_slaves_4_ar_bits_len; // @[Widget.scala 324:34]
  wire  ctrlInterconnect_io_slaves_4_ar_bits_id; // @[Widget.scala 324:34]
  wire  ctrlInterconnect_io_slaves_4_r_ready; // @[Widget.scala 324:34]
  wire  ctrlInterconnect_io_slaves_4_r_valid; // @[Widget.scala 324:34]
  wire [31:0] ctrlInterconnect_io_slaves_4_r_bits_data; // @[Widget.scala 324:34]
  wire  ctrlInterconnect_io_slaves_4_r_bits_id; // @[Widget.scala 324:34]
  SimulationMaster SimulationMaster_0 ( // @[Widget.scala 303:23]
    .clock(SimulationMaster_0_clock),
    .reset(SimulationMaster_0_reset),
    .io_ctrl_aw_ready(SimulationMaster_0_io_ctrl_aw_ready),
    .io_ctrl_aw_valid(SimulationMaster_0_io_ctrl_aw_valid),
    .io_ctrl_aw_bits_len(SimulationMaster_0_io_ctrl_aw_bits_len),
    .io_ctrl_aw_bits_id(SimulationMaster_0_io_ctrl_aw_bits_id),
    .io_ctrl_w_ready(SimulationMaster_0_io_ctrl_w_ready),
    .io_ctrl_w_valid(SimulationMaster_0_io_ctrl_w_valid),
    .io_ctrl_w_bits_data(SimulationMaster_0_io_ctrl_w_bits_data),
    .io_ctrl_b_ready(SimulationMaster_0_io_ctrl_b_ready),
    .io_ctrl_b_valid(SimulationMaster_0_io_ctrl_b_valid),
    .io_ctrl_b_bits_id(SimulationMaster_0_io_ctrl_b_bits_id),
    .io_ctrl_ar_ready(SimulationMaster_0_io_ctrl_ar_ready),
    .io_ctrl_ar_valid(SimulationMaster_0_io_ctrl_ar_valid),
    .io_ctrl_ar_bits_len(SimulationMaster_0_io_ctrl_ar_bits_len),
    .io_ctrl_ar_bits_id(SimulationMaster_0_io_ctrl_ar_bits_id),
    .io_ctrl_r_ready(SimulationMaster_0_io_ctrl_r_ready),
    .io_ctrl_r_valid(SimulationMaster_0_io_ctrl_r_valid),
    .io_ctrl_r_bits_data(SimulationMaster_0_io_ctrl_r_bits_data),
    .io_ctrl_r_bits_id(SimulationMaster_0_io_ctrl_r_bits_id)
  );
  ClockBridgeModule ClockBridgeModule_0 ( // @[Widget.scala 303:23]
    .clock(ClockBridgeModule_0_clock),
    .reset(ClockBridgeModule_0_reset),
    .io_ctrl_aw_ready(ClockBridgeModule_0_io_ctrl_aw_ready),
    .io_ctrl_aw_valid(ClockBridgeModule_0_io_ctrl_aw_valid),
    .io_ctrl_aw_bits_addr(ClockBridgeModule_0_io_ctrl_aw_bits_addr),
    .io_ctrl_aw_bits_len(ClockBridgeModule_0_io_ctrl_aw_bits_len),
    .io_ctrl_aw_bits_id(ClockBridgeModule_0_io_ctrl_aw_bits_id),
    .io_ctrl_w_ready(ClockBridgeModule_0_io_ctrl_w_ready),
    .io_ctrl_w_valid(ClockBridgeModule_0_io_ctrl_w_valid),
    .io_ctrl_w_bits_data(ClockBridgeModule_0_io_ctrl_w_bits_data),
    .io_ctrl_b_ready(ClockBridgeModule_0_io_ctrl_b_ready),
    .io_ctrl_b_valid(ClockBridgeModule_0_io_ctrl_b_valid),
    .io_ctrl_b_bits_id(ClockBridgeModule_0_io_ctrl_b_bits_id),
    .io_ctrl_ar_ready(ClockBridgeModule_0_io_ctrl_ar_ready),
    .io_ctrl_ar_valid(ClockBridgeModule_0_io_ctrl_ar_valid),
    .io_ctrl_ar_bits_addr(ClockBridgeModule_0_io_ctrl_ar_bits_addr),
    .io_ctrl_ar_bits_len(ClockBridgeModule_0_io_ctrl_ar_bits_len),
    .io_ctrl_ar_bits_id(ClockBridgeModule_0_io_ctrl_ar_bits_id),
    .io_ctrl_r_ready(ClockBridgeModule_0_io_ctrl_r_ready),
    .io_ctrl_r_valid(ClockBridgeModule_0_io_ctrl_r_valid),
    .io_ctrl_r_bits_data(ClockBridgeModule_0_io_ctrl_r_bits_data),
    .io_ctrl_r_bits_id(ClockBridgeModule_0_io_ctrl_r_bits_id),
    .hPort_clocks_ready(ClockBridgeModule_0_hPort_clocks_ready),
    .hPort_clocks_valid(ClockBridgeModule_0_hPort_clocks_valid),
    .hPort_clocks_bits_0(ClockBridgeModule_0_hPort_clocks_bits_0)
  );
  PeekPokeBridgeModule PeekPokeBridgeModule_0 ( // @[Widget.scala 303:23]
    .clock(PeekPokeBridgeModule_0_clock),
    .reset(PeekPokeBridgeModule_0_reset),
    .io_ctrl_aw_ready(PeekPokeBridgeModule_0_io_ctrl_aw_ready),
    .io_ctrl_aw_valid(PeekPokeBridgeModule_0_io_ctrl_aw_valid),
    .io_ctrl_aw_bits_addr(PeekPokeBridgeModule_0_io_ctrl_aw_bits_addr),
    .io_ctrl_aw_bits_len(PeekPokeBridgeModule_0_io_ctrl_aw_bits_len),
    .io_ctrl_aw_bits_id(PeekPokeBridgeModule_0_io_ctrl_aw_bits_id),
    .io_ctrl_w_ready(PeekPokeBridgeModule_0_io_ctrl_w_ready),
    .io_ctrl_w_valid(PeekPokeBridgeModule_0_io_ctrl_w_valid),
    .io_ctrl_w_bits_data(PeekPokeBridgeModule_0_io_ctrl_w_bits_data),
    .io_ctrl_b_ready(PeekPokeBridgeModule_0_io_ctrl_b_ready),
    .io_ctrl_b_valid(PeekPokeBridgeModule_0_io_ctrl_b_valid),
    .io_ctrl_b_bits_id(PeekPokeBridgeModule_0_io_ctrl_b_bits_id),
    .io_ctrl_ar_ready(PeekPokeBridgeModule_0_io_ctrl_ar_ready),
    .io_ctrl_ar_valid(PeekPokeBridgeModule_0_io_ctrl_ar_valid),
    .io_ctrl_ar_bits_addr(PeekPokeBridgeModule_0_io_ctrl_ar_bits_addr),
    .io_ctrl_ar_bits_len(PeekPokeBridgeModule_0_io_ctrl_ar_bits_len),
    .io_ctrl_ar_bits_id(PeekPokeBridgeModule_0_io_ctrl_ar_bits_id),
    .io_ctrl_r_ready(PeekPokeBridgeModule_0_io_ctrl_r_ready),
    .io_ctrl_r_valid(PeekPokeBridgeModule_0_io_ctrl_r_valid),
    .io_ctrl_r_bits_data(PeekPokeBridgeModule_0_io_ctrl_r_bits_data),
    .io_ctrl_r_bits_id(PeekPokeBridgeModule_0_io_ctrl_r_bits_id),
    .hPort_io_a_ready(PeekPokeBridgeModule_0_hPort_io_a_ready),
    .hPort_io_a_valid(PeekPokeBridgeModule_0_hPort_io_a_valid),
    .hPort_io_a_bits(PeekPokeBridgeModule_0_hPort_io_a_bits),
    .hPort_io_b_ready(PeekPokeBridgeModule_0_hPort_io_b_ready),
    .hPort_io_b_valid(PeekPokeBridgeModule_0_hPort_io_b_valid),
    .hPort_io_b_bits(PeekPokeBridgeModule_0_hPort_io_b_bits),
    .hPort_reset_ready(PeekPokeBridgeModule_0_hPort_reset_ready),
    .hPort_reset_valid(PeekPokeBridgeModule_0_hPort_reset_valid),
    .hPort_reset_bits(PeekPokeBridgeModule_0_hPort_reset_bits)
  );
  PrintBridgeModule PrintBridgeModule_0 ( // @[Widget.scala 303:23]
    .clock(PrintBridgeModule_0_clock),
    .reset(PrintBridgeModule_0_reset),
    .streamToHostCPU_ready(PrintBridgeModule_0_streamToHostCPU_ready),
    .streamToHostCPU_valid(PrintBridgeModule_0_streamToHostCPU_valid),
    .streamToHostCPU_bits(PrintBridgeModule_0_streamToHostCPU_bits),
    .io_ctrl_aw_ready(PrintBridgeModule_0_io_ctrl_aw_ready),
    .io_ctrl_aw_valid(PrintBridgeModule_0_io_ctrl_aw_valid),
    .io_ctrl_aw_bits_addr(PrintBridgeModule_0_io_ctrl_aw_bits_addr),
    .io_ctrl_aw_bits_len(PrintBridgeModule_0_io_ctrl_aw_bits_len),
    .io_ctrl_aw_bits_id(PrintBridgeModule_0_io_ctrl_aw_bits_id),
    .io_ctrl_w_ready(PrintBridgeModule_0_io_ctrl_w_ready),
    .io_ctrl_w_valid(PrintBridgeModule_0_io_ctrl_w_valid),
    .io_ctrl_w_bits_data(PrintBridgeModule_0_io_ctrl_w_bits_data),
    .io_ctrl_b_ready(PrintBridgeModule_0_io_ctrl_b_ready),
    .io_ctrl_b_valid(PrintBridgeModule_0_io_ctrl_b_valid),
    .io_ctrl_b_bits_id(PrintBridgeModule_0_io_ctrl_b_bits_id),
    .io_ctrl_ar_ready(PrintBridgeModule_0_io_ctrl_ar_ready),
    .io_ctrl_ar_valid(PrintBridgeModule_0_io_ctrl_ar_valid),
    .io_ctrl_ar_bits_addr(PrintBridgeModule_0_io_ctrl_ar_bits_addr),
    .io_ctrl_ar_bits_len(PrintBridgeModule_0_io_ctrl_ar_bits_len),
    .io_ctrl_ar_bits_id(PrintBridgeModule_0_io_ctrl_ar_bits_id),
    .io_ctrl_r_ready(PrintBridgeModule_0_io_ctrl_r_ready),
    .io_ctrl_r_valid(PrintBridgeModule_0_io_ctrl_r_valid),
    .io_ctrl_r_bits_data(PrintBridgeModule_0_io_ctrl_r_bits_data),
    .io_ctrl_r_bits_id(PrintBridgeModule_0_io_ctrl_r_bits_id),
    .hPort_hBits_synthesizedPrintf_dut_printf_1_wire_args_1(
      PrintBridgeModule_0_hPort_hBits_synthesizedPrintf_dut_printf_1_wire_args_1),
    .hPort_hBits_synthesizedPrintf_dut_printf_1_wire_args_0(
      PrintBridgeModule_0_hPort_hBits_synthesizedPrintf_dut_printf_1_wire_args_0),
    .hPort_hBits_synthesizedPrintf_dut_printf_1_wire_enable(
      PrintBridgeModule_0_hPort_hBits_synthesizedPrintf_dut_printf_1_wire_enable),
    .hPort_hBits_synthesizedPrintf_dut_printf_2_wire_args_1(
      PrintBridgeModule_0_hPort_hBits_synthesizedPrintf_dut_printf_2_wire_args_1),
    .hPort_hBits_synthesizedPrintf_dut_printf_2_wire_args_0(
      PrintBridgeModule_0_hPort_hBits_synthesizedPrintf_dut_printf_2_wire_args_0),
    .hPort_hBits_synthesizedPrintf_dut_printf_2_wire_enable(
      PrintBridgeModule_0_hPort_hBits_synthesizedPrintf_dut_printf_2_wire_enable),
    .hPort_hBits_synthesizedPrintf_dut_childInst_printf_wire_args_1(
      PrintBridgeModule_0_hPort_hBits_synthesizedPrintf_dut_childInst_printf_wire_args_1),
    .hPort_hBits_synthesizedPrintf_dut_childInst_printf_wire_args_0(
      PrintBridgeModule_0_hPort_hBits_synthesizedPrintf_dut_childInst_printf_wire_args_0),
    .hPort_hBits_synthesizedPrintf_dut_childInst_printf_wire_enable(
      PrintBridgeModule_0_hPort_hBits_synthesizedPrintf_dut_childInst_printf_wire_enable),
    .hPort_hBits_synthesizedPrintf_dut_printf_wire_args_0(
      PrintBridgeModule_0_hPort_hBits_synthesizedPrintf_dut_printf_wire_args_0),
    .hPort_hBits_synthesizedPrintf_dut_printf_wire_enable(
      PrintBridgeModule_0_hPort_hBits_synthesizedPrintf_dut_printf_wire_enable),
    .hPort_hBits_synthesizedPrintf_RationalClockBridge_clocks_0_globalReset(
      PrintBridgeModule_0_hPort_hBits_synthesizedPrintf_RationalClockBridge_clocks_0_globalReset),
    .hPort_toHost_hReady(PrintBridgeModule_0_hPort_toHost_hReady),
    .hPort_toHost_hValid(PrintBridgeModule_0_hPort_toHost_hValid)
  );
  FPGAManagedStreamEngine FPGAManagedStreamEngine_0 ( // @[Widget.scala 303:23]
    .clock(FPGAManagedStreamEngine_0_clock),
    .reset(FPGAManagedStreamEngine_0_reset),
    .auto_axi4xbar_out_aw_ready(FPGAManagedStreamEngine_0_auto_axi4xbar_out_aw_ready),
    .auto_axi4xbar_out_aw_valid(FPGAManagedStreamEngine_0_auto_axi4xbar_out_aw_valid),
    .auto_axi4xbar_out_aw_bits_id(FPGAManagedStreamEngine_0_auto_axi4xbar_out_aw_bits_id),
    .auto_axi4xbar_out_aw_bits_addr(FPGAManagedStreamEngine_0_auto_axi4xbar_out_aw_bits_addr),
    .auto_axi4xbar_out_aw_bits_len(FPGAManagedStreamEngine_0_auto_axi4xbar_out_aw_bits_len),
    .auto_axi4xbar_out_aw_bits_size(FPGAManagedStreamEngine_0_auto_axi4xbar_out_aw_bits_size),
    .auto_axi4xbar_out_aw_bits_burst(FPGAManagedStreamEngine_0_auto_axi4xbar_out_aw_bits_burst),
    .auto_axi4xbar_out_aw_bits_lock(FPGAManagedStreamEngine_0_auto_axi4xbar_out_aw_bits_lock),
    .auto_axi4xbar_out_aw_bits_cache(FPGAManagedStreamEngine_0_auto_axi4xbar_out_aw_bits_cache),
    .auto_axi4xbar_out_aw_bits_prot(FPGAManagedStreamEngine_0_auto_axi4xbar_out_aw_bits_prot),
    .auto_axi4xbar_out_aw_bits_qos(FPGAManagedStreamEngine_0_auto_axi4xbar_out_aw_bits_qos),
    .auto_axi4xbar_out_w_ready(FPGAManagedStreamEngine_0_auto_axi4xbar_out_w_ready),
    .auto_axi4xbar_out_w_valid(FPGAManagedStreamEngine_0_auto_axi4xbar_out_w_valid),
    .auto_axi4xbar_out_w_bits_data(FPGAManagedStreamEngine_0_auto_axi4xbar_out_w_bits_data),
    .auto_axi4xbar_out_w_bits_strb(FPGAManagedStreamEngine_0_auto_axi4xbar_out_w_bits_strb),
    .auto_axi4xbar_out_w_bits_last(FPGAManagedStreamEngine_0_auto_axi4xbar_out_w_bits_last),
    .auto_axi4xbar_out_b_ready(FPGAManagedStreamEngine_0_auto_axi4xbar_out_b_ready),
    .auto_axi4xbar_out_b_valid(FPGAManagedStreamEngine_0_auto_axi4xbar_out_b_valid),
    .auto_axi4xbar_out_b_bits_id(FPGAManagedStreamEngine_0_auto_axi4xbar_out_b_bits_id),
    .auto_axi4xbar_out_ar_ready(FPGAManagedStreamEngine_0_auto_axi4xbar_out_ar_ready),
    .auto_axi4xbar_out_ar_valid(FPGAManagedStreamEngine_0_auto_axi4xbar_out_ar_valid),
    .auto_axi4xbar_out_ar_bits_id(FPGAManagedStreamEngine_0_auto_axi4xbar_out_ar_bits_id),
    .auto_axi4xbar_out_ar_bits_addr(FPGAManagedStreamEngine_0_auto_axi4xbar_out_ar_bits_addr),
    .auto_axi4xbar_out_ar_bits_len(FPGAManagedStreamEngine_0_auto_axi4xbar_out_ar_bits_len),
    .auto_axi4xbar_out_ar_bits_size(FPGAManagedStreamEngine_0_auto_axi4xbar_out_ar_bits_size),
    .auto_axi4xbar_out_ar_bits_burst(FPGAManagedStreamEngine_0_auto_axi4xbar_out_ar_bits_burst),
    .auto_axi4xbar_out_ar_bits_lock(FPGAManagedStreamEngine_0_auto_axi4xbar_out_ar_bits_lock),
    .auto_axi4xbar_out_ar_bits_cache(FPGAManagedStreamEngine_0_auto_axi4xbar_out_ar_bits_cache),
    .auto_axi4xbar_out_ar_bits_prot(FPGAManagedStreamEngine_0_auto_axi4xbar_out_ar_bits_prot),
    .auto_axi4xbar_out_ar_bits_qos(FPGAManagedStreamEngine_0_auto_axi4xbar_out_ar_bits_qos),
    .auto_axi4xbar_out_r_ready(FPGAManagedStreamEngine_0_auto_axi4xbar_out_r_ready),
    .auto_axi4xbar_out_r_valid(FPGAManagedStreamEngine_0_auto_axi4xbar_out_r_valid),
    .auto_axi4xbar_out_r_bits_id(FPGAManagedStreamEngine_0_auto_axi4xbar_out_r_bits_id),
    .streamsToHostCPU_0_ready(FPGAManagedStreamEngine_0_streamsToHostCPU_0_ready),
    .streamsToHostCPU_0_valid(FPGAManagedStreamEngine_0_streamsToHostCPU_0_valid),
    .streamsToHostCPU_0_bits(FPGAManagedStreamEngine_0_streamsToHostCPU_0_bits),
    .io_ctrl_aw_ready(FPGAManagedStreamEngine_0_io_ctrl_aw_ready),
    .io_ctrl_aw_valid(FPGAManagedStreamEngine_0_io_ctrl_aw_valid),
    .io_ctrl_aw_bits_addr(FPGAManagedStreamEngine_0_io_ctrl_aw_bits_addr),
    .io_ctrl_aw_bits_len(FPGAManagedStreamEngine_0_io_ctrl_aw_bits_len),
    .io_ctrl_aw_bits_id(FPGAManagedStreamEngine_0_io_ctrl_aw_bits_id),
    .io_ctrl_w_ready(FPGAManagedStreamEngine_0_io_ctrl_w_ready),
    .io_ctrl_w_valid(FPGAManagedStreamEngine_0_io_ctrl_w_valid),
    .io_ctrl_w_bits_data(FPGAManagedStreamEngine_0_io_ctrl_w_bits_data),
    .io_ctrl_b_ready(FPGAManagedStreamEngine_0_io_ctrl_b_ready),
    .io_ctrl_b_valid(FPGAManagedStreamEngine_0_io_ctrl_b_valid),
    .io_ctrl_b_bits_id(FPGAManagedStreamEngine_0_io_ctrl_b_bits_id),
    .io_ctrl_ar_ready(FPGAManagedStreamEngine_0_io_ctrl_ar_ready),
    .io_ctrl_ar_valid(FPGAManagedStreamEngine_0_io_ctrl_ar_valid),
    .io_ctrl_ar_bits_addr(FPGAManagedStreamEngine_0_io_ctrl_ar_bits_addr),
    .io_ctrl_ar_bits_len(FPGAManagedStreamEngine_0_io_ctrl_ar_bits_len),
    .io_ctrl_ar_bits_id(FPGAManagedStreamEngine_0_io_ctrl_ar_bits_id),
    .io_ctrl_r_ready(FPGAManagedStreamEngine_0_io_ctrl_r_ready),
    .io_ctrl_r_valid(FPGAManagedStreamEngine_0_io_ctrl_r_valid),
    .io_ctrl_r_bits_data(FPGAManagedStreamEngine_0_io_ctrl_r_bits_data),
    .io_ctrl_r_bits_id(FPGAManagedStreamEngine_0_io_ctrl_r_bits_id)
  );
  AXI4IdIndexer axi4index ( // @[IdIndexer.scala 94:31]
    .auto_in_aw_ready(axi4index_auto_in_aw_ready),
    .auto_in_aw_valid(axi4index_auto_in_aw_valid),
    .auto_in_aw_bits_id(axi4index_auto_in_aw_bits_id),
    .auto_in_aw_bits_addr(axi4index_auto_in_aw_bits_addr),
    .auto_in_aw_bits_len(axi4index_auto_in_aw_bits_len),
    .auto_in_aw_bits_size(axi4index_auto_in_aw_bits_size),
    .auto_in_aw_bits_burst(axi4index_auto_in_aw_bits_burst),
    .auto_in_aw_bits_lock(axi4index_auto_in_aw_bits_lock),
    .auto_in_aw_bits_cache(axi4index_auto_in_aw_bits_cache),
    .auto_in_aw_bits_prot(axi4index_auto_in_aw_bits_prot),
    .auto_in_aw_bits_qos(axi4index_auto_in_aw_bits_qos),
    .auto_in_w_ready(axi4index_auto_in_w_ready),
    .auto_in_w_valid(axi4index_auto_in_w_valid),
    .auto_in_w_bits_data(axi4index_auto_in_w_bits_data),
    .auto_in_w_bits_strb(axi4index_auto_in_w_bits_strb),
    .auto_in_w_bits_last(axi4index_auto_in_w_bits_last),
    .auto_in_b_ready(axi4index_auto_in_b_ready),
    .auto_in_b_valid(axi4index_auto_in_b_valid),
    .auto_in_b_bits_id(axi4index_auto_in_b_bits_id),
    .auto_in_ar_ready(axi4index_auto_in_ar_ready),
    .auto_in_ar_valid(axi4index_auto_in_ar_valid),
    .auto_in_ar_bits_id(axi4index_auto_in_ar_bits_id),
    .auto_in_ar_bits_addr(axi4index_auto_in_ar_bits_addr),
    .auto_in_ar_bits_len(axi4index_auto_in_ar_bits_len),
    .auto_in_ar_bits_size(axi4index_auto_in_ar_bits_size),
    .auto_in_ar_bits_burst(axi4index_auto_in_ar_bits_burst),
    .auto_in_ar_bits_lock(axi4index_auto_in_ar_bits_lock),
    .auto_in_ar_bits_cache(axi4index_auto_in_ar_bits_cache),
    .auto_in_ar_bits_prot(axi4index_auto_in_ar_bits_prot),
    .auto_in_ar_bits_qos(axi4index_auto_in_ar_bits_qos),
    .auto_in_r_ready(axi4index_auto_in_r_ready),
    .auto_in_r_valid(axi4index_auto_in_r_valid),
    .auto_in_r_bits_id(axi4index_auto_in_r_bits_id),
    .auto_out_aw_ready(axi4index_auto_out_aw_ready),
    .auto_out_aw_valid(axi4index_auto_out_aw_valid),
    .auto_out_aw_bits_id(axi4index_auto_out_aw_bits_id),
    .auto_out_aw_bits_addr(axi4index_auto_out_aw_bits_addr),
    .auto_out_aw_bits_len(axi4index_auto_out_aw_bits_len),
    .auto_out_aw_bits_size(axi4index_auto_out_aw_bits_size),
    .auto_out_aw_bits_burst(axi4index_auto_out_aw_bits_burst),
    .auto_out_aw_bits_lock(axi4index_auto_out_aw_bits_lock),
    .auto_out_aw_bits_cache(axi4index_auto_out_aw_bits_cache),
    .auto_out_aw_bits_prot(axi4index_auto_out_aw_bits_prot),
    .auto_out_aw_bits_qos(axi4index_auto_out_aw_bits_qos),
    .auto_out_w_ready(axi4index_auto_out_w_ready),
    .auto_out_w_valid(axi4index_auto_out_w_valid),
    .auto_out_w_bits_data(axi4index_auto_out_w_bits_data),
    .auto_out_w_bits_strb(axi4index_auto_out_w_bits_strb),
    .auto_out_w_bits_last(axi4index_auto_out_w_bits_last),
    .auto_out_b_ready(axi4index_auto_out_b_ready),
    .auto_out_b_valid(axi4index_auto_out_b_valid),
    .auto_out_b_bits_id(axi4index_auto_out_b_bits_id),
    .auto_out_ar_ready(axi4index_auto_out_ar_ready),
    .auto_out_ar_valid(axi4index_auto_out_ar_valid),
    .auto_out_ar_bits_id(axi4index_auto_out_ar_bits_id),
    .auto_out_ar_bits_addr(axi4index_auto_out_ar_bits_addr),
    .auto_out_ar_bits_len(axi4index_auto_out_ar_bits_len),
    .auto_out_ar_bits_size(axi4index_auto_out_ar_bits_size),
    .auto_out_ar_bits_burst(axi4index_auto_out_ar_bits_burst),
    .auto_out_ar_bits_lock(axi4index_auto_out_ar_bits_lock),
    .auto_out_ar_bits_cache(axi4index_auto_out_ar_bits_cache),
    .auto_out_ar_bits_prot(axi4index_auto_out_ar_bits_prot),
    .auto_out_ar_bits_qos(axi4index_auto_out_ar_bits_qos),
    .auto_out_r_ready(axi4index_auto_out_r_ready),
    .auto_out_r_valid(axi4index_auto_out_r_valid),
    .auto_out_r_bits_id(axi4index_auto_out_r_bits_id)
  );
  AXI4Buffer axi4buf ( // @[Buffer.scala 63:29]
    .clock(axi4buf_clock),
    .reset(axi4buf_reset),
    .auto_in_aw_ready(axi4buf_auto_in_aw_ready),
    .auto_in_aw_valid(axi4buf_auto_in_aw_valid),
    .auto_in_aw_bits_id(axi4buf_auto_in_aw_bits_id),
    .auto_in_aw_bits_addr(axi4buf_auto_in_aw_bits_addr),
    .auto_in_aw_bits_len(axi4buf_auto_in_aw_bits_len),
    .auto_in_aw_bits_size(axi4buf_auto_in_aw_bits_size),
    .auto_in_aw_bits_burst(axi4buf_auto_in_aw_bits_burst),
    .auto_in_aw_bits_lock(axi4buf_auto_in_aw_bits_lock),
    .auto_in_aw_bits_cache(axi4buf_auto_in_aw_bits_cache),
    .auto_in_aw_bits_prot(axi4buf_auto_in_aw_bits_prot),
    .auto_in_aw_bits_qos(axi4buf_auto_in_aw_bits_qos),
    .auto_in_w_ready(axi4buf_auto_in_w_ready),
    .auto_in_w_valid(axi4buf_auto_in_w_valid),
    .auto_in_w_bits_data(axi4buf_auto_in_w_bits_data),
    .auto_in_w_bits_strb(axi4buf_auto_in_w_bits_strb),
    .auto_in_w_bits_last(axi4buf_auto_in_w_bits_last),
    .auto_in_b_ready(axi4buf_auto_in_b_ready),
    .auto_in_b_valid(axi4buf_auto_in_b_valid),
    .auto_in_b_bits_id(axi4buf_auto_in_b_bits_id),
    .auto_in_ar_ready(axi4buf_auto_in_ar_ready),
    .auto_in_ar_valid(axi4buf_auto_in_ar_valid),
    .auto_in_ar_bits_id(axi4buf_auto_in_ar_bits_id),
    .auto_in_ar_bits_addr(axi4buf_auto_in_ar_bits_addr),
    .auto_in_ar_bits_len(axi4buf_auto_in_ar_bits_len),
    .auto_in_ar_bits_size(axi4buf_auto_in_ar_bits_size),
    .auto_in_ar_bits_burst(axi4buf_auto_in_ar_bits_burst),
    .auto_in_ar_bits_lock(axi4buf_auto_in_ar_bits_lock),
    .auto_in_ar_bits_cache(axi4buf_auto_in_ar_bits_cache),
    .auto_in_ar_bits_prot(axi4buf_auto_in_ar_bits_prot),
    .auto_in_ar_bits_qos(axi4buf_auto_in_ar_bits_qos),
    .auto_in_r_ready(axi4buf_auto_in_r_ready),
    .auto_in_r_valid(axi4buf_auto_in_r_valid),
    .auto_in_r_bits_id(axi4buf_auto_in_r_bits_id),
    .auto_out_aw_ready(axi4buf_auto_out_aw_ready),
    .auto_out_aw_valid(axi4buf_auto_out_aw_valid),
    .auto_out_aw_bits_id(axi4buf_auto_out_aw_bits_id),
    .auto_out_aw_bits_addr(axi4buf_auto_out_aw_bits_addr),
    .auto_out_aw_bits_len(axi4buf_auto_out_aw_bits_len),
    .auto_out_aw_bits_size(axi4buf_auto_out_aw_bits_size),
    .auto_out_aw_bits_burst(axi4buf_auto_out_aw_bits_burst),
    .auto_out_aw_bits_lock(axi4buf_auto_out_aw_bits_lock),
    .auto_out_aw_bits_cache(axi4buf_auto_out_aw_bits_cache),
    .auto_out_aw_bits_prot(axi4buf_auto_out_aw_bits_prot),
    .auto_out_aw_bits_qos(axi4buf_auto_out_aw_bits_qos),
    .auto_out_w_ready(axi4buf_auto_out_w_ready),
    .auto_out_w_valid(axi4buf_auto_out_w_valid),
    .auto_out_w_bits_data(axi4buf_auto_out_w_bits_data),
    .auto_out_w_bits_strb(axi4buf_auto_out_w_bits_strb),
    .auto_out_w_bits_last(axi4buf_auto_out_w_bits_last),
    .auto_out_b_ready(axi4buf_auto_out_b_ready),
    .auto_out_b_valid(axi4buf_auto_out_b_valid),
    .auto_out_b_bits_id(axi4buf_auto_out_b_bits_id),
    .auto_out_ar_ready(axi4buf_auto_out_ar_ready),
    .auto_out_ar_valid(axi4buf_auto_out_ar_valid),
    .auto_out_ar_bits_id(axi4buf_auto_out_ar_bits_id),
    .auto_out_ar_bits_addr(axi4buf_auto_out_ar_bits_addr),
    .auto_out_ar_bits_len(axi4buf_auto_out_ar_bits_len),
    .auto_out_ar_bits_size(axi4buf_auto_out_ar_bits_size),
    .auto_out_ar_bits_burst(axi4buf_auto_out_ar_bits_burst),
    .auto_out_ar_bits_lock(axi4buf_auto_out_ar_bits_lock),
    .auto_out_ar_bits_cache(axi4buf_auto_out_ar_bits_cache),
    .auto_out_ar_bits_prot(axi4buf_auto_out_ar_bits_prot),
    .auto_out_ar_bits_qos(axi4buf_auto_out_ar_bits_qos),
    .auto_out_r_ready(axi4buf_auto_out_r_ready),
    .auto_out_r_valid(axi4buf_auto_out_r_valid),
    .auto_out_r_bits_id(axi4buf_auto_out_r_bits_id)
  );
  SimWrapper sim ( // @[FPGATop.scala 400:21]
    .clock(sim_clock),
    .reset(sim_reset),
    .channelPorts_PrintfModule_synthesizedPrintf_dut_printf_1_wire_args_1_source_ready(
      sim_channelPorts_PrintfModule_synthesizedPrintf_dut_printf_1_wire_args_1_source_ready),
    .channelPorts_PrintfModule_synthesizedPrintf_dut_printf_1_wire_args_1_source_valid(
      sim_channelPorts_PrintfModule_synthesizedPrintf_dut_printf_1_wire_args_1_source_valid),
    .channelPorts_PrintfModule_synthesizedPrintf_dut_printf_1_wire_args_1_source_bits(
      sim_channelPorts_PrintfModule_synthesizedPrintf_dut_printf_1_wire_args_1_source_bits),
    .channelPorts_PrintfModule_synthesizedPrintf_dut_printf_1_wire_args_0_source_ready(
      sim_channelPorts_PrintfModule_synthesizedPrintf_dut_printf_1_wire_args_0_source_ready),
    .channelPorts_PrintfModule_synthesizedPrintf_dut_printf_1_wire_args_0_source_valid(
      sim_channelPorts_PrintfModule_synthesizedPrintf_dut_printf_1_wire_args_0_source_valid),
    .channelPorts_PrintfModule_synthesizedPrintf_dut_printf_1_wire_args_0_source_bits(
      sim_channelPorts_PrintfModule_synthesizedPrintf_dut_printf_1_wire_args_0_source_bits),
    .channelPorts_PrintfModule_synthesizedPrintf_dut_printf_1_wire_enable_source_ready(
      sim_channelPorts_PrintfModule_synthesizedPrintf_dut_printf_1_wire_enable_source_ready),
    .channelPorts_PrintfModule_synthesizedPrintf_dut_printf_1_wire_enable_source_valid(
      sim_channelPorts_PrintfModule_synthesizedPrintf_dut_printf_1_wire_enable_source_valid),
    .channelPorts_PrintfModule_synthesizedPrintf_dut_printf_1_wire_enable_source_bits(
      sim_channelPorts_PrintfModule_synthesizedPrintf_dut_printf_1_wire_enable_source_bits),
    .channelPorts_PrintfModule_synthesizedPrintf_dut_printf_2_wire_args_1_source_ready(
      sim_channelPorts_PrintfModule_synthesizedPrintf_dut_printf_2_wire_args_1_source_ready),
    .channelPorts_PrintfModule_synthesizedPrintf_dut_printf_2_wire_args_1_source_valid(
      sim_channelPorts_PrintfModule_synthesizedPrintf_dut_printf_2_wire_args_1_source_valid),
    .channelPorts_PrintfModule_synthesizedPrintf_dut_printf_2_wire_args_1_source_bits(
      sim_channelPorts_PrintfModule_synthesizedPrintf_dut_printf_2_wire_args_1_source_bits),
    .channelPorts_PrintfModule_synthesizedPrintf_dut_printf_2_wire_args_0_source_ready(
      sim_channelPorts_PrintfModule_synthesizedPrintf_dut_printf_2_wire_args_0_source_ready),
    .channelPorts_PrintfModule_synthesizedPrintf_dut_printf_2_wire_args_0_source_valid(
      sim_channelPorts_PrintfModule_synthesizedPrintf_dut_printf_2_wire_args_0_source_valid),
    .channelPorts_PrintfModule_synthesizedPrintf_dut_printf_2_wire_args_0_source_bits(
      sim_channelPorts_PrintfModule_synthesizedPrintf_dut_printf_2_wire_args_0_source_bits),
    .channelPorts_PrintfModule_synthesizedPrintf_dut_printf_2_wire_enable_source_ready(
      sim_channelPorts_PrintfModule_synthesizedPrintf_dut_printf_2_wire_enable_source_ready),
    .channelPorts_PrintfModule_synthesizedPrintf_dut_printf_2_wire_enable_source_valid(
      sim_channelPorts_PrintfModule_synthesizedPrintf_dut_printf_2_wire_enable_source_valid),
    .channelPorts_PrintfModule_synthesizedPrintf_dut_printf_2_wire_enable_source_bits(
      sim_channelPorts_PrintfModule_synthesizedPrintf_dut_printf_2_wire_enable_source_bits),
    .channelPorts_PrintfModule_synthesizedPrintf_dut_childInst_printf_wire_args_1_source_ready(
      sim_channelPorts_PrintfModule_synthesizedPrintf_dut_childInst_printf_wire_args_1_source_ready),
    .channelPorts_PrintfModule_synthesizedPrintf_dut_childInst_printf_wire_args_1_source_valid(
      sim_channelPorts_PrintfModule_synthesizedPrintf_dut_childInst_printf_wire_args_1_source_valid),
    .channelPorts_PrintfModule_synthesizedPrintf_dut_childInst_printf_wire_args_1_source_bits(
      sim_channelPorts_PrintfModule_synthesizedPrintf_dut_childInst_printf_wire_args_1_source_bits),
    .channelPorts_PrintfModule_synthesizedPrintf_dut_childInst_printf_wire_args_0_source_ready(
      sim_channelPorts_PrintfModule_synthesizedPrintf_dut_childInst_printf_wire_args_0_source_ready),
    .channelPorts_PrintfModule_synthesizedPrintf_dut_childInst_printf_wire_args_0_source_valid(
      sim_channelPorts_PrintfModule_synthesizedPrintf_dut_childInst_printf_wire_args_0_source_valid),
    .channelPorts_PrintfModule_synthesizedPrintf_dut_childInst_printf_wire_args_0_source_bits(
      sim_channelPorts_PrintfModule_synthesizedPrintf_dut_childInst_printf_wire_args_0_source_bits),
    .channelPorts_PrintfModule_synthesizedPrintf_dut_childInst_printf_wire_enable_source_ready(
      sim_channelPorts_PrintfModule_synthesizedPrintf_dut_childInst_printf_wire_enable_source_ready),
    .channelPorts_PrintfModule_synthesizedPrintf_dut_childInst_printf_wire_enable_source_valid(
      sim_channelPorts_PrintfModule_synthesizedPrintf_dut_childInst_printf_wire_enable_source_valid),
    .channelPorts_PrintfModule_synthesizedPrintf_dut_childInst_printf_wire_enable_source_bits(
      sim_channelPorts_PrintfModule_synthesizedPrintf_dut_childInst_printf_wire_enable_source_bits),
    .channelPorts_PrintfModule_synthesizedPrintf_dut_printf_wire_args_0_source_ready(
      sim_channelPorts_PrintfModule_synthesizedPrintf_dut_printf_wire_args_0_source_ready),
    .channelPorts_PrintfModule_synthesizedPrintf_dut_printf_wire_args_0_source_valid(
      sim_channelPorts_PrintfModule_synthesizedPrintf_dut_printf_wire_args_0_source_valid),
    .channelPorts_PrintfModule_synthesizedPrintf_dut_printf_wire_args_0_source_bits(
      sim_channelPorts_PrintfModule_synthesizedPrintf_dut_printf_wire_args_0_source_bits),
    .channelPorts_PrintfModule_synthesizedPrintf_dut_printf_wire_enable_source_ready(
      sim_channelPorts_PrintfModule_synthesizedPrintf_dut_printf_wire_enable_source_ready),
    .channelPorts_PrintfModule_synthesizedPrintf_dut_printf_wire_enable_source_valid(
      sim_channelPorts_PrintfModule_synthesizedPrintf_dut_printf_wire_enable_source_valid),
    .channelPorts_PrintfModule_synthesizedPrintf_dut_printf_wire_enable_source_bits(
      sim_channelPorts_PrintfModule_synthesizedPrintf_dut_printf_wire_enable_source_bits),
    .channelPorts_PrintfModule_synthesizedPrintf_RationalClockBridge_clocks_0_globalReset_source_ready(
      sim_channelPorts_PrintfModule_synthesizedPrintf_RationalClockBridge_clocks_0_globalReset_source_ready),
    .channelPorts_PrintfModule_synthesizedPrintf_RationalClockBridge_clocks_0_globalReset_source_valid(
      sim_channelPorts_PrintfModule_synthesizedPrintf_RationalClockBridge_clocks_0_globalReset_source_valid),
    .channelPorts_PrintfModule_synthesizedPrintf_RationalClockBridge_clocks_0_globalReset_source_bits(
      sim_channelPorts_PrintfModule_synthesizedPrintf_RationalClockBridge_clocks_0_globalReset_source_bits),
    .channelPorts_PrintfModule_peekPokeBridge_io_a_sink_ready(
      sim_channelPorts_PrintfModule_peekPokeBridge_io_a_sink_ready),
    .channelPorts_PrintfModule_peekPokeBridge_io_a_sink_valid(
      sim_channelPorts_PrintfModule_peekPokeBridge_io_a_sink_valid),
    .channelPorts_PrintfModule_peekPokeBridge_io_a_sink_bits(sim_channelPorts_PrintfModule_peekPokeBridge_io_a_sink_bits
      ),
    .channelPorts_PrintfModule_peekPokeBridge_io_b_sink_ready(
      sim_channelPorts_PrintfModule_peekPokeBridge_io_b_sink_ready),
    .channelPorts_PrintfModule_peekPokeBridge_io_b_sink_valid(
      sim_channelPorts_PrintfModule_peekPokeBridge_io_b_sink_valid),
    .channelPorts_PrintfModule_peekPokeBridge_io_b_sink_bits(sim_channelPorts_PrintfModule_peekPokeBridge_io_b_sink_bits
      ),
    .channelPorts_PrintfModule_peekPokeBridge_reset_sink_ready(
      sim_channelPorts_PrintfModule_peekPokeBridge_reset_sink_ready),
    .channelPorts_PrintfModule_peekPokeBridge_reset_sink_valid(
      sim_channelPorts_PrintfModule_peekPokeBridge_reset_sink_valid),
    .channelPorts_PrintfModule_peekPokeBridge_reset_sink_bits(
      sim_channelPorts_PrintfModule_peekPokeBridge_reset_sink_bits),
    .channelPorts_PrintfModule_RationalClockBridge_clocks_0_sink_ready(
      sim_channelPorts_PrintfModule_RationalClockBridge_clocks_0_sink_ready)
  );
  NastiRecursiveInterconnect ctrlInterconnect ( // @[Widget.scala 324:34]
    .clock(ctrlInterconnect_clock),
    .reset(ctrlInterconnect_reset),
    .io_masters_0_aw_ready(ctrlInterconnect_io_masters_0_aw_ready),
    .io_masters_0_aw_valid(ctrlInterconnect_io_masters_0_aw_valid),
    .io_masters_0_aw_bits_addr(ctrlInterconnect_io_masters_0_aw_bits_addr),
    .io_masters_0_aw_bits_len(ctrlInterconnect_io_masters_0_aw_bits_len),
    .io_masters_0_aw_bits_id(ctrlInterconnect_io_masters_0_aw_bits_id),
    .io_masters_0_w_ready(ctrlInterconnect_io_masters_0_w_ready),
    .io_masters_0_w_valid(ctrlInterconnect_io_masters_0_w_valid),
    .io_masters_0_w_bits_data(ctrlInterconnect_io_masters_0_w_bits_data),
    .io_masters_0_w_bits_last(ctrlInterconnect_io_masters_0_w_bits_last),
    .io_masters_0_b_ready(ctrlInterconnect_io_masters_0_b_ready),
    .io_masters_0_b_valid(ctrlInterconnect_io_masters_0_b_valid),
    .io_masters_0_b_bits_resp(ctrlInterconnect_io_masters_0_b_bits_resp),
    .io_masters_0_b_bits_id(ctrlInterconnect_io_masters_0_b_bits_id),
    .io_masters_0_ar_ready(ctrlInterconnect_io_masters_0_ar_ready),
    .io_masters_0_ar_valid(ctrlInterconnect_io_masters_0_ar_valid),
    .io_masters_0_ar_bits_addr(ctrlInterconnect_io_masters_0_ar_bits_addr),
    .io_masters_0_ar_bits_len(ctrlInterconnect_io_masters_0_ar_bits_len),
    .io_masters_0_ar_bits_id(ctrlInterconnect_io_masters_0_ar_bits_id),
    .io_masters_0_r_ready(ctrlInterconnect_io_masters_0_r_ready),
    .io_masters_0_r_valid(ctrlInterconnect_io_masters_0_r_valid),
    .io_masters_0_r_bits_resp(ctrlInterconnect_io_masters_0_r_bits_resp),
    .io_masters_0_r_bits_data(ctrlInterconnect_io_masters_0_r_bits_data),
    .io_masters_0_r_bits_last(ctrlInterconnect_io_masters_0_r_bits_last),
    .io_masters_0_r_bits_id(ctrlInterconnect_io_masters_0_r_bits_id),
    .io_slaves_0_aw_ready(ctrlInterconnect_io_slaves_0_aw_ready),
    .io_slaves_0_aw_valid(ctrlInterconnect_io_slaves_0_aw_valid),
    .io_slaves_0_aw_bits_addr(ctrlInterconnect_io_slaves_0_aw_bits_addr),
    .io_slaves_0_aw_bits_len(ctrlInterconnect_io_slaves_0_aw_bits_len),
    .io_slaves_0_aw_bits_id(ctrlInterconnect_io_slaves_0_aw_bits_id),
    .io_slaves_0_w_ready(ctrlInterconnect_io_slaves_0_w_ready),
    .io_slaves_0_w_valid(ctrlInterconnect_io_slaves_0_w_valid),
    .io_slaves_0_w_bits_data(ctrlInterconnect_io_slaves_0_w_bits_data),
    .io_slaves_0_b_ready(ctrlInterconnect_io_slaves_0_b_ready),
    .io_slaves_0_b_valid(ctrlInterconnect_io_slaves_0_b_valid),
    .io_slaves_0_b_bits_id(ctrlInterconnect_io_slaves_0_b_bits_id),
    .io_slaves_0_ar_ready(ctrlInterconnect_io_slaves_0_ar_ready),
    .io_slaves_0_ar_valid(ctrlInterconnect_io_slaves_0_ar_valid),
    .io_slaves_0_ar_bits_addr(ctrlInterconnect_io_slaves_0_ar_bits_addr),
    .io_slaves_0_ar_bits_len(ctrlInterconnect_io_slaves_0_ar_bits_len),
    .io_slaves_0_ar_bits_id(ctrlInterconnect_io_slaves_0_ar_bits_id),
    .io_slaves_0_r_ready(ctrlInterconnect_io_slaves_0_r_ready),
    .io_slaves_0_r_valid(ctrlInterconnect_io_slaves_0_r_valid),
    .io_slaves_0_r_bits_data(ctrlInterconnect_io_slaves_0_r_bits_data),
    .io_slaves_0_r_bits_id(ctrlInterconnect_io_slaves_0_r_bits_id),
    .io_slaves_1_aw_ready(ctrlInterconnect_io_slaves_1_aw_ready),
    .io_slaves_1_aw_valid(ctrlInterconnect_io_slaves_1_aw_valid),
    .io_slaves_1_aw_bits_addr(ctrlInterconnect_io_slaves_1_aw_bits_addr),
    .io_slaves_1_aw_bits_len(ctrlInterconnect_io_slaves_1_aw_bits_len),
    .io_slaves_1_aw_bits_id(ctrlInterconnect_io_slaves_1_aw_bits_id),
    .io_slaves_1_w_ready(ctrlInterconnect_io_slaves_1_w_ready),
    .io_slaves_1_w_valid(ctrlInterconnect_io_slaves_1_w_valid),
    .io_slaves_1_w_bits_data(ctrlInterconnect_io_slaves_1_w_bits_data),
    .io_slaves_1_b_ready(ctrlInterconnect_io_slaves_1_b_ready),
    .io_slaves_1_b_valid(ctrlInterconnect_io_slaves_1_b_valid),
    .io_slaves_1_b_bits_id(ctrlInterconnect_io_slaves_1_b_bits_id),
    .io_slaves_1_ar_ready(ctrlInterconnect_io_slaves_1_ar_ready),
    .io_slaves_1_ar_valid(ctrlInterconnect_io_slaves_1_ar_valid),
    .io_slaves_1_ar_bits_addr(ctrlInterconnect_io_slaves_1_ar_bits_addr),
    .io_slaves_1_ar_bits_len(ctrlInterconnect_io_slaves_1_ar_bits_len),
    .io_slaves_1_ar_bits_id(ctrlInterconnect_io_slaves_1_ar_bits_id),
    .io_slaves_1_r_ready(ctrlInterconnect_io_slaves_1_r_ready),
    .io_slaves_1_r_valid(ctrlInterconnect_io_slaves_1_r_valid),
    .io_slaves_1_r_bits_data(ctrlInterconnect_io_slaves_1_r_bits_data),
    .io_slaves_1_r_bits_id(ctrlInterconnect_io_slaves_1_r_bits_id),
    .io_slaves_2_aw_ready(ctrlInterconnect_io_slaves_2_aw_ready),
    .io_slaves_2_aw_valid(ctrlInterconnect_io_slaves_2_aw_valid),
    .io_slaves_2_aw_bits_addr(ctrlInterconnect_io_slaves_2_aw_bits_addr),
    .io_slaves_2_aw_bits_len(ctrlInterconnect_io_slaves_2_aw_bits_len),
    .io_slaves_2_aw_bits_id(ctrlInterconnect_io_slaves_2_aw_bits_id),
    .io_slaves_2_w_ready(ctrlInterconnect_io_slaves_2_w_ready),
    .io_slaves_2_w_valid(ctrlInterconnect_io_slaves_2_w_valid),
    .io_slaves_2_w_bits_data(ctrlInterconnect_io_slaves_2_w_bits_data),
    .io_slaves_2_b_ready(ctrlInterconnect_io_slaves_2_b_ready),
    .io_slaves_2_b_valid(ctrlInterconnect_io_slaves_2_b_valid),
    .io_slaves_2_b_bits_id(ctrlInterconnect_io_slaves_2_b_bits_id),
    .io_slaves_2_ar_ready(ctrlInterconnect_io_slaves_2_ar_ready),
    .io_slaves_2_ar_valid(ctrlInterconnect_io_slaves_2_ar_valid),
    .io_slaves_2_ar_bits_addr(ctrlInterconnect_io_slaves_2_ar_bits_addr),
    .io_slaves_2_ar_bits_len(ctrlInterconnect_io_slaves_2_ar_bits_len),
    .io_slaves_2_ar_bits_id(ctrlInterconnect_io_slaves_2_ar_bits_id),
    .io_slaves_2_r_ready(ctrlInterconnect_io_slaves_2_r_ready),
    .io_slaves_2_r_valid(ctrlInterconnect_io_slaves_2_r_valid),
    .io_slaves_2_r_bits_data(ctrlInterconnect_io_slaves_2_r_bits_data),
    .io_slaves_2_r_bits_id(ctrlInterconnect_io_slaves_2_r_bits_id),
    .io_slaves_3_aw_ready(ctrlInterconnect_io_slaves_3_aw_ready),
    .io_slaves_3_aw_valid(ctrlInterconnect_io_slaves_3_aw_valid),
    .io_slaves_3_aw_bits_addr(ctrlInterconnect_io_slaves_3_aw_bits_addr),
    .io_slaves_3_aw_bits_len(ctrlInterconnect_io_slaves_3_aw_bits_len),
    .io_slaves_3_aw_bits_id(ctrlInterconnect_io_slaves_3_aw_bits_id),
    .io_slaves_3_w_ready(ctrlInterconnect_io_slaves_3_w_ready),
    .io_slaves_3_w_valid(ctrlInterconnect_io_slaves_3_w_valid),
    .io_slaves_3_w_bits_data(ctrlInterconnect_io_slaves_3_w_bits_data),
    .io_slaves_3_b_ready(ctrlInterconnect_io_slaves_3_b_ready),
    .io_slaves_3_b_valid(ctrlInterconnect_io_slaves_3_b_valid),
    .io_slaves_3_b_bits_id(ctrlInterconnect_io_slaves_3_b_bits_id),
    .io_slaves_3_ar_ready(ctrlInterconnect_io_slaves_3_ar_ready),
    .io_slaves_3_ar_valid(ctrlInterconnect_io_slaves_3_ar_valid),
    .io_slaves_3_ar_bits_addr(ctrlInterconnect_io_slaves_3_ar_bits_addr),
    .io_slaves_3_ar_bits_len(ctrlInterconnect_io_slaves_3_ar_bits_len),
    .io_slaves_3_ar_bits_id(ctrlInterconnect_io_slaves_3_ar_bits_id),
    .io_slaves_3_r_ready(ctrlInterconnect_io_slaves_3_r_ready),
    .io_slaves_3_r_valid(ctrlInterconnect_io_slaves_3_r_valid),
    .io_slaves_3_r_bits_data(ctrlInterconnect_io_slaves_3_r_bits_data),
    .io_slaves_3_r_bits_id(ctrlInterconnect_io_slaves_3_r_bits_id),
    .io_slaves_4_aw_ready(ctrlInterconnect_io_slaves_4_aw_ready),
    .io_slaves_4_aw_valid(ctrlInterconnect_io_slaves_4_aw_valid),
    .io_slaves_4_aw_bits_len(ctrlInterconnect_io_slaves_4_aw_bits_len),
    .io_slaves_4_aw_bits_id(ctrlInterconnect_io_slaves_4_aw_bits_id),
    .io_slaves_4_w_ready(ctrlInterconnect_io_slaves_4_w_ready),
    .io_slaves_4_w_valid(ctrlInterconnect_io_slaves_4_w_valid),
    .io_slaves_4_w_bits_data(ctrlInterconnect_io_slaves_4_w_bits_data),
    .io_slaves_4_b_ready(ctrlInterconnect_io_slaves_4_b_ready),
    .io_slaves_4_b_valid(ctrlInterconnect_io_slaves_4_b_valid),
    .io_slaves_4_b_bits_id(ctrlInterconnect_io_slaves_4_b_bits_id),
    .io_slaves_4_ar_ready(ctrlInterconnect_io_slaves_4_ar_ready),
    .io_slaves_4_ar_valid(ctrlInterconnect_io_slaves_4_ar_valid),
    .io_slaves_4_ar_bits_len(ctrlInterconnect_io_slaves_4_ar_bits_len),
    .io_slaves_4_ar_bits_id(ctrlInterconnect_io_slaves_4_ar_bits_id),
    .io_slaves_4_r_ready(ctrlInterconnect_io_slaves_4_r_ready),
    .io_slaves_4_r_valid(ctrlInterconnect_io_slaves_4_r_valid),
    .io_slaves_4_r_bits_data(ctrlInterconnect_io_slaves_4_r_bits_data),
    .io_slaves_4_r_bits_id(ctrlInterconnect_io_slaves_4_r_bits_id)
  );
  assign ctrl_aw_ready = ctrlInterconnect_io_masters_0_aw_ready; // @[Widget.scala 330:36]
  assign ctrl_w_ready = ctrlInterconnect_io_masters_0_w_ready; // @[Widget.scala 330:36]
  assign ctrl_b_valid = ctrlInterconnect_io_masters_0_b_valid; // @[Widget.scala 330:36]
  assign ctrl_b_bits_resp = ctrlInterconnect_io_masters_0_b_bits_resp; // @[Widget.scala 330:36]
  assign ctrl_b_bits_id = ctrlInterconnect_io_masters_0_b_bits_id; // @[Widget.scala 330:36]
  assign ctrl_b_bits_user = 1'h0; // @[Widget.scala 330:36]
  assign ctrl_ar_ready = ctrlInterconnect_io_masters_0_ar_ready; // @[Widget.scala 330:36]
  assign ctrl_r_valid = ctrlInterconnect_io_masters_0_r_valid; // @[Widget.scala 330:36]
  assign ctrl_r_bits_resp = ctrlInterconnect_io_masters_0_r_bits_resp; // @[Widget.scala 330:36]
  assign ctrl_r_bits_data = ctrlInterconnect_io_masters_0_r_bits_data; // @[Widget.scala 330:36]
  assign ctrl_r_bits_last = ctrlInterconnect_io_masters_0_r_bits_last; // @[Widget.scala 330:36]
  assign ctrl_r_bits_id = ctrlInterconnect_io_masters_0_r_bits_id; // @[Widget.scala 330:36]
  assign ctrl_r_bits_user = 1'h0; // @[Widget.scala 330:36]
  assign fpga_managed_axi4_aw_valid = axi4index_auto_out_aw_valid; // @[Nodes.scala 1215:84 LazyModule.scala 353:16]
  assign fpga_managed_axi4_aw_bits_id = axi4index_auto_out_aw_bits_id; // @[Nodes.scala 1215:84 LazyModule.scala 353:16]
  assign fpga_managed_axi4_aw_bits_addr = axi4index_auto_out_aw_bits_addr; // @[Nodes.scala 1215:84 LazyModule.scala 353:16]
  assign fpga_managed_axi4_aw_bits_len = axi4index_auto_out_aw_bits_len; // @[Nodes.scala 1215:84 LazyModule.scala 353:16]
  assign fpga_managed_axi4_aw_bits_size = axi4index_auto_out_aw_bits_size; // @[Nodes.scala 1215:84 LazyModule.scala 353:16]
  assign fpga_managed_axi4_aw_bits_burst = axi4index_auto_out_aw_bits_burst; // @[Nodes.scala 1215:84 LazyModule.scala 353:16]
  assign fpga_managed_axi4_aw_bits_lock = axi4index_auto_out_aw_bits_lock; // @[Nodes.scala 1215:84 LazyModule.scala 353:16]
  assign fpga_managed_axi4_aw_bits_cache = axi4index_auto_out_aw_bits_cache; // @[Nodes.scala 1215:84 LazyModule.scala 353:16]
  assign fpga_managed_axi4_aw_bits_prot = axi4index_auto_out_aw_bits_prot; // @[Nodes.scala 1215:84 LazyModule.scala 353:16]
  assign fpga_managed_axi4_aw_bits_qos = axi4index_auto_out_aw_bits_qos; // @[Nodes.scala 1215:84 LazyModule.scala 353:16]
  assign fpga_managed_axi4_w_valid = axi4index_auto_out_w_valid; // @[Nodes.scala 1215:84 LazyModule.scala 353:16]
  assign fpga_managed_axi4_w_bits_data = axi4index_auto_out_w_bits_data; // @[Nodes.scala 1215:84 LazyModule.scala 353:16]
  assign fpga_managed_axi4_w_bits_strb = axi4index_auto_out_w_bits_strb; // @[Nodes.scala 1215:84 LazyModule.scala 353:16]
  assign fpga_managed_axi4_w_bits_last = axi4index_auto_out_w_bits_last; // @[Nodes.scala 1215:84 LazyModule.scala 353:16]
  assign fpga_managed_axi4_b_ready = axi4index_auto_out_b_ready; // @[Nodes.scala 1215:84 LazyModule.scala 353:16]
  assign fpga_managed_axi4_ar_valid = axi4index_auto_out_ar_valid; // @[Nodes.scala 1215:84 LazyModule.scala 353:16]
  assign fpga_managed_axi4_ar_bits_id = axi4index_auto_out_ar_bits_id; // @[Nodes.scala 1215:84 LazyModule.scala 353:16]
  assign fpga_managed_axi4_ar_bits_addr = axi4index_auto_out_ar_bits_addr; // @[Nodes.scala 1215:84 LazyModule.scala 353:16]
  assign fpga_managed_axi4_ar_bits_len = axi4index_auto_out_ar_bits_len; // @[Nodes.scala 1215:84 LazyModule.scala 353:16]
  assign fpga_managed_axi4_ar_bits_size = axi4index_auto_out_ar_bits_size; // @[Nodes.scala 1215:84 LazyModule.scala 353:16]
  assign fpga_managed_axi4_ar_bits_burst = axi4index_auto_out_ar_bits_burst; // @[Nodes.scala 1215:84 LazyModule.scala 353:16]
  assign fpga_managed_axi4_ar_bits_lock = axi4index_auto_out_ar_bits_lock; // @[Nodes.scala 1215:84 LazyModule.scala 353:16]
  assign fpga_managed_axi4_ar_bits_cache = axi4index_auto_out_ar_bits_cache; // @[Nodes.scala 1215:84 LazyModule.scala 353:16]
  assign fpga_managed_axi4_ar_bits_prot = axi4index_auto_out_ar_bits_prot; // @[Nodes.scala 1215:84 LazyModule.scala 353:16]
  assign fpga_managed_axi4_ar_bits_qos = axi4index_auto_out_ar_bits_qos; // @[Nodes.scala 1215:84 LazyModule.scala 353:16]
  assign fpga_managed_axi4_r_ready = axi4index_auto_out_r_ready; // @[Nodes.scala 1215:84 LazyModule.scala 353:16]
  assign SimulationMaster_0_clock = clock;
  assign SimulationMaster_0_reset = reset;
  assign SimulationMaster_0_io_ctrl_aw_valid = ctrlInterconnect_io_slaves_4_aw_valid; // @[Widget.scala 332:24]
  assign SimulationMaster_0_io_ctrl_aw_bits_len = ctrlInterconnect_io_slaves_4_aw_bits_len; // @[Widget.scala 332:24]
  assign SimulationMaster_0_io_ctrl_aw_bits_id = ctrlInterconnect_io_slaves_4_aw_bits_id; // @[Widget.scala 332:24]
  assign SimulationMaster_0_io_ctrl_w_valid = ctrlInterconnect_io_slaves_4_w_valid; // @[Widget.scala 332:24]
  assign SimulationMaster_0_io_ctrl_w_bits_data = ctrlInterconnect_io_slaves_4_w_bits_data; // @[Widget.scala 332:24]
  assign SimulationMaster_0_io_ctrl_b_ready = ctrlInterconnect_io_slaves_4_b_ready; // @[Widget.scala 332:24]
  assign SimulationMaster_0_io_ctrl_ar_valid = ctrlInterconnect_io_slaves_4_ar_valid; // @[Widget.scala 332:24]
  assign SimulationMaster_0_io_ctrl_ar_bits_len = ctrlInterconnect_io_slaves_4_ar_bits_len; // @[Widget.scala 332:24]
  assign SimulationMaster_0_io_ctrl_ar_bits_id = ctrlInterconnect_io_slaves_4_ar_bits_id; // @[Widget.scala 332:24]
  assign SimulationMaster_0_io_ctrl_r_ready = ctrlInterconnect_io_slaves_4_r_ready; // @[Widget.scala 332:24]
  assign ClockBridgeModule_0_clock = clock;
  assign ClockBridgeModule_0_reset = reset;
  assign ClockBridgeModule_0_io_ctrl_aw_valid = ctrlInterconnect_io_slaves_1_aw_valid; // @[Widget.scala 332:24]
  assign ClockBridgeModule_0_io_ctrl_aw_bits_addr = ctrlInterconnect_io_slaves_1_aw_bits_addr; // @[Widget.scala 332:24]
  assign ClockBridgeModule_0_io_ctrl_aw_bits_len = ctrlInterconnect_io_slaves_1_aw_bits_len; // @[Widget.scala 332:24]
  assign ClockBridgeModule_0_io_ctrl_aw_bits_id = ctrlInterconnect_io_slaves_1_aw_bits_id; // @[Widget.scala 332:24]
  assign ClockBridgeModule_0_io_ctrl_w_valid = ctrlInterconnect_io_slaves_1_w_valid; // @[Widget.scala 332:24]
  assign ClockBridgeModule_0_io_ctrl_w_bits_data = ctrlInterconnect_io_slaves_1_w_bits_data; // @[Widget.scala 332:24]
  assign ClockBridgeModule_0_io_ctrl_b_ready = ctrlInterconnect_io_slaves_1_b_ready; // @[Widget.scala 332:24]
  assign ClockBridgeModule_0_io_ctrl_ar_valid = ctrlInterconnect_io_slaves_1_ar_valid; // @[Widget.scala 332:24]
  assign ClockBridgeModule_0_io_ctrl_ar_bits_addr = ctrlInterconnect_io_slaves_1_ar_bits_addr; // @[Widget.scala 332:24]
  assign ClockBridgeModule_0_io_ctrl_ar_bits_len = ctrlInterconnect_io_slaves_1_ar_bits_len; // @[Widget.scala 332:24]
  assign ClockBridgeModule_0_io_ctrl_ar_bits_id = ctrlInterconnect_io_slaves_1_ar_bits_id; // @[Widget.scala 332:24]
  assign ClockBridgeModule_0_io_ctrl_r_ready = ctrlInterconnect_io_slaves_1_r_ready; // @[Widget.scala 332:24]
  assign ClockBridgeModule_0_hPort_clocks_ready = sim_channelPorts_PrintfModule_RationalClockBridge_clocks_0_sink_ready; // @[ClockBridge.scala 131:30]
  assign PeekPokeBridgeModule_0_clock = clock;
  assign PeekPokeBridgeModule_0_reset = reset;
  assign PeekPokeBridgeModule_0_io_ctrl_aw_valid = ctrlInterconnect_io_slaves_0_aw_valid; // @[Widget.scala 332:24]
  assign PeekPokeBridgeModule_0_io_ctrl_aw_bits_addr = ctrlInterconnect_io_slaves_0_aw_bits_addr; // @[Widget.scala 332:24]
  assign PeekPokeBridgeModule_0_io_ctrl_aw_bits_len = ctrlInterconnect_io_slaves_0_aw_bits_len; // @[Widget.scala 332:24]
  assign PeekPokeBridgeModule_0_io_ctrl_aw_bits_id = ctrlInterconnect_io_slaves_0_aw_bits_id; // @[Widget.scala 332:24]
  assign PeekPokeBridgeModule_0_io_ctrl_w_valid = ctrlInterconnect_io_slaves_0_w_valid; // @[Widget.scala 332:24]
  assign PeekPokeBridgeModule_0_io_ctrl_w_bits_data = ctrlInterconnect_io_slaves_0_w_bits_data; // @[Widget.scala 332:24]
  assign PeekPokeBridgeModule_0_io_ctrl_b_ready = ctrlInterconnect_io_slaves_0_b_ready; // @[Widget.scala 332:24]
  assign PeekPokeBridgeModule_0_io_ctrl_ar_valid = ctrlInterconnect_io_slaves_0_ar_valid; // @[Widget.scala 332:24]
  assign PeekPokeBridgeModule_0_io_ctrl_ar_bits_addr = ctrlInterconnect_io_slaves_0_ar_bits_addr; // @[Widget.scala 332:24]
  assign PeekPokeBridgeModule_0_io_ctrl_ar_bits_len = ctrlInterconnect_io_slaves_0_ar_bits_len; // @[Widget.scala 332:24]
  assign PeekPokeBridgeModule_0_io_ctrl_ar_bits_id = ctrlInterconnect_io_slaves_0_ar_bits_id; // @[Widget.scala 332:24]
  assign PeekPokeBridgeModule_0_io_ctrl_r_ready = ctrlInterconnect_io_slaves_0_r_ready; // @[Widget.scala 332:24]
  assign PeekPokeBridgeModule_0_hPort_io_a_ready = sim_channelPorts_PrintfModule_peekPokeBridge_io_a_sink_ready; // @[ChannelizedHostPort.scala 113:64]
  assign PeekPokeBridgeModule_0_hPort_io_b_ready = sim_channelPorts_PrintfModule_peekPokeBridge_io_b_sink_ready; // @[ChannelizedHostPort.scala 113:64]
  assign PeekPokeBridgeModule_0_hPort_reset_ready = sim_channelPorts_PrintfModule_peekPokeBridge_reset_sink_ready; // @[ChannelizedHostPort.scala 113:64]
  assign PrintBridgeModule_0_clock = clock;
  assign PrintBridgeModule_0_reset = reset;
  assign PrintBridgeModule_0_streamToHostCPU_ready = FPGAManagedStreamEngine_0_streamsToHostCPU_0_ready; // @[FPGATop.scala 420:12]
  assign PrintBridgeModule_0_io_ctrl_aw_valid = ctrlInterconnect_io_slaves_2_aw_valid; // @[Widget.scala 332:24]
  assign PrintBridgeModule_0_io_ctrl_aw_bits_addr = ctrlInterconnect_io_slaves_2_aw_bits_addr; // @[Widget.scala 332:24]
  assign PrintBridgeModule_0_io_ctrl_aw_bits_len = ctrlInterconnect_io_slaves_2_aw_bits_len; // @[Widget.scala 332:24]
  assign PrintBridgeModule_0_io_ctrl_aw_bits_id = ctrlInterconnect_io_slaves_2_aw_bits_id; // @[Widget.scala 332:24]
  assign PrintBridgeModule_0_io_ctrl_w_valid = ctrlInterconnect_io_slaves_2_w_valid; // @[Widget.scala 332:24]
  assign PrintBridgeModule_0_io_ctrl_w_bits_data = ctrlInterconnect_io_slaves_2_w_bits_data; // @[Widget.scala 332:24]
  assign PrintBridgeModule_0_io_ctrl_b_ready = ctrlInterconnect_io_slaves_2_b_ready; // @[Widget.scala 332:24]
  assign PrintBridgeModule_0_io_ctrl_ar_valid = ctrlInterconnect_io_slaves_2_ar_valid; // @[Widget.scala 332:24]
  assign PrintBridgeModule_0_io_ctrl_ar_bits_addr = ctrlInterconnect_io_slaves_2_ar_bits_addr; // @[Widget.scala 332:24]
  assign PrintBridgeModule_0_io_ctrl_ar_bits_len = ctrlInterconnect_io_slaves_2_ar_bits_len; // @[Widget.scala 332:24]
  assign PrintBridgeModule_0_io_ctrl_ar_bits_id = ctrlInterconnect_io_slaves_2_ar_bits_id; // @[Widget.scala 332:24]
  assign PrintBridgeModule_0_io_ctrl_r_ready = ctrlInterconnect_io_slaves_2_r_ready; // @[Widget.scala 332:24]
  assign PrintBridgeModule_0_hPort_hBits_synthesizedPrintf_dut_printf_1_wire_args_1 =
    sim_channelPorts_PrintfModule_synthesizedPrintf_dut_printf_1_wire_args_1_source_bits; // @[HostPort.scala 72:13]
  assign PrintBridgeModule_0_hPort_hBits_synthesizedPrintf_dut_printf_1_wire_args_0 =
    sim_channelPorts_PrintfModule_synthesizedPrintf_dut_printf_1_wire_args_0_source_bits; // @[HostPort.scala 72:13]
  assign PrintBridgeModule_0_hPort_hBits_synthesizedPrintf_dut_printf_1_wire_enable =
    sim_channelPorts_PrintfModule_synthesizedPrintf_dut_printf_1_wire_enable_source_bits; // @[HostPort.scala 72:13]
  assign PrintBridgeModule_0_hPort_hBits_synthesizedPrintf_dut_printf_2_wire_args_1 =
    sim_channelPorts_PrintfModule_synthesizedPrintf_dut_printf_2_wire_args_1_source_bits; // @[HostPort.scala 72:13]
  assign PrintBridgeModule_0_hPort_hBits_synthesizedPrintf_dut_printf_2_wire_args_0 =
    sim_channelPorts_PrintfModule_synthesizedPrintf_dut_printf_2_wire_args_0_source_bits; // @[HostPort.scala 72:13]
  assign PrintBridgeModule_0_hPort_hBits_synthesizedPrintf_dut_printf_2_wire_enable =
    sim_channelPorts_PrintfModule_synthesizedPrintf_dut_printf_2_wire_enable_source_bits; // @[HostPort.scala 72:13]
  assign PrintBridgeModule_0_hPort_hBits_synthesizedPrintf_dut_childInst_printf_wire_args_1 =
    sim_channelPorts_PrintfModule_synthesizedPrintf_dut_childInst_printf_wire_args_1_source_bits; // @[HostPort.scala 72:13]
  assign PrintBridgeModule_0_hPort_hBits_synthesizedPrintf_dut_childInst_printf_wire_args_0 =
    sim_channelPorts_PrintfModule_synthesizedPrintf_dut_childInst_printf_wire_args_0_source_bits; // @[HostPort.scala 72:13]
  assign PrintBridgeModule_0_hPort_hBits_synthesizedPrintf_dut_childInst_printf_wire_enable =
    sim_channelPorts_PrintfModule_synthesizedPrintf_dut_childInst_printf_wire_enable_source_bits; // @[HostPort.scala 72:13]
  assign PrintBridgeModule_0_hPort_hBits_synthesizedPrintf_dut_printf_wire_args_0 =
    sim_channelPorts_PrintfModule_synthesizedPrintf_dut_printf_wire_args_0_source_bits; // @[HostPort.scala 72:13]
  assign PrintBridgeModule_0_hPort_hBits_synthesizedPrintf_dut_printf_wire_enable =
    sim_channelPorts_PrintfModule_synthesizedPrintf_dut_printf_wire_enable_source_bits; // @[HostPort.scala 72:13]
  assign PrintBridgeModule_0_hPort_hBits_synthesizedPrintf_RationalClockBridge_clocks_0_globalReset =
    sim_channelPorts_PrintfModule_synthesizedPrintf_RationalClockBridge_clocks_0_globalReset_source_bits; // @[HostPort.scala 72:13]
  assign PrintBridgeModule_0_hPort_toHost_hValid =
    sim_channelPorts_PrintfModule_synthesizedPrintf_RationalClockBridge_clocks_0_globalReset_source_valid &
    sim_channelPorts_PrintfModule_synthesizedPrintf_dut_printf_wire_enable_source_valid &
    sim_channelPorts_PrintfModule_synthesizedPrintf_dut_printf_wire_args_0_source_valid &
    sim_channelPorts_PrintfModule_synthesizedPrintf_dut_childInst_printf_wire_enable_source_valid &
    sim_channelPorts_PrintfModule_synthesizedPrintf_dut_childInst_printf_wire_args_0_source_valid &
    sim_channelPorts_PrintfModule_synthesizedPrintf_dut_childInst_printf_wire_args_1_source_valid &
    sim_channelPorts_PrintfModule_synthesizedPrintf_dut_printf_2_wire_enable_source_valid &
    sim_channelPorts_PrintfModule_synthesizedPrintf_dut_printf_2_wire_args_0_source_valid &
    sim_channelPorts_PrintfModule_synthesizedPrintf_dut_printf_2_wire_args_1_source_valid &
    sim_channelPorts_PrintfModule_synthesizedPrintf_dut_printf_1_wire_enable_source_valid &
    sim_channelPorts_PrintfModule_synthesizedPrintf_dut_printf_1_wire_args_0_source_valid &
    sim_channelPorts_PrintfModule_synthesizedPrintf_dut_printf_1_wire_args_1_source_valid; // @[HostPort.scala 105:56]
  assign FPGAManagedStreamEngine_0_clock = clock;
  assign FPGAManagedStreamEngine_0_reset = reset;
  assign FPGAManagedStreamEngine_0_auto_axi4xbar_out_aw_ready = axi4buf_auto_in_aw_ready; // @[LazyModule.scala 355:16]
  assign FPGAManagedStreamEngine_0_auto_axi4xbar_out_w_ready = axi4buf_auto_in_w_ready; // @[LazyModule.scala 355:16]
  assign FPGAManagedStreamEngine_0_auto_axi4xbar_out_b_valid = axi4buf_auto_in_b_valid; // @[LazyModule.scala 355:16]
  assign FPGAManagedStreamEngine_0_auto_axi4xbar_out_b_bits_id = axi4buf_auto_in_b_bits_id; // @[LazyModule.scala 355:16]
  assign FPGAManagedStreamEngine_0_auto_axi4xbar_out_ar_ready = axi4buf_auto_in_ar_ready; // @[LazyModule.scala 355:16]
  assign FPGAManagedStreamEngine_0_auto_axi4xbar_out_r_valid = axi4buf_auto_in_r_valid; // @[LazyModule.scala 355:16]
  assign FPGAManagedStreamEngine_0_auto_axi4xbar_out_r_bits_id = axi4buf_auto_in_r_bits_id; // @[LazyModule.scala 355:16]
  assign FPGAManagedStreamEngine_0_streamsToHostCPU_0_valid = PrintBridgeModule_0_streamToHostCPU_valid; // @[FPGATop.scala 420:12]
  assign FPGAManagedStreamEngine_0_streamsToHostCPU_0_bits = PrintBridgeModule_0_streamToHostCPU_bits; // @[FPGATop.scala 420:12]
  assign FPGAManagedStreamEngine_0_io_ctrl_aw_valid = ctrlInterconnect_io_slaves_3_aw_valid; // @[Widget.scala 332:24]
  assign FPGAManagedStreamEngine_0_io_ctrl_aw_bits_addr = ctrlInterconnect_io_slaves_3_aw_bits_addr; // @[Widget.scala 332:24]
  assign FPGAManagedStreamEngine_0_io_ctrl_aw_bits_len = ctrlInterconnect_io_slaves_3_aw_bits_len; // @[Widget.scala 332:24]
  assign FPGAManagedStreamEngine_0_io_ctrl_aw_bits_id = ctrlInterconnect_io_slaves_3_aw_bits_id; // @[Widget.scala 332:24]
  assign FPGAManagedStreamEngine_0_io_ctrl_w_valid = ctrlInterconnect_io_slaves_3_w_valid; // @[Widget.scala 332:24]
  assign FPGAManagedStreamEngine_0_io_ctrl_w_bits_data = ctrlInterconnect_io_slaves_3_w_bits_data; // @[Widget.scala 332:24]
  assign FPGAManagedStreamEngine_0_io_ctrl_b_ready = ctrlInterconnect_io_slaves_3_b_ready; // @[Widget.scala 332:24]
  assign FPGAManagedStreamEngine_0_io_ctrl_ar_valid = ctrlInterconnect_io_slaves_3_ar_valid; // @[Widget.scala 332:24]
  assign FPGAManagedStreamEngine_0_io_ctrl_ar_bits_addr = ctrlInterconnect_io_slaves_3_ar_bits_addr; // @[Widget.scala 332:24]
  assign FPGAManagedStreamEngine_0_io_ctrl_ar_bits_len = ctrlInterconnect_io_slaves_3_ar_bits_len; // @[Widget.scala 332:24]
  assign FPGAManagedStreamEngine_0_io_ctrl_ar_bits_id = ctrlInterconnect_io_slaves_3_ar_bits_id; // @[Widget.scala 332:24]
  assign FPGAManagedStreamEngine_0_io_ctrl_r_ready = ctrlInterconnect_io_slaves_3_r_ready; // @[Widget.scala 332:24]
  assign axi4index_auto_in_aw_valid = axi4buf_auto_out_aw_valid; // @[LazyModule.scala 353:16]
  assign axi4index_auto_in_aw_bits_id = axi4buf_auto_out_aw_bits_id; // @[LazyModule.scala 353:16]
  assign axi4index_auto_in_aw_bits_addr = axi4buf_auto_out_aw_bits_addr; // @[LazyModule.scala 353:16]
  assign axi4index_auto_in_aw_bits_len = axi4buf_auto_out_aw_bits_len; // @[LazyModule.scala 353:16]
  assign axi4index_auto_in_aw_bits_size = axi4buf_auto_out_aw_bits_size; // @[LazyModule.scala 353:16]
  assign axi4index_auto_in_aw_bits_burst = axi4buf_auto_out_aw_bits_burst; // @[LazyModule.scala 353:16]
  assign axi4index_auto_in_aw_bits_lock = axi4buf_auto_out_aw_bits_lock; // @[LazyModule.scala 353:16]
  assign axi4index_auto_in_aw_bits_cache = axi4buf_auto_out_aw_bits_cache; // @[LazyModule.scala 353:16]
  assign axi4index_auto_in_aw_bits_prot = axi4buf_auto_out_aw_bits_prot; // @[LazyModule.scala 353:16]
  assign axi4index_auto_in_aw_bits_qos = axi4buf_auto_out_aw_bits_qos; // @[LazyModule.scala 353:16]
  assign axi4index_auto_in_w_valid = axi4buf_auto_out_w_valid; // @[LazyModule.scala 353:16]
  assign axi4index_auto_in_w_bits_data = axi4buf_auto_out_w_bits_data; // @[LazyModule.scala 353:16]
  assign axi4index_auto_in_w_bits_strb = axi4buf_auto_out_w_bits_strb; // @[LazyModule.scala 353:16]
  assign axi4index_auto_in_w_bits_last = axi4buf_auto_out_w_bits_last; // @[LazyModule.scala 353:16]
  assign axi4index_auto_in_b_ready = axi4buf_auto_out_b_ready; // @[LazyModule.scala 353:16]
  assign axi4index_auto_in_ar_valid = axi4buf_auto_out_ar_valid; // @[LazyModule.scala 353:16]
  assign axi4index_auto_in_ar_bits_id = axi4buf_auto_out_ar_bits_id; // @[LazyModule.scala 353:16]
  assign axi4index_auto_in_ar_bits_addr = axi4buf_auto_out_ar_bits_addr; // @[LazyModule.scala 353:16]
  assign axi4index_auto_in_ar_bits_len = axi4buf_auto_out_ar_bits_len; // @[LazyModule.scala 353:16]
  assign axi4index_auto_in_ar_bits_size = axi4buf_auto_out_ar_bits_size; // @[LazyModule.scala 353:16]
  assign axi4index_auto_in_ar_bits_burst = axi4buf_auto_out_ar_bits_burst; // @[LazyModule.scala 353:16]
  assign axi4index_auto_in_ar_bits_lock = axi4buf_auto_out_ar_bits_lock; // @[LazyModule.scala 353:16]
  assign axi4index_auto_in_ar_bits_cache = axi4buf_auto_out_ar_bits_cache; // @[LazyModule.scala 353:16]
  assign axi4index_auto_in_ar_bits_prot = axi4buf_auto_out_ar_bits_prot; // @[LazyModule.scala 353:16]
  assign axi4index_auto_in_ar_bits_qos = axi4buf_auto_out_ar_bits_qos; // @[LazyModule.scala 353:16]
  assign axi4index_auto_in_r_ready = axi4buf_auto_out_r_ready; // @[LazyModule.scala 353:16]
  assign axi4index_auto_out_aw_ready = fpga_managed_axi4_aw_ready; // @[Nodes.scala 1215:84 FPGATop.scala 381:10]
  assign axi4index_auto_out_w_ready = fpga_managed_axi4_w_ready; // @[Nodes.scala 1215:84 FPGATop.scala 381:10]
  assign axi4index_auto_out_b_valid = fpga_managed_axi4_b_valid; // @[Nodes.scala 1215:84 FPGATop.scala 381:10]
  assign axi4index_auto_out_b_bits_id = fpga_managed_axi4_b_bits_id; // @[Nodes.scala 1215:84 FPGATop.scala 381:10]
  assign axi4index_auto_out_ar_ready = fpga_managed_axi4_ar_ready; // @[Nodes.scala 1215:84 FPGATop.scala 381:10]
  assign axi4index_auto_out_r_valid = fpga_managed_axi4_r_valid; // @[Nodes.scala 1215:84 FPGATop.scala 381:10]
  assign axi4index_auto_out_r_bits_id = fpga_managed_axi4_r_bits_id; // @[Nodes.scala 1215:84 FPGATop.scala 381:10]
  assign axi4buf_clock = clock;
  assign axi4buf_reset = reset;
  assign axi4buf_auto_in_aw_valid = FPGAManagedStreamEngine_0_auto_axi4xbar_out_aw_valid; // @[LazyModule.scala 355:16]
  assign axi4buf_auto_in_aw_bits_id = FPGAManagedStreamEngine_0_auto_axi4xbar_out_aw_bits_id; // @[LazyModule.scala 355:16]
  assign axi4buf_auto_in_aw_bits_addr = FPGAManagedStreamEngine_0_auto_axi4xbar_out_aw_bits_addr; // @[LazyModule.scala 355:16]
  assign axi4buf_auto_in_aw_bits_len = FPGAManagedStreamEngine_0_auto_axi4xbar_out_aw_bits_len; // @[LazyModule.scala 355:16]
  assign axi4buf_auto_in_aw_bits_size = FPGAManagedStreamEngine_0_auto_axi4xbar_out_aw_bits_size; // @[LazyModule.scala 355:16]
  assign axi4buf_auto_in_aw_bits_burst = FPGAManagedStreamEngine_0_auto_axi4xbar_out_aw_bits_burst; // @[LazyModule.scala 355:16]
  assign axi4buf_auto_in_aw_bits_lock = FPGAManagedStreamEngine_0_auto_axi4xbar_out_aw_bits_lock; // @[LazyModule.scala 355:16]
  assign axi4buf_auto_in_aw_bits_cache = FPGAManagedStreamEngine_0_auto_axi4xbar_out_aw_bits_cache; // @[LazyModule.scala 355:16]
  assign axi4buf_auto_in_aw_bits_prot = FPGAManagedStreamEngine_0_auto_axi4xbar_out_aw_bits_prot; // @[LazyModule.scala 355:16]
  assign axi4buf_auto_in_aw_bits_qos = FPGAManagedStreamEngine_0_auto_axi4xbar_out_aw_bits_qos; // @[LazyModule.scala 355:16]
  assign axi4buf_auto_in_w_valid = FPGAManagedStreamEngine_0_auto_axi4xbar_out_w_valid; // @[LazyModule.scala 355:16]
  assign axi4buf_auto_in_w_bits_data = FPGAManagedStreamEngine_0_auto_axi4xbar_out_w_bits_data; // @[LazyModule.scala 355:16]
  assign axi4buf_auto_in_w_bits_strb = FPGAManagedStreamEngine_0_auto_axi4xbar_out_w_bits_strb; // @[LazyModule.scala 355:16]
  assign axi4buf_auto_in_w_bits_last = FPGAManagedStreamEngine_0_auto_axi4xbar_out_w_bits_last; // @[LazyModule.scala 355:16]
  assign axi4buf_auto_in_b_ready = FPGAManagedStreamEngine_0_auto_axi4xbar_out_b_ready; // @[LazyModule.scala 355:16]
  assign axi4buf_auto_in_ar_valid = FPGAManagedStreamEngine_0_auto_axi4xbar_out_ar_valid; // @[LazyModule.scala 355:16]
  assign axi4buf_auto_in_ar_bits_id = FPGAManagedStreamEngine_0_auto_axi4xbar_out_ar_bits_id; // @[LazyModule.scala 355:16]
  assign axi4buf_auto_in_ar_bits_addr = FPGAManagedStreamEngine_0_auto_axi4xbar_out_ar_bits_addr; // @[LazyModule.scala 355:16]
  assign axi4buf_auto_in_ar_bits_len = FPGAManagedStreamEngine_0_auto_axi4xbar_out_ar_bits_len; // @[LazyModule.scala 355:16]
  assign axi4buf_auto_in_ar_bits_size = FPGAManagedStreamEngine_0_auto_axi4xbar_out_ar_bits_size; // @[LazyModule.scala 355:16]
  assign axi4buf_auto_in_ar_bits_burst = FPGAManagedStreamEngine_0_auto_axi4xbar_out_ar_bits_burst; // @[LazyModule.scala 355:16]
  assign axi4buf_auto_in_ar_bits_lock = FPGAManagedStreamEngine_0_auto_axi4xbar_out_ar_bits_lock; // @[LazyModule.scala 355:16]
  assign axi4buf_auto_in_ar_bits_cache = FPGAManagedStreamEngine_0_auto_axi4xbar_out_ar_bits_cache; // @[LazyModule.scala 355:16]
  assign axi4buf_auto_in_ar_bits_prot = FPGAManagedStreamEngine_0_auto_axi4xbar_out_ar_bits_prot; // @[LazyModule.scala 355:16]
  assign axi4buf_auto_in_ar_bits_qos = FPGAManagedStreamEngine_0_auto_axi4xbar_out_ar_bits_qos; // @[LazyModule.scala 355:16]
  assign axi4buf_auto_in_r_ready = FPGAManagedStreamEngine_0_auto_axi4xbar_out_r_ready; // @[LazyModule.scala 355:16]
  assign axi4buf_auto_out_aw_ready = axi4index_auto_in_aw_ready; // @[LazyModule.scala 353:16]
  assign axi4buf_auto_out_w_ready = axi4index_auto_in_w_ready; // @[LazyModule.scala 353:16]
  assign axi4buf_auto_out_b_valid = axi4index_auto_in_b_valid; // @[LazyModule.scala 353:16]
  assign axi4buf_auto_out_b_bits_id = axi4index_auto_in_b_bits_id; // @[LazyModule.scala 353:16]
  assign axi4buf_auto_out_ar_ready = axi4index_auto_in_ar_ready; // @[LazyModule.scala 353:16]
  assign axi4buf_auto_out_r_valid = axi4index_auto_in_r_valid; // @[LazyModule.scala 353:16]
  assign axi4buf_auto_out_r_bits_id = axi4index_auto_in_r_bits_id; // @[LazyModule.scala 353:16]
  assign sim_clock = clock;
  assign sim_reset = reset;
  assign sim_channelPorts_PrintfModule_synthesizedPrintf_dut_printf_1_wire_args_1_source_ready =
    PrintBridgeModule_0_hPort_toHost_hReady &
    sim_channelPorts_PrintfModule_synthesizedPrintf_RationalClockBridge_clocks_0_globalReset_source_valid &
    sim_channelPorts_PrintfModule_synthesizedPrintf_dut_printf_wire_enable_source_valid &
    sim_channelPorts_PrintfModule_synthesizedPrintf_dut_printf_wire_args_0_source_valid &
    sim_channelPorts_PrintfModule_synthesizedPrintf_dut_childInst_printf_wire_enable_source_valid &
    sim_channelPorts_PrintfModule_synthesizedPrintf_dut_childInst_printf_wire_args_0_source_valid &
    sim_channelPorts_PrintfModule_synthesizedPrintf_dut_childInst_printf_wire_args_1_source_valid &
    sim_channelPorts_PrintfModule_synthesizedPrintf_dut_printf_2_wire_enable_source_valid &
    sim_channelPorts_PrintfModule_synthesizedPrintf_dut_printf_2_wire_args_0_source_valid &
    sim_channelPorts_PrintfModule_synthesizedPrintf_dut_printf_2_wire_args_1_source_valid &
    sim_channelPorts_PrintfModule_synthesizedPrintf_dut_printf_1_wire_enable_source_valid &
    sim_channelPorts_PrintfModule_synthesizedPrintf_dut_printf_1_wire_args_0_source_valid; // @[Misc.scala 25:53]
  assign sim_channelPorts_PrintfModule_synthesizedPrintf_dut_printf_1_wire_args_0_source_ready =
    PrintBridgeModule_0_hPort_toHost_hReady &
    sim_channelPorts_PrintfModule_synthesizedPrintf_RationalClockBridge_clocks_0_globalReset_source_valid &
    sim_channelPorts_PrintfModule_synthesizedPrintf_dut_printf_wire_enable_source_valid &
    sim_channelPorts_PrintfModule_synthesizedPrintf_dut_printf_wire_args_0_source_valid &
    sim_channelPorts_PrintfModule_synthesizedPrintf_dut_childInst_printf_wire_enable_source_valid &
    sim_channelPorts_PrintfModule_synthesizedPrintf_dut_childInst_printf_wire_args_0_source_valid &
    sim_channelPorts_PrintfModule_synthesizedPrintf_dut_childInst_printf_wire_args_1_source_valid &
    sim_channelPorts_PrintfModule_synthesizedPrintf_dut_printf_2_wire_enable_source_valid &
    sim_channelPorts_PrintfModule_synthesizedPrintf_dut_printf_2_wire_args_0_source_valid &
    sim_channelPorts_PrintfModule_synthesizedPrintf_dut_printf_2_wire_args_1_source_valid &
    sim_channelPorts_PrintfModule_synthesizedPrintf_dut_printf_1_wire_enable_source_valid &
    sim_channelPorts_PrintfModule_synthesizedPrintf_dut_printf_1_wire_args_1_source_valid; // @[Misc.scala 25:53]
  assign sim_channelPorts_PrintfModule_synthesizedPrintf_dut_printf_1_wire_enable_source_ready =
    PrintBridgeModule_0_hPort_toHost_hReady &
    sim_channelPorts_PrintfModule_synthesizedPrintf_RationalClockBridge_clocks_0_globalReset_source_valid &
    sim_channelPorts_PrintfModule_synthesizedPrintf_dut_printf_wire_enable_source_valid &
    sim_channelPorts_PrintfModule_synthesizedPrintf_dut_printf_wire_args_0_source_valid &
    sim_channelPorts_PrintfModule_synthesizedPrintf_dut_childInst_printf_wire_enable_source_valid &
    sim_channelPorts_PrintfModule_synthesizedPrintf_dut_childInst_printf_wire_args_0_source_valid &
    sim_channelPorts_PrintfModule_synthesizedPrintf_dut_childInst_printf_wire_args_1_source_valid &
    sim_channelPorts_PrintfModule_synthesizedPrintf_dut_printf_2_wire_enable_source_valid &
    sim_channelPorts_PrintfModule_synthesizedPrintf_dut_printf_2_wire_args_0_source_valid &
    sim_channelPorts_PrintfModule_synthesizedPrintf_dut_printf_2_wire_args_1_source_valid &
    sim_channelPorts_PrintfModule_synthesizedPrintf_dut_printf_1_wire_args_0_source_valid &
    sim_channelPorts_PrintfModule_synthesizedPrintf_dut_printf_1_wire_args_1_source_valid; // @[Misc.scala 25:53]
  assign sim_channelPorts_PrintfModule_synthesizedPrintf_dut_printf_2_wire_args_1_source_ready =
    PrintBridgeModule_0_hPort_toHost_hReady &
    sim_channelPorts_PrintfModule_synthesizedPrintf_RationalClockBridge_clocks_0_globalReset_source_valid &
    sim_channelPorts_PrintfModule_synthesizedPrintf_dut_printf_wire_enable_source_valid &
    sim_channelPorts_PrintfModule_synthesizedPrintf_dut_printf_wire_args_0_source_valid &
    sim_channelPorts_PrintfModule_synthesizedPrintf_dut_childInst_printf_wire_enable_source_valid &
    sim_channelPorts_PrintfModule_synthesizedPrintf_dut_childInst_printf_wire_args_0_source_valid &
    sim_channelPorts_PrintfModule_synthesizedPrintf_dut_childInst_printf_wire_args_1_source_valid &
    sim_channelPorts_PrintfModule_synthesizedPrintf_dut_printf_2_wire_enable_source_valid &
    sim_channelPorts_PrintfModule_synthesizedPrintf_dut_printf_2_wire_args_0_source_valid &
    sim_channelPorts_PrintfModule_synthesizedPrintf_dut_printf_1_wire_enable_source_valid &
    sim_channelPorts_PrintfModule_synthesizedPrintf_dut_printf_1_wire_args_0_source_valid &
    sim_channelPorts_PrintfModule_synthesizedPrintf_dut_printf_1_wire_args_1_source_valid; // @[Misc.scala 25:53]
  assign sim_channelPorts_PrintfModule_synthesizedPrintf_dut_printf_2_wire_args_0_source_ready =
    PrintBridgeModule_0_hPort_toHost_hReady &
    sim_channelPorts_PrintfModule_synthesizedPrintf_RationalClockBridge_clocks_0_globalReset_source_valid &
    sim_channelPorts_PrintfModule_synthesizedPrintf_dut_printf_wire_enable_source_valid &
    sim_channelPorts_PrintfModule_synthesizedPrintf_dut_printf_wire_args_0_source_valid &
    sim_channelPorts_PrintfModule_synthesizedPrintf_dut_childInst_printf_wire_enable_source_valid &
    sim_channelPorts_PrintfModule_synthesizedPrintf_dut_childInst_printf_wire_args_0_source_valid &
    sim_channelPorts_PrintfModule_synthesizedPrintf_dut_childInst_printf_wire_args_1_source_valid &
    sim_channelPorts_PrintfModule_synthesizedPrintf_dut_printf_2_wire_enable_source_valid &
    sim_channelPorts_PrintfModule_synthesizedPrintf_dut_printf_2_wire_args_1_source_valid &
    sim_channelPorts_PrintfModule_synthesizedPrintf_dut_printf_1_wire_enable_source_valid &
    sim_channelPorts_PrintfModule_synthesizedPrintf_dut_printf_1_wire_args_0_source_valid &
    sim_channelPorts_PrintfModule_synthesizedPrintf_dut_printf_1_wire_args_1_source_valid; // @[Misc.scala 25:53]
  assign sim_channelPorts_PrintfModule_synthesizedPrintf_dut_printf_2_wire_enable_source_ready =
    PrintBridgeModule_0_hPort_toHost_hReady &
    sim_channelPorts_PrintfModule_synthesizedPrintf_RationalClockBridge_clocks_0_globalReset_source_valid &
    sim_channelPorts_PrintfModule_synthesizedPrintf_dut_printf_wire_enable_source_valid &
    sim_channelPorts_PrintfModule_synthesizedPrintf_dut_printf_wire_args_0_source_valid &
    sim_channelPorts_PrintfModule_synthesizedPrintf_dut_childInst_printf_wire_enable_source_valid &
    sim_channelPorts_PrintfModule_synthesizedPrintf_dut_childInst_printf_wire_args_0_source_valid &
    sim_channelPorts_PrintfModule_synthesizedPrintf_dut_childInst_printf_wire_args_1_source_valid &
    sim_channelPorts_PrintfModule_synthesizedPrintf_dut_printf_2_wire_args_0_source_valid &
    sim_channelPorts_PrintfModule_synthesizedPrintf_dut_printf_2_wire_args_1_source_valid &
    sim_channelPorts_PrintfModule_synthesizedPrintf_dut_printf_1_wire_enable_source_valid &
    sim_channelPorts_PrintfModule_synthesizedPrintf_dut_printf_1_wire_args_0_source_valid &
    sim_channelPorts_PrintfModule_synthesizedPrintf_dut_printf_1_wire_args_1_source_valid; // @[Misc.scala 25:53]
  assign sim_channelPorts_PrintfModule_synthesizedPrintf_dut_childInst_printf_wire_args_1_source_ready =
    PrintBridgeModule_0_hPort_toHost_hReady &
    sim_channelPorts_PrintfModule_synthesizedPrintf_RationalClockBridge_clocks_0_globalReset_source_valid &
    sim_channelPorts_PrintfModule_synthesizedPrintf_dut_printf_wire_enable_source_valid &
    sim_channelPorts_PrintfModule_synthesizedPrintf_dut_printf_wire_args_0_source_valid &
    sim_channelPorts_PrintfModule_synthesizedPrintf_dut_childInst_printf_wire_enable_source_valid &
    sim_channelPorts_PrintfModule_synthesizedPrintf_dut_childInst_printf_wire_args_0_source_valid &
    sim_channelPorts_PrintfModule_synthesizedPrintf_dut_printf_2_wire_enable_source_valid &
    sim_channelPorts_PrintfModule_synthesizedPrintf_dut_printf_2_wire_args_0_source_valid &
    sim_channelPorts_PrintfModule_synthesizedPrintf_dut_printf_2_wire_args_1_source_valid &
    sim_channelPorts_PrintfModule_synthesizedPrintf_dut_printf_1_wire_enable_source_valid &
    sim_channelPorts_PrintfModule_synthesizedPrintf_dut_printf_1_wire_args_0_source_valid &
    sim_channelPorts_PrintfModule_synthesizedPrintf_dut_printf_1_wire_args_1_source_valid; // @[Misc.scala 25:53]
  assign sim_channelPorts_PrintfModule_synthesizedPrintf_dut_childInst_printf_wire_args_0_source_ready =
    PrintBridgeModule_0_hPort_toHost_hReady &
    sim_channelPorts_PrintfModule_synthesizedPrintf_RationalClockBridge_clocks_0_globalReset_source_valid &
    sim_channelPorts_PrintfModule_synthesizedPrintf_dut_printf_wire_enable_source_valid &
    sim_channelPorts_PrintfModule_synthesizedPrintf_dut_printf_wire_args_0_source_valid &
    sim_channelPorts_PrintfModule_synthesizedPrintf_dut_childInst_printf_wire_enable_source_valid &
    sim_channelPorts_PrintfModule_synthesizedPrintf_dut_childInst_printf_wire_args_1_source_valid &
    sim_channelPorts_PrintfModule_synthesizedPrintf_dut_printf_2_wire_enable_source_valid &
    sim_channelPorts_PrintfModule_synthesizedPrintf_dut_printf_2_wire_args_0_source_valid &
    sim_channelPorts_PrintfModule_synthesizedPrintf_dut_printf_2_wire_args_1_source_valid &
    sim_channelPorts_PrintfModule_synthesizedPrintf_dut_printf_1_wire_enable_source_valid &
    sim_channelPorts_PrintfModule_synthesizedPrintf_dut_printf_1_wire_args_0_source_valid &
    sim_channelPorts_PrintfModule_synthesizedPrintf_dut_printf_1_wire_args_1_source_valid; // @[Misc.scala 25:53]
  assign sim_channelPorts_PrintfModule_synthesizedPrintf_dut_childInst_printf_wire_enable_source_ready =
    PrintBridgeModule_0_hPort_toHost_hReady &
    sim_channelPorts_PrintfModule_synthesizedPrintf_RationalClockBridge_clocks_0_globalReset_source_valid &
    sim_channelPorts_PrintfModule_synthesizedPrintf_dut_printf_wire_enable_source_valid &
    sim_channelPorts_PrintfModule_synthesizedPrintf_dut_printf_wire_args_0_source_valid &
    sim_channelPorts_PrintfModule_synthesizedPrintf_dut_childInst_printf_wire_args_0_source_valid &
    sim_channelPorts_PrintfModule_synthesizedPrintf_dut_childInst_printf_wire_args_1_source_valid &
    sim_channelPorts_PrintfModule_synthesizedPrintf_dut_printf_2_wire_enable_source_valid &
    sim_channelPorts_PrintfModule_synthesizedPrintf_dut_printf_2_wire_args_0_source_valid &
    sim_channelPorts_PrintfModule_synthesizedPrintf_dut_printf_2_wire_args_1_source_valid &
    sim_channelPorts_PrintfModule_synthesizedPrintf_dut_printf_1_wire_enable_source_valid &
    sim_channelPorts_PrintfModule_synthesizedPrintf_dut_printf_1_wire_args_0_source_valid &
    sim_channelPorts_PrintfModule_synthesizedPrintf_dut_printf_1_wire_args_1_source_valid; // @[Misc.scala 25:53]
  assign sim_channelPorts_PrintfModule_synthesizedPrintf_dut_printf_wire_args_0_source_ready =
    PrintBridgeModule_0_hPort_toHost_hReady &
    sim_channelPorts_PrintfModule_synthesizedPrintf_RationalClockBridge_clocks_0_globalReset_source_valid &
    sim_channelPorts_PrintfModule_synthesizedPrintf_dut_printf_wire_enable_source_valid &
    sim_channelPorts_PrintfModule_synthesizedPrintf_dut_childInst_printf_wire_enable_source_valid &
    sim_channelPorts_PrintfModule_synthesizedPrintf_dut_childInst_printf_wire_args_0_source_valid &
    sim_channelPorts_PrintfModule_synthesizedPrintf_dut_childInst_printf_wire_args_1_source_valid &
    sim_channelPorts_PrintfModule_synthesizedPrintf_dut_printf_2_wire_enable_source_valid &
    sim_channelPorts_PrintfModule_synthesizedPrintf_dut_printf_2_wire_args_0_source_valid &
    sim_channelPorts_PrintfModule_synthesizedPrintf_dut_printf_2_wire_args_1_source_valid &
    sim_channelPorts_PrintfModule_synthesizedPrintf_dut_printf_1_wire_enable_source_valid &
    sim_channelPorts_PrintfModule_synthesizedPrintf_dut_printf_1_wire_args_0_source_valid &
    sim_channelPorts_PrintfModule_synthesizedPrintf_dut_printf_1_wire_args_1_source_valid; // @[Misc.scala 25:53]
  assign sim_channelPorts_PrintfModule_synthesizedPrintf_dut_printf_wire_enable_source_ready =
    PrintBridgeModule_0_hPort_toHost_hReady &
    sim_channelPorts_PrintfModule_synthesizedPrintf_RationalClockBridge_clocks_0_globalReset_source_valid &
    sim_channelPorts_PrintfModule_synthesizedPrintf_dut_printf_wire_args_0_source_valid &
    sim_channelPorts_PrintfModule_synthesizedPrintf_dut_childInst_printf_wire_enable_source_valid &
    sim_channelPorts_PrintfModule_synthesizedPrintf_dut_childInst_printf_wire_args_0_source_valid &
    sim_channelPorts_PrintfModule_synthesizedPrintf_dut_childInst_printf_wire_args_1_source_valid &
    sim_channelPorts_PrintfModule_synthesizedPrintf_dut_printf_2_wire_enable_source_valid &
    sim_channelPorts_PrintfModule_synthesizedPrintf_dut_printf_2_wire_args_0_source_valid &
    sim_channelPorts_PrintfModule_synthesizedPrintf_dut_printf_2_wire_args_1_source_valid &
    sim_channelPorts_PrintfModule_synthesizedPrintf_dut_printf_1_wire_enable_source_valid &
    sim_channelPorts_PrintfModule_synthesizedPrintf_dut_printf_1_wire_args_0_source_valid &
    sim_channelPorts_PrintfModule_synthesizedPrintf_dut_printf_1_wire_args_1_source_valid; // @[Misc.scala 25:53]
  assign sim_channelPorts_PrintfModule_synthesizedPrintf_RationalClockBridge_clocks_0_globalReset_source_ready =
    PrintBridgeModule_0_hPort_toHost_hReady &
    sim_channelPorts_PrintfModule_synthesizedPrintf_dut_printf_wire_enable_source_valid &
    sim_channelPorts_PrintfModule_synthesizedPrintf_dut_printf_wire_args_0_source_valid &
    sim_channelPorts_PrintfModule_synthesizedPrintf_dut_childInst_printf_wire_enable_source_valid &
    sim_channelPorts_PrintfModule_synthesizedPrintf_dut_childInst_printf_wire_args_0_source_valid &
    sim_channelPorts_PrintfModule_synthesizedPrintf_dut_childInst_printf_wire_args_1_source_valid &
    sim_channelPorts_PrintfModule_synthesizedPrintf_dut_printf_2_wire_enable_source_valid &
    sim_channelPorts_PrintfModule_synthesizedPrintf_dut_printf_2_wire_args_0_source_valid &
    sim_channelPorts_PrintfModule_synthesizedPrintf_dut_printf_2_wire_args_1_source_valid &
    sim_channelPorts_PrintfModule_synthesizedPrintf_dut_printf_1_wire_enable_source_valid &
    sim_channelPorts_PrintfModule_synthesizedPrintf_dut_printf_1_wire_args_0_source_valid &
    sim_channelPorts_PrintfModule_synthesizedPrintf_dut_printf_1_wire_args_1_source_valid; // @[Misc.scala 25:53]
  assign sim_channelPorts_PrintfModule_peekPokeBridge_io_a_sink_valid = PeekPokeBridgeModule_0_hPort_io_a_valid; // @[ChannelizedHostPort.scala 113:64]
  assign sim_channelPorts_PrintfModule_peekPokeBridge_io_a_sink_bits = PeekPokeBridgeModule_0_hPort_io_a_bits; // @[ChannelizedHostPort.scala 113:64]
  assign sim_channelPorts_PrintfModule_peekPokeBridge_io_b_sink_valid = PeekPokeBridgeModule_0_hPort_io_b_valid; // @[ChannelizedHostPort.scala 113:64]
  assign sim_channelPorts_PrintfModule_peekPokeBridge_io_b_sink_bits = PeekPokeBridgeModule_0_hPort_io_b_bits; // @[ChannelizedHostPort.scala 113:64]
  assign sim_channelPorts_PrintfModule_peekPokeBridge_reset_sink_valid = PeekPokeBridgeModule_0_hPort_reset_valid; // @[ChannelizedHostPort.scala 113:64]
  assign sim_channelPorts_PrintfModule_peekPokeBridge_reset_sink_bits = PeekPokeBridgeModule_0_hPort_reset_bits; // @[ChannelizedHostPort.scala 113:64]
  assign ctrlInterconnect_clock = clock;
  assign ctrlInterconnect_reset = reset;
  assign ctrlInterconnect_io_masters_0_aw_valid = ctrl_aw_valid; // @[Widget.scala 330:36]
  assign ctrlInterconnect_io_masters_0_aw_bits_addr = ctrl_aw_bits_addr; // @[Widget.scala 330:36]
  assign ctrlInterconnect_io_masters_0_aw_bits_len = ctrl_aw_bits_len; // @[Widget.scala 330:36]
  assign ctrlInterconnect_io_masters_0_aw_bits_id = ctrl_aw_bits_id; // @[Widget.scala 330:36]
  assign ctrlInterconnect_io_masters_0_w_valid = ctrl_w_valid; // @[Widget.scala 330:36]
  assign ctrlInterconnect_io_masters_0_w_bits_data = ctrl_w_bits_data; // @[Widget.scala 330:36]
  assign ctrlInterconnect_io_masters_0_w_bits_last = ctrl_w_bits_last; // @[Widget.scala 330:36]
  assign ctrlInterconnect_io_masters_0_b_ready = ctrl_b_ready; // @[Widget.scala 330:36]
  assign ctrlInterconnect_io_masters_0_ar_valid = ctrl_ar_valid; // @[Widget.scala 330:36]
  assign ctrlInterconnect_io_masters_0_ar_bits_addr = ctrl_ar_bits_addr; // @[Widget.scala 330:36]
  assign ctrlInterconnect_io_masters_0_ar_bits_len = ctrl_ar_bits_len; // @[Widget.scala 330:36]
  assign ctrlInterconnect_io_masters_0_ar_bits_id = ctrl_ar_bits_id; // @[Widget.scala 330:36]
  assign ctrlInterconnect_io_masters_0_r_ready = ctrl_r_ready; // @[Widget.scala 330:36]
  assign ctrlInterconnect_io_slaves_0_aw_ready = PeekPokeBridgeModule_0_io_ctrl_aw_ready; // @[Widget.scala 332:24]
  assign ctrlInterconnect_io_slaves_0_w_ready = PeekPokeBridgeModule_0_io_ctrl_w_ready; // @[Widget.scala 332:24]
  assign ctrlInterconnect_io_slaves_0_b_valid = PeekPokeBridgeModule_0_io_ctrl_b_valid; // @[Widget.scala 332:24]
  assign ctrlInterconnect_io_slaves_0_b_bits_id = PeekPokeBridgeModule_0_io_ctrl_b_bits_id; // @[Widget.scala 332:24]
  assign ctrlInterconnect_io_slaves_0_ar_ready = PeekPokeBridgeModule_0_io_ctrl_ar_ready; // @[Widget.scala 332:24]
  assign ctrlInterconnect_io_slaves_0_r_valid = PeekPokeBridgeModule_0_io_ctrl_r_valid; // @[Widget.scala 332:24]
  assign ctrlInterconnect_io_slaves_0_r_bits_data = PeekPokeBridgeModule_0_io_ctrl_r_bits_data; // @[Widget.scala 332:24]
  assign ctrlInterconnect_io_slaves_0_r_bits_id = PeekPokeBridgeModule_0_io_ctrl_r_bits_id; // @[Widget.scala 332:24]
  assign ctrlInterconnect_io_slaves_1_aw_ready = ClockBridgeModule_0_io_ctrl_aw_ready; // @[Widget.scala 332:24]
  assign ctrlInterconnect_io_slaves_1_w_ready = ClockBridgeModule_0_io_ctrl_w_ready; // @[Widget.scala 332:24]
  assign ctrlInterconnect_io_slaves_1_b_valid = ClockBridgeModule_0_io_ctrl_b_valid; // @[Widget.scala 332:24]
  assign ctrlInterconnect_io_slaves_1_b_bits_id = ClockBridgeModule_0_io_ctrl_b_bits_id; // @[Widget.scala 332:24]
  assign ctrlInterconnect_io_slaves_1_ar_ready = ClockBridgeModule_0_io_ctrl_ar_ready; // @[Widget.scala 332:24]
  assign ctrlInterconnect_io_slaves_1_r_valid = ClockBridgeModule_0_io_ctrl_r_valid; // @[Widget.scala 332:24]
  assign ctrlInterconnect_io_slaves_1_r_bits_data = ClockBridgeModule_0_io_ctrl_r_bits_data; // @[Widget.scala 332:24]
  assign ctrlInterconnect_io_slaves_1_r_bits_id = ClockBridgeModule_0_io_ctrl_r_bits_id; // @[Widget.scala 332:24]
  assign ctrlInterconnect_io_slaves_2_aw_ready = PrintBridgeModule_0_io_ctrl_aw_ready; // @[Widget.scala 332:24]
  assign ctrlInterconnect_io_slaves_2_w_ready = PrintBridgeModule_0_io_ctrl_w_ready; // @[Widget.scala 332:24]
  assign ctrlInterconnect_io_slaves_2_b_valid = PrintBridgeModule_0_io_ctrl_b_valid; // @[Widget.scala 332:24]
  assign ctrlInterconnect_io_slaves_2_b_bits_id = PrintBridgeModule_0_io_ctrl_b_bits_id; // @[Widget.scala 332:24]
  assign ctrlInterconnect_io_slaves_2_ar_ready = PrintBridgeModule_0_io_ctrl_ar_ready; // @[Widget.scala 332:24]
  assign ctrlInterconnect_io_slaves_2_r_valid = PrintBridgeModule_0_io_ctrl_r_valid; // @[Widget.scala 332:24]
  assign ctrlInterconnect_io_slaves_2_r_bits_data = PrintBridgeModule_0_io_ctrl_r_bits_data; // @[Widget.scala 332:24]
  assign ctrlInterconnect_io_slaves_2_r_bits_id = PrintBridgeModule_0_io_ctrl_r_bits_id; // @[Widget.scala 332:24]
  assign ctrlInterconnect_io_slaves_3_aw_ready = FPGAManagedStreamEngine_0_io_ctrl_aw_ready; // @[Widget.scala 332:24]
  assign ctrlInterconnect_io_slaves_3_w_ready = FPGAManagedStreamEngine_0_io_ctrl_w_ready; // @[Widget.scala 332:24]
  assign ctrlInterconnect_io_slaves_3_b_valid = FPGAManagedStreamEngine_0_io_ctrl_b_valid; // @[Widget.scala 332:24]
  assign ctrlInterconnect_io_slaves_3_b_bits_id = FPGAManagedStreamEngine_0_io_ctrl_b_bits_id; // @[Widget.scala 332:24]
  assign ctrlInterconnect_io_slaves_3_ar_ready = FPGAManagedStreamEngine_0_io_ctrl_ar_ready; // @[Widget.scala 332:24]
  assign ctrlInterconnect_io_slaves_3_r_valid = FPGAManagedStreamEngine_0_io_ctrl_r_valid; // @[Widget.scala 332:24]
  assign ctrlInterconnect_io_slaves_3_r_bits_data = FPGAManagedStreamEngine_0_io_ctrl_r_bits_data; // @[Widget.scala 332:24]
  assign ctrlInterconnect_io_slaves_3_r_bits_id = FPGAManagedStreamEngine_0_io_ctrl_r_bits_id; // @[Widget.scala 332:24]
  assign ctrlInterconnect_io_slaves_4_aw_ready = SimulationMaster_0_io_ctrl_aw_ready; // @[Widget.scala 332:24]
  assign ctrlInterconnect_io_slaves_4_w_ready = SimulationMaster_0_io_ctrl_w_ready; // @[Widget.scala 332:24]
  assign ctrlInterconnect_io_slaves_4_b_valid = SimulationMaster_0_io_ctrl_b_valid; // @[Widget.scala 332:24]
  assign ctrlInterconnect_io_slaves_4_b_bits_id = SimulationMaster_0_io_ctrl_b_bits_id; // @[Widget.scala 332:24]
  assign ctrlInterconnect_io_slaves_4_ar_ready = SimulationMaster_0_io_ctrl_ar_ready; // @[Widget.scala 332:24]
  assign ctrlInterconnect_io_slaves_4_r_valid = SimulationMaster_0_io_ctrl_r_valid; // @[Widget.scala 332:24]
  assign ctrlInterconnect_io_slaves_4_r_bits_data = SimulationMaster_0_io_ctrl_r_bits_data; // @[Widget.scala 332:24]
  assign ctrlInterconnect_io_slaves_4_r_bits_id = SimulationMaster_0_io_ctrl_r_bits_id; // @[Widget.scala 332:24]
endmodule
module AXI42NastiIdentityModule(
  output        io_axi4_aw_ready,
  input         io_axi4_aw_valid,
  input  [11:0] io_axi4_aw_bits_addr,
  input  [2:0]  io_axi4_aw_bits_prot,
  output        io_axi4_w_ready,
  input         io_axi4_w_valid,
  input  [31:0] io_axi4_w_bits_data,
  input  [3:0]  io_axi4_w_bits_strb,
  input         io_axi4_b_ready,
  output        io_axi4_b_valid,
  output [1:0]  io_axi4_b_bits_resp,
  output        io_axi4_ar_ready,
  input         io_axi4_ar_valid,
  input  [11:0] io_axi4_ar_bits_addr,
  input  [2:0]  io_axi4_ar_bits_prot,
  input         io_axi4_r_ready,
  output        io_axi4_r_valid,
  output [31:0] io_axi4_r_bits_data,
  output [1:0]  io_axi4_r_bits_resp,
  output        io_axi4_r_bits_last,
  input         io_nasti_aw_ready,
  output        io_nasti_aw_valid,
  output [11:0] io_nasti_aw_bits_addr,
  output [2:0]  io_nasti_aw_bits_prot,
  input         io_nasti_w_ready,
  output        io_nasti_w_valid,
  output [31:0] io_nasti_w_bits_data,
  output [3:0]  io_nasti_w_bits_strb,
  output        io_nasti_b_ready,
  input         io_nasti_b_valid,
  input  [1:0]  io_nasti_b_bits_resp,
  input         io_nasti_ar_ready,
  output        io_nasti_ar_valid,
  output [11:0] io_nasti_ar_bits_addr,
  output [2:0]  io_nasti_ar_bits_prot,
  output        io_nasti_r_ready,
  input         io_nasti_r_valid,
  input  [1:0]  io_nasti_r_bits_resp,
  input  [31:0] io_nasti_r_bits_data,
  input         io_nasti_r_bits_last
);
  assign io_axi4_aw_ready = io_nasti_aw_ready; // @[nasti.scala 628:19]
  assign io_axi4_w_ready = io_nasti_w_ready; // @[nasti.scala 650:18]
  assign io_axi4_b_valid = io_nasti_b_valid; // @[nasti.scala 662:22]
  assign io_axi4_b_bits_resp = io_nasti_b_bits_resp; // @[nasti.scala 664:22]
  assign io_axi4_ar_ready = io_nasti_ar_ready; // @[nasti.scala 642:19]
  assign io_axi4_r_valid = io_nasti_r_valid; // @[nasti.scala 652:22]
  assign io_axi4_r_bits_data = io_nasti_r_bits_data; // @[nasti.scala 654:22]
  assign io_axi4_r_bits_resp = io_nasti_r_bits_resp; // @[nasti.scala 655:22]
  assign io_axi4_r_bits_last = io_nasti_r_bits_last; // @[nasti.scala 656:22]
  assign io_nasti_aw_valid = io_axi4_aw_valid; // @[nasti.scala 616:21]
  assign io_nasti_aw_bits_addr = io_axi4_aw_bits_addr; // @[nasti.scala 618:26]
  assign io_nasti_aw_bits_prot = io_axi4_aw_bits_prot; // @[nasti.scala 624:26]
  assign io_nasti_w_valid = io_axi4_w_valid; // @[nasti.scala 644:20]
  assign io_nasti_w_bits_data = io_axi4_w_bits_data; // @[nasti.scala 645:24]
  assign io_nasti_w_bits_strb = io_axi4_w_bits_strb; // @[nasti.scala 646:24]
  assign io_nasti_b_ready = io_axi4_b_ready; // @[nasti.scala 668:19]
  assign io_nasti_ar_valid = io_axi4_ar_valid; // @[nasti.scala 630:21]
  assign io_nasti_ar_bits_addr = io_axi4_ar_bits_addr; // @[nasti.scala 632:26]
  assign io_nasti_ar_bits_prot = io_axi4_ar_bits_prot; // @[nasti.scala 638:26]
  assign io_nasti_r_ready = io_axi4_r_ready; // @[nasti.scala 660:19]
endmodule
module VitisShim(
  input          ap_rst_n,
  input          ap_clk,
  input  [11:0]  s_axi_lite_awaddr,
  input  [2:0]   s_axi_lite_awprot,
  input          s_axi_lite_awvalid,
  output         s_axi_lite_awready,
  input  [31:0]  s_axi_lite_wdata,
  input  [3:0]   s_axi_lite_wstrb,
  input          s_axi_lite_wvalid,
  output         s_axi_lite_wready,
  output [1:0]   s_axi_lite_bresp,
  output         s_axi_lite_bvalid,
  input          s_axi_lite_bready,
  input  [11:0]  s_axi_lite_araddr,
  input  [2:0]   s_axi_lite_arprot,
  input          s_axi_lite_arvalid,
  output         s_axi_lite_arready,
  output [31:0]  s_axi_lite_rdata,
  output [1:0]   s_axi_lite_rresp,
  output         s_axi_lite_rvalid,
  input          s_axi_lite_rready,
  output [15:0]  host_mem_0_awid,
  output [63:0]  host_mem_0_awaddr,
  output [7:0]   host_mem_0_awlen,
  output [2:0]   host_mem_0_awsize,
  output [1:0]   host_mem_0_awburst,
  output         host_mem_0_awlock,
  output [3:0]   host_mem_0_awcache,
  output [2:0]   host_mem_0_awprot,
  output [3:0]   host_mem_0_awqos,
  output         host_mem_0_awvalid,
  input          host_mem_0_awready,
  output [63:0]  host_mem_0_wdata,
  output [7:0]   host_mem_0_wstrb,
  output         host_mem_0_wlast,
  output         host_mem_0_wvalid,
  input          host_mem_0_wready,
  input  [15:0]  host_mem_0_bid,
  input  [1:0]   host_mem_0_bresp,
  input          host_mem_0_bvalid,
  output         host_mem_0_bready,
  output [15:0]  host_mem_0_arid,
  output [63:0]  host_mem_0_araddr,
  output [7:0]   host_mem_0_arlen,
  output [2:0]   host_mem_0_arsize,
  output [1:0]   host_mem_0_arburst,
  output         host_mem_0_arlock,
  output [3:0]   host_mem_0_arcache,
  output [2:0]   host_mem_0_arprot,
  output [3:0]   host_mem_0_arqos,
  output         host_mem_0_arvalid,
  input          host_mem_0_arready,
  input  [15:0]  host_mem_0_rid,
  input  [63:0]  host_mem_0_rdata,
  input  [1:0]   host_mem_0_rresp,
  input          host_mem_0_rlast,
  input          host_mem_0_rvalid,
  output         host_mem_0_rready,
  output [3:0]   m_dma_awid,
  output [63:0]  m_dma_awaddr,
  output [7:0]   m_dma_awlen,
  output [2:0]   m_dma_awsize,
  output [1:0]   m_dma_awburst,
  output         m_dma_awlock,
  output [3:0]   m_dma_awcache,
  output [2:0]   m_dma_awprot,
  output [3:0]   m_dma_awqos,
  output         m_dma_awvalid,
  input          m_dma_awready,
  output [511:0] m_dma_wdata,
  output [63:0]  m_dma_wstrb,
  output         m_dma_wlast,
  output         m_dma_wvalid,
  input          m_dma_wready,
  input  [3:0]   m_dma_bid,
  input  [1:0]   m_dma_bresp,
  input          m_dma_bvalid,
  output         m_dma_bready,
  output [3:0]   m_dma_arid,
  output [63:0]  m_dma_araddr,
  output [7:0]   m_dma_arlen,
  output [2:0]   m_dma_arsize,
  output [1:0]   m_dma_arburst,
  output         m_dma_arlock,
  output [3:0]   m_dma_arcache,
  output [2:0]   m_dma_arprot,
  output [3:0]   m_dma_arqos,
  output         m_dma_arvalid,
  input          m_dma_arready,
  input  [3:0]   m_dma_rid,
  input  [511:0] m_dma_rdata,
  input  [1:0]   m_dma_rresp,
  input          m_dma_rlast,
  input          m_dma_rvalid,
  output         m_dma_rready
);
`ifdef RANDOMIZE_REG_INIT
  reg [63:0] _RAND_0;
  reg [63:0] _RAND_1;
  reg [63:0] _RAND_2;
`endif // RANDOMIZE_REG_INIT
  wire  top_clock; // @[PlatformShim.scala 23:23]
  wire  top_reset; // @[PlatformShim.scala 23:23]
  wire  top_ctrl_aw_ready; // @[PlatformShim.scala 23:23]
  wire  top_ctrl_aw_valid; // @[PlatformShim.scala 23:23]
  wire [11:0] top_ctrl_aw_bits_addr; // @[PlatformShim.scala 23:23]
  wire [7:0] top_ctrl_aw_bits_len; // @[PlatformShim.scala 23:23]
  wire [2:0] top_ctrl_aw_bits_size; // @[PlatformShim.scala 23:23]
  wire [1:0] top_ctrl_aw_bits_burst; // @[PlatformShim.scala 23:23]
  wire  top_ctrl_aw_bits_lock; // @[PlatformShim.scala 23:23]
  wire [3:0] top_ctrl_aw_bits_cache; // @[PlatformShim.scala 23:23]
  wire [2:0] top_ctrl_aw_bits_prot; // @[PlatformShim.scala 23:23]
  wire [3:0] top_ctrl_aw_bits_qos; // @[PlatformShim.scala 23:23]
  wire [3:0] top_ctrl_aw_bits_region; // @[PlatformShim.scala 23:23]
  wire  top_ctrl_aw_bits_id; // @[PlatformShim.scala 23:23]
  wire  top_ctrl_aw_bits_user; // @[PlatformShim.scala 23:23]
  wire  top_ctrl_w_ready; // @[PlatformShim.scala 23:23]
  wire  top_ctrl_w_valid; // @[PlatformShim.scala 23:23]
  wire [31:0] top_ctrl_w_bits_data; // @[PlatformShim.scala 23:23]
  wire  top_ctrl_w_bits_last; // @[PlatformShim.scala 23:23]
  wire  top_ctrl_w_bits_id; // @[PlatformShim.scala 23:23]
  wire [3:0] top_ctrl_w_bits_strb; // @[PlatformShim.scala 23:23]
  wire  top_ctrl_w_bits_user; // @[PlatformShim.scala 23:23]
  wire  top_ctrl_b_ready; // @[PlatformShim.scala 23:23]
  wire  top_ctrl_b_valid; // @[PlatformShim.scala 23:23]
  wire [1:0] top_ctrl_b_bits_resp; // @[PlatformShim.scala 23:23]
  wire  top_ctrl_b_bits_id; // @[PlatformShim.scala 23:23]
  wire  top_ctrl_b_bits_user; // @[PlatformShim.scala 23:23]
  wire  top_ctrl_ar_ready; // @[PlatformShim.scala 23:23]
  wire  top_ctrl_ar_valid; // @[PlatformShim.scala 23:23]
  wire [11:0] top_ctrl_ar_bits_addr; // @[PlatformShim.scala 23:23]
  wire [7:0] top_ctrl_ar_bits_len; // @[PlatformShim.scala 23:23]
  wire [2:0] top_ctrl_ar_bits_size; // @[PlatformShim.scala 23:23]
  wire [1:0] top_ctrl_ar_bits_burst; // @[PlatformShim.scala 23:23]
  wire  top_ctrl_ar_bits_lock; // @[PlatformShim.scala 23:23]
  wire [3:0] top_ctrl_ar_bits_cache; // @[PlatformShim.scala 23:23]
  wire [2:0] top_ctrl_ar_bits_prot; // @[PlatformShim.scala 23:23]
  wire [3:0] top_ctrl_ar_bits_qos; // @[PlatformShim.scala 23:23]
  wire [3:0] top_ctrl_ar_bits_region; // @[PlatformShim.scala 23:23]
  wire  top_ctrl_ar_bits_id; // @[PlatformShim.scala 23:23]
  wire  top_ctrl_ar_bits_user; // @[PlatformShim.scala 23:23]
  wire  top_ctrl_r_ready; // @[PlatformShim.scala 23:23]
  wire  top_ctrl_r_valid; // @[PlatformShim.scala 23:23]
  wire [1:0] top_ctrl_r_bits_resp; // @[PlatformShim.scala 23:23]
  wire [31:0] top_ctrl_r_bits_data; // @[PlatformShim.scala 23:23]
  wire  top_ctrl_r_bits_last; // @[PlatformShim.scala 23:23]
  wire  top_ctrl_r_bits_id; // @[PlatformShim.scala 23:23]
  wire  top_ctrl_r_bits_user; // @[PlatformShim.scala 23:23]
  wire  top_fpga_managed_axi4_aw_ready; // @[PlatformShim.scala 23:23]
  wire  top_fpga_managed_axi4_aw_valid; // @[PlatformShim.scala 23:23]
  wire [3:0] top_fpga_managed_axi4_aw_bits_id; // @[PlatformShim.scala 23:23]
  wire [21:0] top_fpga_managed_axi4_aw_bits_addr; // @[PlatformShim.scala 23:23]
  wire [7:0] top_fpga_managed_axi4_aw_bits_len; // @[PlatformShim.scala 23:23]
  wire [2:0] top_fpga_managed_axi4_aw_bits_size; // @[PlatformShim.scala 23:23]
  wire [1:0] top_fpga_managed_axi4_aw_bits_burst; // @[PlatformShim.scala 23:23]
  wire  top_fpga_managed_axi4_aw_bits_lock; // @[PlatformShim.scala 23:23]
  wire [3:0] top_fpga_managed_axi4_aw_bits_cache; // @[PlatformShim.scala 23:23]
  wire [2:0] top_fpga_managed_axi4_aw_bits_prot; // @[PlatformShim.scala 23:23]
  wire [3:0] top_fpga_managed_axi4_aw_bits_qos; // @[PlatformShim.scala 23:23]
  wire  top_fpga_managed_axi4_w_ready; // @[PlatformShim.scala 23:23]
  wire  top_fpga_managed_axi4_w_valid; // @[PlatformShim.scala 23:23]
  wire [511:0] top_fpga_managed_axi4_w_bits_data; // @[PlatformShim.scala 23:23]
  wire [63:0] top_fpga_managed_axi4_w_bits_strb; // @[PlatformShim.scala 23:23]
  wire  top_fpga_managed_axi4_w_bits_last; // @[PlatformShim.scala 23:23]
  wire  top_fpga_managed_axi4_b_ready; // @[PlatformShim.scala 23:23]
  wire  top_fpga_managed_axi4_b_valid; // @[PlatformShim.scala 23:23]
  wire [3:0] top_fpga_managed_axi4_b_bits_id; // @[PlatformShim.scala 23:23]
  wire [1:0] top_fpga_managed_axi4_b_bits_resp; // @[PlatformShim.scala 23:23]
  wire  top_fpga_managed_axi4_ar_ready; // @[PlatformShim.scala 23:23]
  wire  top_fpga_managed_axi4_ar_valid; // @[PlatformShim.scala 23:23]
  wire [3:0] top_fpga_managed_axi4_ar_bits_id; // @[PlatformShim.scala 23:23]
  wire [21:0] top_fpga_managed_axi4_ar_bits_addr; // @[PlatformShim.scala 23:23]
  wire [7:0] top_fpga_managed_axi4_ar_bits_len; // @[PlatformShim.scala 23:23]
  wire [2:0] top_fpga_managed_axi4_ar_bits_size; // @[PlatformShim.scala 23:23]
  wire [1:0] top_fpga_managed_axi4_ar_bits_burst; // @[PlatformShim.scala 23:23]
  wire  top_fpga_managed_axi4_ar_bits_lock; // @[PlatformShim.scala 23:23]
  wire [3:0] top_fpga_managed_axi4_ar_bits_cache; // @[PlatformShim.scala 23:23]
  wire [2:0] top_fpga_managed_axi4_ar_bits_prot; // @[PlatformShim.scala 23:23]
  wire [3:0] top_fpga_managed_axi4_ar_bits_qos; // @[PlatformShim.scala 23:23]
  wire  top_fpga_managed_axi4_r_ready; // @[PlatformShim.scala 23:23]
  wire  top_fpga_managed_axi4_r_valid; // @[PlatformShim.scala 23:23]
  wire [3:0] top_fpga_managed_axi4_r_bits_id; // @[PlatformShim.scala 23:23]
  wire [511:0] top_fpga_managed_axi4_r_bits_data; // @[PlatformShim.scala 23:23]
  wire [1:0] top_fpga_managed_axi4_r_bits_resp; // @[PlatformShim.scala 23:23]
  wire  top_fpga_managed_axi4_r_bits_last; // @[PlatformShim.scala 23:23]
  wire  firesimMMCM_clk_in1; // @[VitisShim.scala 49:29]
  wire  firesimMMCM_clk_out1; // @[VitisShim.scala 49:29]
  wire  firesimMMCM_reset; // @[VitisShim.scala 49:29]
  wire  firesimMMCM_locked; // @[VitisShim.scala 49:29]
  wire  hostSyncReset_xpm_sync_dest_clk; // @[ResetSynchronizer.scala 41:26]
  wire  hostSyncReset_xpm_sync_dest_rst; // @[ResetSynchronizer.scala 41:26]
  wire  hostSyncReset_xpm_sync_src_rst; // @[ResetSynchronizer.scala 41:26]
  wire  ctrl_cdc_s_axi_aclk; // @[VitisShim.scala 72:26]
  wire  ctrl_cdc_s_axi_aresetn; // @[VitisShim.scala 72:26]
  wire [11:0] ctrl_cdc_s_axi_awaddr; // @[VitisShim.scala 72:26]
  wire [2:0] ctrl_cdc_s_axi_awprot; // @[VitisShim.scala 72:26]
  wire  ctrl_cdc_s_axi_awvalid; // @[VitisShim.scala 72:26]
  wire  ctrl_cdc_s_axi_awready; // @[VitisShim.scala 72:26]
  wire [31:0] ctrl_cdc_s_axi_wdata; // @[VitisShim.scala 72:26]
  wire [3:0] ctrl_cdc_s_axi_wstrb; // @[VitisShim.scala 72:26]
  wire  ctrl_cdc_s_axi_wvalid; // @[VitisShim.scala 72:26]
  wire  ctrl_cdc_s_axi_wready; // @[VitisShim.scala 72:26]
  wire [1:0] ctrl_cdc_s_axi_bresp; // @[VitisShim.scala 72:26]
  wire  ctrl_cdc_s_axi_bvalid; // @[VitisShim.scala 72:26]
  wire  ctrl_cdc_s_axi_bready; // @[VitisShim.scala 72:26]
  wire [11:0] ctrl_cdc_s_axi_araddr; // @[VitisShim.scala 72:26]
  wire [2:0] ctrl_cdc_s_axi_arprot; // @[VitisShim.scala 72:26]
  wire  ctrl_cdc_s_axi_arvalid; // @[VitisShim.scala 72:26]
  wire  ctrl_cdc_s_axi_arready; // @[VitisShim.scala 72:26]
  wire [31:0] ctrl_cdc_s_axi_rdata; // @[VitisShim.scala 72:26]
  wire [1:0] ctrl_cdc_s_axi_rresp; // @[VitisShim.scala 72:26]
  wire  ctrl_cdc_s_axi_rvalid; // @[VitisShim.scala 72:26]
  wire  ctrl_cdc_s_axi_rready; // @[VitisShim.scala 72:26]
  wire  ctrl_cdc_m_axi_aclk; // @[VitisShim.scala 72:26]
  wire  ctrl_cdc_m_axi_aresetn; // @[VitisShim.scala 72:26]
  wire [11:0] ctrl_cdc_m_axi_awaddr; // @[VitisShim.scala 72:26]
  wire [2:0] ctrl_cdc_m_axi_awprot; // @[VitisShim.scala 72:26]
  wire  ctrl_cdc_m_axi_awvalid; // @[VitisShim.scala 72:26]
  wire  ctrl_cdc_m_axi_awready; // @[VitisShim.scala 72:26]
  wire [31:0] ctrl_cdc_m_axi_wdata; // @[VitisShim.scala 72:26]
  wire [3:0] ctrl_cdc_m_axi_wstrb; // @[VitisShim.scala 72:26]
  wire  ctrl_cdc_m_axi_wvalid; // @[VitisShim.scala 72:26]
  wire  ctrl_cdc_m_axi_wready; // @[VitisShim.scala 72:26]
  wire [1:0] ctrl_cdc_m_axi_bresp; // @[VitisShim.scala 72:26]
  wire  ctrl_cdc_m_axi_bvalid; // @[VitisShim.scala 72:26]
  wire  ctrl_cdc_m_axi_bready; // @[VitisShim.scala 72:26]
  wire [11:0] ctrl_cdc_m_axi_araddr; // @[VitisShim.scala 72:26]
  wire [2:0] ctrl_cdc_m_axi_arprot; // @[VitisShim.scala 72:26]
  wire  ctrl_cdc_m_axi_arvalid; // @[VitisShim.scala 72:26]
  wire  ctrl_cdc_m_axi_arready; // @[VitisShim.scala 72:26]
  wire [31:0] ctrl_cdc_m_axi_rdata; // @[VitisShim.scala 72:26]
  wire [1:0] ctrl_cdc_m_axi_rresp; // @[VitisShim.scala 72:26]
  wire  ctrl_cdc_m_axi_rvalid; // @[VitisShim.scala 72:26]
  wire  ctrl_cdc_m_axi_rready; // @[VitisShim.scala 72:26]
  wire  axi4ToNasti_io_axi4_aw_ready; // @[VitisShim.scala 82:29]
  wire  axi4ToNasti_io_axi4_aw_valid; // @[VitisShim.scala 82:29]
  wire [11:0] axi4ToNasti_io_axi4_aw_bits_addr; // @[VitisShim.scala 82:29]
  wire [2:0] axi4ToNasti_io_axi4_aw_bits_prot; // @[VitisShim.scala 82:29]
  wire  axi4ToNasti_io_axi4_w_ready; // @[VitisShim.scala 82:29]
  wire  axi4ToNasti_io_axi4_w_valid; // @[VitisShim.scala 82:29]
  wire [31:0] axi4ToNasti_io_axi4_w_bits_data; // @[VitisShim.scala 82:29]
  wire [3:0] axi4ToNasti_io_axi4_w_bits_strb; // @[VitisShim.scala 82:29]
  wire  axi4ToNasti_io_axi4_b_ready; // @[VitisShim.scala 82:29]
  wire  axi4ToNasti_io_axi4_b_valid; // @[VitisShim.scala 82:29]
  wire [1:0] axi4ToNasti_io_axi4_b_bits_resp; // @[VitisShim.scala 82:29]
  wire  axi4ToNasti_io_axi4_ar_ready; // @[VitisShim.scala 82:29]
  wire  axi4ToNasti_io_axi4_ar_valid; // @[VitisShim.scala 82:29]
  wire [11:0] axi4ToNasti_io_axi4_ar_bits_addr; // @[VitisShim.scala 82:29]
  wire [2:0] axi4ToNasti_io_axi4_ar_bits_prot; // @[VitisShim.scala 82:29]
  wire  axi4ToNasti_io_axi4_r_ready; // @[VitisShim.scala 82:29]
  wire  axi4ToNasti_io_axi4_r_valid; // @[VitisShim.scala 82:29]
  wire [31:0] axi4ToNasti_io_axi4_r_bits_data; // @[VitisShim.scala 82:29]
  wire [1:0] axi4ToNasti_io_axi4_r_bits_resp; // @[VitisShim.scala 82:29]
  wire  axi4ToNasti_io_axi4_r_bits_last; // @[VitisShim.scala 82:29]
  wire  axi4ToNasti_io_nasti_aw_ready; // @[VitisShim.scala 82:29]
  wire  axi4ToNasti_io_nasti_aw_valid; // @[VitisShim.scala 82:29]
  wire [11:0] axi4ToNasti_io_nasti_aw_bits_addr; // @[VitisShim.scala 82:29]
  wire [2:0] axi4ToNasti_io_nasti_aw_bits_prot; // @[VitisShim.scala 82:29]
  wire  axi4ToNasti_io_nasti_w_ready; // @[VitisShim.scala 82:29]
  wire  axi4ToNasti_io_nasti_w_valid; // @[VitisShim.scala 82:29]
  wire [31:0] axi4ToNasti_io_nasti_w_bits_data; // @[VitisShim.scala 82:29]
  wire [3:0] axi4ToNasti_io_nasti_w_bits_strb; // @[VitisShim.scala 82:29]
  wire  axi4ToNasti_io_nasti_b_ready; // @[VitisShim.scala 82:29]
  wire  axi4ToNasti_io_nasti_b_valid; // @[VitisShim.scala 82:29]
  wire [1:0] axi4ToNasti_io_nasti_b_bits_resp; // @[VitisShim.scala 82:29]
  wire  axi4ToNasti_io_nasti_ar_ready; // @[VitisShim.scala 82:29]
  wire  axi4ToNasti_io_nasti_ar_valid; // @[VitisShim.scala 82:29]
  wire [11:0] axi4ToNasti_io_nasti_ar_bits_addr; // @[VitisShim.scala 82:29]
  wire [2:0] axi4ToNasti_io_nasti_ar_bits_prot; // @[VitisShim.scala 82:29]
  wire  axi4ToNasti_io_nasti_r_ready; // @[VitisShim.scala 82:29]
  wire  axi4ToNasti_io_nasti_r_valid; // @[VitisShim.scala 82:29]
  wire [1:0] axi4ToNasti_io_nasti_r_bits_resp; // @[VitisShim.scala 82:29]
  wire [31:0] axi4ToNasti_io_nasti_r_bits_data; // @[VitisShim.scala 82:29]
  wire  axi4ToNasti_io_nasti_r_bits_last; // @[VitisShim.scala 82:29]
  wire  dma_cdc_s_axi_aclk; // @[VitisShim.scala 128:27]
  wire  dma_cdc_s_axi_aresetn; // @[VitisShim.scala 128:27]
  wire [3:0] dma_cdc_s_axi_awid; // @[VitisShim.scala 128:27]
  wire [63:0] dma_cdc_s_axi_awaddr; // @[VitisShim.scala 128:27]
  wire [7:0] dma_cdc_s_axi_awlen; // @[VitisShim.scala 128:27]
  wire [2:0] dma_cdc_s_axi_awsize; // @[VitisShim.scala 128:27]
  wire [1:0] dma_cdc_s_axi_awburst; // @[VitisShim.scala 128:27]
  wire  dma_cdc_s_axi_awlock; // @[VitisShim.scala 128:27]
  wire [3:0] dma_cdc_s_axi_awcache; // @[VitisShim.scala 128:27]
  wire [2:0] dma_cdc_s_axi_awprot; // @[VitisShim.scala 128:27]
  wire [3:0] dma_cdc_s_axi_awqos; // @[VitisShim.scala 128:27]
  wire  dma_cdc_s_axi_awvalid; // @[VitisShim.scala 128:27]
  wire  dma_cdc_s_axi_awready; // @[VitisShim.scala 128:27]
  wire [511:0] dma_cdc_s_axi_wdata; // @[VitisShim.scala 128:27]
  wire [63:0] dma_cdc_s_axi_wstrb; // @[VitisShim.scala 128:27]
  wire  dma_cdc_s_axi_wlast; // @[VitisShim.scala 128:27]
  wire  dma_cdc_s_axi_wvalid; // @[VitisShim.scala 128:27]
  wire  dma_cdc_s_axi_wready; // @[VitisShim.scala 128:27]
  wire [3:0] dma_cdc_s_axi_bid; // @[VitisShim.scala 128:27]
  wire [1:0] dma_cdc_s_axi_bresp; // @[VitisShim.scala 128:27]
  wire  dma_cdc_s_axi_bvalid; // @[VitisShim.scala 128:27]
  wire  dma_cdc_s_axi_bready; // @[VitisShim.scala 128:27]
  wire [3:0] dma_cdc_s_axi_arid; // @[VitisShim.scala 128:27]
  wire [63:0] dma_cdc_s_axi_araddr; // @[VitisShim.scala 128:27]
  wire [7:0] dma_cdc_s_axi_arlen; // @[VitisShim.scala 128:27]
  wire [2:0] dma_cdc_s_axi_arsize; // @[VitisShim.scala 128:27]
  wire [1:0] dma_cdc_s_axi_arburst; // @[VitisShim.scala 128:27]
  wire  dma_cdc_s_axi_arlock; // @[VitisShim.scala 128:27]
  wire [3:0] dma_cdc_s_axi_arcache; // @[VitisShim.scala 128:27]
  wire [2:0] dma_cdc_s_axi_arprot; // @[VitisShim.scala 128:27]
  wire [3:0] dma_cdc_s_axi_arqos; // @[VitisShim.scala 128:27]
  wire  dma_cdc_s_axi_arvalid; // @[VitisShim.scala 128:27]
  wire  dma_cdc_s_axi_arready; // @[VitisShim.scala 128:27]
  wire [3:0] dma_cdc_s_axi_rid; // @[VitisShim.scala 128:27]
  wire [511:0] dma_cdc_s_axi_rdata; // @[VitisShim.scala 128:27]
  wire [1:0] dma_cdc_s_axi_rresp; // @[VitisShim.scala 128:27]
  wire  dma_cdc_s_axi_rlast; // @[VitisShim.scala 128:27]
  wire  dma_cdc_s_axi_rvalid; // @[VitisShim.scala 128:27]
  wire  dma_cdc_s_axi_rready; // @[VitisShim.scala 128:27]
  wire  dma_cdc_m_axi_aclk; // @[VitisShim.scala 128:27]
  wire  dma_cdc_m_axi_aresetn; // @[VitisShim.scala 128:27]
  wire [3:0] dma_cdc_m_axi_awid; // @[VitisShim.scala 128:27]
  wire [63:0] dma_cdc_m_axi_awaddr; // @[VitisShim.scala 128:27]
  wire [7:0] dma_cdc_m_axi_awlen; // @[VitisShim.scala 128:27]
  wire [2:0] dma_cdc_m_axi_awsize; // @[VitisShim.scala 128:27]
  wire [1:0] dma_cdc_m_axi_awburst; // @[VitisShim.scala 128:27]
  wire  dma_cdc_m_axi_awlock; // @[VitisShim.scala 128:27]
  wire [3:0] dma_cdc_m_axi_awcache; // @[VitisShim.scala 128:27]
  wire [2:0] dma_cdc_m_axi_awprot; // @[VitisShim.scala 128:27]
  wire [3:0] dma_cdc_m_axi_awqos; // @[VitisShim.scala 128:27]
  wire  dma_cdc_m_axi_awvalid; // @[VitisShim.scala 128:27]
  wire  dma_cdc_m_axi_awready; // @[VitisShim.scala 128:27]
  wire [511:0] dma_cdc_m_axi_wdata; // @[VitisShim.scala 128:27]
  wire [63:0] dma_cdc_m_axi_wstrb; // @[VitisShim.scala 128:27]
  wire  dma_cdc_m_axi_wlast; // @[VitisShim.scala 128:27]
  wire  dma_cdc_m_axi_wvalid; // @[VitisShim.scala 128:27]
  wire  dma_cdc_m_axi_wready; // @[VitisShim.scala 128:27]
  wire [3:0] dma_cdc_m_axi_bid; // @[VitisShim.scala 128:27]
  wire [1:0] dma_cdc_m_axi_bresp; // @[VitisShim.scala 128:27]
  wire  dma_cdc_m_axi_bvalid; // @[VitisShim.scala 128:27]
  wire  dma_cdc_m_axi_bready; // @[VitisShim.scala 128:27]
  wire [3:0] dma_cdc_m_axi_arid; // @[VitisShim.scala 128:27]
  wire [63:0] dma_cdc_m_axi_araddr; // @[VitisShim.scala 128:27]
  wire [7:0] dma_cdc_m_axi_arlen; // @[VitisShim.scala 128:27]
  wire [2:0] dma_cdc_m_axi_arsize; // @[VitisShim.scala 128:27]
  wire [1:0] dma_cdc_m_axi_arburst; // @[VitisShim.scala 128:27]
  wire  dma_cdc_m_axi_arlock; // @[VitisShim.scala 128:27]
  wire [3:0] dma_cdc_m_axi_arcache; // @[VitisShim.scala 128:27]
  wire [2:0] dma_cdc_m_axi_arprot; // @[VitisShim.scala 128:27]
  wire [3:0] dma_cdc_m_axi_arqos; // @[VitisShim.scala 128:27]
  wire  dma_cdc_m_axi_arvalid; // @[VitisShim.scala 128:27]
  wire  dma_cdc_m_axi_arready; // @[VitisShim.scala 128:27]
  wire [3:0] dma_cdc_m_axi_rid; // @[VitisShim.scala 128:27]
  wire [511:0] dma_cdc_m_axi_rdata; // @[VitisShim.scala 128:27]
  wire [1:0] dma_cdc_m_axi_rresp; // @[VitisShim.scala 128:27]
  wire  dma_cdc_m_axi_rlast; // @[VitisShim.scala 128:27]
  wire  dma_cdc_m_axi_rvalid; // @[VitisShim.scala 128:27]
  wire  dma_cdc_m_axi_rready; // @[VitisShim.scala 128:27]
  wire  ap_rst = ~ap_rst_n; // @[VitisShim.scala 46:19]
  wire  _ctrl_cdc_io_s_axi_aresetn_T = ~ap_rst; // @[VitisShim.scala 75:35]
  wire  _T_3 = ~hostSyncReset_xpm_sync_dest_rst; // @[AXI4Crossing.scala 111:15]
  reg [63:0] cyclecount; // @[AXI4Printf.scala 80:29]
  wire [63:0] _cyclecount_T_1 = cyclecount + 64'h1; // @[AXI4Printf.scala 81:30]
  wire  _T_5 = host_mem_0_awready & host_mem_0_awvalid; // @[AXI4Printf.scala 82:22]
  wire  _T_8 = host_mem_0_wready & host_mem_0_wvalid; // @[AXI4Printf.scala 98:21]
  wire  _T_11 = host_mem_0_bready & host_mem_0_bvalid; // @[AXI4Printf.scala 107:21]
  wire  _T_14 = host_mem_0_arready & host_mem_0_arvalid; // @[AXI4Printf.scala 116:22]
  wire  _T_17 = host_mem_0_rready & host_mem_0_rvalid; // @[AXI4Printf.scala 132:21]
  reg [63:0] cyclecount_1; // @[AXI4Printf.scala 80:29]
  wire [63:0] _cyclecount_T_3 = cyclecount_1 + 64'h1; // @[AXI4Printf.scala 81:30]
  wire  _T_20 = m_dma_awready & m_dma_awvalid; // @[AXI4Printf.scala 82:22]
  wire  _T_23 = m_dma_wready & m_dma_wvalid; // @[AXI4Printf.scala 98:21]
  wire  _T_26 = m_dma_bready & m_dma_bvalid; // @[AXI4Printf.scala 107:21]
  wire  _T_29 = m_dma_arready & m_dma_arvalid; // @[AXI4Printf.scala 116:22]
  wire  _T_32 = m_dma_rready & m_dma_rvalid; // @[AXI4Printf.scala 132:21]
  reg [63:0] cyclecount_2; // @[AXI4Printf.scala 13:29]
  wire [63:0] _cyclecount_T_5 = cyclecount_2 + 64'h1; // @[AXI4Printf.scala 14:30]
  wire  _T_35 = top_fpga_managed_axi4_aw_ready & top_fpga_managed_axi4_aw_valid; // @[Decoupled.scala 51:35]
  wire  _T_38 = top_fpga_managed_axi4_w_ready & top_fpga_managed_axi4_w_valid; // @[Decoupled.scala 51:35]
  wire  _T_41 = top_fpga_managed_axi4_b_ready & top_fpga_managed_axi4_b_valid; // @[Decoupled.scala 51:35]
  wire  _T_44 = top_fpga_managed_axi4_ar_ready & top_fpga_managed_axi4_ar_valid; // @[Decoupled.scala 51:35]
  wire  _T_47 = top_fpga_managed_axi4_r_ready & top_fpga_managed_axi4_r_valid; // @[Decoupled.scala 51:35]
  wire [63:0] _GEN_0 = {{42'd0}, top_fpga_managed_axi4_ar_bits_addr}; // @[VitisShim.scala 132:62]
  wire [63:0] _GEN_1 = {{42'd0}, top_fpga_managed_axi4_aw_bits_addr}; // @[VitisShim.scala 133:62]
  FPGATop top ( // @[PlatformShim.scala 23:23]
    .clock(top_clock),
    .reset(top_reset),
    .ctrl_aw_ready(top_ctrl_aw_ready),
    .ctrl_aw_valid(top_ctrl_aw_valid),
    .ctrl_aw_bits_addr(top_ctrl_aw_bits_addr),
    .ctrl_aw_bits_len(top_ctrl_aw_bits_len),
    .ctrl_aw_bits_size(top_ctrl_aw_bits_size),
    .ctrl_aw_bits_burst(top_ctrl_aw_bits_burst),
    .ctrl_aw_bits_lock(top_ctrl_aw_bits_lock),
    .ctrl_aw_bits_cache(top_ctrl_aw_bits_cache),
    .ctrl_aw_bits_prot(top_ctrl_aw_bits_prot),
    .ctrl_aw_bits_qos(top_ctrl_aw_bits_qos),
    .ctrl_aw_bits_region(top_ctrl_aw_bits_region),
    .ctrl_aw_bits_id(top_ctrl_aw_bits_id),
    .ctrl_aw_bits_user(top_ctrl_aw_bits_user),
    .ctrl_w_ready(top_ctrl_w_ready),
    .ctrl_w_valid(top_ctrl_w_valid),
    .ctrl_w_bits_data(top_ctrl_w_bits_data),
    .ctrl_w_bits_last(top_ctrl_w_bits_last),
    .ctrl_w_bits_id(top_ctrl_w_bits_id),
    .ctrl_w_bits_strb(top_ctrl_w_bits_strb),
    .ctrl_w_bits_user(top_ctrl_w_bits_user),
    .ctrl_b_ready(top_ctrl_b_ready),
    .ctrl_b_valid(top_ctrl_b_valid),
    .ctrl_b_bits_resp(top_ctrl_b_bits_resp),
    .ctrl_b_bits_id(top_ctrl_b_bits_id),
    .ctrl_b_bits_user(top_ctrl_b_bits_user),
    .ctrl_ar_ready(top_ctrl_ar_ready),
    .ctrl_ar_valid(top_ctrl_ar_valid),
    .ctrl_ar_bits_addr(top_ctrl_ar_bits_addr),
    .ctrl_ar_bits_len(top_ctrl_ar_bits_len),
    .ctrl_ar_bits_size(top_ctrl_ar_bits_size),
    .ctrl_ar_bits_burst(top_ctrl_ar_bits_burst),
    .ctrl_ar_bits_lock(top_ctrl_ar_bits_lock),
    .ctrl_ar_bits_cache(top_ctrl_ar_bits_cache),
    .ctrl_ar_bits_prot(top_ctrl_ar_bits_prot),
    .ctrl_ar_bits_qos(top_ctrl_ar_bits_qos),
    .ctrl_ar_bits_region(top_ctrl_ar_bits_region),
    .ctrl_ar_bits_id(top_ctrl_ar_bits_id),
    .ctrl_ar_bits_user(top_ctrl_ar_bits_user),
    .ctrl_r_ready(top_ctrl_r_ready),
    .ctrl_r_valid(top_ctrl_r_valid),
    .ctrl_r_bits_resp(top_ctrl_r_bits_resp),
    .ctrl_r_bits_data(top_ctrl_r_bits_data),
    .ctrl_r_bits_last(top_ctrl_r_bits_last),
    .ctrl_r_bits_id(top_ctrl_r_bits_id),
    .ctrl_r_bits_user(top_ctrl_r_bits_user),
    .fpga_managed_axi4_aw_ready(top_fpga_managed_axi4_aw_ready),
    .fpga_managed_axi4_aw_valid(top_fpga_managed_axi4_aw_valid),
    .fpga_managed_axi4_aw_bits_id(top_fpga_managed_axi4_aw_bits_id),
    .fpga_managed_axi4_aw_bits_addr(top_fpga_managed_axi4_aw_bits_addr),
    .fpga_managed_axi4_aw_bits_len(top_fpga_managed_axi4_aw_bits_len),
    .fpga_managed_axi4_aw_bits_size(top_fpga_managed_axi4_aw_bits_size),
    .fpga_managed_axi4_aw_bits_burst(top_fpga_managed_axi4_aw_bits_burst),
    .fpga_managed_axi4_aw_bits_lock(top_fpga_managed_axi4_aw_bits_lock),
    .fpga_managed_axi4_aw_bits_cache(top_fpga_managed_axi4_aw_bits_cache),
    .fpga_managed_axi4_aw_bits_prot(top_fpga_managed_axi4_aw_bits_prot),
    .fpga_managed_axi4_aw_bits_qos(top_fpga_managed_axi4_aw_bits_qos),
    .fpga_managed_axi4_w_ready(top_fpga_managed_axi4_w_ready),
    .fpga_managed_axi4_w_valid(top_fpga_managed_axi4_w_valid),
    .fpga_managed_axi4_w_bits_data(top_fpga_managed_axi4_w_bits_data),
    .fpga_managed_axi4_w_bits_strb(top_fpga_managed_axi4_w_bits_strb),
    .fpga_managed_axi4_w_bits_last(top_fpga_managed_axi4_w_bits_last),
    .fpga_managed_axi4_b_ready(top_fpga_managed_axi4_b_ready),
    .fpga_managed_axi4_b_valid(top_fpga_managed_axi4_b_valid),
    .fpga_managed_axi4_b_bits_id(top_fpga_managed_axi4_b_bits_id),
    .fpga_managed_axi4_b_bits_resp(top_fpga_managed_axi4_b_bits_resp),
    .fpga_managed_axi4_ar_ready(top_fpga_managed_axi4_ar_ready),
    .fpga_managed_axi4_ar_valid(top_fpga_managed_axi4_ar_valid),
    .fpga_managed_axi4_ar_bits_id(top_fpga_managed_axi4_ar_bits_id),
    .fpga_managed_axi4_ar_bits_addr(top_fpga_managed_axi4_ar_bits_addr),
    .fpga_managed_axi4_ar_bits_len(top_fpga_managed_axi4_ar_bits_len),
    .fpga_managed_axi4_ar_bits_size(top_fpga_managed_axi4_ar_bits_size),
    .fpga_managed_axi4_ar_bits_burst(top_fpga_managed_axi4_ar_bits_burst),
    .fpga_managed_axi4_ar_bits_lock(top_fpga_managed_axi4_ar_bits_lock),
    .fpga_managed_axi4_ar_bits_cache(top_fpga_managed_axi4_ar_bits_cache),
    .fpga_managed_axi4_ar_bits_prot(top_fpga_managed_axi4_ar_bits_prot),
    .fpga_managed_axi4_ar_bits_qos(top_fpga_managed_axi4_ar_bits_qos),
    .fpga_managed_axi4_r_ready(top_fpga_managed_axi4_r_ready),
    .fpga_managed_axi4_r_valid(top_fpga_managed_axi4_r_valid),
    .fpga_managed_axi4_r_bits_id(top_fpga_managed_axi4_r_bits_id),
    .fpga_managed_axi4_r_bits_data(top_fpga_managed_axi4_r_bits_data),
    .fpga_managed_axi4_r_bits_resp(top_fpga_managed_axi4_r_bits_resp),
    .fpga_managed_axi4_r_bits_last(top_fpga_managed_axi4_r_bits_last)
  );
  firesim_clocking firesimMMCM ( // @[VitisShim.scala 49:29]
    .clk_in1(firesimMMCM_clk_in1),
    .clk_out1(firesimMMCM_clk_out1),
    .reset(firesimMMCM_reset),
    .locked(firesimMMCM_locked)
  );
  xpm_cdc_sync_rst #(.DEST_SYNC_FF(4), .INIT(1), .INIT_SYNC_FF(1)) hostSyncReset_xpm_sync ( // @[ResetSynchronizer.scala 41:26]
    .dest_clk(hostSyncReset_xpm_sync_dest_clk),
    .dest_rst(hostSyncReset_xpm_sync_dest_rst),
    .src_rst(hostSyncReset_xpm_sync_src_rst)
  );
  ctrl_cdc ctrl_cdc ( // @[VitisShim.scala 72:26]
    .s_axi_aclk(ctrl_cdc_s_axi_aclk),
    .s_axi_aresetn(ctrl_cdc_s_axi_aresetn),
    .s_axi_awaddr(ctrl_cdc_s_axi_awaddr),
    .s_axi_awprot(ctrl_cdc_s_axi_awprot),
    .s_axi_awvalid(ctrl_cdc_s_axi_awvalid),
    .s_axi_awready(ctrl_cdc_s_axi_awready),
    .s_axi_wdata(ctrl_cdc_s_axi_wdata),
    .s_axi_wstrb(ctrl_cdc_s_axi_wstrb),
    .s_axi_wvalid(ctrl_cdc_s_axi_wvalid),
    .s_axi_wready(ctrl_cdc_s_axi_wready),
    .s_axi_bresp(ctrl_cdc_s_axi_bresp),
    .s_axi_bvalid(ctrl_cdc_s_axi_bvalid),
    .s_axi_bready(ctrl_cdc_s_axi_bready),
    .s_axi_araddr(ctrl_cdc_s_axi_araddr),
    .s_axi_arprot(ctrl_cdc_s_axi_arprot),
    .s_axi_arvalid(ctrl_cdc_s_axi_arvalid),
    .s_axi_arready(ctrl_cdc_s_axi_arready),
    .s_axi_rdata(ctrl_cdc_s_axi_rdata),
    .s_axi_rresp(ctrl_cdc_s_axi_rresp),
    .s_axi_rvalid(ctrl_cdc_s_axi_rvalid),
    .s_axi_rready(ctrl_cdc_s_axi_rready),
    .m_axi_aclk(ctrl_cdc_m_axi_aclk),
    .m_axi_aresetn(ctrl_cdc_m_axi_aresetn),
    .m_axi_awaddr(ctrl_cdc_m_axi_awaddr),
    .m_axi_awprot(ctrl_cdc_m_axi_awprot),
    .m_axi_awvalid(ctrl_cdc_m_axi_awvalid),
    .m_axi_awready(ctrl_cdc_m_axi_awready),
    .m_axi_wdata(ctrl_cdc_m_axi_wdata),
    .m_axi_wstrb(ctrl_cdc_m_axi_wstrb),
    .m_axi_wvalid(ctrl_cdc_m_axi_wvalid),
    .m_axi_wready(ctrl_cdc_m_axi_wready),
    .m_axi_bresp(ctrl_cdc_m_axi_bresp),
    .m_axi_bvalid(ctrl_cdc_m_axi_bvalid),
    .m_axi_bready(ctrl_cdc_m_axi_bready),
    .m_axi_araddr(ctrl_cdc_m_axi_araddr),
    .m_axi_arprot(ctrl_cdc_m_axi_arprot),
    .m_axi_arvalid(ctrl_cdc_m_axi_arvalid),
    .m_axi_arready(ctrl_cdc_m_axi_arready),
    .m_axi_rdata(ctrl_cdc_m_axi_rdata),
    .m_axi_rresp(ctrl_cdc_m_axi_rresp),
    .m_axi_rvalid(ctrl_cdc_m_axi_rvalid),
    .m_axi_rready(ctrl_cdc_m_axi_rready)
  );
  AXI42NastiIdentityModule axi4ToNasti ( // @[VitisShim.scala 82:29]
    .io_axi4_aw_ready(axi4ToNasti_io_axi4_aw_ready),
    .io_axi4_aw_valid(axi4ToNasti_io_axi4_aw_valid),
    .io_axi4_aw_bits_addr(axi4ToNasti_io_axi4_aw_bits_addr),
    .io_axi4_aw_bits_prot(axi4ToNasti_io_axi4_aw_bits_prot),
    .io_axi4_w_ready(axi4ToNasti_io_axi4_w_ready),
    .io_axi4_w_valid(axi4ToNasti_io_axi4_w_valid),
    .io_axi4_w_bits_data(axi4ToNasti_io_axi4_w_bits_data),
    .io_axi4_w_bits_strb(axi4ToNasti_io_axi4_w_bits_strb),
    .io_axi4_b_ready(axi4ToNasti_io_axi4_b_ready),
    .io_axi4_b_valid(axi4ToNasti_io_axi4_b_valid),
    .io_axi4_b_bits_resp(axi4ToNasti_io_axi4_b_bits_resp),
    .io_axi4_ar_ready(axi4ToNasti_io_axi4_ar_ready),
    .io_axi4_ar_valid(axi4ToNasti_io_axi4_ar_valid),
    .io_axi4_ar_bits_addr(axi4ToNasti_io_axi4_ar_bits_addr),
    .io_axi4_ar_bits_prot(axi4ToNasti_io_axi4_ar_bits_prot),
    .io_axi4_r_ready(axi4ToNasti_io_axi4_r_ready),
    .io_axi4_r_valid(axi4ToNasti_io_axi4_r_valid),
    .io_axi4_r_bits_data(axi4ToNasti_io_axi4_r_bits_data),
    .io_axi4_r_bits_resp(axi4ToNasti_io_axi4_r_bits_resp),
    .io_axi4_r_bits_last(axi4ToNasti_io_axi4_r_bits_last),
    .io_nasti_aw_ready(axi4ToNasti_io_nasti_aw_ready),
    .io_nasti_aw_valid(axi4ToNasti_io_nasti_aw_valid),
    .io_nasti_aw_bits_addr(axi4ToNasti_io_nasti_aw_bits_addr),
    .io_nasti_aw_bits_prot(axi4ToNasti_io_nasti_aw_bits_prot),
    .io_nasti_w_ready(axi4ToNasti_io_nasti_w_ready),
    .io_nasti_w_valid(axi4ToNasti_io_nasti_w_valid),
    .io_nasti_w_bits_data(axi4ToNasti_io_nasti_w_bits_data),
    .io_nasti_w_bits_strb(axi4ToNasti_io_nasti_w_bits_strb),
    .io_nasti_b_ready(axi4ToNasti_io_nasti_b_ready),
    .io_nasti_b_valid(axi4ToNasti_io_nasti_b_valid),
    .io_nasti_b_bits_resp(axi4ToNasti_io_nasti_b_bits_resp),
    .io_nasti_ar_ready(axi4ToNasti_io_nasti_ar_ready),
    .io_nasti_ar_valid(axi4ToNasti_io_nasti_ar_valid),
    .io_nasti_ar_bits_addr(axi4ToNasti_io_nasti_ar_bits_addr),
    .io_nasti_ar_bits_prot(axi4ToNasti_io_nasti_ar_bits_prot),
    .io_nasti_r_ready(axi4ToNasti_io_nasti_r_ready),
    .io_nasti_r_valid(axi4ToNasti_io_nasti_r_valid),
    .io_nasti_r_bits_resp(axi4ToNasti_io_nasti_r_bits_resp),
    .io_nasti_r_bits_data(axi4ToNasti_io_nasti_r_bits_data),
    .io_nasti_r_bits_last(axi4ToNasti_io_nasti_r_bits_last)
  );
  dma_cdc dma_cdc ( // @[VitisShim.scala 128:27]
    .s_axi_aclk(dma_cdc_s_axi_aclk),
    .s_axi_aresetn(dma_cdc_s_axi_aresetn),
    .s_axi_awid(dma_cdc_s_axi_awid),
    .s_axi_awaddr(dma_cdc_s_axi_awaddr),
    .s_axi_awlen(dma_cdc_s_axi_awlen),
    .s_axi_awsize(dma_cdc_s_axi_awsize),
    .s_axi_awburst(dma_cdc_s_axi_awburst),
    .s_axi_awlock(dma_cdc_s_axi_awlock),
    .s_axi_awcache(dma_cdc_s_axi_awcache),
    .s_axi_awprot(dma_cdc_s_axi_awprot),
    .s_axi_awqos(dma_cdc_s_axi_awqos),
    .s_axi_awvalid(dma_cdc_s_axi_awvalid),
    .s_axi_awready(dma_cdc_s_axi_awready),
    .s_axi_wdata(dma_cdc_s_axi_wdata),
    .s_axi_wstrb(dma_cdc_s_axi_wstrb),
    .s_axi_wlast(dma_cdc_s_axi_wlast),
    .s_axi_wvalid(dma_cdc_s_axi_wvalid),
    .s_axi_wready(dma_cdc_s_axi_wready),
    .s_axi_bid(dma_cdc_s_axi_bid),
    .s_axi_bresp(dma_cdc_s_axi_bresp),
    .s_axi_bvalid(dma_cdc_s_axi_bvalid),
    .s_axi_bready(dma_cdc_s_axi_bready),
    .s_axi_arid(dma_cdc_s_axi_arid),
    .s_axi_araddr(dma_cdc_s_axi_araddr),
    .s_axi_arlen(dma_cdc_s_axi_arlen),
    .s_axi_arsize(dma_cdc_s_axi_arsize),
    .s_axi_arburst(dma_cdc_s_axi_arburst),
    .s_axi_arlock(dma_cdc_s_axi_arlock),
    .s_axi_arcache(dma_cdc_s_axi_arcache),
    .s_axi_arprot(dma_cdc_s_axi_arprot),
    .s_axi_arqos(dma_cdc_s_axi_arqos),
    .s_axi_arvalid(dma_cdc_s_axi_arvalid),
    .s_axi_arready(dma_cdc_s_axi_arready),
    .s_axi_rid(dma_cdc_s_axi_rid),
    .s_axi_rdata(dma_cdc_s_axi_rdata),
    .s_axi_rresp(dma_cdc_s_axi_rresp),
    .s_axi_rlast(dma_cdc_s_axi_rlast),
    .s_axi_rvalid(dma_cdc_s_axi_rvalid),
    .s_axi_rready(dma_cdc_s_axi_rready),
    .m_axi_aclk(dma_cdc_m_axi_aclk),
    .m_axi_aresetn(dma_cdc_m_axi_aresetn),
    .m_axi_awid(dma_cdc_m_axi_awid),
    .m_axi_awaddr(dma_cdc_m_axi_awaddr),
    .m_axi_awlen(dma_cdc_m_axi_awlen),
    .m_axi_awsize(dma_cdc_m_axi_awsize),
    .m_axi_awburst(dma_cdc_m_axi_awburst),
    .m_axi_awlock(dma_cdc_m_axi_awlock),
    .m_axi_awcache(dma_cdc_m_axi_awcache),
    .m_axi_awprot(dma_cdc_m_axi_awprot),
    .m_axi_awqos(dma_cdc_m_axi_awqos),
    .m_axi_awvalid(dma_cdc_m_axi_awvalid),
    .m_axi_awready(dma_cdc_m_axi_awready),
    .m_axi_wdata(dma_cdc_m_axi_wdata),
    .m_axi_wstrb(dma_cdc_m_axi_wstrb),
    .m_axi_wlast(dma_cdc_m_axi_wlast),
    .m_axi_wvalid(dma_cdc_m_axi_wvalid),
    .m_axi_wready(dma_cdc_m_axi_wready),
    .m_axi_bid(dma_cdc_m_axi_bid),
    .m_axi_bresp(dma_cdc_m_axi_bresp),
    .m_axi_bvalid(dma_cdc_m_axi_bvalid),
    .m_axi_bready(dma_cdc_m_axi_bready),
    .m_axi_arid(dma_cdc_m_axi_arid),
    .m_axi_araddr(dma_cdc_m_axi_araddr),
    .m_axi_arlen(dma_cdc_m_axi_arlen),
    .m_axi_arsize(dma_cdc_m_axi_arsize),
    .m_axi_arburst(dma_cdc_m_axi_arburst),
    .m_axi_arlock(dma_cdc_m_axi_arlock),
    .m_axi_arcache(dma_cdc_m_axi_arcache),
    .m_axi_arprot(dma_cdc_m_axi_arprot),
    .m_axi_arqos(dma_cdc_m_axi_arqos),
    .m_axi_arvalid(dma_cdc_m_axi_arvalid),
    .m_axi_arready(dma_cdc_m_axi_arready),
    .m_axi_rid(dma_cdc_m_axi_rid),
    .m_axi_rdata(dma_cdc_m_axi_rdata),
    .m_axi_rresp(dma_cdc_m_axi_rresp),
    .m_axi_rlast(dma_cdc_m_axi_rlast),
    .m_axi_rvalid(dma_cdc_m_axi_rvalid),
    .m_axi_rready(dma_cdc_m_axi_rready)
  );
  assign s_axi_lite_awready = ctrl_cdc_s_axi_awready; // @[VitisShim.scala 73:31]
  assign s_axi_lite_wready = ctrl_cdc_s_axi_wready; // @[VitisShim.scala 73:31]
  assign s_axi_lite_bresp = ctrl_cdc_s_axi_bresp; // @[VitisShim.scala 73:31]
  assign s_axi_lite_bvalid = ctrl_cdc_s_axi_bvalid; // @[VitisShim.scala 73:31]
  assign s_axi_lite_arready = ctrl_cdc_s_axi_arready; // @[VitisShim.scala 73:31]
  assign s_axi_lite_rdata = ctrl_cdc_s_axi_rdata; // @[VitisShim.scala 73:31]
  assign s_axi_lite_rresp = ctrl_cdc_s_axi_rresp; // @[VitisShim.scala 73:31]
  assign s_axi_lite_rvalid = ctrl_cdc_s_axi_rvalid; // @[VitisShim.scala 73:31]
  assign host_mem_0_awid = 16'h0;
  assign host_mem_0_awaddr = 64'h0;
  assign host_mem_0_awlen = 8'h0;
  assign host_mem_0_awsize = 3'h0;
  assign host_mem_0_awburst = 2'h0;
  assign host_mem_0_awlock = 1'h0;
  assign host_mem_0_awcache = 4'h0;
  assign host_mem_0_awprot = 3'h0;
  assign host_mem_0_awqos = 4'h0;
  assign host_mem_0_awvalid = 1'h0; // @[AXI4Crossing.scala 184:13]
  assign host_mem_0_wdata = 64'h0;
  assign host_mem_0_wstrb = 8'h0;
  assign host_mem_0_wlast = 1'h0;
  assign host_mem_0_wvalid = 1'h0; // @[AXI4Crossing.scala 189:12]
  assign host_mem_0_bready = 1'h0; // @[AXI4Crossing.scala 191:12]
  assign host_mem_0_arid = 16'h0;
  assign host_mem_0_araddr = 64'h0;
  assign host_mem_0_arlen = 8'h0;
  assign host_mem_0_arsize = 3'h0;
  assign host_mem_0_arburst = 2'h0;
  assign host_mem_0_arlock = 1'h0;
  assign host_mem_0_arcache = 4'h0;
  assign host_mem_0_arprot = 3'h0;
  assign host_mem_0_arqos = 4'h0;
  assign host_mem_0_arvalid = 1'h0; // @[AXI4Crossing.scala 202:13]
  assign host_mem_0_rready = 1'h0; // @[AXI4Crossing.scala 204:12]
  assign m_dma_awid = dma_cdc_m_axi_awid; // @[VitisShim.scala 137:32]
  assign m_dma_awaddr = dma_cdc_m_axi_awaddr; // @[VitisShim.scala 137:32]
  assign m_dma_awlen = dma_cdc_m_axi_awlen; // @[VitisShim.scala 137:32]
  assign m_dma_awsize = dma_cdc_m_axi_awsize; // @[VitisShim.scala 137:32]
  assign m_dma_awburst = dma_cdc_m_axi_awburst; // @[VitisShim.scala 137:32]
  assign m_dma_awlock = dma_cdc_m_axi_awlock; // @[VitisShim.scala 137:32]
  assign m_dma_awcache = dma_cdc_m_axi_awcache; // @[VitisShim.scala 137:32]
  assign m_dma_awprot = dma_cdc_m_axi_awprot; // @[VitisShim.scala 137:32]
  assign m_dma_awqos = dma_cdc_m_axi_awqos; // @[VitisShim.scala 137:32]
  assign m_dma_awvalid = dma_cdc_m_axi_awvalid; // @[VitisShim.scala 137:32]
  assign m_dma_wdata = dma_cdc_m_axi_wdata; // @[VitisShim.scala 137:32]
  assign m_dma_wstrb = dma_cdc_m_axi_wstrb; // @[VitisShim.scala 137:32]
  assign m_dma_wlast = dma_cdc_m_axi_wlast; // @[VitisShim.scala 137:32]
  assign m_dma_wvalid = dma_cdc_m_axi_wvalid; // @[VitisShim.scala 137:32]
  assign m_dma_bready = dma_cdc_m_axi_bready; // @[VitisShim.scala 137:32]
  assign m_dma_arid = dma_cdc_m_axi_arid; // @[VitisShim.scala 137:32]
  assign m_dma_araddr = dma_cdc_m_axi_araddr; // @[VitisShim.scala 137:32]
  assign m_dma_arlen = dma_cdc_m_axi_arlen; // @[VitisShim.scala 137:32]
  assign m_dma_arsize = dma_cdc_m_axi_arsize; // @[VitisShim.scala 137:32]
  assign m_dma_arburst = dma_cdc_m_axi_arburst; // @[VitisShim.scala 137:32]
  assign m_dma_arlock = dma_cdc_m_axi_arlock; // @[VitisShim.scala 137:32]
  assign m_dma_arcache = dma_cdc_m_axi_arcache; // @[VitisShim.scala 137:32]
  assign m_dma_arprot = dma_cdc_m_axi_arprot; // @[VitisShim.scala 137:32]
  assign m_dma_arqos = dma_cdc_m_axi_arqos; // @[VitisShim.scala 137:32]
  assign m_dma_arvalid = dma_cdc_m_axi_arvalid; // @[VitisShim.scala 137:32]
  assign m_dma_rready = dma_cdc_m_axi_rready; // @[VitisShim.scala 137:32]
  assign top_clock = firesimMMCM_clk_out1; // @[VitisShim.scala 62:22]
  assign top_reset = hostSyncReset_xpm_sync_dest_rst; // @[VitisShim.scala 61:22]
  assign top_ctrl_aw_valid = axi4ToNasti_io_nasti_aw_valid; // @[VitisShim.scala 86:21]
  assign top_ctrl_aw_bits_addr = axi4ToNasti_io_nasti_aw_bits_addr; // @[VitisShim.scala 86:21]
  assign top_ctrl_aw_bits_len = 8'h0; // @[VitisShim.scala 86:21]
  assign top_ctrl_aw_bits_size = 3'h2; // @[VitisShim.scala 86:21]
  assign top_ctrl_aw_bits_burst = 2'h1; // @[VitisShim.scala 86:21]
  assign top_ctrl_aw_bits_lock = 1'h0; // @[VitisShim.scala 86:21]
  assign top_ctrl_aw_bits_cache = 4'h0; // @[VitisShim.scala 86:21]
  assign top_ctrl_aw_bits_prot = axi4ToNasti_io_nasti_aw_bits_prot; // @[VitisShim.scala 86:21]
  assign top_ctrl_aw_bits_qos = 4'h0; // @[VitisShim.scala 86:21]
  assign top_ctrl_aw_bits_region = 4'h0; // @[VitisShim.scala 86:21]
  assign top_ctrl_aw_bits_id = 1'h0; // @[VitisShim.scala 86:21]
  assign top_ctrl_aw_bits_user = 1'h0; // @[VitisShim.scala 86:21]
  assign top_ctrl_w_valid = axi4ToNasti_io_nasti_w_valid; // @[VitisShim.scala 86:21]
  assign top_ctrl_w_bits_data = axi4ToNasti_io_nasti_w_bits_data; // @[VitisShim.scala 86:21]
  assign top_ctrl_w_bits_last = 1'h1; // @[VitisShim.scala 86:21]
  assign top_ctrl_w_bits_id = 1'h0; // @[VitisShim.scala 86:21]
  assign top_ctrl_w_bits_strb = axi4ToNasti_io_nasti_w_bits_strb; // @[VitisShim.scala 86:21]
  assign top_ctrl_w_bits_user = 1'h0; // @[VitisShim.scala 86:21]
  assign top_ctrl_b_ready = axi4ToNasti_io_nasti_b_ready; // @[VitisShim.scala 86:21]
  assign top_ctrl_ar_valid = axi4ToNasti_io_nasti_ar_valid; // @[VitisShim.scala 86:21]
  assign top_ctrl_ar_bits_addr = axi4ToNasti_io_nasti_ar_bits_addr; // @[VitisShim.scala 86:21]
  assign top_ctrl_ar_bits_len = 8'h0; // @[VitisShim.scala 86:21]
  assign top_ctrl_ar_bits_size = 3'h2; // @[VitisShim.scala 86:21]
  assign top_ctrl_ar_bits_burst = 2'h1; // @[VitisShim.scala 86:21]
  assign top_ctrl_ar_bits_lock = 1'h0; // @[VitisShim.scala 86:21]
  assign top_ctrl_ar_bits_cache = 4'h0; // @[VitisShim.scala 86:21]
  assign top_ctrl_ar_bits_prot = axi4ToNasti_io_nasti_ar_bits_prot; // @[VitisShim.scala 86:21]
  assign top_ctrl_ar_bits_qos = 4'h0; // @[VitisShim.scala 86:21]
  assign top_ctrl_ar_bits_region = 4'h0; // @[VitisShim.scala 86:21]
  assign top_ctrl_ar_bits_id = 1'h0; // @[VitisShim.scala 86:21]
  assign top_ctrl_ar_bits_user = 1'h0; // @[VitisShim.scala 86:21]
  assign top_ctrl_r_ready = axi4ToNasti_io_nasti_r_ready; // @[VitisShim.scala 86:21]
  assign top_fpga_managed_axi4_aw_ready = dma_cdc_s_axi_awready; // @[AXI4Crossing.scala 127:19]
  assign top_fpga_managed_axi4_w_ready = dma_cdc_s_axi_wready; // @[AXI4Crossing.scala 133:18]
  assign top_fpga_managed_axi4_b_valid = dma_cdc_s_axi_bvalid; // @[AXI4Crossing.scala 137:22]
  assign top_fpga_managed_axi4_b_bits_id = dma_cdc_s_axi_bid; // @[AXI4Crossing.scala 135:22]
  assign top_fpga_managed_axi4_b_bits_resp = dma_cdc_s_axi_bresp; // @[AXI4Crossing.scala 136:22]
  assign top_fpga_managed_axi4_ar_ready = dma_cdc_s_axi_arready; // @[AXI4Crossing.scala 150:19]
  assign top_fpga_managed_axi4_r_valid = dma_cdc_s_axi_rvalid; // @[AXI4Crossing.scala 156:22]
  assign top_fpga_managed_axi4_r_bits_id = dma_cdc_s_axi_rid; // @[AXI4Crossing.scala 152:22]
  assign top_fpga_managed_axi4_r_bits_data = dma_cdc_s_axi_rdata; // @[AXI4Crossing.scala 153:22]
  assign top_fpga_managed_axi4_r_bits_resp = dma_cdc_s_axi_rresp; // @[AXI4Crossing.scala 154:22]
  assign top_fpga_managed_axi4_r_bits_last = dma_cdc_s_axi_rlast; // @[AXI4Crossing.scala 155:22]
  assign firesimMMCM_clk_in1 = ap_clk; // @[VitisShim.scala 56:28]
  assign firesimMMCM_reset = ~ap_rst_n; // @[VitisShim.scala 57:38]
  assign hostSyncReset_xpm_sync_dest_clk = firesimMMCM_clk_out1; // @[ResetSynchronizer.scala 43:26]
  assign hostSyncReset_xpm_sync_src_rst = ap_rst | ~firesimMMCM_locked; // @[VitisShim.scala 60:50]
  assign ctrl_cdc_s_axi_aclk = ap_clk; // @[VitisShim.scala 74:31]
  assign ctrl_cdc_s_axi_aresetn = ~ap_rst; // @[VitisShim.scala 75:44]
  assign ctrl_cdc_s_axi_awaddr = s_axi_lite_awaddr; // @[VitisShim.scala 73:31]
  assign ctrl_cdc_s_axi_awprot = s_axi_lite_awprot; // @[VitisShim.scala 73:31]
  assign ctrl_cdc_s_axi_awvalid = s_axi_lite_awvalid; // @[VitisShim.scala 73:31]
  assign ctrl_cdc_s_axi_wdata = s_axi_lite_wdata; // @[VitisShim.scala 73:31]
  assign ctrl_cdc_s_axi_wstrb = s_axi_lite_wstrb; // @[VitisShim.scala 73:31]
  assign ctrl_cdc_s_axi_wvalid = s_axi_lite_wvalid; // @[VitisShim.scala 73:31]
  assign ctrl_cdc_s_axi_bready = s_axi_lite_bready; // @[VitisShim.scala 73:31]
  assign ctrl_cdc_s_axi_araddr = s_axi_lite_araddr; // @[VitisShim.scala 73:31]
  assign ctrl_cdc_s_axi_arprot = s_axi_lite_arprot; // @[VitisShim.scala 73:31]
  assign ctrl_cdc_s_axi_arvalid = s_axi_lite_arvalid; // @[VitisShim.scala 73:31]
  assign ctrl_cdc_s_axi_rready = s_axi_lite_rready; // @[VitisShim.scala 73:31]
  assign ctrl_cdc_m_axi_aclk = firesimMMCM_clk_out1; // @[VitisShim.scala 77:31]
  assign ctrl_cdc_m_axi_aresetn = ~hostSyncReset_xpm_sync_dest_rst; // @[VitisShim.scala 78:51]
  assign ctrl_cdc_m_axi_awready = axi4ToNasti_io_axi4_aw_ready; // @[AXI4Crossing.scala 78:24]
  assign ctrl_cdc_m_axi_wready = axi4ToNasti_io_axi4_w_ready; // @[AXI4Crossing.scala 84:22]
  assign ctrl_cdc_m_axi_bresp = axi4ToNasti_io_axi4_b_bits_resp; // @[AXI4Crossing.scala 87:18]
  assign ctrl_cdc_m_axi_bvalid = axi4ToNasti_io_axi4_b_valid; // @[AXI4Crossing.scala 88:18]
  assign ctrl_cdc_m_axi_arready = axi4ToNasti_io_axi4_ar_ready; // @[AXI4Crossing.scala 101:24]
  assign ctrl_cdc_m_axi_rdata = axi4ToNasti_io_axi4_r_bits_data; // @[AXI4Crossing.scala 104:18]
  assign ctrl_cdc_m_axi_rresp = axi4ToNasti_io_axi4_r_bits_resp; // @[AXI4Crossing.scala 105:18]
  assign ctrl_cdc_m_axi_rvalid = axi4ToNasti_io_axi4_r_valid; // @[AXI4Crossing.scala 107:18]
  assign axi4ToNasti_io_axi4_aw_valid = ctrl_cdc_m_axi_awvalid; // @[AXI4Crossing.scala 77:24]
  assign axi4ToNasti_io_axi4_aw_bits_addr = ctrl_cdc_m_axi_awaddr; // @[AXI4Crossing.scala 69:24]
  assign axi4ToNasti_io_axi4_aw_bits_prot = ctrl_cdc_m_axi_awprot; // @[AXI4Crossing.scala 75:24]
  assign axi4ToNasti_io_axi4_w_valid = ctrl_cdc_m_axi_wvalid; // @[AXI4Crossing.scala 83:22]
  assign axi4ToNasti_io_axi4_w_bits_data = ctrl_cdc_m_axi_wdata; // @[AXI4Crossing.scala 80:22]
  assign axi4ToNasti_io_axi4_w_bits_strb = ctrl_cdc_m_axi_wstrb; // @[AXI4Crossing.scala 81:22]
  assign axi4ToNasti_io_axi4_b_ready = ctrl_cdc_m_axi_bready; // @[AXI4Crossing.scala 89:18]
  assign axi4ToNasti_io_axi4_ar_valid = ctrl_cdc_m_axi_arvalid; // @[AXI4Crossing.scala 100:24]
  assign axi4ToNasti_io_axi4_ar_bits_addr = ctrl_cdc_m_axi_araddr; // @[AXI4Crossing.scala 92:24]
  assign axi4ToNasti_io_axi4_ar_bits_prot = ctrl_cdc_m_axi_arprot; // @[AXI4Crossing.scala 98:24]
  assign axi4ToNasti_io_axi4_r_ready = ctrl_cdc_m_axi_rready; // @[AXI4Crossing.scala 108:18]
  assign axi4ToNasti_io_nasti_aw_ready = top_ctrl_aw_ready; // @[VitisShim.scala 86:21]
  assign axi4ToNasti_io_nasti_w_ready = top_ctrl_w_ready; // @[VitisShim.scala 86:21]
  assign axi4ToNasti_io_nasti_b_valid = top_ctrl_b_valid; // @[VitisShim.scala 86:21]
  assign axi4ToNasti_io_nasti_b_bits_resp = top_ctrl_b_bits_resp; // @[VitisShim.scala 86:21]
  assign axi4ToNasti_io_nasti_ar_ready = top_ctrl_ar_ready; // @[VitisShim.scala 86:21]
  assign axi4ToNasti_io_nasti_r_valid = top_ctrl_r_valid; // @[VitisShim.scala 86:21]
  assign axi4ToNasti_io_nasti_r_bits_resp = top_ctrl_r_bits_resp; // @[VitisShim.scala 86:21]
  assign axi4ToNasti_io_nasti_r_bits_data = top_ctrl_r_bits_data; // @[VitisShim.scala 86:21]
  assign axi4ToNasti_io_nasti_r_bits_last = top_ctrl_r_bits_last; // @[VitisShim.scala 86:21]
  assign dma_cdc_s_axi_aclk = firesimMMCM_clk_out1; // @[VitisShim.scala 130:32]
  assign dma_cdc_s_axi_aresetn = ~hostSyncReset_xpm_sync_dest_rst; // @[VitisShim.scala 131:52]
  assign dma_cdc_s_axi_awid = top_fpga_managed_axi4_aw_bits_id; // @[AXI4Crossing.scala 117:22]
  assign dma_cdc_s_axi_awaddr = 64'h2000000000 + _GEN_1; // @[VitisShim.scala 133:62]
  assign dma_cdc_s_axi_awlen = top_fpga_managed_axi4_aw_bits_len; // @[AXI4Crossing.scala 119:23]
  assign dma_cdc_s_axi_awsize = top_fpga_managed_axi4_aw_bits_size; // @[AXI4Crossing.scala 120:24]
  assign dma_cdc_s_axi_awburst = top_fpga_managed_axi4_aw_bits_burst; // @[AXI4Crossing.scala 121:25]
  assign dma_cdc_s_axi_awlock = top_fpga_managed_axi4_aw_bits_lock; // @[AXI4Crossing.scala 122:24]
  assign dma_cdc_s_axi_awcache = 4'h3; // @[VitisShim.scala 135:44]
  assign dma_cdc_s_axi_awprot = top_fpga_managed_axi4_aw_bits_prot; // @[AXI4Crossing.scala 124:19]
  assign dma_cdc_s_axi_awqos = top_fpga_managed_axi4_aw_bits_qos; // @[AXI4Crossing.scala 125:23]
  assign dma_cdc_s_axi_awvalid = top_fpga_managed_axi4_aw_valid; // @[AXI4Crossing.scala 126:19]
  assign dma_cdc_s_axi_wdata = top_fpga_managed_axi4_w_bits_data; // @[AXI4Crossing.scala 129:18]
  assign dma_cdc_s_axi_wstrb = top_fpga_managed_axi4_w_bits_strb; // @[AXI4Crossing.scala 130:18]
  assign dma_cdc_s_axi_wlast = top_fpga_managed_axi4_w_bits_last; // @[AXI4Crossing.scala 131:23]
  assign dma_cdc_s_axi_wvalid = top_fpga_managed_axi4_w_valid; // @[AXI4Crossing.scala 132:18]
  assign dma_cdc_s_axi_bready = top_fpga_managed_axi4_b_ready; // @[AXI4Crossing.scala 138:22]
  assign dma_cdc_s_axi_arid = top_fpga_managed_axi4_ar_bits_id; // @[AXI4Crossing.scala 140:22]
  assign dma_cdc_s_axi_araddr = 64'h2000000000 + _GEN_0; // @[VitisShim.scala 132:62]
  assign dma_cdc_s_axi_arlen = top_fpga_managed_axi4_ar_bits_len; // @[AXI4Crossing.scala 142:23]
  assign dma_cdc_s_axi_arsize = top_fpga_managed_axi4_ar_bits_size; // @[AXI4Crossing.scala 143:24]
  assign dma_cdc_s_axi_arburst = top_fpga_managed_axi4_ar_bits_burst; // @[AXI4Crossing.scala 144:25]
  assign dma_cdc_s_axi_arlock = top_fpga_managed_axi4_ar_bits_lock; // @[AXI4Crossing.scala 145:24]
  assign dma_cdc_s_axi_arcache = 4'h3; // @[VitisShim.scala 134:44]
  assign dma_cdc_s_axi_arprot = top_fpga_managed_axi4_ar_bits_prot; // @[AXI4Crossing.scala 147:19]
  assign dma_cdc_s_axi_arqos = top_fpga_managed_axi4_ar_bits_qos; // @[AXI4Crossing.scala 148:23]
  assign dma_cdc_s_axi_arvalid = top_fpga_managed_axi4_ar_valid; // @[AXI4Crossing.scala 149:19]
  assign dma_cdc_s_axi_rready = top_fpga_managed_axi4_r_ready; // @[AXI4Crossing.scala 157:22]
  assign dma_cdc_m_axi_aclk = ap_clk; // @[VitisShim.scala 138:32]
  assign dma_cdc_m_axi_aresetn = ap_rst_n; // @[VitisShim.scala 139:32]
  assign dma_cdc_m_axi_awready = m_dma_awready; // @[VitisShim.scala 137:32]
  assign dma_cdc_m_axi_wready = m_dma_wready; // @[VitisShim.scala 137:32]
  assign dma_cdc_m_axi_bid = m_dma_bid; // @[VitisShim.scala 137:32]
  assign dma_cdc_m_axi_bresp = m_dma_bresp; // @[VitisShim.scala 137:32]
  assign dma_cdc_m_axi_bvalid = m_dma_bvalid; // @[VitisShim.scala 137:32]
  assign dma_cdc_m_axi_arready = m_dma_arready; // @[VitisShim.scala 137:32]
  assign dma_cdc_m_axi_rid = m_dma_rid; // @[VitisShim.scala 137:32]
  assign dma_cdc_m_axi_rdata = m_dma_rdata; // @[VitisShim.scala 137:32]
  assign dma_cdc_m_axi_rresp = m_dma_rresp; // @[VitisShim.scala 137:32]
  assign dma_cdc_m_axi_rlast = m_dma_rlast; // @[VitisShim.scala 137:32]
  assign dma_cdc_m_axi_rvalid = m_dma_rvalid; // @[VitisShim.scala 137:32]
  always @(posedge ap_clk) begin
    if (ap_rst) begin // @[AXI4Printf.scala 80:29]
      cyclecount <= 64'h0; // @[AXI4Printf.scala 80:29]
    end else begin
      cyclecount <= _cyclecount_T_1; // @[AXI4Printf.scala 81:16]
    end
    if (ap_rst) begin // @[AXI4Printf.scala 80:29]
      cyclecount_1 <= 64'h0; // @[AXI4Printf.scala 80:29]
    end else begin
      cyclecount_1 <= _cyclecount_T_3; // @[AXI4Printf.scala 81:16]
    end
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_5 & _ctrl_cdc_io_s_axi_aresetn_T) begin
          $fwrite(32'h80000002,
            "[host_mem_0,awfire,%x] addr %x, len %x, size %x, burst %x, lock %x, cache %x, prot %x, qos %x, id %x, user %x\n"
            ,cyclecount,host_mem_0_awaddr,host_mem_0_awlen,host_mem_0_awsize,host_mem_0_awburst,host_mem_0_awlock,
            host_mem_0_awcache,host_mem_0_awprot,host_mem_0_awqos,host_mem_0_awid,1'h0); // @[AXI4Printf.scala 83:13]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_8 & _ctrl_cdc_io_s_axi_aresetn_T) begin
          $fwrite(32'h80000002,"[host_mem_0,wfire,%x] data %x, last %x, strb %x\n",cyclecount,host_mem_0_wdata,
            host_mem_0_wlast,host_mem_0_wstrb); // @[AXI4Printf.scala 99:13]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_11 & _ctrl_cdc_io_s_axi_aresetn_T) begin
          $fwrite(32'h80000002,"[host_mem_0,bfire,%x] resp %x, id %x, user %x\n",cyclecount,host_mem_0_bresp,
            host_mem_0_bid,1'h0); // @[AXI4Printf.scala 108:13]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_14 & _ctrl_cdc_io_s_axi_aresetn_T) begin
          $fwrite(32'h80000002,
            "[host_mem_0,arfire,%x] addr %x, len %x, size %x, burst %x, lock %x, cache %x, prot %x, qos %x, id %x, user %x\n"
            ,cyclecount,host_mem_0_araddr,host_mem_0_arlen,host_mem_0_arsize,host_mem_0_arburst,host_mem_0_arlock,
            host_mem_0_arcache,host_mem_0_arprot,host_mem_0_arqos,host_mem_0_arid,1'h0); // @[AXI4Printf.scala 117:13]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_17 & _ctrl_cdc_io_s_axi_aresetn_T) begin
          $fwrite(32'h80000002,"[host_mem_0,rfire,%x] resp %x, data %x, last %x, id %x, user %x\n",cyclecount,
            host_mem_0_rresp,host_mem_0_rdata,host_mem_0_rlast,host_mem_0_rid,1'h0); // @[AXI4Printf.scala 133:13]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_20 & _ctrl_cdc_io_s_axi_aresetn_T) begin
          $fwrite(32'h80000002,
            "[m_dma,awfire,%x] addr %x, len %x, size %x, burst %x, lock %x, cache %x, prot %x, qos %x, id %x, user %x\n"
            ,cyclecount_1,m_dma_awaddr,m_dma_awlen,m_dma_awsize,m_dma_awburst,m_dma_awlock,m_dma_awcache,m_dma_awprot,
            m_dma_awqos,m_dma_awid,1'h0); // @[AXI4Printf.scala 83:13]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_23 & _ctrl_cdc_io_s_axi_aresetn_T) begin
          $fwrite(32'h80000002,"[m_dma,wfire,%x] data %x, last %x, strb %x\n",cyclecount_1,m_dma_wdata,m_dma_wlast,
            m_dma_wstrb); // @[AXI4Printf.scala 99:13]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_26 & _ctrl_cdc_io_s_axi_aresetn_T) begin
          $fwrite(32'h80000002,"[m_dma,bfire,%x] resp %x, id %x, user %x\n",cyclecount_1,m_dma_bresp,m_dma_bid,1'h0); // @[AXI4Printf.scala 108:13]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_29 & _ctrl_cdc_io_s_axi_aresetn_T) begin
          $fwrite(32'h80000002,
            "[m_dma,arfire,%x] addr %x, len %x, size %x, burst %x, lock %x, cache %x, prot %x, qos %x, id %x, user %x\n"
            ,cyclecount_1,m_dma_araddr,m_dma_arlen,m_dma_arsize,m_dma_arburst,m_dma_arlock,m_dma_arcache,m_dma_arprot,
            m_dma_arqos,m_dma_arid,1'h0); // @[AXI4Printf.scala 117:13]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_32 & _ctrl_cdc_io_s_axi_aresetn_T) begin
          $fwrite(32'h80000002,"[m_dma,rfire,%x] resp %x, data %x, last %x, id %x, user %x\n",cyclecount_1,m_dma_rresp,
            m_dma_rdata,m_dma_rlast,m_dma_rid,1'h0); // @[AXI4Printf.scala 133:13]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
  end
  always @(posedge firesimMMCM_clk_out1) begin
    if (hostSyncReset_xpm_sync_dest_rst) begin // @[AXI4Printf.scala 13:29]
      cyclecount_2 <= 64'h0; // @[AXI4Printf.scala 13:29]
    end else begin
      cyclecount_2 <= _cyclecount_T_5; // @[AXI4Printf.scala 14:16]
    end
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (~hostSyncReset_xpm_sync_dest_rst & ~(~axi4ToNasti_io_axi4_r_valid | axi4ToNasti_io_axi4_r_bits_last)) begin
          $fwrite(32'h80000002,
            "Assertion failed\n    at AXI4Crossing.scala:111 assert(!axi4.r.valid || axi4.r.bits.last)\n"); // @[AXI4Crossing.scala 111:15]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_35 & _T_3) begin
          $fwrite(32'h80000002,
            "[top_fpga_managed_axi4,awfire,%x] addr %x, len %x, size %x, burst %x, lock %x, cache %x, prot %x, qos %x, id %x, user %x\n"
            ,cyclecount_2,top_fpga_managed_axi4_aw_bits_addr,top_fpga_managed_axi4_aw_bits_len,
            top_fpga_managed_axi4_aw_bits_size,top_fpga_managed_axi4_aw_bits_burst,top_fpga_managed_axi4_aw_bits_lock,
            top_fpga_managed_axi4_aw_bits_cache,top_fpga_managed_axi4_aw_bits_prot,top_fpga_managed_axi4_aw_bits_qos,
            top_fpga_managed_axi4_aw_bits_id,1'h0); // @[AXI4Printf.scala 16:13]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_38 & _T_3) begin
          $fwrite(32'h80000002,"[top_fpga_managed_axi4,wfire,%x] data %x, last %x, strb %x\n",cyclecount_2,
            top_fpga_managed_axi4_w_bits_data,top_fpga_managed_axi4_w_bits_last,top_fpga_managed_axi4_w_bits_strb); // @[AXI4Printf.scala 32:13]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_41 & _T_3) begin
          $fwrite(32'h80000002,"[top_fpga_managed_axi4,bfire,%x] resp %x, id %x, user %x\n",cyclecount_2,
            top_fpga_managed_axi4_b_bits_resp,top_fpga_managed_axi4_b_bits_id,1'h0); // @[AXI4Printf.scala 41:13]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_44 & _T_3) begin
          $fwrite(32'h80000002,
            "[top_fpga_managed_axi4,arfire,%x] addr %x, len %x, size %x, burst %x, lock %x, cache %x, prot %x, qos %x, id %x, user %x\n"
            ,cyclecount_2,top_fpga_managed_axi4_ar_bits_addr,top_fpga_managed_axi4_ar_bits_len,
            top_fpga_managed_axi4_ar_bits_size,top_fpga_managed_axi4_ar_bits_burst,top_fpga_managed_axi4_ar_bits_lock,
            top_fpga_managed_axi4_ar_bits_cache,top_fpga_managed_axi4_ar_bits_prot,top_fpga_managed_axi4_ar_bits_qos,
            top_fpga_managed_axi4_ar_bits_id,1'h0); // @[AXI4Printf.scala 50:13]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_47 & _T_3) begin
          $fwrite(32'h80000002,"[top_fpga_managed_axi4,rfire,%x] resp %x, data %x, last %x, id %x, user %x\n",
            cyclecount_2,top_fpga_managed_axi4_r_bits_resp,top_fpga_managed_axi4_r_bits_data,
            top_fpga_managed_axi4_r_bits_last,top_fpga_managed_axi4_r_bits_id,1'h0); // @[AXI4Printf.scala 66:13]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {2{`RANDOM}};
  cyclecount = _RAND_0[63:0];
  _RAND_1 = {2{`RANDOM}};
  cyclecount_1 = _RAND_1[63:0];
  _RAND_2 = {2{`RANDOM}};
  cyclecount_2 = _RAND_2[63:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
  always @(posedge firesimMMCM_clk_out1) begin
    //
    if (~hostSyncReset_xpm_sync_dest_rst) begin
      assert(~axi4ToNasti_io_axi4_r_valid | axi4ToNasti_io_axi4_r_bits_last); // @[AXI4Crossing.scala 111:15]
    end
  end
endmodule
module FAMETop(
  input          hostClock,
  input          hostReset,
  output         PrintfModule_RationalClockBridge_clocks_0_sink_ready,
  input          PrintfModule_RationalClockBridge_clocks_0_sink_bits,
  output         PrintfModule_peekPokeBridge_reset_sink_ready,
  input          PrintfModule_peekPokeBridge_reset_sink_valid,
  input          PrintfModule_peekPokeBridge_reset_sink_bits,
  output         PrintfModule_peekPokeBridge_io_b_sink_ready,
  input          PrintfModule_peekPokeBridge_io_b_sink_valid,
  output         PrintfModule_peekPokeBridge_io_a_sink_ready,
  input          PrintfModule_peekPokeBridge_io_a_sink_valid,
  input          PrintfModule_peekPokeBridge_io_a_sink_bits,
  input          PrintfModule_synthesizedPrintf_RationalClockBridge_clocks_0_globalReset_source_ready,
  output         PrintfModule_synthesizedPrintf_RationalClockBridge_clocks_0_globalReset_source_valid,
  input          PrintfModule_synthesizedPrintf_dut_printf_wire_enable_source_ready,
  output         PrintfModule_synthesizedPrintf_dut_printf_wire_enable_source_valid,
  output         PrintfModule_synthesizedPrintf_dut_printf_wire_enable_source_bits,
  input          PrintfModule_synthesizedPrintf_dut_printf_wire_args_0_source_ready,
  output         PrintfModule_synthesizedPrintf_dut_printf_wire_args_0_source_valid,
  output [15:0]  PrintfModule_synthesizedPrintf_dut_printf_wire_args_0_source_bits,
  input          PrintfModule_synthesizedPrintf_dut_childInst_printf_wire_enable_source_ready,
  output         PrintfModule_synthesizedPrintf_dut_childInst_printf_wire_enable_source_valid,
  output         PrintfModule_synthesizedPrintf_dut_childInst_printf_wire_enable_source_bits,
  input          PrintfModule_synthesizedPrintf_dut_childInst_printf_wire_args_0_source_ready,
  output         PrintfModule_synthesizedPrintf_dut_childInst_printf_wire_args_0_source_valid,
  output [15:0]  PrintfModule_synthesizedPrintf_dut_childInst_printf_wire_args_0_source_bits,
  input          PrintfModule_synthesizedPrintf_dut_childInst_printf_wire_args_1_source_ready,
  output         PrintfModule_synthesizedPrintf_dut_childInst_printf_wire_args_1_source_valid,
  output [15:0]  PrintfModule_synthesizedPrintf_dut_childInst_printf_wire_args_1_source_bits,
  input          PrintfModule_synthesizedPrintf_dut_printf_2_wire_enable_source_ready,
  output         PrintfModule_synthesizedPrintf_dut_printf_2_wire_enable_source_valid,
  output         PrintfModule_synthesizedPrintf_dut_printf_2_wire_enable_source_bits,
  input          PrintfModule_synthesizedPrintf_dut_printf_2_wire_args_0_source_ready,
  output         PrintfModule_synthesizedPrintf_dut_printf_2_wire_args_0_source_valid,
  output [15:0]  PrintfModule_synthesizedPrintf_dut_printf_2_wire_args_0_source_bits,
  input          PrintfModule_synthesizedPrintf_dut_printf_2_wire_args_1_source_ready,
  output         PrintfModule_synthesizedPrintf_dut_printf_2_wire_args_1_source_valid,
  output [7:0]   PrintfModule_synthesizedPrintf_dut_printf_2_wire_args_1_source_bits,
  input          PrintfModule_synthesizedPrintf_dut_printf_1_wire_enable_source_ready,
  output         PrintfModule_synthesizedPrintf_dut_printf_1_wire_enable_source_valid,
  output         PrintfModule_synthesizedPrintf_dut_printf_1_wire_enable_source_bits,
  input          PrintfModule_synthesizedPrintf_dut_printf_1_wire_args_0_source_ready,
  output         PrintfModule_synthesizedPrintf_dut_printf_1_wire_args_0_source_valid,
  output [15:0]  PrintfModule_synthesizedPrintf_dut_printf_1_wire_args_0_source_bits,
  input          PrintfModule_synthesizedPrintf_dut_printf_1_wire_args_1_source_ready,
  output         PrintfModule_synthesizedPrintf_dut_printf_1_wire_args_1_source_valid,
  output [527:0] PrintfModule_synthesizedPrintf_dut_printf_1_wire_args_1_source_bits
);
  wire  PrintfModule__hostClock;
  wire  PrintfModule__hostReset;
  wire  PrintfModule__RationalClockBridge_clocks_0_sink_ready;
  wire  PrintfModule__RationalClockBridge_clocks_0_sink_bits;
  wire  PrintfModule__peekPokeBridge_io_a_sink_ready;
  wire  PrintfModule__peekPokeBridge_io_a_sink_valid;
  wire  PrintfModule__peekPokeBridge_io_a_sink_bits;
  wire  PrintfModule__peekPokeBridge_reset_sink_ready;
  wire  PrintfModule__peekPokeBridge_reset_sink_valid;
  wire  PrintfModule__peekPokeBridge_reset_sink_bits;
  wire  PrintfModule__peekPokeBridge_io_b_sink_ready;
  wire  PrintfModule__peekPokeBridge_io_b_sink_valid;
  wire  PrintfModule__synthesizedPrintf_dut_childInst_printf_wire_enable_source_ready;
  wire  PrintfModule__synthesizedPrintf_dut_childInst_printf_wire_enable_source_valid;
  wire  PrintfModule__synthesizedPrintf_dut_childInst_printf_wire_enable_source_bits;
  wire  PrintfModule__synthesizedPrintf_dut_printf_2_wire_args_1_source_ready;
  wire  PrintfModule__synthesizedPrintf_dut_printf_2_wire_args_1_source_valid;
  wire [7:0] PrintfModule__synthesizedPrintf_dut_printf_2_wire_args_1_source_bits;
  wire  PrintfModule__synthesizedPrintf_dut_printf_2_wire_enable_source_ready;
  wire  PrintfModule__synthesizedPrintf_dut_printf_2_wire_enable_source_valid;
  wire  PrintfModule__synthesizedPrintf_dut_printf_2_wire_enable_source_bits;
  wire  PrintfModule__synthesizedPrintf_dut_printf_2_wire_args_0_source_ready;
  wire  PrintfModule__synthesizedPrintf_dut_printf_2_wire_args_0_source_valid;
  wire [15:0] PrintfModule__synthesizedPrintf_dut_printf_2_wire_args_0_source_bits;
  wire  PrintfModule__synthesizedPrintf_dut_printf_wire_enable_source_ready;
  wire  PrintfModule__synthesizedPrintf_dut_printf_wire_enable_source_valid;
  wire  PrintfModule__synthesizedPrintf_dut_printf_wire_enable_source_bits;
  wire  PrintfModule__synthesizedPrintf_dut_childInst_printf_wire_args_1_source_ready;
  wire  PrintfModule__synthesizedPrintf_dut_childInst_printf_wire_args_1_source_valid;
  wire [15:0] PrintfModule__synthesizedPrintf_dut_childInst_printf_wire_args_1_source_bits;
  wire  PrintfModule__synthesizedPrintf_RationalClockBridge_clocks_0_globalReset_source_ready;
  wire  PrintfModule__synthesizedPrintf_RationalClockBridge_clocks_0_globalReset_source_valid;
  wire  PrintfModule__synthesizedPrintf_dut_childInst_printf_wire_args_0_source_ready;
  wire  PrintfModule__synthesizedPrintf_dut_childInst_printf_wire_args_0_source_valid;
  wire [15:0] PrintfModule__synthesizedPrintf_dut_childInst_printf_wire_args_0_source_bits;
  wire  PrintfModule__synthesizedPrintf_dut_printf_1_wire_args_0_source_ready;
  wire  PrintfModule__synthesizedPrintf_dut_printf_1_wire_args_0_source_valid;
  wire [15:0] PrintfModule__synthesizedPrintf_dut_printf_1_wire_args_0_source_bits;
  wire  PrintfModule__synthesizedPrintf_dut_printf_1_wire_enable_source_ready;
  wire  PrintfModule__synthesizedPrintf_dut_printf_1_wire_enable_source_valid;
  wire  PrintfModule__synthesizedPrintf_dut_printf_1_wire_enable_source_bits;
  wire  PrintfModule__synthesizedPrintf_dut_printf_1_wire_args_1_source_ready;
  wire  PrintfModule__synthesizedPrintf_dut_printf_1_wire_args_1_source_valid;
  wire [527:0] PrintfModule__synthesizedPrintf_dut_printf_1_wire_args_1_source_bits;
  wire  PrintfModule__synthesizedPrintf_dut_printf_wire_args_0_source_ready;
  wire  PrintfModule__synthesizedPrintf_dut_printf_wire_args_0_source_valid;
  wire [15:0] PrintfModule__synthesizedPrintf_dut_printf_wire_args_0_source_bits;
  PrintfModule PrintfModule_ (
    .hostClock(PrintfModule__hostClock),
    .hostReset(PrintfModule__hostReset),
    .RationalClockBridge_clocks_0_sink_ready(PrintfModule__RationalClockBridge_clocks_0_sink_ready),
    .RationalClockBridge_clocks_0_sink_bits(PrintfModule__RationalClockBridge_clocks_0_sink_bits),
    .peekPokeBridge_io_a_sink_ready(PrintfModule__peekPokeBridge_io_a_sink_ready),
    .peekPokeBridge_io_a_sink_valid(PrintfModule__peekPokeBridge_io_a_sink_valid),
    .peekPokeBridge_io_a_sink_bits(PrintfModule__peekPokeBridge_io_a_sink_bits),
    .peekPokeBridge_reset_sink_ready(PrintfModule__peekPokeBridge_reset_sink_ready),
    .peekPokeBridge_reset_sink_valid(PrintfModule__peekPokeBridge_reset_sink_valid),
    .peekPokeBridge_reset_sink_bits(PrintfModule__peekPokeBridge_reset_sink_bits),
    .peekPokeBridge_io_b_sink_ready(PrintfModule__peekPokeBridge_io_b_sink_ready),
    .peekPokeBridge_io_b_sink_valid(PrintfModule__peekPokeBridge_io_b_sink_valid),
    .synthesizedPrintf_dut_childInst_printf_wire_enable_source_ready(
      PrintfModule__synthesizedPrintf_dut_childInst_printf_wire_enable_source_ready),
    .synthesizedPrintf_dut_childInst_printf_wire_enable_source_valid(
      PrintfModule__synthesizedPrintf_dut_childInst_printf_wire_enable_source_valid),
    .synthesizedPrintf_dut_childInst_printf_wire_enable_source_bits(
      PrintfModule__synthesizedPrintf_dut_childInst_printf_wire_enable_source_bits),
    .synthesizedPrintf_dut_printf_2_wire_args_1_source_ready(
      PrintfModule__synthesizedPrintf_dut_printf_2_wire_args_1_source_ready),
    .synthesizedPrintf_dut_printf_2_wire_args_1_source_valid(
      PrintfModule__synthesizedPrintf_dut_printf_2_wire_args_1_source_valid),
    .synthesizedPrintf_dut_printf_2_wire_args_1_source_bits(
      PrintfModule__synthesizedPrintf_dut_printf_2_wire_args_1_source_bits),
    .synthesizedPrintf_dut_printf_2_wire_enable_source_ready(
      PrintfModule__synthesizedPrintf_dut_printf_2_wire_enable_source_ready),
    .synthesizedPrintf_dut_printf_2_wire_enable_source_valid(
      PrintfModule__synthesizedPrintf_dut_printf_2_wire_enable_source_valid),
    .synthesizedPrintf_dut_printf_2_wire_enable_source_bits(
      PrintfModule__synthesizedPrintf_dut_printf_2_wire_enable_source_bits),
    .synthesizedPrintf_dut_printf_2_wire_args_0_source_ready(
      PrintfModule__synthesizedPrintf_dut_printf_2_wire_args_0_source_ready),
    .synthesizedPrintf_dut_printf_2_wire_args_0_source_valid(
      PrintfModule__synthesizedPrintf_dut_printf_2_wire_args_0_source_valid),
    .synthesizedPrintf_dut_printf_2_wire_args_0_source_bits(
      PrintfModule__synthesizedPrintf_dut_printf_2_wire_args_0_source_bits),
    .synthesizedPrintf_dut_printf_wire_enable_source_ready(
      PrintfModule__synthesizedPrintf_dut_printf_wire_enable_source_ready),
    .synthesizedPrintf_dut_printf_wire_enable_source_valid(
      PrintfModule__synthesizedPrintf_dut_printf_wire_enable_source_valid),
    .synthesizedPrintf_dut_printf_wire_enable_source_bits(
      PrintfModule__synthesizedPrintf_dut_printf_wire_enable_source_bits),
    .synthesizedPrintf_dut_childInst_printf_wire_args_1_source_ready(
      PrintfModule__synthesizedPrintf_dut_childInst_printf_wire_args_1_source_ready),
    .synthesizedPrintf_dut_childInst_printf_wire_args_1_source_valid(
      PrintfModule__synthesizedPrintf_dut_childInst_printf_wire_args_1_source_valid),
    .synthesizedPrintf_dut_childInst_printf_wire_args_1_source_bits(
      PrintfModule__synthesizedPrintf_dut_childInst_printf_wire_args_1_source_bits),
    .synthesizedPrintf_RationalClockBridge_clocks_0_globalReset_source_ready(
      PrintfModule__synthesizedPrintf_RationalClockBridge_clocks_0_globalReset_source_ready),
    .synthesizedPrintf_RationalClockBridge_clocks_0_globalReset_source_valid(
      PrintfModule__synthesizedPrintf_RationalClockBridge_clocks_0_globalReset_source_valid),
    .synthesizedPrintf_dut_childInst_printf_wire_args_0_source_ready(
      PrintfModule__synthesizedPrintf_dut_childInst_printf_wire_args_0_source_ready),
    .synthesizedPrintf_dut_childInst_printf_wire_args_0_source_valid(
      PrintfModule__synthesizedPrintf_dut_childInst_printf_wire_args_0_source_valid),
    .synthesizedPrintf_dut_childInst_printf_wire_args_0_source_bits(
      PrintfModule__synthesizedPrintf_dut_childInst_printf_wire_args_0_source_bits),
    .synthesizedPrintf_dut_printf_1_wire_args_0_source_ready(
      PrintfModule__synthesizedPrintf_dut_printf_1_wire_args_0_source_ready),
    .synthesizedPrintf_dut_printf_1_wire_args_0_source_valid(
      PrintfModule__synthesizedPrintf_dut_printf_1_wire_args_0_source_valid),
    .synthesizedPrintf_dut_printf_1_wire_args_0_source_bits(
      PrintfModule__synthesizedPrintf_dut_printf_1_wire_args_0_source_bits),
    .synthesizedPrintf_dut_printf_1_wire_enable_source_ready(
      PrintfModule__synthesizedPrintf_dut_printf_1_wire_enable_source_ready),
    .synthesizedPrintf_dut_printf_1_wire_enable_source_valid(
      PrintfModule__synthesizedPrintf_dut_printf_1_wire_enable_source_valid),
    .synthesizedPrintf_dut_printf_1_wire_enable_source_bits(
      PrintfModule__synthesizedPrintf_dut_printf_1_wire_enable_source_bits),
    .synthesizedPrintf_dut_printf_1_wire_args_1_source_ready(
      PrintfModule__synthesizedPrintf_dut_printf_1_wire_args_1_source_ready),
    .synthesizedPrintf_dut_printf_1_wire_args_1_source_valid(
      PrintfModule__synthesizedPrintf_dut_printf_1_wire_args_1_source_valid),
    .synthesizedPrintf_dut_printf_1_wire_args_1_source_bits(
      PrintfModule__synthesizedPrintf_dut_printf_1_wire_args_1_source_bits),
    .synthesizedPrintf_dut_printf_wire_args_0_source_ready(
      PrintfModule__synthesizedPrintf_dut_printf_wire_args_0_source_ready),
    .synthesizedPrintf_dut_printf_wire_args_0_source_valid(
      PrintfModule__synthesizedPrintf_dut_printf_wire_args_0_source_valid),
    .synthesizedPrintf_dut_printf_wire_args_0_source_bits(
      PrintfModule__synthesizedPrintf_dut_printf_wire_args_0_source_bits)
  );
  assign PrintfModule_RationalClockBridge_clocks_0_sink_ready = PrintfModule__RationalClockBridge_clocks_0_sink_ready;
  assign PrintfModule_peekPokeBridge_reset_sink_ready = PrintfModule__peekPokeBridge_reset_sink_ready;
  assign PrintfModule_peekPokeBridge_io_b_sink_ready = PrintfModule__peekPokeBridge_io_b_sink_ready;
  assign PrintfModule_peekPokeBridge_io_a_sink_ready = PrintfModule__peekPokeBridge_io_a_sink_ready;
  assign PrintfModule_synthesizedPrintf_RationalClockBridge_clocks_0_globalReset_source_valid =
    PrintfModule__synthesizedPrintf_RationalClockBridge_clocks_0_globalReset_source_valid;
  assign PrintfModule_synthesizedPrintf_dut_printf_wire_enable_source_valid =
    PrintfModule__synthesizedPrintf_dut_printf_wire_enable_source_valid;
  assign PrintfModule_synthesizedPrintf_dut_printf_wire_enable_source_bits =
    PrintfModule__synthesizedPrintf_dut_printf_wire_enable_source_bits;
  assign PrintfModule_synthesizedPrintf_dut_printf_wire_args_0_source_valid =
    PrintfModule__synthesizedPrintf_dut_printf_wire_args_0_source_valid;
  assign PrintfModule_synthesizedPrintf_dut_printf_wire_args_0_source_bits =
    PrintfModule__synthesizedPrintf_dut_printf_wire_args_0_source_bits;
  assign PrintfModule_synthesizedPrintf_dut_childInst_printf_wire_enable_source_valid =
    PrintfModule__synthesizedPrintf_dut_childInst_printf_wire_enable_source_valid;
  assign PrintfModule_synthesizedPrintf_dut_childInst_printf_wire_enable_source_bits =
    PrintfModule__synthesizedPrintf_dut_childInst_printf_wire_enable_source_bits;
  assign PrintfModule_synthesizedPrintf_dut_childInst_printf_wire_args_0_source_valid =
    PrintfModule__synthesizedPrintf_dut_childInst_printf_wire_args_0_source_valid;
  assign PrintfModule_synthesizedPrintf_dut_childInst_printf_wire_args_0_source_bits =
    PrintfModule__synthesizedPrintf_dut_childInst_printf_wire_args_0_source_bits;
  assign PrintfModule_synthesizedPrintf_dut_childInst_printf_wire_args_1_source_valid =
    PrintfModule__synthesizedPrintf_dut_childInst_printf_wire_args_1_source_valid;
  assign PrintfModule_synthesizedPrintf_dut_childInst_printf_wire_args_1_source_bits =
    PrintfModule__synthesizedPrintf_dut_childInst_printf_wire_args_1_source_bits;
  assign PrintfModule_synthesizedPrintf_dut_printf_2_wire_enable_source_valid =
    PrintfModule__synthesizedPrintf_dut_printf_2_wire_enable_source_valid;
  assign PrintfModule_synthesizedPrintf_dut_printf_2_wire_enable_source_bits =
    PrintfModule__synthesizedPrintf_dut_printf_2_wire_enable_source_bits;
  assign PrintfModule_synthesizedPrintf_dut_printf_2_wire_args_0_source_valid =
    PrintfModule__synthesizedPrintf_dut_printf_2_wire_args_0_source_valid;
  assign PrintfModule_synthesizedPrintf_dut_printf_2_wire_args_0_source_bits =
    PrintfModule__synthesizedPrintf_dut_printf_2_wire_args_0_source_bits;
  assign PrintfModule_synthesizedPrintf_dut_printf_2_wire_args_1_source_valid =
    PrintfModule__synthesizedPrintf_dut_printf_2_wire_args_1_source_valid;
  assign PrintfModule_synthesizedPrintf_dut_printf_2_wire_args_1_source_bits =
    PrintfModule__synthesizedPrintf_dut_printf_2_wire_args_1_source_bits;
  assign PrintfModule_synthesizedPrintf_dut_printf_1_wire_enable_source_valid =
    PrintfModule__synthesizedPrintf_dut_printf_1_wire_enable_source_valid;
  assign PrintfModule_synthesizedPrintf_dut_printf_1_wire_enable_source_bits =
    PrintfModule__synthesizedPrintf_dut_printf_1_wire_enable_source_bits;
  assign PrintfModule_synthesizedPrintf_dut_printf_1_wire_args_0_source_valid =
    PrintfModule__synthesizedPrintf_dut_printf_1_wire_args_0_source_valid;
  assign PrintfModule_synthesizedPrintf_dut_printf_1_wire_args_0_source_bits =
    PrintfModule__synthesizedPrintf_dut_printf_1_wire_args_0_source_bits;
  assign PrintfModule_synthesizedPrintf_dut_printf_1_wire_args_1_source_valid =
    PrintfModule__synthesizedPrintf_dut_printf_1_wire_args_1_source_valid;
  assign PrintfModule_synthesizedPrintf_dut_printf_1_wire_args_1_source_bits =
    PrintfModule__synthesizedPrintf_dut_printf_1_wire_args_1_source_bits;
  assign PrintfModule__hostClock = hostClock;
  assign PrintfModule__hostReset = hostReset;
  assign PrintfModule__RationalClockBridge_clocks_0_sink_bits = PrintfModule_RationalClockBridge_clocks_0_sink_bits;
  assign PrintfModule__peekPokeBridge_io_a_sink_valid = PrintfModule_peekPokeBridge_io_a_sink_valid;
  assign PrintfModule__peekPokeBridge_io_a_sink_bits = PrintfModule_peekPokeBridge_io_a_sink_bits;
  assign PrintfModule__peekPokeBridge_reset_sink_valid = PrintfModule_peekPokeBridge_reset_sink_valid;
  assign PrintfModule__peekPokeBridge_reset_sink_bits = PrintfModule_peekPokeBridge_reset_sink_bits;
  assign PrintfModule__peekPokeBridge_io_b_sink_valid = PrintfModule_peekPokeBridge_io_b_sink_valid;
  assign PrintfModule__synthesizedPrintf_dut_childInst_printf_wire_enable_source_ready =
    PrintfModule_synthesizedPrintf_dut_childInst_printf_wire_enable_source_ready;
  assign PrintfModule__synthesizedPrintf_dut_printf_2_wire_args_1_source_ready =
    PrintfModule_synthesizedPrintf_dut_printf_2_wire_args_1_source_ready;
  assign PrintfModule__synthesizedPrintf_dut_printf_2_wire_enable_source_ready =
    PrintfModule_synthesizedPrintf_dut_printf_2_wire_enable_source_ready;
  assign PrintfModule__synthesizedPrintf_dut_printf_2_wire_args_0_source_ready =
    PrintfModule_synthesizedPrintf_dut_printf_2_wire_args_0_source_ready;
  assign PrintfModule__synthesizedPrintf_dut_printf_wire_enable_source_ready =
    PrintfModule_synthesizedPrintf_dut_printf_wire_enable_source_ready;
  assign PrintfModule__synthesizedPrintf_dut_childInst_printf_wire_args_1_source_ready =
    PrintfModule_synthesizedPrintf_dut_childInst_printf_wire_args_1_source_ready;
  assign PrintfModule__synthesizedPrintf_RationalClockBridge_clocks_0_globalReset_source_ready =
    PrintfModule_synthesizedPrintf_RationalClockBridge_clocks_0_globalReset_source_ready;
  assign PrintfModule__synthesizedPrintf_dut_childInst_printf_wire_args_0_source_ready =
    PrintfModule_synthesizedPrintf_dut_childInst_printf_wire_args_0_source_ready;
  assign PrintfModule__synthesizedPrintf_dut_printf_1_wire_args_0_source_ready =
    PrintfModule_synthesizedPrintf_dut_printf_1_wire_args_0_source_ready;
  assign PrintfModule__synthesizedPrintf_dut_printf_1_wire_enable_source_ready =
    PrintfModule_synthesizedPrintf_dut_printf_1_wire_enable_source_ready;
  assign PrintfModule__synthesizedPrintf_dut_printf_1_wire_args_1_source_ready =
    PrintfModule_synthesizedPrintf_dut_printf_1_wire_args_1_source_ready;
  assign PrintfModule__synthesizedPrintf_dut_printf_wire_args_0_source_ready =
    PrintfModule_synthesizedPrintf_dut_printf_wire_args_0_source_ready;
endmodule
module PrintfModule(
  input          hostClock,
  input          hostReset,
  output         RationalClockBridge_clocks_0_sink_ready,
  input          RationalClockBridge_clocks_0_sink_bits,
  output         peekPokeBridge_io_a_sink_ready,
  input          peekPokeBridge_io_a_sink_valid,
  input          peekPokeBridge_io_a_sink_bits,
  output         peekPokeBridge_reset_sink_ready,
  input          peekPokeBridge_reset_sink_valid,
  input          peekPokeBridge_reset_sink_bits,
  output         peekPokeBridge_io_b_sink_ready,
  input          peekPokeBridge_io_b_sink_valid,
  input          synthesizedPrintf_dut_childInst_printf_wire_enable_source_ready,
  output         synthesizedPrintf_dut_childInst_printf_wire_enable_source_valid,
  output         synthesizedPrintf_dut_childInst_printf_wire_enable_source_bits,
  input          synthesizedPrintf_dut_printf_2_wire_args_1_source_ready,
  output         synthesizedPrintf_dut_printf_2_wire_args_1_source_valid,
  output [7:0]   synthesizedPrintf_dut_printf_2_wire_args_1_source_bits,
  input          synthesizedPrintf_dut_printf_2_wire_enable_source_ready,
  output         synthesizedPrintf_dut_printf_2_wire_enable_source_valid,
  output         synthesizedPrintf_dut_printf_2_wire_enable_source_bits,
  input          synthesizedPrintf_dut_printf_2_wire_args_0_source_ready,
  output         synthesizedPrintf_dut_printf_2_wire_args_0_source_valid,
  output [15:0]  synthesizedPrintf_dut_printf_2_wire_args_0_source_bits,
  input          synthesizedPrintf_dut_printf_wire_enable_source_ready,
  output         synthesizedPrintf_dut_printf_wire_enable_source_valid,
  output         synthesizedPrintf_dut_printf_wire_enable_source_bits,
  input          synthesizedPrintf_dut_childInst_printf_wire_args_1_source_ready,
  output         synthesizedPrintf_dut_childInst_printf_wire_args_1_source_valid,
  output [15:0]  synthesizedPrintf_dut_childInst_printf_wire_args_1_source_bits,
  input          synthesizedPrintf_RationalClockBridge_clocks_0_globalReset_source_ready,
  output         synthesizedPrintf_RationalClockBridge_clocks_0_globalReset_source_valid,
  input          synthesizedPrintf_dut_childInst_printf_wire_args_0_source_ready,
  output         synthesizedPrintf_dut_childInst_printf_wire_args_0_source_valid,
  output [15:0]  synthesizedPrintf_dut_childInst_printf_wire_args_0_source_bits,
  input          synthesizedPrintf_dut_printf_1_wire_args_0_source_ready,
  output         synthesizedPrintf_dut_printf_1_wire_args_0_source_valid,
  output [15:0]  synthesizedPrintf_dut_printf_1_wire_args_0_source_bits,
  input          synthesizedPrintf_dut_printf_1_wire_enable_source_ready,
  output         synthesizedPrintf_dut_printf_1_wire_enable_source_valid,
  output         synthesizedPrintf_dut_printf_1_wire_enable_source_bits,
  input          synthesizedPrintf_dut_printf_1_wire_args_1_source_ready,
  output         synthesizedPrintf_dut_printf_1_wire_args_1_source_valid,
  output [527:0] synthesizedPrintf_dut_printf_1_wire_args_1_source_bits,
  input          synthesizedPrintf_dut_printf_wire_args_0_source_ready,
  output         synthesizedPrintf_dut_printf_wire_args_0_source_valid,
  output [15:0]  synthesizedPrintf_dut_printf_wire_args_0_source_bits
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
  reg [31:0] _RAND_5;
  reg [31:0] _RAND_6;
  reg [31:0] _RAND_7;
  reg [31:0] _RAND_8;
  reg [31:0] _RAND_9;
  reg [31:0] _RAND_10;
  reg [31:0] _RAND_11;
  reg [31:0] _RAND_12;
  reg [31:0] _RAND_13;
  reg [31:0] _RAND_14;
  reg [31:0] _RAND_15;
`endif // RANDOMIZE_REG_INIT
  wire  RationalClockBridge_clocks_0_buffer_I;
  wire  RationalClockBridge_clocks_0_buffer_CE;
  wire  RationalClockBridge_clocks_0_buffer_O;
  wire  dut_clock; // @[Util.scala 17:21]
  wire  dut_reset; // @[Util.scala 17:21]
  wire  dut_io_a; // @[Util.scala 17:21]
  wire  dut_synthesizedPrintf_printf_wire_enable; // @[Util.scala 17:21]
  wire [15:0] dut_synthesizedPrintf_printf_wire_args_0; // @[Util.scala 17:21]
  wire  dut_synthesizedPrintf_printf_1_wire_enable; // @[Util.scala 17:21]
  wire [15:0] dut_synthesizedPrintf_printf_1_wire_args_0; // @[Util.scala 17:21]
  wire [527:0] dut_synthesizedPrintf_printf_1_wire_args_1; // @[Util.scala 17:21]
  wire  dut_synthesizedPrintf_printf_2_wire_enable; // @[Util.scala 17:21]
  wire [15:0] dut_synthesizedPrintf_printf_2_wire_args_0; // @[Util.scala 17:21]
  wire [7:0] dut_synthesizedPrintf_printf_2_wire_args_1; // @[Util.scala 17:21]
  wire  dut_synthesizedPrintf_childInst_printf_wire_enable; // @[Util.scala 17:21]
  wire [15:0] dut_synthesizedPrintf_childInst_printf_wire_args_0; // @[Util.scala 17:21]
  wire [15:0] dut_synthesizedPrintf_childInst_printf_wire_args_1; // @[Util.scala 17:21]
  reg  RationalClockBridge_clocks_0_enabled;
  reg  peekPokeBridge_io_a_fired_0;
  reg  peekPokeBridge_reset_fired_0;
  reg  peekPokeBridge_io_b_fired_0;
  reg  synthesizedPrintf_dut_childInst_printf_wire_enable_fired_0;
  reg  synthesizedPrintf_dut_printf_2_wire_args_1_fired_0;
  reg  synthesizedPrintf_dut_printf_2_wire_enable_fired_0;
  reg  synthesizedPrintf_dut_printf_2_wire_args_0_fired_0;
  reg  synthesizedPrintf_dut_printf_wire_enable_fired_0;
  reg  synthesizedPrintf_dut_childInst_printf_wire_args_1_fired_0;
  reg  synthesizedPrintf_RationalClockBridge_clocks_0_globalReset_fired_0;
  reg  synthesizedPrintf_dut_childInst_printf_wire_args_0_fired_0;
  reg  synthesizedPrintf_dut_printf_1_wire_args_0_fired_0;
  reg  synthesizedPrintf_dut_printf_1_wire_enable_fired_0;
  reg  synthesizedPrintf_dut_printf_1_wire_args_1_fired_0;
  reg  synthesizedPrintf_dut_printf_wire_args_0_fired_0;
  wire  _GEN_30 = synthesizedPrintf_dut_printf_1_wire_args_1_fired_0 |
    synthesizedPrintf_dut_printf_1_wire_args_1_source_ready & synthesizedPrintf_dut_printf_1_wire_args_1_source_valid;
  wire  _GEN_32 = (synthesizedPrintf_dut_childInst_printf_wire_enable_fired_0 |
    synthesizedPrintf_dut_childInst_printf_wire_enable_source_ready &
    synthesizedPrintf_dut_childInst_printf_wire_enable_source_valid) & (
    synthesizedPrintf_dut_printf_2_wire_args_1_fired_0 | synthesizedPrintf_dut_printf_2_wire_args_1_source_ready &
    synthesizedPrintf_dut_printf_2_wire_args_1_source_valid) & (synthesizedPrintf_dut_printf_2_wire_enable_fired_0 |
    synthesizedPrintf_dut_printf_2_wire_enable_source_ready & synthesizedPrintf_dut_printf_2_wire_enable_source_valid)
     & (synthesizedPrintf_dut_printf_2_wire_args_0_fired_0 | synthesizedPrintf_dut_printf_2_wire_args_0_source_ready &
    synthesizedPrintf_dut_printf_2_wire_args_0_source_valid) & (synthesizedPrintf_dut_printf_wire_enable_fired_0 |
    synthesizedPrintf_dut_printf_wire_enable_source_ready & synthesizedPrintf_dut_printf_wire_enable_source_valid) & (
    synthesizedPrintf_dut_childInst_printf_wire_args_1_fired_0 |
    synthesizedPrintf_dut_childInst_printf_wire_args_1_source_ready &
    synthesizedPrintf_dut_childInst_printf_wire_args_1_source_valid) & (
    synthesizedPrintf_RationalClockBridge_clocks_0_globalReset_fired_0 |
    synthesizedPrintf_RationalClockBridge_clocks_0_globalReset_source_ready &
    synthesizedPrintf_RationalClockBridge_clocks_0_globalReset_source_valid) & (
    synthesizedPrintf_dut_childInst_printf_wire_args_0_fired_0 |
    synthesizedPrintf_dut_childInst_printf_wire_args_0_source_ready &
    synthesizedPrintf_dut_childInst_printf_wire_args_0_source_valid) & (
    synthesizedPrintf_dut_printf_1_wire_args_0_fired_0 | synthesizedPrintf_dut_printf_1_wire_args_0_source_ready &
    synthesizedPrintf_dut_printf_1_wire_args_0_source_valid) & (synthesizedPrintf_dut_printf_1_wire_enable_fired_0 |
    synthesizedPrintf_dut_printf_1_wire_enable_source_ready & synthesizedPrintf_dut_printf_1_wire_enable_source_valid)
     & _GEN_30;
  wire  targetCycleFinishing = _GEN_32 & (synthesizedPrintf_dut_printf_wire_args_0_fired_0 |
    synthesizedPrintf_dut_printf_wire_args_0_source_ready & synthesizedPrintf_dut_printf_wire_args_0_source_valid) &
    peekPokeBridge_io_a_sink_valid & peekPokeBridge_reset_sink_valid & peekPokeBridge_io_b_sink_valid;
  wire  _GEN_85 = targetCycleFinishing ? ~RationalClockBridge_clocks_0_sink_bits : peekPokeBridge_io_a_fired_0 |
    peekPokeBridge_io_a_sink_ready & peekPokeBridge_io_a_sink_valid;
  wire  _GEN_88 = targetCycleFinishing ? ~RationalClockBridge_clocks_0_sink_bits : peekPokeBridge_reset_fired_0 |
    peekPokeBridge_reset_sink_ready & peekPokeBridge_reset_sink_valid;
  wire  _GEN_91 = targetCycleFinishing ? ~RationalClockBridge_clocks_0_sink_bits : peekPokeBridge_io_b_fired_0 |
    peekPokeBridge_io_b_sink_ready & peekPokeBridge_io_b_sink_valid;
  BUFGCE RationalClockBridge_clocks_0_buffer (
    .I(RationalClockBridge_clocks_0_buffer_I),
    .CE(RationalClockBridge_clocks_0_buffer_CE),
    .O(RationalClockBridge_clocks_0_buffer_O)
  );
  PrintfModuleDUT dut ( // @[Util.scala 17:21]
    .clock(dut_clock),
    .reset(dut_reset),
    .io_a(dut_io_a),
    .synthesizedPrintf_printf_wire_enable(dut_synthesizedPrintf_printf_wire_enable),
    .synthesizedPrintf_printf_wire_args_0(dut_synthesizedPrintf_printf_wire_args_0),
    .synthesizedPrintf_printf_1_wire_enable(dut_synthesizedPrintf_printf_1_wire_enable),
    .synthesizedPrintf_printf_1_wire_args_0(dut_synthesizedPrintf_printf_1_wire_args_0),
    .synthesizedPrintf_printf_1_wire_args_1(dut_synthesizedPrintf_printf_1_wire_args_1),
    .synthesizedPrintf_printf_2_wire_enable(dut_synthesizedPrintf_printf_2_wire_enable),
    .synthesizedPrintf_printf_2_wire_args_0(dut_synthesizedPrintf_printf_2_wire_args_0),
    .synthesizedPrintf_printf_2_wire_args_1(dut_synthesizedPrintf_printf_2_wire_args_1),
    .synthesizedPrintf_childInst_printf_wire_enable(dut_synthesizedPrintf_childInst_printf_wire_enable),
    .synthesizedPrintf_childInst_printf_wire_args_0(dut_synthesizedPrintf_childInst_printf_wire_args_0),
    .synthesizedPrintf_childInst_printf_wire_args_1(dut_synthesizedPrintf_childInst_printf_wire_args_1)
  );
  assign RationalClockBridge_clocks_0_sink_ready = _GEN_32 & (synthesizedPrintf_dut_printf_wire_args_0_fired_0 |
    synthesizedPrintf_dut_printf_wire_args_0_source_ready & synthesizedPrintf_dut_printf_wire_args_0_source_valid) &
    peekPokeBridge_io_a_sink_valid & peekPokeBridge_reset_sink_valid & peekPokeBridge_io_b_sink_valid;
  assign peekPokeBridge_io_a_sink_ready = targetCycleFinishing & ~peekPokeBridge_io_a_fired_0;
  assign peekPokeBridge_reset_sink_ready = targetCycleFinishing & ~peekPokeBridge_reset_fired_0;
  assign peekPokeBridge_io_b_sink_ready = targetCycleFinishing & ~peekPokeBridge_io_b_fired_0;
  assign synthesizedPrintf_dut_childInst_printf_wire_enable_source_valid = peekPokeBridge_reset_sink_valid & ~
    synthesizedPrintf_dut_childInst_printf_wire_enable_fired_0;
  assign synthesizedPrintf_dut_childInst_printf_wire_enable_source_bits =
    dut_synthesizedPrintf_childInst_printf_wire_enable;
  assign synthesizedPrintf_dut_printf_2_wire_args_1_source_valid = ~synthesizedPrintf_dut_printf_2_wire_args_1_fired_0;
  assign synthesizedPrintf_dut_printf_2_wire_args_1_source_bits = dut_synthesizedPrintf_printf_2_wire_args_1;
  assign synthesizedPrintf_dut_printf_2_wire_enable_source_valid = peekPokeBridge_reset_sink_valid & ~
    synthesizedPrintf_dut_printf_2_wire_enable_fired_0;
  assign synthesizedPrintf_dut_printf_2_wire_enable_source_bits = dut_synthesizedPrintf_printf_2_wire_enable;
  assign synthesizedPrintf_dut_printf_2_wire_args_0_source_valid = ~synthesizedPrintf_dut_printf_2_wire_args_0_fired_0;
  assign synthesizedPrintf_dut_printf_2_wire_args_0_source_bits = dut_synthesizedPrintf_printf_2_wire_args_0;
  assign synthesizedPrintf_dut_printf_wire_enable_source_valid = peekPokeBridge_reset_sink_valid & ~
    synthesizedPrintf_dut_printf_wire_enable_fired_0;
  assign synthesizedPrintf_dut_printf_wire_enable_source_bits = dut_synthesizedPrintf_printf_wire_enable;
  assign synthesizedPrintf_dut_childInst_printf_wire_args_1_source_valid = ~
    synthesizedPrintf_dut_childInst_printf_wire_args_1_fired_0;
  assign synthesizedPrintf_dut_childInst_printf_wire_args_1_source_bits =
    dut_synthesizedPrintf_childInst_printf_wire_args_1;
  assign synthesizedPrintf_RationalClockBridge_clocks_0_globalReset_source_valid = ~
    synthesizedPrintf_RationalClockBridge_clocks_0_globalReset_fired_0;
  assign synthesizedPrintf_dut_childInst_printf_wire_args_0_source_valid = ~
    synthesizedPrintf_dut_childInst_printf_wire_args_0_fired_0;
  assign synthesizedPrintf_dut_childInst_printf_wire_args_0_source_bits =
    dut_synthesizedPrintf_childInst_printf_wire_args_0;
  assign synthesizedPrintf_dut_printf_1_wire_args_0_source_valid = ~synthesizedPrintf_dut_printf_1_wire_args_0_fired_0;
  assign synthesizedPrintf_dut_printf_1_wire_args_0_source_bits = dut_synthesizedPrintf_printf_1_wire_args_0;
  assign synthesizedPrintf_dut_printf_1_wire_enable_source_valid = peekPokeBridge_reset_sink_valid & ~
    synthesizedPrintf_dut_printf_1_wire_enable_fired_0;
  assign synthesizedPrintf_dut_printf_1_wire_enable_source_bits = dut_synthesizedPrintf_printf_1_wire_enable;
  assign synthesizedPrintf_dut_printf_1_wire_args_1_source_valid = ~synthesizedPrintf_dut_printf_1_wire_args_1_fired_0;
  assign synthesizedPrintf_dut_printf_1_wire_args_1_source_bits = dut_synthesizedPrintf_printf_1_wire_args_1;
  assign synthesizedPrintf_dut_printf_wire_args_0_source_valid = ~synthesizedPrintf_dut_printf_wire_args_0_fired_0;
  assign synthesizedPrintf_dut_printf_wire_args_0_source_bits = dut_synthesizedPrintf_printf_wire_args_0;
  assign RationalClockBridge_clocks_0_buffer_I = hostClock;
  assign RationalClockBridge_clocks_0_buffer_CE = RationalClockBridge_clocks_0_enabled & targetCycleFinishing & ~
    hostReset;
  assign dut_clock = RationalClockBridge_clocks_0_buffer_O;
  assign dut_reset = peekPokeBridge_reset_sink_bits; // @[PeekPokeIO.scala 228:32 231:58]
  assign dut_io_a = peekPokeBridge_io_a_sink_bits; // @[PeekPokeIO.scala 231:58]
  always @(posedge hostClock) begin
    if (hostReset) begin
      RationalClockBridge_clocks_0_enabled <= 1'h0;
    end else if (targetCycleFinishing) begin
      RationalClockBridge_clocks_0_enabled <= RationalClockBridge_clocks_0_sink_bits;
    end
    peekPokeBridge_io_a_fired_0 <= hostReset | _GEN_85;
    peekPokeBridge_reset_fired_0 <= hostReset | _GEN_88;
    peekPokeBridge_io_b_fired_0 <= hostReset | _GEN_91;
    if (hostReset) begin
      synthesizedPrintf_dut_childInst_printf_wire_enable_fired_0 <= 1'h0;
    end else if (targetCycleFinishing) begin
      synthesizedPrintf_dut_childInst_printf_wire_enable_fired_0 <= ~RationalClockBridge_clocks_0_enabled;
    end else begin
      synthesizedPrintf_dut_childInst_printf_wire_enable_fired_0 <=
        synthesizedPrintf_dut_childInst_printf_wire_enable_fired_0 |
        synthesizedPrintf_dut_childInst_printf_wire_enable_source_ready &
        synthesizedPrintf_dut_childInst_printf_wire_enable_source_valid;
    end
    if (hostReset) begin
      synthesizedPrintf_dut_printf_2_wire_args_1_fired_0 <= 1'h0;
    end else if (targetCycleFinishing) begin
      synthesizedPrintf_dut_printf_2_wire_args_1_fired_0 <= ~RationalClockBridge_clocks_0_enabled;
    end else begin
      synthesizedPrintf_dut_printf_2_wire_args_1_fired_0 <= synthesizedPrintf_dut_printf_2_wire_args_1_fired_0 |
        synthesizedPrintf_dut_printf_2_wire_args_1_source_ready &
        synthesizedPrintf_dut_printf_2_wire_args_1_source_valid;
    end
    if (hostReset) begin
      synthesizedPrintf_dut_printf_2_wire_enable_fired_0 <= 1'h0;
    end else if (targetCycleFinishing) begin
      synthesizedPrintf_dut_printf_2_wire_enable_fired_0 <= ~RationalClockBridge_clocks_0_enabled;
    end else begin
      synthesizedPrintf_dut_printf_2_wire_enable_fired_0 <= synthesizedPrintf_dut_printf_2_wire_enable_fired_0 |
        synthesizedPrintf_dut_printf_2_wire_enable_source_ready &
        synthesizedPrintf_dut_printf_2_wire_enable_source_valid;
    end
    if (hostReset) begin
      synthesizedPrintf_dut_printf_2_wire_args_0_fired_0 <= 1'h0;
    end else if (targetCycleFinishing) begin
      synthesizedPrintf_dut_printf_2_wire_args_0_fired_0 <= ~RationalClockBridge_clocks_0_enabled;
    end else begin
      synthesizedPrintf_dut_printf_2_wire_args_0_fired_0 <= synthesizedPrintf_dut_printf_2_wire_args_0_fired_0 |
        synthesizedPrintf_dut_printf_2_wire_args_0_source_ready &
        synthesizedPrintf_dut_printf_2_wire_args_0_source_valid;
    end
    if (hostReset) begin
      synthesizedPrintf_dut_printf_wire_enable_fired_0 <= 1'h0;
    end else if (targetCycleFinishing) begin
      synthesizedPrintf_dut_printf_wire_enable_fired_0 <= ~RationalClockBridge_clocks_0_enabled;
    end else begin
      synthesizedPrintf_dut_printf_wire_enable_fired_0 <= synthesizedPrintf_dut_printf_wire_enable_fired_0 |
        synthesizedPrintf_dut_printf_wire_enable_source_ready & synthesizedPrintf_dut_printf_wire_enable_source_valid;
    end
    if (hostReset) begin
      synthesizedPrintf_dut_childInst_printf_wire_args_1_fired_0 <= 1'h0;
    end else if (targetCycleFinishing) begin
      synthesizedPrintf_dut_childInst_printf_wire_args_1_fired_0 <= ~RationalClockBridge_clocks_0_enabled;
    end else begin
      synthesizedPrintf_dut_childInst_printf_wire_args_1_fired_0 <=
        synthesizedPrintf_dut_childInst_printf_wire_args_1_fired_0 |
        synthesizedPrintf_dut_childInst_printf_wire_args_1_source_ready &
        synthesizedPrintf_dut_childInst_printf_wire_args_1_source_valid;
    end
    if (hostReset) begin
      synthesizedPrintf_RationalClockBridge_clocks_0_globalReset_fired_0 <= 1'h0;
    end else if (targetCycleFinishing) begin
      synthesizedPrintf_RationalClockBridge_clocks_0_globalReset_fired_0 <= ~RationalClockBridge_clocks_0_enabled;
    end else begin
      synthesizedPrintf_RationalClockBridge_clocks_0_globalReset_fired_0 <=
        synthesizedPrintf_RationalClockBridge_clocks_0_globalReset_fired_0 |
        synthesizedPrintf_RationalClockBridge_clocks_0_globalReset_source_ready &
        synthesizedPrintf_RationalClockBridge_clocks_0_globalReset_source_valid;
    end
    if (hostReset) begin
      synthesizedPrintf_dut_childInst_printf_wire_args_0_fired_0 <= 1'h0;
    end else if (targetCycleFinishing) begin
      synthesizedPrintf_dut_childInst_printf_wire_args_0_fired_0 <= ~RationalClockBridge_clocks_0_enabled;
    end else begin
      synthesizedPrintf_dut_childInst_printf_wire_args_0_fired_0 <=
        synthesizedPrintf_dut_childInst_printf_wire_args_0_fired_0 |
        synthesizedPrintf_dut_childInst_printf_wire_args_0_source_ready &
        synthesizedPrintf_dut_childInst_printf_wire_args_0_source_valid;
    end
    if (hostReset) begin
      synthesizedPrintf_dut_printf_1_wire_args_0_fired_0 <= 1'h0;
    end else if (targetCycleFinishing) begin
      synthesizedPrintf_dut_printf_1_wire_args_0_fired_0 <= ~RationalClockBridge_clocks_0_enabled;
    end else begin
      synthesizedPrintf_dut_printf_1_wire_args_0_fired_0 <= synthesizedPrintf_dut_printf_1_wire_args_0_fired_0 |
        synthesizedPrintf_dut_printf_1_wire_args_0_source_ready &
        synthesizedPrintf_dut_printf_1_wire_args_0_source_valid;
    end
    if (hostReset) begin
      synthesizedPrintf_dut_printf_1_wire_enable_fired_0 <= 1'h0;
    end else if (targetCycleFinishing) begin
      synthesizedPrintf_dut_printf_1_wire_enable_fired_0 <= ~RationalClockBridge_clocks_0_enabled;
    end else begin
      synthesizedPrintf_dut_printf_1_wire_enable_fired_0 <= synthesizedPrintf_dut_printf_1_wire_enable_fired_0 |
        synthesizedPrintf_dut_printf_1_wire_enable_source_ready &
        synthesizedPrintf_dut_printf_1_wire_enable_source_valid;
    end
    if (hostReset) begin
      synthesizedPrintf_dut_printf_1_wire_args_1_fired_0 <= 1'h0;
    end else if (targetCycleFinishing) begin
      synthesizedPrintf_dut_printf_1_wire_args_1_fired_0 <= ~RationalClockBridge_clocks_0_enabled;
    end else begin
      synthesizedPrintf_dut_printf_1_wire_args_1_fired_0 <= synthesizedPrintf_dut_printf_1_wire_args_1_fired_0 |
        synthesizedPrintf_dut_printf_1_wire_args_1_source_ready &
        synthesizedPrintf_dut_printf_1_wire_args_1_source_valid;
    end
    if (hostReset) begin
      synthesizedPrintf_dut_printf_wire_args_0_fired_0 <= 1'h0;
    end else if (targetCycleFinishing) begin
      synthesizedPrintf_dut_printf_wire_args_0_fired_0 <= ~RationalClockBridge_clocks_0_enabled;
    end else begin
      synthesizedPrintf_dut_printf_wire_args_0_fired_0 <= synthesizedPrintf_dut_printf_wire_args_0_fired_0 |
        synthesizedPrintf_dut_printf_wire_args_0_source_ready & synthesizedPrintf_dut_printf_wire_args_0_source_valid;
    end
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  RationalClockBridge_clocks_0_enabled = _RAND_0[0:0];
  _RAND_1 = {1{`RANDOM}};
  peekPokeBridge_io_a_fired_0 = _RAND_1[0:0];
  _RAND_2 = {1{`RANDOM}};
  peekPokeBridge_reset_fired_0 = _RAND_2[0:0];
  _RAND_3 = {1{`RANDOM}};
  peekPokeBridge_io_b_fired_0 = _RAND_3[0:0];
  _RAND_4 = {1{`RANDOM}};
  synthesizedPrintf_dut_childInst_printf_wire_enable_fired_0 = _RAND_4[0:0];
  _RAND_5 = {1{`RANDOM}};
  synthesizedPrintf_dut_printf_2_wire_args_1_fired_0 = _RAND_5[0:0];
  _RAND_6 = {1{`RANDOM}};
  synthesizedPrintf_dut_printf_2_wire_enable_fired_0 = _RAND_6[0:0];
  _RAND_7 = {1{`RANDOM}};
  synthesizedPrintf_dut_printf_2_wire_args_0_fired_0 = _RAND_7[0:0];
  _RAND_8 = {1{`RANDOM}};
  synthesizedPrintf_dut_printf_wire_enable_fired_0 = _RAND_8[0:0];
  _RAND_9 = {1{`RANDOM}};
  synthesizedPrintf_dut_childInst_printf_wire_args_1_fired_0 = _RAND_9[0:0];
  _RAND_10 = {1{`RANDOM}};
  synthesizedPrintf_RationalClockBridge_clocks_0_globalReset_fired_0 = _RAND_10[0:0];
  _RAND_11 = {1{`RANDOM}};
  synthesizedPrintf_dut_childInst_printf_wire_args_0_fired_0 = _RAND_11[0:0];
  _RAND_12 = {1{`RANDOM}};
  synthesizedPrintf_dut_printf_1_wire_args_0_fired_0 = _RAND_12[0:0];
  _RAND_13 = {1{`RANDOM}};
  synthesizedPrintf_dut_printf_1_wire_enable_fired_0 = _RAND_13[0:0];
  _RAND_14 = {1{`RANDOM}};
  synthesizedPrintf_dut_printf_1_wire_args_1_fired_0 = _RAND_14[0:0];
  _RAND_15 = {1{`RANDOM}};
  synthesizedPrintf_dut_printf_wire_args_0_fired_0 = _RAND_15[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module PrintfModule_threaded( // @[@ [Added during FAME5Transform]]
  input   hostClock,
  input   hostReset,
  input   RationalClockBridge_clocks_0_sink_valid,
  input   RationalClockBridge_clocks_0_sink_bits,
  input   peekPokeBridge_io_a_sink_valid,
  input   peekPokeBridge_io_a_sink_bits,
  input   peekPokeBridge_reset_sink_valid,
  input   peekPokeBridge_reset_sink_bits,
  input   peekPokeBridge_io_b_sink_valid,
  input   synthesizedPrintf_dut_childInst_printf_wire_enable_source_ready,
  output  synthesizedPrintf_dut_childInst_printf_wire_enable_source_valid,
  input   synthesizedPrintf_dut_printf_2_wire_args_1_source_ready,
  output  synthesizedPrintf_dut_printf_2_wire_args_1_source_valid,
  input   synthesizedPrintf_dut_printf_2_wire_enable_source_ready,
  output  synthesizedPrintf_dut_printf_2_wire_enable_source_valid,
  input   synthesizedPrintf_dut_printf_2_wire_args_0_source_ready,
  output  synthesizedPrintf_dut_printf_2_wire_args_0_source_valid,
  input   synthesizedPrintf_dut_printf_wire_enable_source_ready,
  output  synthesizedPrintf_dut_printf_wire_enable_source_valid,
  input   synthesizedPrintf_dut_childInst_printf_wire_args_1_source_ready,
  output  synthesizedPrintf_dut_childInst_printf_wire_args_1_source_valid,
  input   synthesizedPrintf_RationalClockBridge_clocks_0_globalReset_source_ready,
  output  synthesizedPrintf_RationalClockBridge_clocks_0_globalReset_source_valid,
  input   synthesizedPrintf_dut_childInst_printf_wire_args_0_source_ready,
  output  synthesizedPrintf_dut_childInst_printf_wire_args_0_source_valid,
  input   synthesizedPrintf_dut_printf_1_wire_args_0_source_ready,
  output  synthesizedPrintf_dut_printf_1_wire_args_0_source_valid,
  input   synthesizedPrintf_dut_printf_1_wire_enable_source_ready,
  output  synthesizedPrintf_dut_printf_1_wire_enable_source_valid,
  input   synthesizedPrintf_dut_printf_1_wire_args_1_source_ready,
  output  synthesizedPrintf_dut_printf_1_wire_args_1_source_valid,
  input   synthesizedPrintf_dut_printf_wire_args_0_source_ready,
  output  synthesizedPrintf_dut_printf_wire_args_0_source_valid
);
`ifdef RANDOMIZE_MEM_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
  reg [31:0] _RAND_5;
  reg [31:0] _RAND_6;
  reg [31:0] _RAND_7;
  reg [31:0] _RAND_8;
  reg [31:0] _RAND_9;
  reg [31:0] _RAND_10;
  reg [31:0] _RAND_11;
  reg [31:0] _RAND_12;
`endif // RANDOMIZE_MEM_INIT
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_13;
`endif // RANDOMIZE_REG_INIT
  wire  RationalClockBridge_clocks_0_buffer_I;
  wire  RationalClockBridge_clocks_0_buffer_CE;
  wire  RationalClockBridge_clocks_0_buffer_O;
  wire  dut_clock; // @[Util.scala 17:21]
  wire  dut_reset; // @[Util.scala 17:21]
  wire  dut_io_a; // @[Util.scala 17:21]
  wire  dut_hostClock; // @[Util.scala 17:21]
  reg  RationalClockBridge_clocks_0_enabled [0:0]; // @[@ [Added during FAME5Transform]]
  wire  RationalClockBridge_clocks_0_enabled_read_en; // @[@ [Added during FAME5Transform] @ [Added during FAME5Transform]]
  wire  RationalClockBridge_clocks_0_enabled_read_addr; // @[@ [Added during FAME5Transform] @ [Added during FAME5Transform]]
  wire  RationalClockBridge_clocks_0_enabled_read_data; // @[@ [Added during FAME5Transform]]
  wire  RationalClockBridge_clocks_0_enabled_write_data; // @[@ [Added during FAME5Transform] @ [Added during FAME5Transform] @ [Added during FAME5Transform] @ [Added during FAME5Transform]]
  wire  RationalClockBridge_clocks_0_enabled_write_addr; // @[@ [Added during FAME5Transform] @ [Added during FAME5Transform]]
  wire  RationalClockBridge_clocks_0_enabled_write_mask; // @[@ [Added during FAME5Transform] @ [Added during FAME5Transform]]
  wire  RationalClockBridge_clocks_0_enabled_write_en; // @[@ [Added during FAME5Transform] @ [Added during FAME5Transform] @ [Added during FAME5Transform] @ [Added during FAME5Transform]]
  reg  synthesizedPrintf_dut_childInst_printf_wire_enable_fired_0 [0:0]; // @[@ [Added during FAME5Transform]]
  wire  synthesizedPrintf_dut_childInst_printf_wire_enable_fired_0_read_en; // @[@ [Added during FAME5Transform] @ [Added during FAME5Transform]]
  wire  synthesizedPrintf_dut_childInst_printf_wire_enable_fired_0_read_addr; // @[@ [Added during FAME5Transform] @ [Added during FAME5Transform]]
  wire  synthesizedPrintf_dut_childInst_printf_wire_enable_fired_0_read_data; // @[@ [Added during FAME5Transform]]
  wire  synthesizedPrintf_dut_childInst_printf_wire_enable_fired_0_write_data; // @[@ [Added during FAME5Transform] @ [Added during FAME5Transform] @ [Added during FAME5Transform] @ [Added during FAME5Transform]]
  wire  synthesizedPrintf_dut_childInst_printf_wire_enable_fired_0_write_addr; // @[@ [Added during FAME5Transform] @ [Added during FAME5Transform]]
  wire  synthesizedPrintf_dut_childInst_printf_wire_enable_fired_0_write_mask; // @[@ [Added during FAME5Transform] @ [Added during FAME5Transform]]
  wire  synthesizedPrintf_dut_childInst_printf_wire_enable_fired_0_write_en; // @[@ [Added during FAME5Transform] @ [Added during FAME5Transform] @ [Added during FAME5Transform] @ [Added during FAME5Transform]]
  reg  synthesizedPrintf_dut_printf_2_wire_args_1_fired_0 [0:0]; // @[@ [Added during FAME5Transform]]
  wire  synthesizedPrintf_dut_printf_2_wire_args_1_fired_0_read_en; // @[@ [Added during FAME5Transform] @ [Added during FAME5Transform]]
  wire  synthesizedPrintf_dut_printf_2_wire_args_1_fired_0_read_addr; // @[@ [Added during FAME5Transform] @ [Added during FAME5Transform]]
  wire  synthesizedPrintf_dut_printf_2_wire_args_1_fired_0_read_data; // @[@ [Added during FAME5Transform]]
  wire  synthesizedPrintf_dut_printf_2_wire_args_1_fired_0_write_data; // @[@ [Added during FAME5Transform] @ [Added during FAME5Transform] @ [Added during FAME5Transform] @ [Added during FAME5Transform]]
  wire  synthesizedPrintf_dut_printf_2_wire_args_1_fired_0_write_addr; // @[@ [Added during FAME5Transform] @ [Added during FAME5Transform]]
  wire  synthesizedPrintf_dut_printf_2_wire_args_1_fired_0_write_mask; // @[@ [Added during FAME5Transform] @ [Added during FAME5Transform]]
  wire  synthesizedPrintf_dut_printf_2_wire_args_1_fired_0_write_en; // @[@ [Added during FAME5Transform] @ [Added during FAME5Transform] @ [Added during FAME5Transform] @ [Added during FAME5Transform]]
  reg  synthesizedPrintf_dut_printf_2_wire_enable_fired_0 [0:0]; // @[@ [Added during FAME5Transform]]
  wire  synthesizedPrintf_dut_printf_2_wire_enable_fired_0_read_en; // @[@ [Added during FAME5Transform] @ [Added during FAME5Transform]]
  wire  synthesizedPrintf_dut_printf_2_wire_enable_fired_0_read_addr; // @[@ [Added during FAME5Transform] @ [Added during FAME5Transform]]
  wire  synthesizedPrintf_dut_printf_2_wire_enable_fired_0_read_data; // @[@ [Added during FAME5Transform]]
  wire  synthesizedPrintf_dut_printf_2_wire_enable_fired_0_write_data; // @[@ [Added during FAME5Transform] @ [Added during FAME5Transform] @ [Added during FAME5Transform] @ [Added during FAME5Transform]]
  wire  synthesizedPrintf_dut_printf_2_wire_enable_fired_0_write_addr; // @[@ [Added during FAME5Transform] @ [Added during FAME5Transform]]
  wire  synthesizedPrintf_dut_printf_2_wire_enable_fired_0_write_mask; // @[@ [Added during FAME5Transform] @ [Added during FAME5Transform]]
  wire  synthesizedPrintf_dut_printf_2_wire_enable_fired_0_write_en; // @[@ [Added during FAME5Transform] @ [Added during FAME5Transform] @ [Added during FAME5Transform] @ [Added during FAME5Transform]]
  reg  synthesizedPrintf_dut_printf_2_wire_args_0_fired_0 [0:0]; // @[@ [Added during FAME5Transform]]
  wire  synthesizedPrintf_dut_printf_2_wire_args_0_fired_0_read_en; // @[@ [Added during FAME5Transform] @ [Added during FAME5Transform]]
  wire  synthesizedPrintf_dut_printf_2_wire_args_0_fired_0_read_addr; // @[@ [Added during FAME5Transform] @ [Added during FAME5Transform]]
  wire  synthesizedPrintf_dut_printf_2_wire_args_0_fired_0_read_data; // @[@ [Added during FAME5Transform]]
  wire  synthesizedPrintf_dut_printf_2_wire_args_0_fired_0_write_data; // @[@ [Added during FAME5Transform] @ [Added during FAME5Transform] @ [Added during FAME5Transform] @ [Added during FAME5Transform]]
  wire  synthesizedPrintf_dut_printf_2_wire_args_0_fired_0_write_addr; // @[@ [Added during FAME5Transform] @ [Added during FAME5Transform]]
  wire  synthesizedPrintf_dut_printf_2_wire_args_0_fired_0_write_mask; // @[@ [Added during FAME5Transform] @ [Added during FAME5Transform]]
  wire  synthesizedPrintf_dut_printf_2_wire_args_0_fired_0_write_en; // @[@ [Added during FAME5Transform] @ [Added during FAME5Transform] @ [Added during FAME5Transform] @ [Added during FAME5Transform]]
  reg  synthesizedPrintf_dut_printf_wire_enable_fired_0 [0:0]; // @[@ [Added during FAME5Transform]]
  wire  synthesizedPrintf_dut_printf_wire_enable_fired_0_read_en; // @[@ [Added during FAME5Transform] @ [Added during FAME5Transform]]
  wire  synthesizedPrintf_dut_printf_wire_enable_fired_0_read_addr; // @[@ [Added during FAME5Transform] @ [Added during FAME5Transform]]
  wire  synthesizedPrintf_dut_printf_wire_enable_fired_0_read_data; // @[@ [Added during FAME5Transform]]
  wire  synthesizedPrintf_dut_printf_wire_enable_fired_0_write_data; // @[@ [Added during FAME5Transform] @ [Added during FAME5Transform] @ [Added during FAME5Transform] @ [Added during FAME5Transform]]
  wire  synthesizedPrintf_dut_printf_wire_enable_fired_0_write_addr; // @[@ [Added during FAME5Transform] @ [Added during FAME5Transform]]
  wire  synthesizedPrintf_dut_printf_wire_enable_fired_0_write_mask; // @[@ [Added during FAME5Transform] @ [Added during FAME5Transform]]
  wire  synthesizedPrintf_dut_printf_wire_enable_fired_0_write_en; // @[@ [Added during FAME5Transform] @ [Added during FAME5Transform] @ [Added during FAME5Transform] @ [Added during FAME5Transform]]
  reg  synthesizedPrintf_dut_childInst_printf_wire_args_1_fired_0 [0:0]; // @[@ [Added during FAME5Transform]]
  wire  synthesizedPrintf_dut_childInst_printf_wire_args_1_fired_0_read_en; // @[@ [Added during FAME5Transform] @ [Added during FAME5Transform]]
  wire  synthesizedPrintf_dut_childInst_printf_wire_args_1_fired_0_read_addr; // @[@ [Added during FAME5Transform] @ [Added during FAME5Transform]]
  wire  synthesizedPrintf_dut_childInst_printf_wire_args_1_fired_0_read_data; // @[@ [Added during FAME5Transform]]
  wire  synthesizedPrintf_dut_childInst_printf_wire_args_1_fired_0_write_data; // @[@ [Added during FAME5Transform] @ [Added during FAME5Transform] @ [Added during FAME5Transform] @ [Added during FAME5Transform]]
  wire  synthesizedPrintf_dut_childInst_printf_wire_args_1_fired_0_write_addr; // @[@ [Added during FAME5Transform] @ [Added during FAME5Transform]]
  wire  synthesizedPrintf_dut_childInst_printf_wire_args_1_fired_0_write_mask; // @[@ [Added during FAME5Transform] @ [Added during FAME5Transform]]
  wire  synthesizedPrintf_dut_childInst_printf_wire_args_1_fired_0_write_en; // @[@ [Added during FAME5Transform] @ [Added during FAME5Transform] @ [Added during FAME5Transform] @ [Added during FAME5Transform]]
  reg  synthesizedPrintf_RationalClockBridge_clocks_0_globalReset_fired_0 [0:0]; // @[@ [Added during FAME5Transform]]
  wire  synthesizedPrintf_RationalClockBridge_clocks_0_globalReset_fired_0_read_en; // @[@ [Added during FAME5Transform] @ [Added during FAME5Transform]]
  wire  synthesizedPrintf_RationalClockBridge_clocks_0_globalReset_fired_0_read_addr; // @[@ [Added during FAME5Transform] @ [Added during FAME5Transform]]
  wire  synthesizedPrintf_RationalClockBridge_clocks_0_globalReset_fired_0_read_data; // @[@ [Added during FAME5Transform]]
  wire  synthesizedPrintf_RationalClockBridge_clocks_0_globalReset_fired_0_write_data; // @[@ [Added during FAME5Transform] @ [Added during FAME5Transform] @ [Added during FAME5Transform] @ [Added during FAME5Transform]]
  wire  synthesizedPrintf_RationalClockBridge_clocks_0_globalReset_fired_0_write_addr; // @[@ [Added during FAME5Transform] @ [Added during FAME5Transform]]
  wire  synthesizedPrintf_RationalClockBridge_clocks_0_globalReset_fired_0_write_mask; // @[@ [Added during FAME5Transform] @ [Added during FAME5Transform]]
  wire  synthesizedPrintf_RationalClockBridge_clocks_0_globalReset_fired_0_write_en; // @[@ [Added during FAME5Transform] @ [Added during FAME5Transform] @ [Added during FAME5Transform] @ [Added during FAME5Transform]]
  reg  synthesizedPrintf_dut_childInst_printf_wire_args_0_fired_0 [0:0]; // @[@ [Added during FAME5Transform]]
  wire  synthesizedPrintf_dut_childInst_printf_wire_args_0_fired_0_read_en; // @[@ [Added during FAME5Transform] @ [Added during FAME5Transform]]
  wire  synthesizedPrintf_dut_childInst_printf_wire_args_0_fired_0_read_addr; // @[@ [Added during FAME5Transform] @ [Added during FAME5Transform]]
  wire  synthesizedPrintf_dut_childInst_printf_wire_args_0_fired_0_read_data; // @[@ [Added during FAME5Transform]]
  wire  synthesizedPrintf_dut_childInst_printf_wire_args_0_fired_0_write_data; // @[@ [Added during FAME5Transform] @ [Added during FAME5Transform] @ [Added during FAME5Transform] @ [Added during FAME5Transform]]
  wire  synthesizedPrintf_dut_childInst_printf_wire_args_0_fired_0_write_addr; // @[@ [Added during FAME5Transform] @ [Added during FAME5Transform]]
  wire  synthesizedPrintf_dut_childInst_printf_wire_args_0_fired_0_write_mask; // @[@ [Added during FAME5Transform] @ [Added during FAME5Transform]]
  wire  synthesizedPrintf_dut_childInst_printf_wire_args_0_fired_0_write_en; // @[@ [Added during FAME5Transform] @ [Added during FAME5Transform] @ [Added during FAME5Transform] @ [Added during FAME5Transform]]
  reg  synthesizedPrintf_dut_printf_1_wire_args_0_fired_0 [0:0]; // @[@ [Added during FAME5Transform]]
  wire  synthesizedPrintf_dut_printf_1_wire_args_0_fired_0_read_en; // @[@ [Added during FAME5Transform] @ [Added during FAME5Transform]]
  wire  synthesizedPrintf_dut_printf_1_wire_args_0_fired_0_read_addr; // @[@ [Added during FAME5Transform] @ [Added during FAME5Transform]]
  wire  synthesizedPrintf_dut_printf_1_wire_args_0_fired_0_read_data; // @[@ [Added during FAME5Transform]]
  wire  synthesizedPrintf_dut_printf_1_wire_args_0_fired_0_write_data; // @[@ [Added during FAME5Transform] @ [Added during FAME5Transform] @ [Added during FAME5Transform] @ [Added during FAME5Transform]]
  wire  synthesizedPrintf_dut_printf_1_wire_args_0_fired_0_write_addr; // @[@ [Added during FAME5Transform] @ [Added during FAME5Transform]]
  wire  synthesizedPrintf_dut_printf_1_wire_args_0_fired_0_write_mask; // @[@ [Added during FAME5Transform] @ [Added during FAME5Transform]]
  wire  synthesizedPrintf_dut_printf_1_wire_args_0_fired_0_write_en; // @[@ [Added during FAME5Transform] @ [Added during FAME5Transform] @ [Added during FAME5Transform] @ [Added during FAME5Transform]]
  reg  synthesizedPrintf_dut_printf_1_wire_enable_fired_0 [0:0]; // @[@ [Added during FAME5Transform]]
  wire  synthesizedPrintf_dut_printf_1_wire_enable_fired_0_read_en; // @[@ [Added during FAME5Transform] @ [Added during FAME5Transform]]
  wire  synthesizedPrintf_dut_printf_1_wire_enable_fired_0_read_addr; // @[@ [Added during FAME5Transform] @ [Added during FAME5Transform]]
  wire  synthesizedPrintf_dut_printf_1_wire_enable_fired_0_read_data; // @[@ [Added during FAME5Transform]]
  wire  synthesizedPrintf_dut_printf_1_wire_enable_fired_0_write_data; // @[@ [Added during FAME5Transform] @ [Added during FAME5Transform] @ [Added during FAME5Transform] @ [Added during FAME5Transform]]
  wire  synthesizedPrintf_dut_printf_1_wire_enable_fired_0_write_addr; // @[@ [Added during FAME5Transform] @ [Added during FAME5Transform]]
  wire  synthesizedPrintf_dut_printf_1_wire_enable_fired_0_write_mask; // @[@ [Added during FAME5Transform] @ [Added during FAME5Transform]]
  wire  synthesizedPrintf_dut_printf_1_wire_enable_fired_0_write_en; // @[@ [Added during FAME5Transform] @ [Added during FAME5Transform] @ [Added during FAME5Transform] @ [Added during FAME5Transform]]
  reg  synthesizedPrintf_dut_printf_1_wire_args_1_fired_0 [0:0]; // @[@ [Added during FAME5Transform]]
  wire  synthesizedPrintf_dut_printf_1_wire_args_1_fired_0_read_en; // @[@ [Added during FAME5Transform] @ [Added during FAME5Transform]]
  wire  synthesizedPrintf_dut_printf_1_wire_args_1_fired_0_read_addr; // @[@ [Added during FAME5Transform] @ [Added during FAME5Transform]]
  wire  synthesizedPrintf_dut_printf_1_wire_args_1_fired_0_read_data; // @[@ [Added during FAME5Transform]]
  wire  synthesizedPrintf_dut_printf_1_wire_args_1_fired_0_write_data; // @[@ [Added during FAME5Transform] @ [Added during FAME5Transform] @ [Added during FAME5Transform] @ [Added during FAME5Transform]]
  wire  synthesizedPrintf_dut_printf_1_wire_args_1_fired_0_write_addr; // @[@ [Added during FAME5Transform] @ [Added during FAME5Transform]]
  wire  synthesizedPrintf_dut_printf_1_wire_args_1_fired_0_write_mask; // @[@ [Added during FAME5Transform] @ [Added during FAME5Transform]]
  wire  synthesizedPrintf_dut_printf_1_wire_args_1_fired_0_write_en; // @[@ [Added during FAME5Transform] @ [Added during FAME5Transform] @ [Added during FAME5Transform] @ [Added during FAME5Transform]]
  reg  synthesizedPrintf_dut_printf_wire_args_0_fired_0 [0:0]; // @[@ [Added during FAME5Transform]]
  wire  synthesizedPrintf_dut_printf_wire_args_0_fired_0_read_en; // @[@ [Added during FAME5Transform] @ [Added during FAME5Transform]]
  wire  synthesizedPrintf_dut_printf_wire_args_0_fired_0_read_addr; // @[@ [Added during FAME5Transform] @ [Added during FAME5Transform]]
  wire  synthesizedPrintf_dut_printf_wire_args_0_fired_0_read_data; // @[@ [Added during FAME5Transform]]
  wire  synthesizedPrintf_dut_printf_wire_args_0_fired_0_write_data; // @[@ [Added during FAME5Transform] @ [Added during FAME5Transform] @ [Added during FAME5Transform] @ [Added during FAME5Transform]]
  wire  synthesizedPrintf_dut_printf_wire_args_0_fired_0_write_addr; // @[@ [Added during FAME5Transform] @ [Added during FAME5Transform]]
  wire  synthesizedPrintf_dut_printf_wire_args_0_fired_0_write_mask; // @[@ [Added during FAME5Transform] @ [Added during FAME5Transform]]
  wire  synthesizedPrintf_dut_printf_wire_args_0_fired_0_write_en; // @[@ [Added during FAME5Transform] @ [Added during FAME5Transform] @ [Added during FAME5Transform] @ [Added during FAME5Transform]]
  reg  threadIdx; // @[@ [Added during FAME5Transform]]
  wire  _GEN_47 = synthesizedPrintf_dut_printf_1_wire_args_1_fired_0_read_data |
    synthesizedPrintf_dut_printf_1_wire_args_1_source_ready & synthesizedPrintf_dut_printf_1_wire_args_1_source_valid;
  wire  _GEN_49 = (synthesizedPrintf_dut_childInst_printf_wire_enable_fired_0_read_data |
    synthesizedPrintf_dut_childInst_printf_wire_enable_source_ready &
    synthesizedPrintf_dut_childInst_printf_wire_enable_source_valid) & (
    synthesizedPrintf_dut_printf_2_wire_args_1_fired_0_read_data |
    synthesizedPrintf_dut_printf_2_wire_args_1_source_ready & synthesizedPrintf_dut_printf_2_wire_args_1_source_valid)
     & (synthesizedPrintf_dut_printf_2_wire_enable_fired_0_read_data |
    synthesizedPrintf_dut_printf_2_wire_enable_source_ready & synthesizedPrintf_dut_printf_2_wire_enable_source_valid)
     & (synthesizedPrintf_dut_printf_2_wire_args_0_fired_0_read_data |
    synthesizedPrintf_dut_printf_2_wire_args_0_source_ready & synthesizedPrintf_dut_printf_2_wire_args_0_source_valid)
     & (synthesizedPrintf_dut_printf_wire_enable_fired_0_read_data |
    synthesizedPrintf_dut_printf_wire_enable_source_ready & synthesizedPrintf_dut_printf_wire_enable_source_valid) & (
    synthesizedPrintf_dut_childInst_printf_wire_args_1_fired_0_read_data |
    synthesizedPrintf_dut_childInst_printf_wire_args_1_source_ready &
    synthesizedPrintf_dut_childInst_printf_wire_args_1_source_valid) & (
    synthesizedPrintf_RationalClockBridge_clocks_0_globalReset_fired_0_read_data |
    synthesizedPrintf_RationalClockBridge_clocks_0_globalReset_source_ready &
    synthesizedPrintf_RationalClockBridge_clocks_0_globalReset_source_valid) & (
    synthesizedPrintf_dut_childInst_printf_wire_args_0_fired_0_read_data |
    synthesizedPrintf_dut_childInst_printf_wire_args_0_source_ready &
    synthesizedPrintf_dut_childInst_printf_wire_args_0_source_valid) & (
    synthesizedPrintf_dut_printf_1_wire_args_0_fired_0_read_data |
    synthesizedPrintf_dut_printf_1_wire_args_0_source_ready & synthesizedPrintf_dut_printf_1_wire_args_0_source_valid)
     & (synthesizedPrintf_dut_printf_1_wire_enable_fired_0_read_data |
    synthesizedPrintf_dut_printf_1_wire_enable_source_ready & synthesizedPrintf_dut_printf_1_wire_enable_source_valid)
     & _GEN_47;
  wire  targetCycleFinishing = _GEN_49 & (synthesizedPrintf_dut_printf_wire_args_0_fired_0_read_data |
    synthesizedPrintf_dut_printf_wire_args_0_source_ready & synthesizedPrintf_dut_printf_wire_args_0_source_valid) &
    peekPokeBridge_io_a_sink_valid & peekPokeBridge_reset_sink_valid & peekPokeBridge_io_b_sink_valid &
    RationalClockBridge_clocks_0_sink_valid;
  wire [1:0] _GEN_143 = ~threadIdx ? 2'h0 : threadIdx + 1'h1; // @[@ [Added during FAME5Transform]]
  BUFGCE RationalClockBridge_clocks_0_buffer (
    .I(RationalClockBridge_clocks_0_buffer_I),
    .CE(RationalClockBridge_clocks_0_buffer_CE),
    .O(RationalClockBridge_clocks_0_buffer_O)
  );
  PrintfModuleDUT_threaded dut ( // @[Util.scala 17:21]
    .clock(dut_clock),
    .reset(dut_reset),
    .io_a(dut_io_a),
    .hostClock(dut_hostClock)
  );
  assign RationalClockBridge_clocks_0_enabled_read_en = 1'h1; // @[@ [Added during FAME5Transform]]
  assign RationalClockBridge_clocks_0_enabled_read_addr = threadIdx; // @[@ [Added during FAME5Transform]]
  assign RationalClockBridge_clocks_0_enabled_read_data =
    RationalClockBridge_clocks_0_enabled[RationalClockBridge_clocks_0_enabled_read_addr]; // @[@ [Added during FAME5Transform]]
  assign RationalClockBridge_clocks_0_enabled_write_data = hostReset ? 1'h0 : targetCycleFinishing ?
    RationalClockBridge_clocks_0_sink_bits : RationalClockBridge_clocks_0_enabled_read_data; // @[@ [Added during FAME5Transform] @ [Added during FAME5Transform] @ [Added during FAME5Transform]]
  assign RationalClockBridge_clocks_0_enabled_write_addr = threadIdx; // @[@ [Added during FAME5Transform]]
  assign RationalClockBridge_clocks_0_enabled_write_mask = 1'h1; // @[@ [Added during FAME5Transform]]
  assign RationalClockBridge_clocks_0_enabled_write_en = 1'h1; // @[@ [Added during FAME5Transform] @ [Added during FAME5Transform] @ [Added during FAME5Transform]]
  assign synthesizedPrintf_dut_childInst_printf_wire_enable_fired_0_read_en = 1'h1; // @[@ [Added during FAME5Transform]]
  assign synthesizedPrintf_dut_childInst_printf_wire_enable_fired_0_read_addr = threadIdx; // @[@ [Added during FAME5Transform]]
  assign synthesizedPrintf_dut_childInst_printf_wire_enable_fired_0_read_data =
    synthesizedPrintf_dut_childInst_printf_wire_enable_fired_0[synthesizedPrintf_dut_childInst_printf_wire_enable_fired_0_read_addr]
    ; // @[@ [Added during FAME5Transform]]
  assign synthesizedPrintf_dut_childInst_printf_wire_enable_fired_0_write_data = hostReset ? 1'h0 : targetCycleFinishing
     ? ~RationalClockBridge_clocks_0_enabled_read_data :
    synthesizedPrintf_dut_childInst_printf_wire_enable_fired_0_read_data |
    synthesizedPrintf_dut_childInst_printf_wire_enable_source_ready &
    synthesizedPrintf_dut_childInst_printf_wire_enable_source_valid; // @[@ [Added during FAME5Transform] @ [Added during FAME5Transform] @ [Added during FAME5Transform]]
  assign synthesizedPrintf_dut_childInst_printf_wire_enable_fired_0_write_addr = threadIdx; // @[@ [Added during FAME5Transform]]
  assign synthesizedPrintf_dut_childInst_printf_wire_enable_fired_0_write_mask = 1'h1; // @[@ [Added during FAME5Transform]]
  assign synthesizedPrintf_dut_childInst_printf_wire_enable_fired_0_write_en = 1'h1; // @[@ [Added during FAME5Transform] @ [Added during FAME5Transform] @ [Added during FAME5Transform]]
  assign synthesizedPrintf_dut_printf_2_wire_args_1_fired_0_read_en = 1'h1; // @[@ [Added during FAME5Transform]]
  assign synthesizedPrintf_dut_printf_2_wire_args_1_fired_0_read_addr = threadIdx; // @[@ [Added during FAME5Transform]]
  assign synthesizedPrintf_dut_printf_2_wire_args_1_fired_0_read_data =
    synthesizedPrintf_dut_printf_2_wire_args_1_fired_0[synthesizedPrintf_dut_printf_2_wire_args_1_fired_0_read_addr]; // @[@ [Added during FAME5Transform]]
  assign synthesizedPrintf_dut_printf_2_wire_args_1_fired_0_write_data = hostReset ? 1'h0 : targetCycleFinishing ? ~
    RationalClockBridge_clocks_0_enabled_read_data : synthesizedPrintf_dut_printf_2_wire_args_1_fired_0_read_data |
    synthesizedPrintf_dut_printf_2_wire_args_1_source_ready & synthesizedPrintf_dut_printf_2_wire_args_1_source_valid; // @[@ [Added during FAME5Transform] @ [Added during FAME5Transform] @ [Added during FAME5Transform]]
  assign synthesizedPrintf_dut_printf_2_wire_args_1_fired_0_write_addr = threadIdx; // @[@ [Added during FAME5Transform]]
  assign synthesizedPrintf_dut_printf_2_wire_args_1_fired_0_write_mask = 1'h1; // @[@ [Added during FAME5Transform]]
  assign synthesizedPrintf_dut_printf_2_wire_args_1_fired_0_write_en = 1'h1; // @[@ [Added during FAME5Transform] @ [Added during FAME5Transform] @ [Added during FAME5Transform]]
  assign synthesizedPrintf_dut_printf_2_wire_enable_fired_0_read_en = 1'h1; // @[@ [Added during FAME5Transform]]
  assign synthesizedPrintf_dut_printf_2_wire_enable_fired_0_read_addr = threadIdx; // @[@ [Added during FAME5Transform]]
  assign synthesizedPrintf_dut_printf_2_wire_enable_fired_0_read_data =
    synthesizedPrintf_dut_printf_2_wire_enable_fired_0[synthesizedPrintf_dut_printf_2_wire_enable_fired_0_read_addr]; // @[@ [Added during FAME5Transform]]
  assign synthesizedPrintf_dut_printf_2_wire_enable_fired_0_write_data = hostReset ? 1'h0 : targetCycleFinishing ? ~
    RationalClockBridge_clocks_0_enabled_read_data : synthesizedPrintf_dut_printf_2_wire_enable_fired_0_read_data |
    synthesizedPrintf_dut_printf_2_wire_enable_source_ready & synthesizedPrintf_dut_printf_2_wire_enable_source_valid; // @[@ [Added during FAME5Transform] @ [Added during FAME5Transform] @ [Added during FAME5Transform]]
  assign synthesizedPrintf_dut_printf_2_wire_enable_fired_0_write_addr = threadIdx; // @[@ [Added during FAME5Transform]]
  assign synthesizedPrintf_dut_printf_2_wire_enable_fired_0_write_mask = 1'h1; // @[@ [Added during FAME5Transform]]
  assign synthesizedPrintf_dut_printf_2_wire_enable_fired_0_write_en = 1'h1; // @[@ [Added during FAME5Transform] @ [Added during FAME5Transform] @ [Added during FAME5Transform]]
  assign synthesizedPrintf_dut_printf_2_wire_args_0_fired_0_read_en = 1'h1; // @[@ [Added during FAME5Transform]]
  assign synthesizedPrintf_dut_printf_2_wire_args_0_fired_0_read_addr = threadIdx; // @[@ [Added during FAME5Transform]]
  assign synthesizedPrintf_dut_printf_2_wire_args_0_fired_0_read_data =
    synthesizedPrintf_dut_printf_2_wire_args_0_fired_0[synthesizedPrintf_dut_printf_2_wire_args_0_fired_0_read_addr]; // @[@ [Added during FAME5Transform]]
  assign synthesizedPrintf_dut_printf_2_wire_args_0_fired_0_write_data = hostReset ? 1'h0 : targetCycleFinishing ? ~
    RationalClockBridge_clocks_0_enabled_read_data : synthesizedPrintf_dut_printf_2_wire_args_0_fired_0_read_data |
    synthesizedPrintf_dut_printf_2_wire_args_0_source_ready & synthesizedPrintf_dut_printf_2_wire_args_0_source_valid; // @[@ [Added during FAME5Transform] @ [Added during FAME5Transform] @ [Added during FAME5Transform]]
  assign synthesizedPrintf_dut_printf_2_wire_args_0_fired_0_write_addr = threadIdx; // @[@ [Added during FAME5Transform]]
  assign synthesizedPrintf_dut_printf_2_wire_args_0_fired_0_write_mask = 1'h1; // @[@ [Added during FAME5Transform]]
  assign synthesizedPrintf_dut_printf_2_wire_args_0_fired_0_write_en = 1'h1; // @[@ [Added during FAME5Transform] @ [Added during FAME5Transform] @ [Added during FAME5Transform]]
  assign synthesizedPrintf_dut_printf_wire_enable_fired_0_read_en = 1'h1; // @[@ [Added during FAME5Transform]]
  assign synthesizedPrintf_dut_printf_wire_enable_fired_0_read_addr = threadIdx; // @[@ [Added during FAME5Transform]]
  assign synthesizedPrintf_dut_printf_wire_enable_fired_0_read_data =
    synthesizedPrintf_dut_printf_wire_enable_fired_0[synthesizedPrintf_dut_printf_wire_enable_fired_0_read_addr]; // @[@ [Added during FAME5Transform]]
  assign synthesizedPrintf_dut_printf_wire_enable_fired_0_write_data = hostReset ? 1'h0 : targetCycleFinishing ? ~
    RationalClockBridge_clocks_0_enabled_read_data : synthesizedPrintf_dut_printf_wire_enable_fired_0_read_data |
    synthesizedPrintf_dut_printf_wire_enable_source_ready & synthesizedPrintf_dut_printf_wire_enable_source_valid; // @[@ [Added during FAME5Transform] @ [Added during FAME5Transform] @ [Added during FAME5Transform]]
  assign synthesizedPrintf_dut_printf_wire_enable_fired_0_write_addr = threadIdx; // @[@ [Added during FAME5Transform]]
  assign synthesizedPrintf_dut_printf_wire_enable_fired_0_write_mask = 1'h1; // @[@ [Added during FAME5Transform]]
  assign synthesizedPrintf_dut_printf_wire_enable_fired_0_write_en = 1'h1; // @[@ [Added during FAME5Transform] @ [Added during FAME5Transform] @ [Added during FAME5Transform]]
  assign synthesizedPrintf_dut_childInst_printf_wire_args_1_fired_0_read_en = 1'h1; // @[@ [Added during FAME5Transform]]
  assign synthesizedPrintf_dut_childInst_printf_wire_args_1_fired_0_read_addr = threadIdx; // @[@ [Added during FAME5Transform]]
  assign synthesizedPrintf_dut_childInst_printf_wire_args_1_fired_0_read_data =
    synthesizedPrintf_dut_childInst_printf_wire_args_1_fired_0[synthesizedPrintf_dut_childInst_printf_wire_args_1_fired_0_read_addr]
    ; // @[@ [Added during FAME5Transform]]
  assign synthesizedPrintf_dut_childInst_printf_wire_args_1_fired_0_write_data = hostReset ? 1'h0 : targetCycleFinishing
     ? ~RationalClockBridge_clocks_0_enabled_read_data :
    synthesizedPrintf_dut_childInst_printf_wire_args_1_fired_0_read_data |
    synthesizedPrintf_dut_childInst_printf_wire_args_1_source_ready &
    synthesizedPrintf_dut_childInst_printf_wire_args_1_source_valid; // @[@ [Added during FAME5Transform] @ [Added during FAME5Transform] @ [Added during FAME5Transform]]
  assign synthesizedPrintf_dut_childInst_printf_wire_args_1_fired_0_write_addr = threadIdx; // @[@ [Added during FAME5Transform]]
  assign synthesizedPrintf_dut_childInst_printf_wire_args_1_fired_0_write_mask = 1'h1; // @[@ [Added during FAME5Transform]]
  assign synthesizedPrintf_dut_childInst_printf_wire_args_1_fired_0_write_en = 1'h1; // @[@ [Added during FAME5Transform] @ [Added during FAME5Transform] @ [Added during FAME5Transform]]
  assign synthesizedPrintf_RationalClockBridge_clocks_0_globalReset_fired_0_read_en = 1'h1; // @[@ [Added during FAME5Transform]]
  assign synthesizedPrintf_RationalClockBridge_clocks_0_globalReset_fired_0_read_addr = threadIdx; // @[@ [Added during FAME5Transform]]
  assign synthesizedPrintf_RationalClockBridge_clocks_0_globalReset_fired_0_read_data =
    synthesizedPrintf_RationalClockBridge_clocks_0_globalReset_fired_0[synthesizedPrintf_RationalClockBridge_clocks_0_globalReset_fired_0_read_addr]
    ; // @[@ [Added during FAME5Transform]]
  assign synthesizedPrintf_RationalClockBridge_clocks_0_globalReset_fired_0_write_data = hostReset ? 1'h0 :
    targetCycleFinishing ? ~RationalClockBridge_clocks_0_enabled_read_data :
    synthesizedPrintf_RationalClockBridge_clocks_0_globalReset_fired_0_read_data |
    synthesizedPrintf_RationalClockBridge_clocks_0_globalReset_source_ready &
    synthesizedPrintf_RationalClockBridge_clocks_0_globalReset_source_valid; // @[@ [Added during FAME5Transform] @ [Added during FAME5Transform] @ [Added during FAME5Transform]]
  assign synthesizedPrintf_RationalClockBridge_clocks_0_globalReset_fired_0_write_addr = threadIdx; // @[@ [Added during FAME5Transform]]
  assign synthesizedPrintf_RationalClockBridge_clocks_0_globalReset_fired_0_write_mask = 1'h1; // @[@ [Added during FAME5Transform]]
  assign synthesizedPrintf_RationalClockBridge_clocks_0_globalReset_fired_0_write_en = 1'h1; // @[@ [Added during FAME5Transform] @ [Added during FAME5Transform] @ [Added during FAME5Transform]]
  assign synthesizedPrintf_dut_childInst_printf_wire_args_0_fired_0_read_en = 1'h1; // @[@ [Added during FAME5Transform]]
  assign synthesizedPrintf_dut_childInst_printf_wire_args_0_fired_0_read_addr = threadIdx; // @[@ [Added during FAME5Transform]]
  assign synthesizedPrintf_dut_childInst_printf_wire_args_0_fired_0_read_data =
    synthesizedPrintf_dut_childInst_printf_wire_args_0_fired_0[synthesizedPrintf_dut_childInst_printf_wire_args_0_fired_0_read_addr]
    ; // @[@ [Added during FAME5Transform]]
  assign synthesizedPrintf_dut_childInst_printf_wire_args_0_fired_0_write_data = hostReset ? 1'h0 : targetCycleFinishing
     ? ~RationalClockBridge_clocks_0_enabled_read_data :
    synthesizedPrintf_dut_childInst_printf_wire_args_0_fired_0_read_data |
    synthesizedPrintf_dut_childInst_printf_wire_args_0_source_ready &
    synthesizedPrintf_dut_childInst_printf_wire_args_0_source_valid; // @[@ [Added during FAME5Transform] @ [Added during FAME5Transform] @ [Added during FAME5Transform]]
  assign synthesizedPrintf_dut_childInst_printf_wire_args_0_fired_0_write_addr = threadIdx; // @[@ [Added during FAME5Transform]]
  assign synthesizedPrintf_dut_childInst_printf_wire_args_0_fired_0_write_mask = 1'h1; // @[@ [Added during FAME5Transform]]
  assign synthesizedPrintf_dut_childInst_printf_wire_args_0_fired_0_write_en = 1'h1; // @[@ [Added during FAME5Transform] @ [Added during FAME5Transform] @ [Added during FAME5Transform]]
  assign synthesizedPrintf_dut_printf_1_wire_args_0_fired_0_read_en = 1'h1; // @[@ [Added during FAME5Transform]]
  assign synthesizedPrintf_dut_printf_1_wire_args_0_fired_0_read_addr = threadIdx; // @[@ [Added during FAME5Transform]]
  assign synthesizedPrintf_dut_printf_1_wire_args_0_fired_0_read_data =
    synthesizedPrintf_dut_printf_1_wire_args_0_fired_0[synthesizedPrintf_dut_printf_1_wire_args_0_fired_0_read_addr]; // @[@ [Added during FAME5Transform]]
  assign synthesizedPrintf_dut_printf_1_wire_args_0_fired_0_write_data = hostReset ? 1'h0 : targetCycleFinishing ? ~
    RationalClockBridge_clocks_0_enabled_read_data : synthesizedPrintf_dut_printf_1_wire_args_0_fired_0_read_data |
    synthesizedPrintf_dut_printf_1_wire_args_0_source_ready & synthesizedPrintf_dut_printf_1_wire_args_0_source_valid; // @[@ [Added during FAME5Transform] @ [Added during FAME5Transform] @ [Added during FAME5Transform]]
  assign synthesizedPrintf_dut_printf_1_wire_args_0_fired_0_write_addr = threadIdx; // @[@ [Added during FAME5Transform]]
  assign synthesizedPrintf_dut_printf_1_wire_args_0_fired_0_write_mask = 1'h1; // @[@ [Added during FAME5Transform]]
  assign synthesizedPrintf_dut_printf_1_wire_args_0_fired_0_write_en = 1'h1; // @[@ [Added during FAME5Transform] @ [Added during FAME5Transform] @ [Added during FAME5Transform]]
  assign synthesizedPrintf_dut_printf_1_wire_enable_fired_0_read_en = 1'h1; // @[@ [Added during FAME5Transform]]
  assign synthesizedPrintf_dut_printf_1_wire_enable_fired_0_read_addr = threadIdx; // @[@ [Added during FAME5Transform]]
  assign synthesizedPrintf_dut_printf_1_wire_enable_fired_0_read_data =
    synthesizedPrintf_dut_printf_1_wire_enable_fired_0[synthesizedPrintf_dut_printf_1_wire_enable_fired_0_read_addr]; // @[@ [Added during FAME5Transform]]
  assign synthesizedPrintf_dut_printf_1_wire_enable_fired_0_write_data = hostReset ? 1'h0 : targetCycleFinishing ? ~
    RationalClockBridge_clocks_0_enabled_read_data : synthesizedPrintf_dut_printf_1_wire_enable_fired_0_read_data |
    synthesizedPrintf_dut_printf_1_wire_enable_source_ready & synthesizedPrintf_dut_printf_1_wire_enable_source_valid; // @[@ [Added during FAME5Transform] @ [Added during FAME5Transform] @ [Added during FAME5Transform]]
  assign synthesizedPrintf_dut_printf_1_wire_enable_fired_0_write_addr = threadIdx; // @[@ [Added during FAME5Transform]]
  assign synthesizedPrintf_dut_printf_1_wire_enable_fired_0_write_mask = 1'h1; // @[@ [Added during FAME5Transform]]
  assign synthesizedPrintf_dut_printf_1_wire_enable_fired_0_write_en = 1'h1; // @[@ [Added during FAME5Transform] @ [Added during FAME5Transform] @ [Added during FAME5Transform]]
  assign synthesizedPrintf_dut_printf_1_wire_args_1_fired_0_read_en = 1'h1; // @[@ [Added during FAME5Transform]]
  assign synthesizedPrintf_dut_printf_1_wire_args_1_fired_0_read_addr = threadIdx; // @[@ [Added during FAME5Transform]]
  assign synthesizedPrintf_dut_printf_1_wire_args_1_fired_0_read_data =
    synthesizedPrintf_dut_printf_1_wire_args_1_fired_0[synthesizedPrintf_dut_printf_1_wire_args_1_fired_0_read_addr]; // @[@ [Added during FAME5Transform]]
  assign synthesizedPrintf_dut_printf_1_wire_args_1_fired_0_write_data = hostReset ? 1'h0 : targetCycleFinishing ? ~
    RationalClockBridge_clocks_0_enabled_read_data : synthesizedPrintf_dut_printf_1_wire_args_1_fired_0_read_data |
    synthesizedPrintf_dut_printf_1_wire_args_1_source_ready & synthesizedPrintf_dut_printf_1_wire_args_1_source_valid; // @[@ [Added during FAME5Transform] @ [Added during FAME5Transform] @ [Added during FAME5Transform]]
  assign synthesizedPrintf_dut_printf_1_wire_args_1_fired_0_write_addr = threadIdx; // @[@ [Added during FAME5Transform]]
  assign synthesizedPrintf_dut_printf_1_wire_args_1_fired_0_write_mask = 1'h1; // @[@ [Added during FAME5Transform]]
  assign synthesizedPrintf_dut_printf_1_wire_args_1_fired_0_write_en = 1'h1; // @[@ [Added during FAME5Transform] @ [Added during FAME5Transform] @ [Added during FAME5Transform]]
  assign synthesizedPrintf_dut_printf_wire_args_0_fired_0_read_en = 1'h1; // @[@ [Added during FAME5Transform]]
  assign synthesizedPrintf_dut_printf_wire_args_0_fired_0_read_addr = threadIdx; // @[@ [Added during FAME5Transform]]
  assign synthesizedPrintf_dut_printf_wire_args_0_fired_0_read_data =
    synthesizedPrintf_dut_printf_wire_args_0_fired_0[synthesizedPrintf_dut_printf_wire_args_0_fired_0_read_addr]; // @[@ [Added during FAME5Transform]]
  assign synthesizedPrintf_dut_printf_wire_args_0_fired_0_write_data = hostReset ? 1'h0 : targetCycleFinishing ? ~
    RationalClockBridge_clocks_0_enabled_read_data : synthesizedPrintf_dut_printf_wire_args_0_fired_0_read_data |
    synthesizedPrintf_dut_printf_wire_args_0_source_ready & synthesizedPrintf_dut_printf_wire_args_0_source_valid; // @[@ [Added during FAME5Transform] @ [Added during FAME5Transform] @ [Added during FAME5Transform]]
  assign synthesizedPrintf_dut_printf_wire_args_0_fired_0_write_addr = threadIdx; // @[@ [Added during FAME5Transform]]
  assign synthesizedPrintf_dut_printf_wire_args_0_fired_0_write_mask = 1'h1; // @[@ [Added during FAME5Transform]]
  assign synthesizedPrintf_dut_printf_wire_args_0_fired_0_write_en = 1'h1; // @[@ [Added during FAME5Transform] @ [Added during FAME5Transform] @ [Added during FAME5Transform]]
  assign synthesizedPrintf_dut_childInst_printf_wire_enable_source_valid = peekPokeBridge_reset_sink_valid & ~
    synthesizedPrintf_dut_childInst_printf_wire_enable_fired_0_read_data;
  assign synthesizedPrintf_dut_printf_2_wire_args_1_source_valid = ~
    synthesizedPrintf_dut_printf_2_wire_args_1_fired_0_read_data;
  assign synthesizedPrintf_dut_printf_2_wire_enable_source_valid = peekPokeBridge_reset_sink_valid & ~
    synthesizedPrintf_dut_printf_2_wire_enable_fired_0_read_data;
  assign synthesizedPrintf_dut_printf_2_wire_args_0_source_valid = ~
    synthesizedPrintf_dut_printf_2_wire_args_0_fired_0_read_data;
  assign synthesizedPrintf_dut_printf_wire_enable_source_valid = peekPokeBridge_reset_sink_valid & ~
    synthesizedPrintf_dut_printf_wire_enable_fired_0_read_data;
  assign synthesizedPrintf_dut_childInst_printf_wire_args_1_source_valid = ~
    synthesizedPrintf_dut_childInst_printf_wire_args_1_fired_0_read_data;
  assign synthesizedPrintf_RationalClockBridge_clocks_0_globalReset_source_valid = ~
    synthesizedPrintf_RationalClockBridge_clocks_0_globalReset_fired_0_read_data;
  assign synthesizedPrintf_dut_childInst_printf_wire_args_0_source_valid = ~
    synthesizedPrintf_dut_childInst_printf_wire_args_0_fired_0_read_data;
  assign synthesizedPrintf_dut_printf_1_wire_args_0_source_valid = ~
    synthesizedPrintf_dut_printf_1_wire_args_0_fired_0_read_data;
  assign synthesizedPrintf_dut_printf_1_wire_enable_source_valid = peekPokeBridge_reset_sink_valid & ~
    synthesizedPrintf_dut_printf_1_wire_enable_fired_0_read_data;
  assign synthesizedPrintf_dut_printf_1_wire_args_1_source_valid = ~
    synthesizedPrintf_dut_printf_1_wire_args_1_fired_0_read_data;
  assign synthesizedPrintf_dut_printf_wire_args_0_source_valid = ~
    synthesizedPrintf_dut_printf_wire_args_0_fired_0_read_data;
  assign RationalClockBridge_clocks_0_buffer_I = hostClock;
  assign RationalClockBridge_clocks_0_buffer_CE = RationalClockBridge_clocks_0_enabled_read_data & targetCycleFinishing
     & ~hostReset;
  assign dut_clock = RationalClockBridge_clocks_0_buffer_O;
  assign dut_reset = peekPokeBridge_reset_sink_bits; // @[PeekPokeIO.scala 228:32 231:58]
  assign dut_io_a = peekPokeBridge_io_a_sink_bits; // @[PeekPokeIO.scala 231:58]
  assign dut_hostClock = hostClock; // @[@ [Added during FAME5Transform]]
  always @(posedge hostClock) begin
    if (RationalClockBridge_clocks_0_enabled_write_en & RationalClockBridge_clocks_0_enabled_write_mask) begin
      RationalClockBridge_clocks_0_enabled[RationalClockBridge_clocks_0_enabled_write_addr] <=
        RationalClockBridge_clocks_0_enabled_write_data; // @[@ [Added during FAME5Transform]]
    end
    if (synthesizedPrintf_dut_childInst_printf_wire_enable_fired_0_write_en &
      synthesizedPrintf_dut_childInst_printf_wire_enable_fired_0_write_mask) begin

        synthesizedPrintf_dut_childInst_printf_wire_enable_fired_0[synthesizedPrintf_dut_childInst_printf_wire_enable_fired_0_write_addr]
         <= synthesizedPrintf_dut_childInst_printf_wire_enable_fired_0_write_data; // @[@ [Added during FAME5Transform]]
    end
    if (synthesizedPrintf_dut_printf_2_wire_args_1_fired_0_write_en &
      synthesizedPrintf_dut_printf_2_wire_args_1_fired_0_write_mask) begin
      synthesizedPrintf_dut_printf_2_wire_args_1_fired_0[synthesizedPrintf_dut_printf_2_wire_args_1_fired_0_write_addr]
         <= synthesizedPrintf_dut_printf_2_wire_args_1_fired_0_write_data; // @[@ [Added during FAME5Transform]]
    end
    if (synthesizedPrintf_dut_printf_2_wire_enable_fired_0_write_en &
      synthesizedPrintf_dut_printf_2_wire_enable_fired_0_write_mask) begin
      synthesizedPrintf_dut_printf_2_wire_enable_fired_0[synthesizedPrintf_dut_printf_2_wire_enable_fired_0_write_addr]
         <= synthesizedPrintf_dut_printf_2_wire_enable_fired_0_write_data; // @[@ [Added during FAME5Transform]]
    end
    if (synthesizedPrintf_dut_printf_2_wire_args_0_fired_0_write_en &
      synthesizedPrintf_dut_printf_2_wire_args_0_fired_0_write_mask) begin
      synthesizedPrintf_dut_printf_2_wire_args_0_fired_0[synthesizedPrintf_dut_printf_2_wire_args_0_fired_0_write_addr]
         <= synthesizedPrintf_dut_printf_2_wire_args_0_fired_0_write_data; // @[@ [Added during FAME5Transform]]
    end
    if (synthesizedPrintf_dut_printf_wire_enable_fired_0_write_en &
      synthesizedPrintf_dut_printf_wire_enable_fired_0_write_mask) begin
      synthesizedPrintf_dut_printf_wire_enable_fired_0[synthesizedPrintf_dut_printf_wire_enable_fired_0_write_addr] <=
        synthesizedPrintf_dut_printf_wire_enable_fired_0_write_data; // @[@ [Added during FAME5Transform]]
    end
    if (synthesizedPrintf_dut_childInst_printf_wire_args_1_fired_0_write_en &
      synthesizedPrintf_dut_childInst_printf_wire_args_1_fired_0_write_mask) begin

        synthesizedPrintf_dut_childInst_printf_wire_args_1_fired_0[synthesizedPrintf_dut_childInst_printf_wire_args_1_fired_0_write_addr]
         <= synthesizedPrintf_dut_childInst_printf_wire_args_1_fired_0_write_data; // @[@ [Added during FAME5Transform]]
    end
    if (synthesizedPrintf_RationalClockBridge_clocks_0_globalReset_fired_0_write_en &
      synthesizedPrintf_RationalClockBridge_clocks_0_globalReset_fired_0_write_mask) begin

        synthesizedPrintf_RationalClockBridge_clocks_0_globalReset_fired_0[synthesizedPrintf_RationalClockBridge_clocks_0_globalReset_fired_0_write_addr]
         <= synthesizedPrintf_RationalClockBridge_clocks_0_globalReset_fired_0_write_data; // @[@ [Added during FAME5Transform]]
    end
    if (synthesizedPrintf_dut_childInst_printf_wire_args_0_fired_0_write_en &
      synthesizedPrintf_dut_childInst_printf_wire_args_0_fired_0_write_mask) begin

        synthesizedPrintf_dut_childInst_printf_wire_args_0_fired_0[synthesizedPrintf_dut_childInst_printf_wire_args_0_fired_0_write_addr]
         <= synthesizedPrintf_dut_childInst_printf_wire_args_0_fired_0_write_data; // @[@ [Added during FAME5Transform]]
    end
    if (synthesizedPrintf_dut_printf_1_wire_args_0_fired_0_write_en &
      synthesizedPrintf_dut_printf_1_wire_args_0_fired_0_write_mask) begin
      synthesizedPrintf_dut_printf_1_wire_args_0_fired_0[synthesizedPrintf_dut_printf_1_wire_args_0_fired_0_write_addr]
         <= synthesizedPrintf_dut_printf_1_wire_args_0_fired_0_write_data; // @[@ [Added during FAME5Transform]]
    end
    if (synthesizedPrintf_dut_printf_1_wire_enable_fired_0_write_en &
      synthesizedPrintf_dut_printf_1_wire_enable_fired_0_write_mask) begin
      synthesizedPrintf_dut_printf_1_wire_enable_fired_0[synthesizedPrintf_dut_printf_1_wire_enable_fired_0_write_addr]
         <= synthesizedPrintf_dut_printf_1_wire_enable_fired_0_write_data; // @[@ [Added during FAME5Transform]]
    end
    if (synthesizedPrintf_dut_printf_1_wire_args_1_fired_0_write_en &
      synthesizedPrintf_dut_printf_1_wire_args_1_fired_0_write_mask) begin
      synthesizedPrintf_dut_printf_1_wire_args_1_fired_0[synthesizedPrintf_dut_printf_1_wire_args_1_fired_0_write_addr]
         <= synthesizedPrintf_dut_printf_1_wire_args_1_fired_0_write_data; // @[@ [Added during FAME5Transform]]
    end
    if (synthesizedPrintf_dut_printf_wire_args_0_fired_0_write_en &
      synthesizedPrintf_dut_printf_wire_args_0_fired_0_write_mask) begin
      synthesizedPrintf_dut_printf_wire_args_0_fired_0[synthesizedPrintf_dut_printf_wire_args_0_fired_0_write_addr] <=
        synthesizedPrintf_dut_printf_wire_args_0_fired_0_write_data; // @[@ [Added during FAME5Transform]]
    end
    threadIdx <= _GEN_143[0]; // @[@ [Added during FAME5Transform]]
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_MEM_INIT
  _RAND_0 = {1{`RANDOM}};
  for (initvar = 0; initvar < 1; initvar = initvar+1)
    RationalClockBridge_clocks_0_enabled[initvar] = _RAND_0[0:0];
  _RAND_1 = {1{`RANDOM}};
  for (initvar = 0; initvar < 1; initvar = initvar+1)
    synthesizedPrintf_dut_childInst_printf_wire_enable_fired_0[initvar] = _RAND_1[0:0];
  _RAND_2 = {1{`RANDOM}};
  for (initvar = 0; initvar < 1; initvar = initvar+1)
    synthesizedPrintf_dut_printf_2_wire_args_1_fired_0[initvar] = _RAND_2[0:0];
  _RAND_3 = {1{`RANDOM}};
  for (initvar = 0; initvar < 1; initvar = initvar+1)
    synthesizedPrintf_dut_printf_2_wire_enable_fired_0[initvar] = _RAND_3[0:0];
  _RAND_4 = {1{`RANDOM}};
  for (initvar = 0; initvar < 1; initvar = initvar+1)
    synthesizedPrintf_dut_printf_2_wire_args_0_fired_0[initvar] = _RAND_4[0:0];
  _RAND_5 = {1{`RANDOM}};
  for (initvar = 0; initvar < 1; initvar = initvar+1)
    synthesizedPrintf_dut_printf_wire_enable_fired_0[initvar] = _RAND_5[0:0];
  _RAND_6 = {1{`RANDOM}};
  for (initvar = 0; initvar < 1; initvar = initvar+1)
    synthesizedPrintf_dut_childInst_printf_wire_args_1_fired_0[initvar] = _RAND_6[0:0];
  _RAND_7 = {1{`RANDOM}};
  for (initvar = 0; initvar < 1; initvar = initvar+1)
    synthesizedPrintf_RationalClockBridge_clocks_0_globalReset_fired_0[initvar] = _RAND_7[0:0];
  _RAND_8 = {1{`RANDOM}};
  for (initvar = 0; initvar < 1; initvar = initvar+1)
    synthesizedPrintf_dut_childInst_printf_wire_args_0_fired_0[initvar] = _RAND_8[0:0];
  _RAND_9 = {1{`RANDOM}};
  for (initvar = 0; initvar < 1; initvar = initvar+1)
    synthesizedPrintf_dut_printf_1_wire_args_0_fired_0[initvar] = _RAND_9[0:0];
  _RAND_10 = {1{`RANDOM}};
  for (initvar = 0; initvar < 1; initvar = initvar+1)
    synthesizedPrintf_dut_printf_1_wire_enable_fired_0[initvar] = _RAND_10[0:0];
  _RAND_11 = {1{`RANDOM}};
  for (initvar = 0; initvar < 1; initvar = initvar+1)
    synthesizedPrintf_dut_printf_1_wire_args_1_fired_0[initvar] = _RAND_11[0:0];
  _RAND_12 = {1{`RANDOM}};
  for (initvar = 0; initvar < 1; initvar = initvar+1)
    synthesizedPrintf_dut_printf_wire_args_0_fired_0[initvar] = _RAND_12[0:0];
`endif // RANDOMIZE_MEM_INIT
`ifdef RANDOMIZE_REG_INIT
  _RAND_13 = {1{`RANDOM}};
  threadIdx = _RAND_13[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module MaxPeriodFibonacciLFSR(
  input   clock,
  input   reset,
  input   io_increment,
  output  io_out_0,
  output  io_out_1,
  output  io_out_2,
  output  io_out_3,
  output  io_out_4,
  output  io_out_5,
  output  io_out_6,
  output  io_out_7,
  output  io_out_8,
  output  io_out_9,
  output  io_out_10,
  output  io_out_11,
  output  io_out_12,
  output  io_out_13,
  output  io_out_14,
  output  io_out_15
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
  reg [31:0] _RAND_5;
  reg [31:0] _RAND_6;
  reg [31:0] _RAND_7;
  reg [31:0] _RAND_8;
  reg [31:0] _RAND_9;
  reg [31:0] _RAND_10;
  reg [31:0] _RAND_11;
  reg [31:0] _RAND_12;
  reg [31:0] _RAND_13;
  reg [31:0] _RAND_14;
  reg [31:0] _RAND_15;
`endif // RANDOMIZE_REG_INIT
  reg  state_0; // @[PRNG.scala 55:49]
  reg  state_1; // @[PRNG.scala 55:49]
  reg  state_2; // @[PRNG.scala 55:49]
  reg  state_3; // @[PRNG.scala 55:49]
  reg  state_4; // @[PRNG.scala 55:49]
  reg  state_5; // @[PRNG.scala 55:49]
  reg  state_6; // @[PRNG.scala 55:49]
  reg  state_7; // @[PRNG.scala 55:49]
  reg  state_8; // @[PRNG.scala 55:49]
  reg  state_9; // @[PRNG.scala 55:49]
  reg  state_10; // @[PRNG.scala 55:49]
  reg  state_11; // @[PRNG.scala 55:49]
  reg  state_12; // @[PRNG.scala 55:49]
  reg  state_13; // @[PRNG.scala 55:49]
  reg  state_14; // @[PRNG.scala 55:49]
  reg  state_15; // @[PRNG.scala 55:49]
  wire  _T_2 = state_15 ^ state_13 ^ state_12 ^ state_10; // @[LFSR.scala 15:41]
  wire  _GEN_0 = io_increment ? _T_2 : state_0; // @[PRNG.scala 69:22 70:11 55:49]
  assign io_out_0 = state_0; // @[PRNG.scala 78:10]
  assign io_out_1 = state_1; // @[PRNG.scala 78:10]
  assign io_out_2 = state_2; // @[PRNG.scala 78:10]
  assign io_out_3 = state_3; // @[PRNG.scala 78:10]
  assign io_out_4 = state_4; // @[PRNG.scala 78:10]
  assign io_out_5 = state_5; // @[PRNG.scala 78:10]
  assign io_out_6 = state_6; // @[PRNG.scala 78:10]
  assign io_out_7 = state_7; // @[PRNG.scala 78:10]
  assign io_out_8 = state_8; // @[PRNG.scala 78:10]
  assign io_out_9 = state_9; // @[PRNG.scala 78:10]
  assign io_out_10 = state_10; // @[PRNG.scala 78:10]
  assign io_out_11 = state_11; // @[PRNG.scala 78:10]
  assign io_out_12 = state_12; // @[PRNG.scala 78:10]
  assign io_out_13 = state_13; // @[PRNG.scala 78:10]
  assign io_out_14 = state_14; // @[PRNG.scala 78:10]
  assign io_out_15 = state_15; // @[PRNG.scala 78:10]
  always @(posedge clock) begin
    state_0 <= reset | _GEN_0; // @[PRNG.scala 55:{49,49}]
    if (reset) begin // @[PRNG.scala 55:49]
      state_1 <= 1'h0; // @[PRNG.scala 55:49]
    end else if (io_increment) begin // @[PRNG.scala 69:22]
      state_1 <= state_0; // @[PRNG.scala 70:11]
    end
    if (reset) begin // @[PRNG.scala 55:49]
      state_2 <= 1'h0; // @[PRNG.scala 55:49]
    end else if (io_increment) begin // @[PRNG.scala 69:22]
      state_2 <= state_1; // @[PRNG.scala 70:11]
    end
    if (reset) begin // @[PRNG.scala 55:49]
      state_3 <= 1'h0; // @[PRNG.scala 55:49]
    end else if (io_increment) begin // @[PRNG.scala 69:22]
      state_3 <= state_2; // @[PRNG.scala 70:11]
    end
    if (reset) begin // @[PRNG.scala 55:49]
      state_4 <= 1'h0; // @[PRNG.scala 55:49]
    end else if (io_increment) begin // @[PRNG.scala 69:22]
      state_4 <= state_3; // @[PRNG.scala 70:11]
    end
    if (reset) begin // @[PRNG.scala 55:49]
      state_5 <= 1'h0; // @[PRNG.scala 55:49]
    end else if (io_increment) begin // @[PRNG.scala 69:22]
      state_5 <= state_4; // @[PRNG.scala 70:11]
    end
    if (reset) begin // @[PRNG.scala 55:49]
      state_6 <= 1'h0; // @[PRNG.scala 55:49]
    end else if (io_increment) begin // @[PRNG.scala 69:22]
      state_6 <= state_5; // @[PRNG.scala 70:11]
    end
    if (reset) begin // @[PRNG.scala 55:49]
      state_7 <= 1'h0; // @[PRNG.scala 55:49]
    end else if (io_increment) begin // @[PRNG.scala 69:22]
      state_7 <= state_6; // @[PRNG.scala 70:11]
    end
    if (reset) begin // @[PRNG.scala 55:49]
      state_8 <= 1'h0; // @[PRNG.scala 55:49]
    end else if (io_increment) begin // @[PRNG.scala 69:22]
      state_8 <= state_7; // @[PRNG.scala 70:11]
    end
    if (reset) begin // @[PRNG.scala 55:49]
      state_9 <= 1'h0; // @[PRNG.scala 55:49]
    end else if (io_increment) begin // @[PRNG.scala 69:22]
      state_9 <= state_8; // @[PRNG.scala 70:11]
    end
    if (reset) begin // @[PRNG.scala 55:49]
      state_10 <= 1'h0; // @[PRNG.scala 55:49]
    end else if (io_increment) begin // @[PRNG.scala 69:22]
      state_10 <= state_9; // @[PRNG.scala 70:11]
    end
    if (reset) begin // @[PRNG.scala 55:49]
      state_11 <= 1'h0; // @[PRNG.scala 55:49]
    end else if (io_increment) begin // @[PRNG.scala 69:22]
      state_11 <= state_10; // @[PRNG.scala 70:11]
    end
    if (reset) begin // @[PRNG.scala 55:49]
      state_12 <= 1'h0; // @[PRNG.scala 55:49]
    end else if (io_increment) begin // @[PRNG.scala 69:22]
      state_12 <= state_11; // @[PRNG.scala 70:11]
    end
    if (reset) begin // @[PRNG.scala 55:49]
      state_13 <= 1'h0; // @[PRNG.scala 55:49]
    end else if (io_increment) begin // @[PRNG.scala 69:22]
      state_13 <= state_12; // @[PRNG.scala 70:11]
    end
    if (reset) begin // @[PRNG.scala 55:49]
      state_14 <= 1'h0; // @[PRNG.scala 55:49]
    end else if (io_increment) begin // @[PRNG.scala 69:22]
      state_14 <= state_13; // @[PRNG.scala 70:11]
    end
    if (reset) begin // @[PRNG.scala 55:49]
      state_15 <= 1'h0; // @[PRNG.scala 55:49]
    end else if (io_increment) begin // @[PRNG.scala 69:22]
      state_15 <= state_14; // @[PRNG.scala 70:11]
    end
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  state_0 = _RAND_0[0:0];
  _RAND_1 = {1{`RANDOM}};
  state_1 = _RAND_1[0:0];
  _RAND_2 = {1{`RANDOM}};
  state_2 = _RAND_2[0:0];
  _RAND_3 = {1{`RANDOM}};
  state_3 = _RAND_3[0:0];
  _RAND_4 = {1{`RANDOM}};
  state_4 = _RAND_4[0:0];
  _RAND_5 = {1{`RANDOM}};
  state_5 = _RAND_5[0:0];
  _RAND_6 = {1{`RANDOM}};
  state_6 = _RAND_6[0:0];
  _RAND_7 = {1{`RANDOM}};
  state_7 = _RAND_7[0:0];
  _RAND_8 = {1{`RANDOM}};
  state_8 = _RAND_8[0:0];
  _RAND_9 = {1{`RANDOM}};
  state_9 = _RAND_9[0:0];
  _RAND_10 = {1{`RANDOM}};
  state_10 = _RAND_10[0:0];
  _RAND_11 = {1{`RANDOM}};
  state_11 = _RAND_11[0:0];
  _RAND_12 = {1{`RANDOM}};
  state_12 = _RAND_12[0:0];
  _RAND_13 = {1{`RANDOM}};
  state_13 = _RAND_13[0:0];
  _RAND_14 = {1{`RANDOM}};
  state_14 = _RAND_14[0:0];
  _RAND_15 = {1{`RANDOM}};
  state_15 = _RAND_15[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module MaxPeriodFibonacciLFSR_threaded( // @[@ [Added during FAME5Transform]]
  input   clock,
  input   reset,
  input   io_increment,
  output  io_out_0,
  output  io_out_1,
  output  io_out_2,
  output  io_out_3,
  output  io_out_4,
  output  io_out_5,
  output  io_out_6,
  output  io_out_7,
  output  io_out_8,
  output  io_out_9,
  output  io_out_10,
  output  io_out_11,
  output  io_out_12,
  output  io_out_13,
  output  io_out_14,
  output  io_out_15,
  input   hostClock // @[@ [Added during FAME5Transform]]
);
`ifdef RANDOMIZE_MEM_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
  reg [31:0] _RAND_5;
  reg [31:0] _RAND_6;
  reg [31:0] _RAND_7;
  reg [31:0] _RAND_8;
  reg [31:0] _RAND_9;
  reg [31:0] _RAND_10;
  reg [31:0] _RAND_11;
  reg [31:0] _RAND_12;
  reg [31:0] _RAND_13;
  reg [31:0] _RAND_14;
  reg [31:0] _RAND_15;
`endif // RANDOMIZE_MEM_INIT
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_16;
`endif // RANDOMIZE_REG_INIT
  reg  state_0 [0:0]; // @[@ [Added during FAME5Transform] PRNG.scala 55:49]
  wire  state_0_read_en; // @[@ [Added during FAME5Transform] @ [Added during FAME5Transform] PRNG.scala 55:{49,49}]
  wire  state_0_read_addr; // @[@ [Added during FAME5Transform] @ [Added during FAME5Transform] PRNG.scala 55:{49,49}]
  wire  state_0_read_data; // @[@ [Added during FAME5Transform] PRNG.scala 55:49]
  wire  state_0_write_data; // @[@ [Added during FAME5Transform] @ [Added during FAME5Transform] PRNG.scala 55:{49,49,49}]
  wire  state_0_write_addr; // @[@ [Added during FAME5Transform] @ [Added during FAME5Transform] PRNG.scala 55:{49,49}]
  wire  state_0_write_mask; // @[@ [Added during FAME5Transform] @ [Added during FAME5Transform] PRNG.scala 55:{49,49}]
  wire  state_0_write_en; // @[@ [Added during FAME5Transform] @ [Added during FAME5Transform] PRNG.scala 55:{49,49,49}]
  reg  state_1 [0:0]; // @[@ [Added during FAME5Transform] PRNG.scala 55:49]
  wire  state_1_read_en; // @[@ [Added during FAME5Transform] @ [Added during FAME5Transform] PRNG.scala 55:{49,49}]
  wire  state_1_read_addr; // @[@ [Added during FAME5Transform] @ [Added during FAME5Transform] PRNG.scala 55:{49,49}]
  wire  state_1_read_data; // @[@ [Added during FAME5Transform] PRNG.scala 55:49]
  wire  state_1_write_data; // @[@ [Added during FAME5Transform] @ [Added during FAME5Transform] PRNG.scala 55:{49,49,49}]
  wire  state_1_write_addr; // @[@ [Added during FAME5Transform] @ [Added during FAME5Transform] PRNG.scala 55:{49,49}]
  wire  state_1_write_mask; // @[@ [Added during FAME5Transform] @ [Added during FAME5Transform] PRNG.scala 55:{49,49}]
  wire  state_1_write_en; // @[@ [Added during FAME5Transform] @ [Added during FAME5Transform] PRNG.scala 55:{49,49,49}]
  reg  state_2 [0:0]; // @[@ [Added during FAME5Transform] PRNG.scala 55:49]
  wire  state_2_read_en; // @[@ [Added during FAME5Transform] @ [Added during FAME5Transform] PRNG.scala 55:{49,49}]
  wire  state_2_read_addr; // @[@ [Added during FAME5Transform] @ [Added during FAME5Transform] PRNG.scala 55:{49,49}]
  wire  state_2_read_data; // @[@ [Added during FAME5Transform] PRNG.scala 55:49]
  wire  state_2_write_data; // @[@ [Added during FAME5Transform] @ [Added during FAME5Transform] PRNG.scala 55:{49,49,49}]
  wire  state_2_write_addr; // @[@ [Added during FAME5Transform] @ [Added during FAME5Transform] PRNG.scala 55:{49,49}]
  wire  state_2_write_mask; // @[@ [Added during FAME5Transform] @ [Added during FAME5Transform] PRNG.scala 55:{49,49}]
  wire  state_2_write_en; // @[@ [Added during FAME5Transform] @ [Added during FAME5Transform] PRNG.scala 55:{49,49,49}]
  reg  state_3 [0:0]; // @[@ [Added during FAME5Transform] PRNG.scala 55:49]
  wire  state_3_read_en; // @[@ [Added during FAME5Transform] @ [Added during FAME5Transform] PRNG.scala 55:{49,49}]
  wire  state_3_read_addr; // @[@ [Added during FAME5Transform] @ [Added during FAME5Transform] PRNG.scala 55:{49,49}]
  wire  state_3_read_data; // @[@ [Added during FAME5Transform] PRNG.scala 55:49]
  wire  state_3_write_data; // @[@ [Added during FAME5Transform] @ [Added during FAME5Transform] PRNG.scala 55:{49,49,49}]
  wire  state_3_write_addr; // @[@ [Added during FAME5Transform] @ [Added during FAME5Transform] PRNG.scala 55:{49,49}]
  wire  state_3_write_mask; // @[@ [Added during FAME5Transform] @ [Added during FAME5Transform] PRNG.scala 55:{49,49}]
  wire  state_3_write_en; // @[@ [Added during FAME5Transform] @ [Added during FAME5Transform] PRNG.scala 55:{49,49,49}]
  reg  state_4 [0:0]; // @[@ [Added during FAME5Transform] PRNG.scala 55:49]
  wire  state_4_read_en; // @[@ [Added during FAME5Transform] @ [Added during FAME5Transform] PRNG.scala 55:{49,49}]
  wire  state_4_read_addr; // @[@ [Added during FAME5Transform] @ [Added during FAME5Transform] PRNG.scala 55:{49,49}]
  wire  state_4_read_data; // @[@ [Added during FAME5Transform] PRNG.scala 55:49]
  wire  state_4_write_data; // @[@ [Added during FAME5Transform] @ [Added during FAME5Transform] PRNG.scala 55:{49,49,49}]
  wire  state_4_write_addr; // @[@ [Added during FAME5Transform] @ [Added during FAME5Transform] PRNG.scala 55:{49,49}]
  wire  state_4_write_mask; // @[@ [Added during FAME5Transform] @ [Added during FAME5Transform] PRNG.scala 55:{49,49}]
  wire  state_4_write_en; // @[@ [Added during FAME5Transform] @ [Added during FAME5Transform] PRNG.scala 55:{49,49,49}]
  reg  state_5 [0:0]; // @[@ [Added during FAME5Transform] PRNG.scala 55:49]
  wire  state_5_read_en; // @[@ [Added during FAME5Transform] @ [Added during FAME5Transform] PRNG.scala 55:{49,49}]
  wire  state_5_read_addr; // @[@ [Added during FAME5Transform] @ [Added during FAME5Transform] PRNG.scala 55:{49,49}]
  wire  state_5_read_data; // @[@ [Added during FAME5Transform] PRNG.scala 55:49]
  wire  state_5_write_data; // @[@ [Added during FAME5Transform] @ [Added during FAME5Transform] PRNG.scala 55:{49,49,49}]
  wire  state_5_write_addr; // @[@ [Added during FAME5Transform] @ [Added during FAME5Transform] PRNG.scala 55:{49,49}]
  wire  state_5_write_mask; // @[@ [Added during FAME5Transform] @ [Added during FAME5Transform] PRNG.scala 55:{49,49}]
  wire  state_5_write_en; // @[@ [Added during FAME5Transform] @ [Added during FAME5Transform] PRNG.scala 55:{49,49,49}]
  reg  state_6 [0:0]; // @[@ [Added during FAME5Transform] PRNG.scala 55:49]
  wire  state_6_read_en; // @[@ [Added during FAME5Transform] @ [Added during FAME5Transform] PRNG.scala 55:{49,49}]
  wire  state_6_read_addr; // @[@ [Added during FAME5Transform] @ [Added during FAME5Transform] PRNG.scala 55:{49,49}]
  wire  state_6_read_data; // @[@ [Added during FAME5Transform] PRNG.scala 55:49]
  wire  state_6_write_data; // @[@ [Added during FAME5Transform] @ [Added during FAME5Transform] PRNG.scala 55:{49,49,49}]
  wire  state_6_write_addr; // @[@ [Added during FAME5Transform] @ [Added during FAME5Transform] PRNG.scala 55:{49,49}]
  wire  state_6_write_mask; // @[@ [Added during FAME5Transform] @ [Added during FAME5Transform] PRNG.scala 55:{49,49}]
  wire  state_6_write_en; // @[@ [Added during FAME5Transform] @ [Added during FAME5Transform] PRNG.scala 55:{49,49,49}]
  reg  state_7 [0:0]; // @[@ [Added during FAME5Transform] PRNG.scala 55:49]
  wire  state_7_read_en; // @[@ [Added during FAME5Transform] @ [Added during FAME5Transform] PRNG.scala 55:{49,49}]
  wire  state_7_read_addr; // @[@ [Added during FAME5Transform] @ [Added during FAME5Transform] PRNG.scala 55:{49,49}]
  wire  state_7_read_data; // @[@ [Added during FAME5Transform] PRNG.scala 55:49]
  wire  state_7_write_data; // @[@ [Added during FAME5Transform] @ [Added during FAME5Transform] PRNG.scala 55:{49,49,49}]
  wire  state_7_write_addr; // @[@ [Added during FAME5Transform] @ [Added during FAME5Transform] PRNG.scala 55:{49,49}]
  wire  state_7_write_mask; // @[@ [Added during FAME5Transform] @ [Added during FAME5Transform] PRNG.scala 55:{49,49}]
  wire  state_7_write_en; // @[@ [Added during FAME5Transform] @ [Added during FAME5Transform] PRNG.scala 55:{49,49,49}]
  reg  state_8 [0:0]; // @[@ [Added during FAME5Transform] PRNG.scala 55:49]
  wire  state_8_read_en; // @[@ [Added during FAME5Transform] @ [Added during FAME5Transform] PRNG.scala 55:{49,49}]
  wire  state_8_read_addr; // @[@ [Added during FAME5Transform] @ [Added during FAME5Transform] PRNG.scala 55:{49,49}]
  wire  state_8_read_data; // @[@ [Added during FAME5Transform] PRNG.scala 55:49]
  wire  state_8_write_data; // @[@ [Added during FAME5Transform] @ [Added during FAME5Transform] PRNG.scala 55:{49,49,49}]
  wire  state_8_write_addr; // @[@ [Added during FAME5Transform] @ [Added during FAME5Transform] PRNG.scala 55:{49,49}]
  wire  state_8_write_mask; // @[@ [Added during FAME5Transform] @ [Added during FAME5Transform] PRNG.scala 55:{49,49}]
  wire  state_8_write_en; // @[@ [Added during FAME5Transform] @ [Added during FAME5Transform] PRNG.scala 55:{49,49,49}]
  reg  state_9 [0:0]; // @[@ [Added during FAME5Transform] PRNG.scala 55:49]
  wire  state_9_read_en; // @[@ [Added during FAME5Transform] @ [Added during FAME5Transform] PRNG.scala 55:{49,49}]
  wire  state_9_read_addr; // @[@ [Added during FAME5Transform] @ [Added during FAME5Transform] PRNG.scala 55:{49,49}]
  wire  state_9_read_data; // @[@ [Added during FAME5Transform] PRNG.scala 55:49]
  wire  state_9_write_data; // @[@ [Added during FAME5Transform] @ [Added during FAME5Transform] PRNG.scala 55:{49,49,49}]
  wire  state_9_write_addr; // @[@ [Added during FAME5Transform] @ [Added during FAME5Transform] PRNG.scala 55:{49,49}]
  wire  state_9_write_mask; // @[@ [Added during FAME5Transform] @ [Added during FAME5Transform] PRNG.scala 55:{49,49}]
  wire  state_9_write_en; // @[@ [Added during FAME5Transform] @ [Added during FAME5Transform] PRNG.scala 55:{49,49,49}]
  reg  state_10 [0:0]; // @[@ [Added during FAME5Transform] PRNG.scala 55:49]
  wire  state_10_read_en; // @[@ [Added during FAME5Transform] @ [Added during FAME5Transform] PRNG.scala 55:{49,49}]
  wire  state_10_read_addr; // @[@ [Added during FAME5Transform] @ [Added during FAME5Transform] PRNG.scala 55:{49,49}]
  wire  state_10_read_data; // @[@ [Added during FAME5Transform] PRNG.scala 55:49]
  wire  state_10_write_data; // @[@ [Added during FAME5Transform] @ [Added during FAME5Transform] PRNG.scala 55:{49,49,49}]
  wire  state_10_write_addr; // @[@ [Added during FAME5Transform] @ [Added during FAME5Transform] PRNG.scala 55:{49,49}]
  wire  state_10_write_mask; // @[@ [Added during FAME5Transform] @ [Added during FAME5Transform] PRNG.scala 55:{49,49}]
  wire  state_10_write_en; // @[@ [Added during FAME5Transform] @ [Added during FAME5Transform] PRNG.scala 55:{49,49,49}]
  reg  state_11 [0:0]; // @[@ [Added during FAME5Transform] PRNG.scala 55:49]
  wire  state_11_read_en; // @[@ [Added during FAME5Transform] @ [Added during FAME5Transform] PRNG.scala 55:{49,49}]
  wire  state_11_read_addr; // @[@ [Added during FAME5Transform] @ [Added during FAME5Transform] PRNG.scala 55:{49,49}]
  wire  state_11_read_data; // @[@ [Added during FAME5Transform] PRNG.scala 55:49]
  wire  state_11_write_data; // @[@ [Added during FAME5Transform] @ [Added during FAME5Transform] PRNG.scala 55:{49,49,49}]
  wire  state_11_write_addr; // @[@ [Added during FAME5Transform] @ [Added during FAME5Transform] PRNG.scala 55:{49,49}]
  wire  state_11_write_mask; // @[@ [Added during FAME5Transform] @ [Added during FAME5Transform] PRNG.scala 55:{49,49}]
  wire  state_11_write_en; // @[@ [Added during FAME5Transform] @ [Added during FAME5Transform] PRNG.scala 55:{49,49,49}]
  reg  state_12 [0:0]; // @[@ [Added during FAME5Transform] PRNG.scala 55:49]
  wire  state_12_read_en; // @[@ [Added during FAME5Transform] @ [Added during FAME5Transform] PRNG.scala 55:{49,49}]
  wire  state_12_read_addr; // @[@ [Added during FAME5Transform] @ [Added during FAME5Transform] PRNG.scala 55:{49,49}]
  wire  state_12_read_data; // @[@ [Added during FAME5Transform] PRNG.scala 55:49]
  wire  state_12_write_data; // @[@ [Added during FAME5Transform] @ [Added during FAME5Transform] PRNG.scala 55:{49,49,49}]
  wire  state_12_write_addr; // @[@ [Added during FAME5Transform] @ [Added during FAME5Transform] PRNG.scala 55:{49,49}]
  wire  state_12_write_mask; // @[@ [Added during FAME5Transform] @ [Added during FAME5Transform] PRNG.scala 55:{49,49}]
  wire  state_12_write_en; // @[@ [Added during FAME5Transform] @ [Added during FAME5Transform] PRNG.scala 55:{49,49,49}]
  reg  state_13 [0:0]; // @[@ [Added during FAME5Transform] PRNG.scala 55:49]
  wire  state_13_read_en; // @[@ [Added during FAME5Transform] @ [Added during FAME5Transform] PRNG.scala 55:{49,49}]
  wire  state_13_read_addr; // @[@ [Added during FAME5Transform] @ [Added during FAME5Transform] PRNG.scala 55:{49,49}]
  wire  state_13_read_data; // @[@ [Added during FAME5Transform] PRNG.scala 55:49]
  wire  state_13_write_data; // @[@ [Added during FAME5Transform] @ [Added during FAME5Transform] PRNG.scala 55:{49,49,49}]
  wire  state_13_write_addr; // @[@ [Added during FAME5Transform] @ [Added during FAME5Transform] PRNG.scala 55:{49,49}]
  wire  state_13_write_mask; // @[@ [Added during FAME5Transform] @ [Added during FAME5Transform] PRNG.scala 55:{49,49}]
  wire  state_13_write_en; // @[@ [Added during FAME5Transform] @ [Added during FAME5Transform] PRNG.scala 55:{49,49,49}]
  reg  state_14 [0:0]; // @[@ [Added during FAME5Transform] PRNG.scala 55:49]
  wire  state_14_read_en; // @[@ [Added during FAME5Transform] @ [Added during FAME5Transform] PRNG.scala 55:{49,49}]
  wire  state_14_read_addr; // @[@ [Added during FAME5Transform] @ [Added during FAME5Transform] PRNG.scala 55:{49,49}]
  wire  state_14_read_data; // @[@ [Added during FAME5Transform] PRNG.scala 55:49]
  wire  state_14_write_data; // @[@ [Added during FAME5Transform] @ [Added during FAME5Transform] PRNG.scala 55:{49,49,49}]
  wire  state_14_write_addr; // @[@ [Added during FAME5Transform] @ [Added during FAME5Transform] PRNG.scala 55:{49,49}]
  wire  state_14_write_mask; // @[@ [Added during FAME5Transform] @ [Added during FAME5Transform] PRNG.scala 55:{49,49}]
  wire  state_14_write_en; // @[@ [Added during FAME5Transform] @ [Added during FAME5Transform] PRNG.scala 55:{49,49,49}]
  reg  state_15 [0:0]; // @[@ [Added during FAME5Transform] PRNG.scala 55:49]
  wire  state_15_read_en; // @[@ [Added during FAME5Transform] @ [Added during FAME5Transform] PRNG.scala 55:{49,49}]
  wire  state_15_read_addr; // @[@ [Added during FAME5Transform] @ [Added during FAME5Transform] PRNG.scala 55:{49,49}]
  wire  state_15_read_data; // @[@ [Added during FAME5Transform] PRNG.scala 55:49]
  wire  state_15_write_data; // @[@ [Added during FAME5Transform] @ [Added during FAME5Transform] PRNG.scala 55:{49,49,49}]
  wire  state_15_write_addr; // @[@ [Added during FAME5Transform] @ [Added during FAME5Transform] PRNG.scala 55:{49,49}]
  wire  state_15_write_mask; // @[@ [Added during FAME5Transform] @ [Added during FAME5Transform] PRNG.scala 55:{49,49}]
  wire  state_15_write_en; // @[@ [Added during FAME5Transform] @ [Added during FAME5Transform] PRNG.scala 55:{49,49,49}]
  reg  threadIdx; // @[@ [Added during FAME5Transform]]
  wire  _T_2 = state_15_read_data ^ state_13_read_data ^ state_12_read_data ^ state_10_read_data; // @[LFSR.scala 15:41]
  wire  _GEN_0 = io_increment ? _T_2 : state_0_read_data; // @[PRNG.scala 69:22 70:11 55:49]
  wire  _GEN_1 = io_increment ? state_0_read_data : state_1_read_data; // @[PRNG.scala 69:22 70:11 55:49]
  wire  _GEN_2 = io_increment ? state_1_read_data : state_2_read_data; // @[PRNG.scala 69:22 70:11 55:49]
  wire  _GEN_3 = io_increment ? state_2_read_data : state_3_read_data; // @[PRNG.scala 69:22 70:11 55:49]
  wire  _GEN_4 = io_increment ? state_3_read_data : state_4_read_data; // @[PRNG.scala 69:22 70:11 55:49]
  wire  _GEN_5 = io_increment ? state_4_read_data : state_5_read_data; // @[PRNG.scala 69:22 70:11 55:49]
  wire  _GEN_6 = io_increment ? state_5_read_data : state_6_read_data; // @[PRNG.scala 69:22 70:11 55:49]
  wire  _GEN_7 = io_increment ? state_6_read_data : state_7_read_data; // @[PRNG.scala 69:22 70:11 55:49]
  wire  _GEN_8 = io_increment ? state_7_read_data : state_8_read_data; // @[PRNG.scala 69:22 70:11 55:49]
  wire  _GEN_9 = io_increment ? state_8_read_data : state_9_read_data; // @[PRNG.scala 69:22 70:11 55:49]
  wire  _GEN_10 = io_increment ? state_9_read_data : state_10_read_data; // @[PRNG.scala 69:22 70:11 55:49]
  wire  _GEN_11 = io_increment ? state_10_read_data : state_11_read_data; // @[PRNG.scala 69:22 70:11 55:49]
  wire  _GEN_12 = io_increment ? state_11_read_data : state_12_read_data; // @[PRNG.scala 69:22 70:11 55:49]
  wire  _GEN_13 = io_increment ? state_12_read_data : state_13_read_data; // @[PRNG.scala 69:22 70:11 55:49]
  wire  _GEN_14 = io_increment ? state_13_read_data : state_14_read_data; // @[PRNG.scala 69:22 70:11 55:49]
  wire  _GEN_15 = io_increment ? state_14_read_data : state_15_read_data; // @[PRNG.scala 69:22 70:11 55:49]
  wire [1:0] _GEN_16 = ~threadIdx ? 2'h0 : threadIdx + 1'h1; // @[@ [Added during FAME5Transform]]
  assign state_0_read_en = 1'h1; // @[@ [Added during FAME5Transform] PRNG.scala 55:49]
  assign state_0_read_addr = threadIdx; // @[@ [Added during FAME5Transform] PRNG.scala 55:49]
  assign state_0_read_data = state_0[state_0_read_addr]; // @[@ [Added during FAME5Transform] PRNG.scala 55:49]
  assign state_0_write_data = reset | _GEN_0; // @[@ [Added during FAME5Transform] PRNG.scala 55:{49,49}]
  assign state_0_write_addr = threadIdx; // @[@ [Added during FAME5Transform] PRNG.scala 55:49]
  assign state_0_write_mask = 1'h1; // @[@ [Added during FAME5Transform] PRNG.scala 55:49]
  assign state_0_write_en = 1'h1; // @[@ [Added during FAME5Transform] PRNG.scala 55:{49,49}]
  assign state_1_read_en = 1'h1; // @[@ [Added during FAME5Transform] PRNG.scala 55:49]
  assign state_1_read_addr = threadIdx; // @[@ [Added during FAME5Transform] PRNG.scala 55:49]
  assign state_1_read_data = state_1[state_1_read_addr]; // @[@ [Added during FAME5Transform] PRNG.scala 55:49]
  assign state_1_write_data = reset ? 1'h0 : _GEN_1; // @[@ [Added during FAME5Transform] PRNG.scala 55:{49,49}]
  assign state_1_write_addr = threadIdx; // @[@ [Added during FAME5Transform] PRNG.scala 55:49]
  assign state_1_write_mask = 1'h1; // @[@ [Added during FAME5Transform] PRNG.scala 55:49]
  assign state_1_write_en = 1'h1; // @[@ [Added during FAME5Transform] PRNG.scala 55:{49,49}]
  assign state_2_read_en = 1'h1; // @[@ [Added during FAME5Transform] PRNG.scala 55:49]
  assign state_2_read_addr = threadIdx; // @[@ [Added during FAME5Transform] PRNG.scala 55:49]
  assign state_2_read_data = state_2[state_2_read_addr]; // @[@ [Added during FAME5Transform] PRNG.scala 55:49]
  assign state_2_write_data = reset ? 1'h0 : _GEN_2; // @[@ [Added during FAME5Transform] PRNG.scala 55:{49,49}]
  assign state_2_write_addr = threadIdx; // @[@ [Added during FAME5Transform] PRNG.scala 55:49]
  assign state_2_write_mask = 1'h1; // @[@ [Added during FAME5Transform] PRNG.scala 55:49]
  assign state_2_write_en = 1'h1; // @[@ [Added during FAME5Transform] PRNG.scala 55:{49,49}]
  assign state_3_read_en = 1'h1; // @[@ [Added during FAME5Transform] PRNG.scala 55:49]
  assign state_3_read_addr = threadIdx; // @[@ [Added during FAME5Transform] PRNG.scala 55:49]
  assign state_3_read_data = state_3[state_3_read_addr]; // @[@ [Added during FAME5Transform] PRNG.scala 55:49]
  assign state_3_write_data = reset ? 1'h0 : _GEN_3; // @[@ [Added during FAME5Transform] PRNG.scala 55:{49,49}]
  assign state_3_write_addr = threadIdx; // @[@ [Added during FAME5Transform] PRNG.scala 55:49]
  assign state_3_write_mask = 1'h1; // @[@ [Added during FAME5Transform] PRNG.scala 55:49]
  assign state_3_write_en = 1'h1; // @[@ [Added during FAME5Transform] PRNG.scala 55:{49,49}]
  assign state_4_read_en = 1'h1; // @[@ [Added during FAME5Transform] PRNG.scala 55:49]
  assign state_4_read_addr = threadIdx; // @[@ [Added during FAME5Transform] PRNG.scala 55:49]
  assign state_4_read_data = state_4[state_4_read_addr]; // @[@ [Added during FAME5Transform] PRNG.scala 55:49]
  assign state_4_write_data = reset ? 1'h0 : _GEN_4; // @[@ [Added during FAME5Transform] PRNG.scala 55:{49,49}]
  assign state_4_write_addr = threadIdx; // @[@ [Added during FAME5Transform] PRNG.scala 55:49]
  assign state_4_write_mask = 1'h1; // @[@ [Added during FAME5Transform] PRNG.scala 55:49]
  assign state_4_write_en = 1'h1; // @[@ [Added during FAME5Transform] PRNG.scala 55:{49,49}]
  assign state_5_read_en = 1'h1; // @[@ [Added during FAME5Transform] PRNG.scala 55:49]
  assign state_5_read_addr = threadIdx; // @[@ [Added during FAME5Transform] PRNG.scala 55:49]
  assign state_5_read_data = state_5[state_5_read_addr]; // @[@ [Added during FAME5Transform] PRNG.scala 55:49]
  assign state_5_write_data = reset ? 1'h0 : _GEN_5; // @[@ [Added during FAME5Transform] PRNG.scala 55:{49,49}]
  assign state_5_write_addr = threadIdx; // @[@ [Added during FAME5Transform] PRNG.scala 55:49]
  assign state_5_write_mask = 1'h1; // @[@ [Added during FAME5Transform] PRNG.scala 55:49]
  assign state_5_write_en = 1'h1; // @[@ [Added during FAME5Transform] PRNG.scala 55:{49,49}]
  assign state_6_read_en = 1'h1; // @[@ [Added during FAME5Transform] PRNG.scala 55:49]
  assign state_6_read_addr = threadIdx; // @[@ [Added during FAME5Transform] PRNG.scala 55:49]
  assign state_6_read_data = state_6[state_6_read_addr]; // @[@ [Added during FAME5Transform] PRNG.scala 55:49]
  assign state_6_write_data = reset ? 1'h0 : _GEN_6; // @[@ [Added during FAME5Transform] PRNG.scala 55:{49,49}]
  assign state_6_write_addr = threadIdx; // @[@ [Added during FAME5Transform] PRNG.scala 55:49]
  assign state_6_write_mask = 1'h1; // @[@ [Added during FAME5Transform] PRNG.scala 55:49]
  assign state_6_write_en = 1'h1; // @[@ [Added during FAME5Transform] PRNG.scala 55:{49,49}]
  assign state_7_read_en = 1'h1; // @[@ [Added during FAME5Transform] PRNG.scala 55:49]
  assign state_7_read_addr = threadIdx; // @[@ [Added during FAME5Transform] PRNG.scala 55:49]
  assign state_7_read_data = state_7[state_7_read_addr]; // @[@ [Added during FAME5Transform] PRNG.scala 55:49]
  assign state_7_write_data = reset ? 1'h0 : _GEN_7; // @[@ [Added during FAME5Transform] PRNG.scala 55:{49,49}]
  assign state_7_write_addr = threadIdx; // @[@ [Added during FAME5Transform] PRNG.scala 55:49]
  assign state_7_write_mask = 1'h1; // @[@ [Added during FAME5Transform] PRNG.scala 55:49]
  assign state_7_write_en = 1'h1; // @[@ [Added during FAME5Transform] PRNG.scala 55:{49,49}]
  assign state_8_read_en = 1'h1; // @[@ [Added during FAME5Transform] PRNG.scala 55:49]
  assign state_8_read_addr = threadIdx; // @[@ [Added during FAME5Transform] PRNG.scala 55:49]
  assign state_8_read_data = state_8[state_8_read_addr]; // @[@ [Added during FAME5Transform] PRNG.scala 55:49]
  assign state_8_write_data = reset ? 1'h0 : _GEN_8; // @[@ [Added during FAME5Transform] PRNG.scala 55:{49,49}]
  assign state_8_write_addr = threadIdx; // @[@ [Added during FAME5Transform] PRNG.scala 55:49]
  assign state_8_write_mask = 1'h1; // @[@ [Added during FAME5Transform] PRNG.scala 55:49]
  assign state_8_write_en = 1'h1; // @[@ [Added during FAME5Transform] PRNG.scala 55:{49,49}]
  assign state_9_read_en = 1'h1; // @[@ [Added during FAME5Transform] PRNG.scala 55:49]
  assign state_9_read_addr = threadIdx; // @[@ [Added during FAME5Transform] PRNG.scala 55:49]
  assign state_9_read_data = state_9[state_9_read_addr]; // @[@ [Added during FAME5Transform] PRNG.scala 55:49]
  assign state_9_write_data = reset ? 1'h0 : _GEN_9; // @[@ [Added during FAME5Transform] PRNG.scala 55:{49,49}]
  assign state_9_write_addr = threadIdx; // @[@ [Added during FAME5Transform] PRNG.scala 55:49]
  assign state_9_write_mask = 1'h1; // @[@ [Added during FAME5Transform] PRNG.scala 55:49]
  assign state_9_write_en = 1'h1; // @[@ [Added during FAME5Transform] PRNG.scala 55:{49,49}]
  assign state_10_read_en = 1'h1; // @[@ [Added during FAME5Transform] PRNG.scala 55:49]
  assign state_10_read_addr = threadIdx; // @[@ [Added during FAME5Transform] PRNG.scala 55:49]
  assign state_10_read_data = state_10[state_10_read_addr]; // @[@ [Added during FAME5Transform] PRNG.scala 55:49]
  assign state_10_write_data = reset ? 1'h0 : _GEN_10; // @[@ [Added during FAME5Transform] PRNG.scala 55:{49,49}]
  assign state_10_write_addr = threadIdx; // @[@ [Added during FAME5Transform] PRNG.scala 55:49]
  assign state_10_write_mask = 1'h1; // @[@ [Added during FAME5Transform] PRNG.scala 55:49]
  assign state_10_write_en = 1'h1; // @[@ [Added during FAME5Transform] PRNG.scala 55:{49,49}]
  assign state_11_read_en = 1'h1; // @[@ [Added during FAME5Transform] PRNG.scala 55:49]
  assign state_11_read_addr = threadIdx; // @[@ [Added during FAME5Transform] PRNG.scala 55:49]
  assign state_11_read_data = state_11[state_11_read_addr]; // @[@ [Added during FAME5Transform] PRNG.scala 55:49]
  assign state_11_write_data = reset ? 1'h0 : _GEN_11; // @[@ [Added during FAME5Transform] PRNG.scala 55:{49,49}]
  assign state_11_write_addr = threadIdx; // @[@ [Added during FAME5Transform] PRNG.scala 55:49]
  assign state_11_write_mask = 1'h1; // @[@ [Added during FAME5Transform] PRNG.scala 55:49]
  assign state_11_write_en = 1'h1; // @[@ [Added during FAME5Transform] PRNG.scala 55:{49,49}]
  assign state_12_read_en = 1'h1; // @[@ [Added during FAME5Transform] PRNG.scala 55:49]
  assign state_12_read_addr = threadIdx; // @[@ [Added during FAME5Transform] PRNG.scala 55:49]
  assign state_12_read_data = state_12[state_12_read_addr]; // @[@ [Added during FAME5Transform] PRNG.scala 55:49]
  assign state_12_write_data = reset ? 1'h0 : _GEN_12; // @[@ [Added during FAME5Transform] PRNG.scala 55:{49,49}]
  assign state_12_write_addr = threadIdx; // @[@ [Added during FAME5Transform] PRNG.scala 55:49]
  assign state_12_write_mask = 1'h1; // @[@ [Added during FAME5Transform] PRNG.scala 55:49]
  assign state_12_write_en = 1'h1; // @[@ [Added during FAME5Transform] PRNG.scala 55:{49,49}]
  assign state_13_read_en = 1'h1; // @[@ [Added during FAME5Transform] PRNG.scala 55:49]
  assign state_13_read_addr = threadIdx; // @[@ [Added during FAME5Transform] PRNG.scala 55:49]
  assign state_13_read_data = state_13[state_13_read_addr]; // @[@ [Added during FAME5Transform] PRNG.scala 55:49]
  assign state_13_write_data = reset ? 1'h0 : _GEN_13; // @[@ [Added during FAME5Transform] PRNG.scala 55:{49,49}]
  assign state_13_write_addr = threadIdx; // @[@ [Added during FAME5Transform] PRNG.scala 55:49]
  assign state_13_write_mask = 1'h1; // @[@ [Added during FAME5Transform] PRNG.scala 55:49]
  assign state_13_write_en = 1'h1; // @[@ [Added during FAME5Transform] PRNG.scala 55:{49,49}]
  assign state_14_read_en = 1'h1; // @[@ [Added during FAME5Transform] PRNG.scala 55:49]
  assign state_14_read_addr = threadIdx; // @[@ [Added during FAME5Transform] PRNG.scala 55:49]
  assign state_14_read_data = state_14[state_14_read_addr]; // @[@ [Added during FAME5Transform] PRNG.scala 55:49]
  assign state_14_write_data = reset ? 1'h0 : _GEN_14; // @[@ [Added during FAME5Transform] PRNG.scala 55:{49,49}]
  assign state_14_write_addr = threadIdx; // @[@ [Added during FAME5Transform] PRNG.scala 55:49]
  assign state_14_write_mask = 1'h1; // @[@ [Added during FAME5Transform] PRNG.scala 55:49]
  assign state_14_write_en = 1'h1; // @[@ [Added during FAME5Transform] PRNG.scala 55:{49,49}]
  assign state_15_read_en = 1'h1; // @[@ [Added during FAME5Transform] PRNG.scala 55:49]
  assign state_15_read_addr = threadIdx; // @[@ [Added during FAME5Transform] PRNG.scala 55:49]
  assign state_15_read_data = state_15[state_15_read_addr]; // @[@ [Added during FAME5Transform] PRNG.scala 55:49]
  assign state_15_write_data = reset ? 1'h0 : _GEN_15; // @[@ [Added during FAME5Transform] PRNG.scala 55:{49,49}]
  assign state_15_write_addr = threadIdx; // @[@ [Added during FAME5Transform] PRNG.scala 55:49]
  assign state_15_write_mask = 1'h1; // @[@ [Added during FAME5Transform] PRNG.scala 55:49]
  assign state_15_write_en = 1'h1; // @[@ [Added during FAME5Transform] PRNG.scala 55:{49,49}]
  assign io_out_0 = state_0_read_data; // @[PRNG.scala 78:10]
  assign io_out_1 = state_1_read_data; // @[PRNG.scala 78:10]
  assign io_out_2 = state_2_read_data; // @[PRNG.scala 78:10]
  assign io_out_3 = state_3_read_data; // @[PRNG.scala 78:10]
  assign io_out_4 = state_4_read_data; // @[PRNG.scala 78:10]
  assign io_out_5 = state_5_read_data; // @[PRNG.scala 78:10]
  assign io_out_6 = state_6_read_data; // @[PRNG.scala 78:10]
  assign io_out_7 = state_7_read_data; // @[PRNG.scala 78:10]
  assign io_out_8 = state_8_read_data; // @[PRNG.scala 78:10]
  assign io_out_9 = state_9_read_data; // @[PRNG.scala 78:10]
  assign io_out_10 = state_10_read_data; // @[PRNG.scala 78:10]
  assign io_out_11 = state_11_read_data; // @[PRNG.scala 78:10]
  assign io_out_12 = state_12_read_data; // @[PRNG.scala 78:10]
  assign io_out_13 = state_13_read_data; // @[PRNG.scala 78:10]
  assign io_out_14 = state_14_read_data; // @[PRNG.scala 78:10]
  assign io_out_15 = state_15_read_data; // @[PRNG.scala 78:10]
  always @(posedge clock) begin
    if (state_0_write_en & state_0_write_mask) begin
      state_0[state_0_write_addr] <= state_0_write_data; // @[@ [Added during FAME5Transform] PRNG.scala 55:49]
    end
    if (state_1_write_en & state_1_write_mask) begin
      state_1[state_1_write_addr] <= state_1_write_data; // @[@ [Added during FAME5Transform] PRNG.scala 55:49]
    end
    if (state_2_write_en & state_2_write_mask) begin
      state_2[state_2_write_addr] <= state_2_write_data; // @[@ [Added during FAME5Transform] PRNG.scala 55:49]
    end
    if (state_3_write_en & state_3_write_mask) begin
      state_3[state_3_write_addr] <= state_3_write_data; // @[@ [Added during FAME5Transform] PRNG.scala 55:49]
    end
    if (state_4_write_en & state_4_write_mask) begin
      state_4[state_4_write_addr] <= state_4_write_data; // @[@ [Added during FAME5Transform] PRNG.scala 55:49]
    end
    if (state_5_write_en & state_5_write_mask) begin
      state_5[state_5_write_addr] <= state_5_write_data; // @[@ [Added during FAME5Transform] PRNG.scala 55:49]
    end
    if (state_6_write_en & state_6_write_mask) begin
      state_6[state_6_write_addr] <= state_6_write_data; // @[@ [Added during FAME5Transform] PRNG.scala 55:49]
    end
    if (state_7_write_en & state_7_write_mask) begin
      state_7[state_7_write_addr] <= state_7_write_data; // @[@ [Added during FAME5Transform] PRNG.scala 55:49]
    end
    if (state_8_write_en & state_8_write_mask) begin
      state_8[state_8_write_addr] <= state_8_write_data; // @[@ [Added during FAME5Transform] PRNG.scala 55:49]
    end
    if (state_9_write_en & state_9_write_mask) begin
      state_9[state_9_write_addr] <= state_9_write_data; // @[@ [Added during FAME5Transform] PRNG.scala 55:49]
    end
    if (state_10_write_en & state_10_write_mask) begin
      state_10[state_10_write_addr] <= state_10_write_data; // @[@ [Added during FAME5Transform] PRNG.scala 55:49]
    end
    if (state_11_write_en & state_11_write_mask) begin
      state_11[state_11_write_addr] <= state_11_write_data; // @[@ [Added during FAME5Transform] PRNG.scala 55:49]
    end
    if (state_12_write_en & state_12_write_mask) begin
      state_12[state_12_write_addr] <= state_12_write_data; // @[@ [Added during FAME5Transform] PRNG.scala 55:49]
    end
    if (state_13_write_en & state_13_write_mask) begin
      state_13[state_13_write_addr] <= state_13_write_data; // @[@ [Added during FAME5Transform] PRNG.scala 55:49]
    end
    if (state_14_write_en & state_14_write_mask) begin
      state_14[state_14_write_addr] <= state_14_write_data; // @[@ [Added during FAME5Transform] PRNG.scala 55:49]
    end
    if (state_15_write_en & state_15_write_mask) begin
      state_15[state_15_write_addr] <= state_15_write_data; // @[@ [Added during FAME5Transform] PRNG.scala 55:49]
    end
  end
  always @(posedge hostClock) begin
    threadIdx <= _GEN_16[0]; // @[@ [Added during FAME5Transform]]
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_MEM_INIT
  _RAND_0 = {1{`RANDOM}};
  for (initvar = 0; initvar < 1; initvar = initvar+1)
    state_0[initvar] = _RAND_0[0:0];
  _RAND_1 = {1{`RANDOM}};
  for (initvar = 0; initvar < 1; initvar = initvar+1)
    state_1[initvar] = _RAND_1[0:0];
  _RAND_2 = {1{`RANDOM}};
  for (initvar = 0; initvar < 1; initvar = initvar+1)
    state_2[initvar] = _RAND_2[0:0];
  _RAND_3 = {1{`RANDOM}};
  for (initvar = 0; initvar < 1; initvar = initvar+1)
    state_3[initvar] = _RAND_3[0:0];
  _RAND_4 = {1{`RANDOM}};
  for (initvar = 0; initvar < 1; initvar = initvar+1)
    state_4[initvar] = _RAND_4[0:0];
  _RAND_5 = {1{`RANDOM}};
  for (initvar = 0; initvar < 1; initvar = initvar+1)
    state_5[initvar] = _RAND_5[0:0];
  _RAND_6 = {1{`RANDOM}};
  for (initvar = 0; initvar < 1; initvar = initvar+1)
    state_6[initvar] = _RAND_6[0:0];
  _RAND_7 = {1{`RANDOM}};
  for (initvar = 0; initvar < 1; initvar = initvar+1)
    state_7[initvar] = _RAND_7[0:0];
  _RAND_8 = {1{`RANDOM}};
  for (initvar = 0; initvar < 1; initvar = initvar+1)
    state_8[initvar] = _RAND_8[0:0];
  _RAND_9 = {1{`RANDOM}};
  for (initvar = 0; initvar < 1; initvar = initvar+1)
    state_9[initvar] = _RAND_9[0:0];
  _RAND_10 = {1{`RANDOM}};
  for (initvar = 0; initvar < 1; initvar = initvar+1)
    state_10[initvar] = _RAND_10[0:0];
  _RAND_11 = {1{`RANDOM}};
  for (initvar = 0; initvar < 1; initvar = initvar+1)
    state_11[initvar] = _RAND_11[0:0];
  _RAND_12 = {1{`RANDOM}};
  for (initvar = 0; initvar < 1; initvar = initvar+1)
    state_12[initvar] = _RAND_12[0:0];
  _RAND_13 = {1{`RANDOM}};
  for (initvar = 0; initvar < 1; initvar = initvar+1)
    state_13[initvar] = _RAND_13[0:0];
  _RAND_14 = {1{`RANDOM}};
  for (initvar = 0; initvar < 1; initvar = initvar+1)
    state_14[initvar] = _RAND_14[0:0];
  _RAND_15 = {1{`RANDOM}};
  for (initvar = 0; initvar < 1; initvar = initvar+1)
    state_15[initvar] = _RAND_15[0:0];
`endif // RANDOMIZE_MEM_INIT
`ifdef RANDOMIZE_REG_INIT
  _RAND_16 = {1{`RANDOM}};
  threadIdx = _RAND_16[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module PrintfModuleChild(
  input         clock,
  input         reset,
  input         c,
  input  [15:0] cycle,
  output        synthesizedPrintf_printf_wire_enable,
  output [15:0] synthesizedPrintf_printf_wire_args_0,
  output [15:0] synthesizedPrintf_printf_wire_args_1
);
  wire  lfsr_prng_clock; // @[PRNG.scala 91:22]
  wire  lfsr_prng_reset; // @[PRNG.scala 91:22]
  wire  lfsr_prng_io_increment; // @[PRNG.scala 91:22]
  wire  lfsr_prng_io_out_0; // @[PRNG.scala 91:22]
  wire  lfsr_prng_io_out_1; // @[PRNG.scala 91:22]
  wire  lfsr_prng_io_out_2; // @[PRNG.scala 91:22]
  wire  lfsr_prng_io_out_3; // @[PRNG.scala 91:22]
  wire  lfsr_prng_io_out_4; // @[PRNG.scala 91:22]
  wire  lfsr_prng_io_out_5; // @[PRNG.scala 91:22]
  wire  lfsr_prng_io_out_6; // @[PRNG.scala 91:22]
  wire  lfsr_prng_io_out_7; // @[PRNG.scala 91:22]
  wire  lfsr_prng_io_out_8; // @[PRNG.scala 91:22]
  wire  lfsr_prng_io_out_9; // @[PRNG.scala 91:22]
  wire  lfsr_prng_io_out_10; // @[PRNG.scala 91:22]
  wire  lfsr_prng_io_out_11; // @[PRNG.scala 91:22]
  wire  lfsr_prng_io_out_12; // @[PRNG.scala 91:22]
  wire  lfsr_prng_io_out_13; // @[PRNG.scala 91:22]
  wire  lfsr_prng_io_out_14; // @[PRNG.scala 91:22]
  wire  lfsr_prng_io_out_15; // @[PRNG.scala 91:22]
  wire [7:0] lfsr_lo = {lfsr_prng_io_out_7,lfsr_prng_io_out_6,lfsr_prng_io_out_5,lfsr_prng_io_out_4,lfsr_prng_io_out_3,
    lfsr_prng_io_out_2,lfsr_prng_io_out_1,lfsr_prng_io_out_0}; // @[PRNG.scala 95:17]
  wire [7:0] lfsr_hi = {lfsr_prng_io_out_15,lfsr_prng_io_out_14,lfsr_prng_io_out_13,lfsr_prng_io_out_12,
    lfsr_prng_io_out_11,lfsr_prng_io_out_10,lfsr_prng_io_out_9,lfsr_prng_io_out_8}; // @[PRNG.scala 95:17]
  wire [15:0] lfsr = {lfsr_prng_io_out_15,lfsr_prng_io_out_14,lfsr_prng_io_out_13,lfsr_prng_io_out_12,
    lfsr_prng_io_out_11,lfsr_prng_io_out_10,lfsr_prng_io_out_9,lfsr_prng_io_out_8,lfsr_lo}; // @[PRNG.scala 95:17]
  wire  printf_wire_enable = ~reset; // @[PrintfModule.scala 51:26]
  MaxPeriodFibonacciLFSR lfsr_prng ( // @[PRNG.scala 91:22]
    .clock(lfsr_prng_clock),
    .reset(lfsr_prng_reset),
    .io_increment(lfsr_prng_io_increment),
    .io_out_0(lfsr_prng_io_out_0),
    .io_out_1(lfsr_prng_io_out_1),
    .io_out_2(lfsr_prng_io_out_2),
    .io_out_3(lfsr_prng_io_out_3),
    .io_out_4(lfsr_prng_io_out_4),
    .io_out_5(lfsr_prng_io_out_5),
    .io_out_6(lfsr_prng_io_out_6),
    .io_out_7(lfsr_prng_io_out_7),
    .io_out_8(lfsr_prng_io_out_8),
    .io_out_9(lfsr_prng_io_out_9),
    .io_out_10(lfsr_prng_io_out_10),
    .io_out_11(lfsr_prng_io_out_11),
    .io_out_12(lfsr_prng_io_out_12),
    .io_out_13(lfsr_prng_io_out_13),
    .io_out_14(lfsr_prng_io_out_14),
    .io_out_15(lfsr_prng_io_out_15)
  );
  assign synthesizedPrintf_printf_wire_enable = ~reset; // @[PrintfModule.scala 51:26]
  assign synthesizedPrintf_printf_wire_args_0 = cycle;
  assign synthesizedPrintf_printf_wire_args_1 = {lfsr_hi,lfsr_lo}; // @[PRNG.scala 95:17]
  assign lfsr_prng_clock = clock;
  assign lfsr_prng_reset = reset;
  assign lfsr_prng_io_increment = c; // @[PRNG.scala 94:23]
  always @(posedge clock) begin
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (printf_wire_enable) begin
          $fwrite(32'h80000002,"SYNTHESIZED_PRINT CYCLE: %d LFSR: %x\n",cycle,lfsr); // @[PrintfModule.scala 51:26]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
  end
endmodule
module PrintfModuleChild_threaded( // @[@ [Added during FAME5Transform]]
  input         clock,
  input         reset,
  input         c,
  input  [15:0] cycle,
  input         hostClock // @[@ [Added during FAME5Transform]]
);
  wire  lfsr_prng_clock; // @[PRNG.scala 91:22]
  wire  lfsr_prng_reset; // @[PRNG.scala 91:22]
  wire  lfsr_prng_io_increment; // @[PRNG.scala 91:22]
  wire  lfsr_prng_io_out_0; // @[PRNG.scala 91:22]
  wire  lfsr_prng_io_out_1; // @[PRNG.scala 91:22]
  wire  lfsr_prng_io_out_2; // @[PRNG.scala 91:22]
  wire  lfsr_prng_io_out_3; // @[PRNG.scala 91:22]
  wire  lfsr_prng_io_out_4; // @[PRNG.scala 91:22]
  wire  lfsr_prng_io_out_5; // @[PRNG.scala 91:22]
  wire  lfsr_prng_io_out_6; // @[PRNG.scala 91:22]
  wire  lfsr_prng_io_out_7; // @[PRNG.scala 91:22]
  wire  lfsr_prng_io_out_8; // @[PRNG.scala 91:22]
  wire  lfsr_prng_io_out_9; // @[PRNG.scala 91:22]
  wire  lfsr_prng_io_out_10; // @[PRNG.scala 91:22]
  wire  lfsr_prng_io_out_11; // @[PRNG.scala 91:22]
  wire  lfsr_prng_io_out_12; // @[PRNG.scala 91:22]
  wire  lfsr_prng_io_out_13; // @[PRNG.scala 91:22]
  wire  lfsr_prng_io_out_14; // @[PRNG.scala 91:22]
  wire  lfsr_prng_io_out_15; // @[PRNG.scala 91:22]
  wire  lfsr_prng_hostClock; // @[PRNG.scala 91:22]
  wire [7:0] lfsr_lo = {lfsr_prng_io_out_7,lfsr_prng_io_out_6,lfsr_prng_io_out_5,lfsr_prng_io_out_4,lfsr_prng_io_out_3,
    lfsr_prng_io_out_2,lfsr_prng_io_out_1,lfsr_prng_io_out_0}; // @[PRNG.scala 95:17]
  wire [15:0] lfsr = {lfsr_prng_io_out_15,lfsr_prng_io_out_14,lfsr_prng_io_out_13,lfsr_prng_io_out_12,
    lfsr_prng_io_out_11,lfsr_prng_io_out_10,lfsr_prng_io_out_9,lfsr_prng_io_out_8,lfsr_lo}; // @[PRNG.scala 95:17]
  wire  printf_wire_enable = ~reset; // @[PrintfModule.scala 51:26]
  MaxPeriodFibonacciLFSR_threaded lfsr_prng ( // @[PRNG.scala 91:22]
    .clock(lfsr_prng_clock),
    .reset(lfsr_prng_reset),
    .io_increment(lfsr_prng_io_increment),
    .io_out_0(lfsr_prng_io_out_0),
    .io_out_1(lfsr_prng_io_out_1),
    .io_out_2(lfsr_prng_io_out_2),
    .io_out_3(lfsr_prng_io_out_3),
    .io_out_4(lfsr_prng_io_out_4),
    .io_out_5(lfsr_prng_io_out_5),
    .io_out_6(lfsr_prng_io_out_6),
    .io_out_7(lfsr_prng_io_out_7),
    .io_out_8(lfsr_prng_io_out_8),
    .io_out_9(lfsr_prng_io_out_9),
    .io_out_10(lfsr_prng_io_out_10),
    .io_out_11(lfsr_prng_io_out_11),
    .io_out_12(lfsr_prng_io_out_12),
    .io_out_13(lfsr_prng_io_out_13),
    .io_out_14(lfsr_prng_io_out_14),
    .io_out_15(lfsr_prng_io_out_15),
    .hostClock(lfsr_prng_hostClock)
  );
  assign lfsr_prng_clock = clock;
  assign lfsr_prng_reset = reset;
  assign lfsr_prng_io_increment = c; // @[PRNG.scala 94:23]
  assign lfsr_prng_hostClock = hostClock; // @[@ [Added during FAME5Transform]]
  always @(posedge clock) begin
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (printf_wire_enable) begin
          $fwrite(32'h80000002,"SYNTHESIZED_PRINT CYCLE: %d LFSR: %x\n",cycle,lfsr); // @[PrintfModule.scala 51:26]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
  end
endmodule
module PrintfModuleDUT(
  input          clock,
  input          reset,
  input          io_a,
  output         synthesizedPrintf_printf_wire_enable,
  output [15:0]  synthesizedPrintf_printf_wire_args_0,
  output         synthesizedPrintf_printf_1_wire_enable,
  output [15:0]  synthesizedPrintf_printf_1_wire_args_0,
  output [527:0] synthesizedPrintf_printf_1_wire_args_1,
  output         synthesizedPrintf_printf_2_wire_enable,
  output [15:0]  synthesizedPrintf_printf_2_wire_args_0,
  output [7:0]   synthesizedPrintf_printf_2_wire_args_1,
  output         synthesizedPrintf_childInst_printf_wire_enable,
  output [15:0]  synthesizedPrintf_childInst_printf_wire_args_0,
  output [15:0]  synthesizedPrintf_childInst_printf_wire_args_1
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
`endif // RANDOMIZE_REG_INIT
  wire  childInst_clock; // @[PrintfModule.scala 38:25]
  wire  childInst_reset; // @[PrintfModule.scala 38:25]
  wire  childInst_c; // @[PrintfModule.scala 38:25]
  wire [15:0] childInst_cycle; // @[PrintfModule.scala 38:25]
  wire  childInst_synthesizedPrintf_printf_wire_enable; // @[PrintfModule.scala 38:25]
  wire [15:0] childInst_synthesizedPrintf_printf_wire_args_0; // @[PrintfModule.scala 38:25]
  wire [15:0] childInst_synthesizedPrintf_printf_wire_args_1; // @[PrintfModule.scala 38:25]
  reg [15:0] cycle; // @[PrintfModule.scala 27:18]
  wire  printf_wire_enable = ~reset; // @[PrintfModule.scala 33:26]
  wire [127:0] wideArgument_lo_lo = {cycle,cycle,cycle,cycle,cycle,cycle,cycle,cycle}; // @[PrintfModule.scala 35:61]
  wire [255:0] wideArgument_lo = {cycle,cycle,cycle,cycle,cycle,cycle,cycle,cycle,wideArgument_lo_lo}; // @[PrintfModule.scala 35:61]
  wire [271:0] wideArgument_hi = {cycle,cycle,cycle,cycle,cycle,cycle,cycle,cycle,cycle,wideArgument_lo_lo}; // @[PrintfModule.scala 35:61]
  wire [527:0] wideArgument = {wideArgument_hi,cycle,cycle,cycle,cycle,cycle,cycle,cycle,cycle,wideArgument_lo_lo}; // @[PrintfModule.scala 35:61]
  wire [7:0] ch = cycle[7:0] > 8'h20 & cycle[7:0] < 8'h7f ? cycle[7:0] : 8'h20; // @[PrintfModule.scala 42:15]
  PrintfModuleChild childInst ( // @[PrintfModule.scala 38:25]
    .clock(childInst_clock),
    .reset(childInst_reset),
    .c(childInst_c),
    .cycle(childInst_cycle),
    .synthesizedPrintf_printf_wire_enable(childInst_synthesizedPrintf_printf_wire_enable),
    .synthesizedPrintf_printf_wire_args_0(childInst_synthesizedPrintf_printf_wire_args_0),
    .synthesizedPrintf_printf_wire_args_1(childInst_synthesizedPrintf_printf_wire_args_1)
  );
  assign synthesizedPrintf_printf_wire_enable = ~reset; // @[PrintfModule.scala 33:26]
  assign synthesizedPrintf_printf_wire_args_0 = cycle;
  assign synthesizedPrintf_printf_1_wire_enable = ~reset; // @[PrintfModule.scala 33:26]
  assign synthesizedPrintf_printf_1_wire_args_0 = cycle;
  assign synthesizedPrintf_printf_1_wire_args_1 = {wideArgument_hi,wideArgument_lo}; // @[PrintfModule.scala 35:61]
  assign synthesizedPrintf_printf_2_wire_enable = ~reset; // @[PrintfModule.scala 33:26]
  assign synthesizedPrintf_printf_2_wire_args_0 = cycle;
  assign synthesizedPrintf_printf_2_wire_args_1 = cycle[7:0] > 8'h20 & cycle[7:0] < 8'h7f ? cycle[7:0] : 8'h20; // @[PrintfModule.scala 42:15]
  assign synthesizedPrintf_childInst_printf_wire_enable = childInst_synthesizedPrintf_printf_wire_enable;
  assign synthesizedPrintf_childInst_printf_wire_args_0 = childInst_synthesizedPrintf_printf_wire_args_0;
  assign synthesizedPrintf_childInst_printf_wire_args_1 = childInst_synthesizedPrintf_printf_wire_args_1;
  assign childInst_clock = clock;
  assign childInst_reset = reset;
  assign childInst_c = io_a; // @[PrintfModule.scala 39:15]
  assign childInst_cycle = cycle; // @[PrintfModule.scala 40:19]
  always @(posedge clock) begin
    cycle <= cycle + 16'h1; // @[PrintfModule.scala 28:18]
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (printf_wire_enable) begin
          $fwrite(32'h80000002,"SYNTHESIZED_PRINT CYCLE: %d\n",cycle); // @[PrintfModule.scala 33:26]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (printf_wire_enable) begin
          $fwrite(32'h80000002,"SYNTHESIZED_PRINT CYCLE: %d wideArgument: %x\n",cycle,wideArgument); // @[PrintfModule.scala 36:26]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (printf_wire_enable) begin
          $fwrite(32'h80000002,"SYNTHESIZED_PRINT CYCLE: %d Char: %c\n",cycle,ch); // @[PrintfModule.scala 43:26]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  cycle = _RAND_0[15:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module PrintfModuleDUT_threaded( // @[@ [Added during FAME5Transform]]
  input   clock,
  input   reset,
  input   io_a,
  input   hostClock // @[@ [Added during FAME5Transform]]
);
`ifdef RANDOMIZE_MEM_INIT
  reg [31:0] _RAND_0;
`endif // RANDOMIZE_MEM_INIT
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_1;
`endif // RANDOMIZE_REG_INIT
  wire  childInst_clock; // @[PrintfModule.scala 38:25]
  wire  childInst_reset; // @[PrintfModule.scala 38:25]
  wire  childInst_c; // @[PrintfModule.scala 38:25]
  wire [15:0] childInst_cycle; // @[PrintfModule.scala 38:25]
  wire  childInst_hostClock; // @[PrintfModule.scala 38:25]
  reg [15:0] cycle [0:0]; // @[@ [Added during FAME5Transform] PrintfModule.scala 27:18]
  wire  cycle_read_en; // @[@ [Added during FAME5Transform] @ [Added during FAME5Transform] PrintfModule.scala 27:{18,18}]
  wire  cycle_read_addr; // @[@ [Added during FAME5Transform] @ [Added during FAME5Transform] PrintfModule.scala 27:{18,18}]
  wire [15:0] cycle_read_data; // @[@ [Added during FAME5Transform] PrintfModule.scala 27:18]
  wire [15:0] cycle_write_data; // @[@ [Added during FAME5Transform] @ [Added during FAME5Transform] PrintfModule.scala 27:18 28:18]
  wire  cycle_write_addr; // @[@ [Added during FAME5Transform] @ [Added during FAME5Transform] PrintfModule.scala 27:{18,18}]
  wire  cycle_write_mask; // @[@ [Added during FAME5Transform] @ [Added during FAME5Transform] PrintfModule.scala 27:{18,18}]
  wire  cycle_write_en; // @[@ [Added during FAME5Transform] @ [Added during FAME5Transform] PrintfModule.scala 27:18 28:18]
  reg  threadIdx; // @[@ [Added during FAME5Transform]]
  wire  printf_wire_enable = ~reset; // @[PrintfModule.scala 33:26]
  wire [127:0] wideArgument_lo_lo = {cycle_read_data,cycle_read_data,cycle_read_data,cycle_read_data,cycle_read_data,
    cycle_read_data,cycle_read_data,cycle_read_data}; // @[PrintfModule.scala 35:61]
  wire [271:0] wideArgument_hi = {cycle_read_data,cycle_read_data,cycle_read_data,cycle_read_data,cycle_read_data,
    cycle_read_data,cycle_read_data,cycle_read_data,cycle_read_data,wideArgument_lo_lo}; // @[PrintfModule.scala 35:61]
  wire [527:0] wideArgument = {wideArgument_hi,cycle_read_data,cycle_read_data,cycle_read_data,cycle_read_data,
    cycle_read_data,cycle_read_data,cycle_read_data,cycle_read_data,wideArgument_lo_lo}; // @[PrintfModule.scala 35:61]
  wire [7:0] ch = cycle_read_data[7:0] > 8'h20 & cycle_read_data[7:0] < 8'h7f ? cycle_read_data[7:0] : 8'h20; // @[PrintfModule.scala 42:15]
  wire [1:0] _GEN_0 = ~threadIdx ? 2'h0 : threadIdx + 1'h1; // @[@ [Added during FAME5Transform]]
  PrintfModuleChild_threaded childInst ( // @[PrintfModule.scala 38:25]
    .clock(childInst_clock),
    .reset(childInst_reset),
    .c(childInst_c),
    .cycle(childInst_cycle),
    .hostClock(childInst_hostClock)
  );
  assign cycle_read_en = 1'h1; // @[@ [Added during FAME5Transform] PrintfModule.scala 27:18]
  assign cycle_read_addr = threadIdx; // @[@ [Added during FAME5Transform] PrintfModule.scala 27:18]
  assign cycle_read_data = cycle[cycle_read_addr]; // @[@ [Added during FAME5Transform] PrintfModule.scala 27:18]
  assign cycle_write_data = cycle_read_data + 16'h1; // @[@ [Added during FAME5Transform] PrintfModule.scala 28:18]
  assign cycle_write_addr = threadIdx; // @[@ [Added during FAME5Transform] PrintfModule.scala 27:18]
  assign cycle_write_mask = 1'h1; // @[@ [Added during FAME5Transform] PrintfModule.scala 27:18]
  assign cycle_write_en = 1'h1; // @[@ [Added during FAME5Transform] PrintfModule.scala 28:18]
  assign childInst_clock = clock;
  assign childInst_reset = reset;
  assign childInst_c = io_a; // @[PrintfModule.scala 39:15]
  assign childInst_cycle = cycle_read_data; // @[PrintfModule.scala 40:19]
  assign childInst_hostClock = hostClock; // @[@ [Added during FAME5Transform]]
  always @(posedge clock) begin
    if (cycle_write_en & cycle_write_mask) begin
      cycle[cycle_write_addr] <= cycle_write_data; // @[@ [Added during FAME5Transform] PrintfModule.scala 27:18]
    end
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (printf_wire_enable) begin
          $fwrite(32'h80000002,"SYNTHESIZED_PRINT CYCLE: %d\n",cycle_read_data); // @[PrintfModule.scala 33:26]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (printf_wire_enable) begin
          $fwrite(32'h80000002,"SYNTHESIZED_PRINT CYCLE: %d wideArgument: %x\n",cycle_read_data,wideArgument); // @[PrintfModule.scala 36:26]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (printf_wire_enable) begin
          $fwrite(32'h80000002,"SYNTHESIZED_PRINT CYCLE: %d Char: %c\n",cycle_read_data,ch); // @[PrintfModule.scala 43:26]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
  end
  always @(posedge hostClock) begin
    threadIdx <= _GEN_0[0]; // @[@ [Added during FAME5Transform]]
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_MEM_INIT
  _RAND_0 = {1{`RANDOM}};
  for (initvar = 0; initvar < 1; initvar = initvar+1)
    cycle[initvar] = _RAND_0[15:0];
`endif // RANDOMIZE_MEM_INIT
`ifdef RANDOMIZE_REG_INIT
  _RAND_1 = {1{`RANDOM}};
  threadIdx = _RAND_1[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
`ifndef ABSTRACTCLOCKGATE
`define ABSTRACTCLOCKGATE
module AbstractClockGate(
  input      I,
  input      CE,
  output reg O
);
  /* verilator lint_off COMBDLY */
  reg enable;
  always @(posedge I)
    enable <= CE;
  assign O = (I & enable);
  /* verilator lint_on COMBDLY */
endmodule
`endif
