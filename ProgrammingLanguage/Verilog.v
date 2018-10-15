//verilog

always @( posedge i_9517cfg_CfgClk, negedge i_9517cfg_Arst_n )
begin
    if( ! i_9517cfg_Arst_n )
        int_Cs_n <= 1'b1;
    else if ((int_CsWidthCnt_5b > 7) && (!int_CfgDone))
    int_Cs_n <= 1'b0;
   	else
   	int_Cs_n <= 1'b1;

end
！