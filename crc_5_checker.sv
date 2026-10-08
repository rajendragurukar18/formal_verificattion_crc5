module crc_checker5 (
    input logic [10:0]data_in,
    input logic [4:0]crc5_out, 
    input logic [4:0] crc_stage [0:11]
    //input logic fb
);


property crc5_init;
    crc_stage[0] == 5'h1f;
endproperty

always_comb begin
A_CRC5_INIT : assert property(crc5_init);
end


genvar i;

generate
    for (i = 0; i < 11; i = i + 1) begin : feedback_check

property crc5_feedback;
            crc_stage_gen[i].fb == (data_in[i] ^ crc_stage[i][4]);

// crc_stage_gen[i].fb  --> this is quite different is taken from the design name istaken hierarchical name in this .
//  in design fb is inside the for loop so i canno directly create in above logic part so need to implement in the loop with the design hierachy name only crc_stage_gen[i].fb so it run 11 iteration.
endproperty

        A_CRC5_FEEDBACK : assert property(crc5_feedback);

    end
endgenerate



// below condition is checking for fb=0  -->  theen only shift {no xor operation with polynomial}

genvar j;
generate
    for (j = 0; j < 11; j = j + 1) begin : feedback_check0


property crc5_feedback_zero;
    crc_stage_gen[j].fb ==1'b0 |-> 
                                   crc_stage[j+1] == {crc_stage[j][3:0], 1'b0};
endproperty
always_comb begin
        A_CRC5_FEEDBACK_ZERO  :  assert property (crc5_feedback_zero);
end

end
endgenerate





// for checking the feedback=1  -->  single array checking. -->  crc_stage[0] to crc_stage[10] steb by step

//   crc_stage[0]
property crc5_feedback_one_stage0;
    crc_stage_gen[0].fb == 1'b1 |->
                        crc_stage[1] == ({ crc_stage[0][3:0], 1'b0 }  ^ 5'b00101);
endproperty

always_comb  begin
A_CRC_FEEDBACK_ONE_STAGE0 :  assert property ( crc5_feedback_one_stage0);
end

//   crc_stage[1]
property crc5_feedback_one_stage1;
    crc_stage_gen[1].fb == 1'b1 |->
                        crc_stage[2] == ({ crc_stage[1][3:0], 1'b0 }  ^ 5'b00101);
endproperty

always_comb  begin
A_CRC_FEEDBACK_ONE_STAGE1 :  assert property ( crc5_feedback_one_stage1);
end

//   crc_stage[2]
property crc5_feedback_one_stage2;
    crc_stage_gen[2].fb == 1'b1 |->
                        crc_stage[3] == ({ crc_stage[2][3:0], 1'b0 }  ^ 5'b00101);
endproperty

always_comb  begin
A_CRC_FEEDBACK_ONE_STAGE2 :  assert property ( crc5_feedback_one_stage2);
end

//   crc_stage[3]

property crc5_feedback_one_stage3;
    crc_stage_gen[3].fb == 1'b1 |->
                        crc_stage[4] == ({ crc_stage[3][3:0], 1'b0 }  ^ 5'b00101);
endproperty

always_comb  begin
A_CRC_FEEDBACK_ONE_STAGE3 :  assert property ( crc5_feedback_one_stage3);
end

//   crc_stage[4]
property crc5_feedback_one_stage4;
    crc_stage_gen[4].fb == 1'b1 |->
                        crc_stage[5] == ({ crc_stage[4][3:0], 1'b0 }  ^ 5'b00101);
endproperty

always_comb  begin
A_CRC_FEEDBACK_ONE_STAGE4 :  assert property ( crc5_feedback_one_stage4);
end

//   crc_stage[5]
property crc5_feedback_one_stage5;
    crc_stage_gen[5].fb == 1'b1 |->
                        crc_stage[6] == ({ crc_stage[5][3:0], 1'b0 }  ^ 5'b00101);
endproperty

always_comb  begin
A_CRC_FEEDBACK_ONE_STAGE5 :  assert property ( crc5_feedback_one_stage5);
end

//   crc_stage[6]
property crc5_feedback_one_stage6;
    crc_stage_gen[6].fb == 1'b1 |->
                        crc_stage[7] == ({ crc_stage[6][3:0], 1'b0 }  ^ 5'b00101);
endproperty

always_comb  begin
A_CRC_FEEDBACK_ONE_STAGE6 :  assert property ( crc5_feedback_one_stage6);
end

//   crc_stage[7]
property crc5_feedback_one_stage7;
    crc_stage_gen[7].fb == 1'b1 |->
                        crc_stage[8] == ({ crc_stage[7][3:0], 1'b0 }  ^ 5'b00101);
endproperty

always_comb  begin
A_CRC_FEEDBACK_ONE_STAGE7 :  assert property ( crc5_feedback_one_stage7);
end

//   crc_stage[8]
property crc5_feedback_one_stage8;
    crc_stage_gen[8].fb == 1'b1 |->
                        crc_stage[9] == ({ crc_stage[8][3:0], 1'b0 }  ^ 5'b00101);
endproperty

always_comb  begin
A_CRC_FEEDBACK_ONE_STAGE8 :  assert property ( crc5_feedback_one_stage8);
end

//   crc_stage[9]
property crc5_feedback_one_stage9;
    crc_stage_gen[9].fb == 1'b1 |->
                        crc_stage[10] == ({ crc_stage[9][3:0], 1'b0 }  ^ 5'b00101);
endproperty

always_comb  begin
A_CRC_FEEDBACK_ONE_STAGE9 :  assert property ( crc5_feedback_one_stage9);
end

//   crc_stage[10]
property crc5_feedback_one_stage10;
    crc_stage_gen[10].fb == 1'b1 |->
                        crc_stage[11] == ({ crc_stage[10][3:0], 1'b0 }  ^ 5'b00101);
endproperty

always_comb  begin
A_CRC_FEEDBACK_ONE_STAGE10 :  assert property ( crc5_feedback_one_stage10);
end



property crc5_final_inversion;
    crc5_out == ~crc_stage[11];
endproperty

always_comb  begin
A_CRC5_FINAL_INVERSION :  assert property(crc5_final_inversion);
end



endmodule

 
 bind crc5_gen  crc_checker5  crc_instance(
    .data_in(data_in),
    .crc5_out(crc5_out),
    .crc_stage(crc_stage)
    //.fb(fb)
    );
