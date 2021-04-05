--////////////////////////////////////////////////////////////////////////////////

--// COMPANY:    COSIC, KU Leuven 
--// AUTHOR:     Victor Arribas

--////////////////////////////////////////////////////////////////////////////////

--// BSD 3-Clause License

--// Copyright (c) 2019, Victor Arribas
--// All rights reserved.

--// Redistribution and use in source and binary forms, with or without
--// modification, are permitted provided that the following conditions are met:

--// 1. Redistributions of source code must retain the above copyright notice, this
--//    list of conditions and the following disclaimer.

--// 2. Redistributions in binary form must reproduce the above copyright notice,
--//    this list of conditions and the following disclaimer in the documentation
--//    and/or other materials provided with the distribution.

--// 3. Neither the name of the copyright holder nor the names of its
--//    contributors may be used to endorse or promote products derived from
--//    this software without specific prior written permission.

--// THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
--// AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
--// IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
--// DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE
--// FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
--// DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
--// SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
--// CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY,
--// OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
--// OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

--////////////////////////////////////////////////////////////////////////////////


##49 SLICES
#
##INST "control_mod/count_reg_5_1" AREA_GROUP = "KECCAK";
##INST "control_mod/Result<4>1" AREA_GROUP = "KECCAK";
##INST "control_mod/Result<3>1" AREA_GROUP = "KECCAK";
##INST "control_mod/count_reg_3_1" AREA_GROUP = "KECCAK";
##INST "control_mod/count_reg_4_1" AREA_GROUP = "KECCAK";
##INST "control_mod/count_reg_2_1" AREA_GROUP = "KECCAK";
##INST "control_mod/count_reg_1_1" AREA_GROUP = "KECCAK";
##INST "Mmux_r_con18" AREA_GROUP = "KECCAK";
##INST "Mmux_r_con16" AREA_GROUP = "KECCAK";
##INST "Mmux_r_con114_G" AREA_GROUP = "KECCAK";
##INST "Mmux_r_con114_F" AREA_GROUP = "KECCAK";
##INST "Mmux_r_con116" AREA_GROUP = "KECCAK";
##INST "Mmux_r_con116_SW0" AREA_GROUP = "KECCAK";
##INST "theta_perm/Mmux_address_parity_rs_xor<5>111_SW1" AREA_GROUP = "KECCAK";
##INST "theta_perm/Mmux_address_parity_rs_xor<5>12" AREA_GROUP = "KECCAK";
##INST "theta_perm/Mmux_address_parity_rs_xor<5>111_SW0" AREA_GROUP = "KECCAK";
##INST "theta_perm/Mmux_address_parity_rs_lut<1>1" AREA_GROUP = "KECCAK";
##INST "theta_perm/Mmux_address_parity_rs_xor<2>11_SW0" AREA_GROUP = "KECCAK";
##INST "state_regss/rst_input[0].calc_keccak_in_init" AREA_GROUP = "KECCAK";
##INST "control_mod/calc_gr_n_sm_382_447_3" AREA_GROUP = "KECCAK";
##INST "control_mod/or_latch_pi_sh" AREA_GROUP = "KECCAK";
##INST "control_mod/or_latch_slice_sh" AREA_GROUP = "KECCAK";
##INST "control_mod/calc_gr_n_sm_446_767_2" AREA_GROUP = "KECCAK";
##INST "control_mod/calc_765" AREA_GROUP = "KECCAK";
##INST "control_mod/calc_62" AREA_GROUP = "KECCAK";
##INST "control_mod/calc_gr_n_sm_318_383_2" AREA_GROUP = "KECCAK";
##INST "control_mod/calc_gr_n_sm_382_447_2" AREA_GROUP = "KECCAK";
##INST "control_mod/calc_319" AREA_GROUP = "KECCAK";
##INST "control_mod/calc_383" AREA_GROUP = "KECCAK";
##INST "control_mod/calc_447" AREA_GROUP = "KECCAK";
##INST "control_mod/calc_gr_n_sm_318_383_3" AREA_GROUP = "KECCAK";
##INST "rho_perm/or_latch02" AREA_GROUP = "KECCAK";
##INST "rho_perm/or_latch03" AREA_GROUP = "KECCAK";
##INST "rho_perm/or_latch04" AREA_GROUP = "KECCAK";
##INST "rho_perm/or_latch32" AREA_GROUP = "KECCAK";
##INST "rho_perm/or_latch44" AREA_GROUP = "KECCAK";
##INST "rho_perm/or_latch11" AREA_GROUP = "KECCAK";
##INST "rho_perm/or_latch22" AREA_GROUP = "KECCAK";
##INST "rho_perm/or_latch10" AREA_GROUP = "KECCAK";
##INST "rho_perm/or_latch12" AREA_GROUP = "KECCAK";
##INST "rho_perm/or_latch34" AREA_GROUP = "KECCAK";
##INST "rho_perm/or_latch13" AREA_GROUP = "KECCAK";
##INST "rho_perm/or_latch43" AREA_GROUP = "KECCAK";
##INST "rho_perm/or_latch14" AREA_GROUP = "KECCAK";
##INST "rho_perm/or_latch40" AREA_GROUP = "KECCAK";
##INST "rho_perm/or_latch20" AREA_GROUP = "KECCAK";
##INST "rho_perm/or_latch41" AREA_GROUP = "KECCAK";
##INST "rho_perm/or_latch21" AREA_GROUP = "KECCAK";
##INST "rho_perm/or_latch24" AREA_GROUP = "KECCAK";
##INST "theta_perm/or_latch_we_parity_mem_OR_absorpt" AREA_GROUP = "KECCAK";
##INST "theta_perm/or_latch_eq_67_OR_absorpt" AREA_GROUP = "KECCAK";
##INST "control_mod/Mcount_round_reg_xor<0>11_INV_0" AREA_GROUP = "KECCAK";
#INST "control_mod/LUT6_2_inst383" AREA_GROUP = "KECCAK";
#INST "chi_n_iota_perms/LUT5_inst" AREA_GROUP = "KECCAK";
#INST "control_mod/LUT6_2_inst318" AREA_GROUP = "KECCAK";
#INST "control_mod/Mcount_count_reg_cy<2>" AREA_GROUP = "KECCAK";
#INST "control_mod/Mcount_count_reg_xor<2>" AREA_GROUP = "KECCAK";
#INST "control_mod/Mcount_count_reg_cy<3>" AREA_GROUP = "KECCAK";
#INST "control_mod/Mcount_count_reg_xor<3>" AREA_GROUP = "KECCAK";
#INST "control_mod/Mcount_count_reg_cy<4>" AREA_GROUP = "KECCAK";
#INST "control_mod/Mcount_count_reg_xor<4>" AREA_GROUP = "KECCAK";
#INST "control_mod/Mcount_count_reg_cy<5>" AREA_GROUP = "KECCAK";
#INST "control_mod/Mcount_count_reg_xor<5>" AREA_GROUP = "KECCAK";
#INST "control_mod/Mcount_count_reg_cy<6>" AREA_GROUP = "KECCAK";
#INST "control_mod/Mcount_count_reg_xor<6>" AREA_GROUP = "KECCAK";
#INST "control_mod/Mcount_count_reg_cy<7>" AREA_GROUP = "KECCAK";
#INST "control_mod/Mcount_count_reg_xor<7>" AREA_GROUP = "KECCAK";
#INST "control_mod/Mcount_count_reg_cy<8>" AREA_GROUP = "KECCAK";
#INST "control_mod/Mcount_count_reg_xor<8>" AREA_GROUP = "KECCAK";
#INST "control_mod/Mcount_count_reg_xor<9>" AREA_GROUP = "KECCAK";
#INST "control_mod/calc_gr_n_sm_446_767_3" AREA_GROUP = "KECCAK";
#INST "control_mod/LUT6_2_inst319" AREA_GROUP = "KECCAK";
#INST "control_mod/round_reg_0" AREA_GROUP = "KECCAK";
#INST "control_mod/round_reg_1" AREA_GROUP = "KECCAK";
#INST "control_mod/round_reg_2" AREA_GROUP = "KECCAK";
#INST "control_mod/round_reg_3" AREA_GROUP = "KECCAK";
#INST "control_mod/round_reg_4" AREA_GROUP = "KECCAK";
#INST "control_mod/count_reg_0" AREA_GROUP = "KECCAK";
#INST "control_mod/count_reg_1" AREA_GROUP = "KECCAK";
#INST "control_mod/count_reg_2" AREA_GROUP = "KECCAK";
#INST "control_mod/count_reg_3" AREA_GROUP = "KECCAK";
#INST "control_mod/count_reg_4" AREA_GROUP = "KECCAK";
#INST "control_mod/count_reg_6" AREA_GROUP = "KECCAK";
#INST "control_mod/count_reg_7" AREA_GROUP = "KECCAK";
#INST "control_mod/count_reg_8" AREA_GROUP = "KECCAK";
#INST "control_mod/count_reg_9" AREA_GROUP = "KECCAK";
#INST "control_mod/count_reg_5" AREA_GROUP = "KECCAK";
#INST "control_mod/Mcount_count_reg_cy<0>" AREA_GROUP = "KECCAK";
#INST "control_mod/Mcount_count_reg_xor<0>" AREA_GROUP = "KECCAK";
#INST "control_mod/Mcount_count_reg_cy<1>" AREA_GROUP = "KECCAK";
#INST "control_mod/Mcount_count_reg_xor<1>" AREA_GROUP = "KECCAK";
#INST "control_mod/LUT6_2_inst62" AREA_GROUP = "KECCAK";
#INST "chi_n_iota_perms/LUT6_2_inst_2" AREA_GROUP = "KECCAK";
#INST "control_mod/eq_765_reg" AREA_GROUP = "KECCAK";
#INST "control_mod/eq_765_reg_reg" AREA_GROUP = "KECCAK";
#INST "control_mod/eq_62_reg" AREA_GROUP = "KECCAK";
#INST "chi_n_iota_perms/LUT6_2_inst" AREA_GROUP = "KECCAK";
#INST "control_mod/LUT6_2_inst765" AREA_GROUP = "KECCAK";
#INST "control_mod/Mcount_round_reg_xor<1>11" AREA_GROUP = "KECCAK";
#INST "control_mod/Mcount_count_reg_val1" AREA_GROUP = "KECCAK";
#INST "control_mod/Mcount_round_reg_xor<2>11" AREA_GROUP = "KECCAK";
#INST "control_mod/Mcount_count_reg_xor<9>_rt" AREA_GROUP = "KECCAK";
#INST "control_mod/Mcount_count_reg_cy<1>_rt" AREA_GROUP = "KECCAK";
#INST "control_mod/Mcount_count_reg_cy<2>_rt" AREA_GROUP = "KECCAK";
#INST "control_mod/Mcount_count_reg_cy<3>_rt" AREA_GROUP = "KECCAK";
#INST "control_mod/Mcount_count_reg_cy<4>_rt" AREA_GROUP = "KECCAK";
#INST "control_mod/Mcount_count_reg_cy<5>_rt" AREA_GROUP = "KECCAK";
#INST "control_mod/Mcount_count_reg_cy<6>_rt" AREA_GROUP = "KECCAK";
#INST "control_mod/Mcount_count_reg_cy<7>_rt" AREA_GROUP = "KECCAK";
#INST "control_mod/Mcount_count_reg_cy<8>_rt" AREA_GROUP = "KECCAK";
#INST "control_mod/Mcount_count_reg_lut<0>_INV_0" AREA_GROUP = "KECCAK";
#INST "control_mod/LUT6_2_inst447" AREA_GROUP = "KECCAK";
#INST "keccak_out<4>1" AREA_GROUP = "KECCAK";
#INST "rho_perm/LUT6_2_inst10" AREA_GROUP = "KECCAK";
#INST "LUT6_2_keccak_out23" AREA_GROUP = "KECCAK";
#INST "LUT6_2_keccak_out01" AREA_GROUP = "KECCAK";
#INST "rho_perm/LUT6_2_inst24" AREA_GROUP = "KECCAK";
#INST "rho_perm/LUT6_3_inst" AREA_GROUP = "KECCAK";
#INST "rho_perm/LUT6_1_inst10_good" AREA_GROUP = "KECCAK";
#INST "rho_perm/LUT6_2_inst14" AREA_GROUP = "KECCAK";
#INST "rho_perm/LUT6_1_inst" AREA_GROUP = "KECCAK";
#INST "rho_perm/LUT6_2_inst34" AREA_GROUP = "KECCAK";
#INST "rho_perm/LUT6_1_inst21" AREA_GROUP = "KECCAK";
#INST "rho_perm/LUT6_2_inst" AREA_GROUP = "KECCAK";
#INST "rho_perm/LUT6_2_inst31" AREA_GROUP = "KECCAK";
#INST "rho_perm/LUT6_2_inst33" AREA_GROUP = "KECCAK";
#INST "rho_perm/LUT6_2_inst22" AREA_GROUP = "KECCAK";
#INST "rho_perm/LUT6_inst41" AREA_GROUP = "KECCAK";
#INST "rho_perm/LUT6_2_inst44" AREA_GROUP = "KECCAK";
#INST "Mmux_state_en<2>31" AREA_GROUP = "KECCAK";
#INST "Mmux_state_en<2>41" AREA_GROUP = "KECCAK";
#INST "Mmux_state_en<2>51" AREA_GROUP = "KECCAK";
#INST "Mmux_state_en<1>11" AREA_GROUP = "KECCAK";
#INST "Mmux_state_en<1>21" AREA_GROUP = "KECCAK";
#INST "Mmux_state_en<1>31" AREA_GROUP = "KECCAK";
#INST "Mmux_state_en<1>41" AREA_GROUP = "KECCAK";
#INST "Mmux_state_en<1>51" AREA_GROUP = "KECCAK";
#INST "Mmux_state_en<0>21" AREA_GROUP = "KECCAK";
#INST "Mmux_state_en<0>31" AREA_GROUP = "KECCAK";
#INST "Mmux_state_en<0>41" AREA_GROUP = "KECCAK";
#INST "Mmux_state_en<0>51" AREA_GROUP = "KECCAK";
#INST "rho_perm/LUT6_1_inst11" AREA_GROUP = "KECCAK";
#INST "rho_perm/LUT6_1_inst13" AREA_GROUP = "KECCAK";
#INST "rho_perm/LUT6_1_inst14" AREA_GROUP = "KECCAK";
#INST "Mmux_state_en<4>11" AREA_GROUP = "KECCAK";
#INST "Mmux_state_en<4>21" AREA_GROUP = "KECCAK";
#INST "Mmux_state_en<4>31" AREA_GROUP = "KECCAK";
#INST "Mmux_state_en<4>41" AREA_GROUP = "KECCAK";
#INST "Mmux_state_en<4>51" AREA_GROUP = "KECCAK";
#INST "Mmux_state_en<3>11" AREA_GROUP = "KECCAK";
#INST "Mmux_state_en<3>21" AREA_GROUP = "KECCAK";
#INST "Mmux_state_en<3>31" AREA_GROUP = "KECCAK";
#INST "Mmux_state_en<3>41" AREA_GROUP = "KECCAK";
#INST "Mmux_state_en<3>51" AREA_GROUP = "KECCAK";
#INST "Mmux_state_en<2>11" AREA_GROUP = "KECCAK";
#INST "Mmux_state_en<2>21" AREA_GROUP = "KECCAK";
#INST "Mmux_r_con110" AREA_GROUP = "KECCAK";
#INST "Mmux_r_con19" AREA_GROUP = "KECCAK";
#INST "Mmux_r_con15" AREA_GROUP = "KECCAK";
#INST "Mmux_r_con14" AREA_GROUP = "KECCAK";
#INST "Mmux_r_con13" AREA_GROUP = "KECCAK";
#INST "Mmux_r_con12" AREA_GROUP = "KECCAK";
#INST "Mmux_r_con11" AREA_GROUP = "KECCAK";
#INST "Mmux_r_con114" AREA_GROUP = "KECCAK";
#INST "state_regss/plane_4/SRLC32E_inst_0_2" AREA_GROUP = "KECCAK";
#INST "state_regss/plane_4/SRLC32E_inst_1_1" AREA_GROUP = "KECCAK";
#INST "state_regss/plane_4/SRLC32E_inst_1_2" AREA_GROUP = "KECCAK";
#INST "state_regss/plane_4/SRLC32E_inst_2_1" AREA_GROUP = "KECCAK";
#INST "state_regss/plane_4/SRLC32E_inst_2_2" AREA_GROUP = "KECCAK";
#INST "state_regss/plane_4/SRLC32E_inst_3_1" AREA_GROUP = "KECCAK";
#INST "state_regss/plane_4/SRLC32E_inst_3_2" AREA_GROUP = "KECCAK";
#INST "state_regss/plane_4/SRLC32E_inst_4_1" AREA_GROUP = "KECCAK";
#INST "state_regss/plane_4/SRLC32E_inst_4_2" AREA_GROUP = "KECCAK";
#INST "state_regss/rst_input[1].calc_keccak_in_init" AREA_GROUP = "KECCAK";
#INST "state_regss/rst_input[2].calc_keccak_in_init" AREA_GROUP = "KECCAK";
#INST "state_regss/rst_input[3].calc_keccak_in_init" AREA_GROUP = "KECCAK";
#INST "state_regss/rst_input[4].calc_keccak_in_init" AREA_GROUP = "KECCAK";
#INST "state_regss/abs_input[1].calc_keccak_in_init" AREA_GROUP = "KECCAK";
#INST "state_regss/abs_input[2].calc_keccak_in_init" AREA_GROUP = "KECCAK";
#INST "state_regss/abs_input[0].calc_keccak_in_init" AREA_GROUP = "KECCAK";
#INST "state_regss/abs_input[3].calc_keccak_in_init" AREA_GROUP = "KECCAK";
#INST "state_regss/abs_input[4].calc_keccak_in_init" AREA_GROUP = "KECCAK";
#INST "theta_perm/parities/theta_addddresses[4].RAM64X1S_inst" AREA_GROUP = "KECCAK";
#INST "theta_perm/parities/theta_addddresses[2].RAM64X1S_inst" AREA_GROUP = "KECCAK";
#INST "state_regss/plane_3/SRLC32E_inst_1_1" AREA_GROUP = "KECCAK";
#INST "state_regss/plane_3/SRLC32E_inst_1_2" AREA_GROUP = "KECCAK";
#INST "state_regss/plane_3/SRLC32E_inst_2_1" AREA_GROUP = "KECCAK";
#INST "state_regss/plane_3/SRLC32E_inst_2_2" AREA_GROUP = "KECCAK";
#INST "state_regss/plane_3/SRLC32E_inst_3_1" AREA_GROUP = "KECCAK";
#INST "state_regss/plane_3/SRLC32E_inst_3_2" AREA_GROUP = "KECCAK";
#INST "state_regss/plane_3/SRLC32E_inst_4_1" AREA_GROUP = "KECCAK";
#INST "state_regss/plane_3/SRLC32E_inst_4_2" AREA_GROUP = "KECCAK";
#INST "state_regss/plane_4/SRLC32E_inst_0_1" AREA_GROUP = "KECCAK";
#INST "state_regss/plane_1/SRLC32E_inst_3_1" AREA_GROUP = "KECCAK";
#INST "state_regss/plane_1/SRLC32E_inst_3_2" AREA_GROUP = "KECCAK";
#INST "state_regss/plane_1/SRLC32E_inst_4_1" AREA_GROUP = "KECCAK";
#INST "state_regss/plane_1/SRLC32E_inst_4_2" AREA_GROUP = "KECCAK";
#INST "state_regss/plane_2/SRLC32E_inst_0_1" AREA_GROUP = "KECCAK";
#INST "state_regss/plane_2/SRLC32E_inst_0_2" AREA_GROUP = "KECCAK";
#INST "state_regss/plane_2/SRLC32E_inst_1_1" AREA_GROUP = "KECCAK";
#INST "state_regss/plane_2/SRLC32E_inst_1_2" AREA_GROUP = "KECCAK";
#INST "state_regss/plane_2/SRLC32E_inst_2_1" AREA_GROUP = "KECCAK";
#INST "state_regss/plane_2/SRLC32E_inst_2_2" AREA_GROUP = "KECCAK";
#INST "state_regss/plane_2/SRLC32E_inst_3_1" AREA_GROUP = "KECCAK";
#INST "state_regss/plane_2/SRLC32E_inst_3_2" AREA_GROUP = "KECCAK";
#INST "state_regss/plane_2/SRLC32E_inst_4_1" AREA_GROUP = "KECCAK";
#INST "state_regss/plane_2/SRLC32E_inst_4_2" AREA_GROUP = "KECCAK";
#INST "state_regss/plane_3/SRLC32E_inst_0_1" AREA_GROUP = "KECCAK";
#INST "state_regss/plane_3/SRLC32E_inst_0_2" AREA_GROUP = "KECCAK";
#INST "state_regss/plane_0/SRLC32E_inst_3_1" AREA_GROUP = "KECCAK";
#INST "state_regss/plane_0/SRLC32E_inst_3_2" AREA_GROUP = "KECCAK";
#INST "state_regss/plane_0/SRLC32E_inst_4_1" AREA_GROUP = "KECCAK";
#INST "state_regss/plane_0/SRLC32E_inst_4_2" AREA_GROUP = "KECCAK";
#INST "state_regss/plane_1/SRLC32E_inst_0_1" AREA_GROUP = "KECCAK";
#INST "state_regss/plane_1/SRLC32E_inst_0_2" AREA_GROUP = "KECCAK";
#INST "state_regss/plane_1/SRLC32E_inst_1_1" AREA_GROUP = "KECCAK";
#INST "state_regss/plane_1/SRLC32E_inst_1_2" AREA_GROUP = "KECCAK";
#INST "state_regss/plane_1/SRLC32E_inst_2_1" AREA_GROUP = "KECCAK";
#INST "state_regss/plane_1/SRLC32E_inst_2_2" AREA_GROUP = "KECCAK";
#INST "theta_perm/calc_sm_63" AREA_GROUP = "KECCAK";
#INST "theta_perm/theta_perm/LUT5_inst_4" AREA_GROUP = "KECCAK";
#INST "theta_perm/theta_perm/LUT5_inst_3" AREA_GROUP = "KECCAK";
#INST "theta_perm/theta_perm/LUT5_inst_2" AREA_GROUP = "KECCAK";
#INST "theta_perm/theta_perm/LUT5_inst_1" AREA_GROUP = "KECCAK";
#INST "state_regss/plane_0/SRLC32E_inst_0_1" AREA_GROUP = "KECCAK";
#INST "state_regss/plane_0/SRLC32E_inst_0_2" AREA_GROUP = "KECCAK";
#INST "state_regss/plane_0/SRLC32E_inst_1_1" AREA_GROUP = "KECCAK";
#INST "state_regss/plane_0/SRLC32E_inst_1_2" AREA_GROUP = "KECCAK";
#INST "state_regss/plane_0/SRLC32E_inst_2_1" AREA_GROUP = "KECCAK";
#INST "state_regss/plane_0/SRLC32E_inst_2_2" AREA_GROUP = "KECCAK";
#INST "theta_perm/parity_last_reg_4" AREA_GROUP = "KECCAK";
#INST "theta_perm/parity_last_reg_3" AREA_GROUP = "KECCAK";
#INST "theta_perm/parity_last_reg_2" AREA_GROUP = "KECCAK";
#INST "theta_perm/parity_last_reg_1" AREA_GROUP = "KECCAK";
#INST "theta_perm/parity_last_reg_0" AREA_GROUP = "KECCAK";
#INST "theta_perm/parity_reg_4" AREA_GROUP = "KECCAK";
#INST "theta_perm/parity_reg_3" AREA_GROUP = "KECCAK";
#INST "theta_perm/parity_reg_2" AREA_GROUP = "KECCAK";
#INST "theta_perm/parity_reg_1" AREA_GROUP = "KECCAK";
#INST "theta_perm/parity_reg_0" AREA_GROUP = "KECCAK";
#INST "theta_perm/parities/theta_addddresses[0].RAM64X1S_inst" AREA_GROUP = "KECCAK";
#INST "theta_perm/parities/theta_addddresses[3].RAM64X1S_inst" AREA_GROUP = "KECCAK";
#INST "theta_perm/parities/theta_addddresses[1].RAM64X1S_inst" AREA_GROUP = "KECCAK";
#INST "state_regss/Mmux_row_in_331" AREA_GROUP = "KECCAK";
#INST "state_regss/Mmux_row_in_321" AREA_GROUP = "KECCAK";
#INST "state_regss/Mmux_row_in_311" AREA_GROUP = "KECCAK";
#INST "state_regss/Mmux_row_in_251" AREA_GROUP = "KECCAK";
#INST "state_regss/Mmux_row_in_241" AREA_GROUP = "KECCAK";
#INST "state_regss/Mmux_row_in_231" AREA_GROUP = "KECCAK";
#INST "state_regss/Mmux_row_in_221" AREA_GROUP = "KECCAK";
#INST "state_regss/Mmux_row_in_211" AREA_GROUP = "KECCAK";
#INST "state_regss/Mmux_row_in_151" AREA_GROUP = "KECCAK";
#INST "state_regss/Mmux_row_in_141" AREA_GROUP = "KECCAK";
#INST "state_regss/Mmux_row_in_131" AREA_GROUP = "KECCAK";
#INST "state_regss/Mmux_row_in_121" AREA_GROUP = "KECCAK";
#INST "state_regss/Mmux_row_in_111" AREA_GROUP = "KECCAK";
#INST "state_regss/Mmux_row_in_0<2>11" AREA_GROUP = "KECCAK";
#INST "state_regss/Mmux_row_in_0<3>11" AREA_GROUP = "KECCAK";
#INST "state_regss/Mmux_row_in_0<4>11" AREA_GROUP = "KECCAK";
#INST "state_regss/Mmux_row_in_0<1>11" AREA_GROUP = "KECCAK";
#INST "theta_perm/we_parity_mem1" AREA_GROUP = "KECCAK";
#INST "theta_perm/Mmux_parity_this51" AREA_GROUP = "KECCAK";
#INST "theta_perm/Mmux_parity_this41" AREA_GROUP = "KECCAK";
#INST "theta_perm/Mmux_parity_this31" AREA_GROUP = "KECCAK";
#INST "theta_perm/Mmux_parity_this21" AREA_GROUP = "KECCAK";
#INST "theta_perm/Mmux_parity_this11" AREA_GROUP = "KECCAK";
#INST "theta_perm/mux91" AREA_GROUP = "KECCAK";
#INST "theta_perm/mux81" AREA_GROUP = "KECCAK";
#INST "theta_perm/mux71" AREA_GROUP = "KECCAK";
#INST "theta_perm/mux61" AREA_GROUP = "KECCAK";
#INST "theta_perm/mux51" AREA_GROUP = "KECCAK";
#INST "state_regss/Mmux_row_in_0<0>11" AREA_GROUP = "KECCAK";
#INST "state_regss/Mmux_row_in_451" AREA_GROUP = "KECCAK";
#INST "state_regss/Mmux_row_in_441" AREA_GROUP = "KECCAK";
#INST "state_regss/Mmux_row_in_431" AREA_GROUP = "KECCAK";
#INST "state_regss/Mmux_row_in_421" AREA_GROUP = "KECCAK";
#INST "state_regss/Mmux_row_in_411" AREA_GROUP = "KECCAK";
#INST "state_regss/Mmux_row_in_351" AREA_GROUP = "KECCAK";
#INST "state_regss/Mmux_row_in_341" AREA_GROUP = "KECCAK";
#INST "theta_perm/Mmux_address_parity_rs_lut<0>1" AREA_GROUP = "KECCAK";
#INST "theta_perm/Mmux_address_parity_rs_xor<3>11" AREA_GROUP = "KECCAK";
#INST "state_regss/not_absorpt1_INV_0" AREA_GROUP = "KECCAK";
#INST "state_regss/Mxor_row_in_xor_kecc_in<4>_xo<0>1" AREA_GROUP = "KECCAK";
#INST "state_regss/Mxor_row_in_xor_kecc_in<3>_xo<0>1" AREA_GROUP = "KECCAK";
#INST "state_regss/Mxor_row_in_xor_kecc_in<2>_xo<0>1" AREA_GROUP = "KECCAK";
#INST "state_regss/Mxor_row_in_xor_kecc_in<1>_xo<0>1" AREA_GROUP = "KECCAK";
#INST "state_regss/Mxor_row_in_xor_kecc_in<0>_xo<0>1" AREA_GROUP = "KECCAK";
#INST "theta_perm/Mmux_address_parity_rs_xor<2>11" AREA_GROUP = "KECCAK";
#INST "theta_perm/Mmux_address_parity_rs_xor<1>11" AREA_GROUP = "KECCAK";
#INST "theta_perm/Mmux_address_parity_rs_xor<4>11" AREA_GROUP = "KECCAK";
#AREA_GROUP "KECCAK" RANGE=SLICE_X2Y70:SLICE_X9Y79;
#
#


INST "LUT6_2_keccak_out01" AREA_GROUP = "pblock_1";
INST "state_regss/plane_4/SRLC32E_inst_4_1" AREA_GROUP = "pblock_1";
INST "state_regss/plane_4/SRLC32E_inst_4_2" AREA_GROUP = "pblock_1";
INST "state_regss/rst_input[0].calc_keccak_in_init" AREA_GROUP = "pblock_1";
INST "state_regss/rst_input[1].calc_keccak_in_init" AREA_GROUP = "pblock_1";
INST "state_regss/rst_input[2].calc_keccak_in_init" AREA_GROUP = "pblock_1";
INST "state_regss/rst_input[3].calc_keccak_in_init" AREA_GROUP = "pblock_1";
INST "state_regss/rst_input[4].calc_keccak_in_init" AREA_GROUP = "pblock_1";
INST "state_regss/abs_input[1].calc_keccak_in_init" AREA_GROUP = "pblock_1";
INST "state_regss/abs_input[2].calc_keccak_in_init" AREA_GROUP = "pblock_1";
INST "state_regss/abs_input[0].calc_keccak_in_init" AREA_GROUP = "pblock_1";
INST "state_regss/abs_input[3].calc_keccak_in_init" AREA_GROUP = "pblock_1";
INST "state_regss/abs_input[4].calc_keccak_in_init" AREA_GROUP = "pblock_1";
INST "chi_n_iota_perms/LUT5_inst" AREA_GROUP = "pblock_1";
INST "theta_perm/parities/theta_addddresses[0].RAM64X1S_inst" AREA_GROUP = "pblock_1";
INST "chi_n_iota_perms/LUT6_2_inst" AREA_GROUP = "pblock_1";
INST "LUT6_2_keccak_out23" AREA_GROUP = "pblock_1";
INST "chi_n_iota_perms/LUT6_2_inst_2" AREA_GROUP = "pblock_1";
INST "XST_GND" AREA_GROUP = "pblock_1";
INST "XST_VCC" AREA_GROUP = "pblock_1";
INST "state_regss/plane_3/SRLC32E_inst_4_1" AREA_GROUP = "pblock_1";
INST "state_regss/plane_3/SRLC32E_inst_4_2" AREA_GROUP = "pblock_1";
INST "state_regss/plane_4/SRLC32E_inst_0_1" AREA_GROUP = "pblock_1";
INST "state_regss/plane_4/SRLC32E_inst_0_2" AREA_GROUP = "pblock_1";
INST "state_regss/plane_4/SRLC32E_inst_1_1" AREA_GROUP = "pblock_1";
INST "state_regss/plane_4/SRLC32E_inst_1_2" AREA_GROUP = "pblock_1";
INST "state_regss/plane_4/SRLC32E_inst_2_1" AREA_GROUP = "pblock_1";
INST "state_regss/plane_4/SRLC32E_inst_2_2" AREA_GROUP = "pblock_1";
INST "state_regss/plane_4/SRLC32E_inst_3_1" AREA_GROUP = "pblock_1";
INST "state_regss/plane_4/SRLC32E_inst_3_2" AREA_GROUP = "pblock_1";
INST "state_regss/plane_2/SRLC32E_inst_1_1" AREA_GROUP = "pblock_1";
INST "state_regss/plane_2/SRLC32E_inst_1_2" AREA_GROUP = "pblock_1";
INST "state_regss/plane_2/SRLC32E_inst_2_1" AREA_GROUP = "pblock_1";
INST "state_regss/plane_2/SRLC32E_inst_2_2" AREA_GROUP = "pblock_1";
INST "state_regss/plane_2/SRLC32E_inst_3_1" AREA_GROUP = "pblock_1";
INST "state_regss/plane_2/SRLC32E_inst_3_2" AREA_GROUP = "pblock_1";
INST "state_regss/plane_2/SRLC32E_inst_4_1" AREA_GROUP = "pblock_1";
INST "state_regss/plane_2/SRLC32E_inst_4_2" AREA_GROUP = "pblock_1";
INST "state_regss/plane_3/SRLC32E_inst_0_1" AREA_GROUP = "pblock_1";
INST "state_regss/plane_3/SRLC32E_inst_0_2" AREA_GROUP = "pblock_1";
INST "state_regss/plane_3/SRLC32E_inst_1_1" AREA_GROUP = "pblock_1";
INST "state_regss/plane_3/SRLC32E_inst_1_2" AREA_GROUP = "pblock_1";
INST "state_regss/plane_3/SRLC32E_inst_2_1" AREA_GROUP = "pblock_1";
INST "state_regss/plane_3/SRLC32E_inst_2_2" AREA_GROUP = "pblock_1";
INST "state_regss/plane_3/SRLC32E_inst_3_1" AREA_GROUP = "pblock_1";
INST "state_regss/plane_3/SRLC32E_inst_3_2" AREA_GROUP = "pblock_1";
INST "state_regss/plane_1/SRLC32E_inst_1_2" AREA_GROUP = "pblock_1";
INST "state_regss/plane_1/SRLC32E_inst_2_1" AREA_GROUP = "pblock_1";
INST "state_regss/plane_1/SRLC32E_inst_2_2" AREA_GROUP = "pblock_1";
INST "state_regss/plane_1/SRLC32E_inst_3_1" AREA_GROUP = "pblock_1";
INST "state_regss/plane_1/SRLC32E_inst_3_2" AREA_GROUP = "pblock_1";
INST "state_regss/plane_1/SRLC32E_inst_4_1" AREA_GROUP = "pblock_1";
INST "state_regss/plane_1/SRLC32E_inst_4_2" AREA_GROUP = "pblock_1";
INST "state_regss/plane_2/SRLC32E_inst_0_1" AREA_GROUP = "pblock_1";
INST "state_regss/plane_2/SRLC32E_inst_0_2" AREA_GROUP = "pblock_1";
INST "theta_perm/parities/theta_addddresses[2].RAM64X1S_inst" AREA_GROUP = "pblock_1";
INST "theta_perm/parities/theta_addddresses[1].RAM64X1S_inst" AREA_GROUP = "pblock_1";
INST "state_regss/plane_0/SRLC32E_inst_0_1" AREA_GROUP = "pblock_1";
INST "state_regss/plane_0/SRLC32E_inst_0_2" AREA_GROUP = "pblock_1";
INST "state_regss/plane_0/SRLC32E_inst_1_1" AREA_GROUP = "pblock_1";
INST "state_regss/plane_0/SRLC32E_inst_1_2" AREA_GROUP = "pblock_1";
INST "state_regss/plane_0/SRLC32E_inst_2_1" AREA_GROUP = "pblock_1";
INST "state_regss/plane_0/SRLC32E_inst_2_2" AREA_GROUP = "pblock_1";
INST "state_regss/plane_0/SRLC32E_inst_3_1" AREA_GROUP = "pblock_1";
INST "state_regss/plane_0/SRLC32E_inst_3_2" AREA_GROUP = "pblock_1";
INST "state_regss/plane_0/SRLC32E_inst_4_1" AREA_GROUP = "pblock_1";
INST "state_regss/plane_0/SRLC32E_inst_4_2" AREA_GROUP = "pblock_1";
INST "state_regss/plane_1/SRLC32E_inst_0_1" AREA_GROUP = "pblock_1";
INST "state_regss/plane_1/SRLC32E_inst_0_2" AREA_GROUP = "pblock_1";
INST "state_regss/plane_1/SRLC32E_inst_1_1" AREA_GROUP = "pblock_1";
INST "theta_perm/parity_last_reg_4" AREA_GROUP = "pblock_1";
INST "theta_perm/parity_last_reg_3" AREA_GROUP = "pblock_1";
INST "theta_perm/parity_last_reg_2" AREA_GROUP = "pblock_1";
INST "theta_perm/parity_last_reg_1" AREA_GROUP = "pblock_1";
INST "theta_perm/parity_last_reg_0" AREA_GROUP = "pblock_1";
INST "control_mod/LUT6_1_inst_and2" AREA_GROUP = "pblock_1";
INST "theta_perm/calc_sm_63" AREA_GROUP = "pblock_1";
INST "theta_perm/theta_perm/LUT5_inst_4" AREA_GROUP = "pblock_1";
INST "theta_perm/theta_perm/LUT5_inst_3" AREA_GROUP = "pblock_1";
INST "theta_perm/theta_perm/LUT5_inst_2" AREA_GROUP = "pblock_1";
INST "theta_perm/theta_perm/LUT5_inst_1" AREA_GROUP = "pblock_1";
INST "theta_perm/theta_perm/LUT5_inst_0" AREA_GROUP = "pblock_1";
INST "theta_perm/LUT6_1_inst_or2" AREA_GROUP = "pblock_1";
INST "theta_perm/parities/theta_addddresses[4].RAM64X1S_inst" AREA_GROUP = "pblock_1";
INST "theta_perm/parities/theta_addddresses[3].RAM64X1S_inst" AREA_GROUP = "pblock_1";
INST "control_mod/Mcount_count_reg_xor<2>" AREA_GROUP = "pblock_1";
INST "control_mod/Mcount_count_reg_cy<3>" AREA_GROUP = "pblock_1";
INST "control_mod/Mcount_count_reg_xor<3>" AREA_GROUP = "pblock_1";
INST "control_mod/Mcount_count_reg_cy<4>" AREA_GROUP = "pblock_1";
INST "control_mod/Mcount_count_reg_xor<4>" AREA_GROUP = "pblock_1";
INST "control_mod/Mcount_count_reg_cy<5>" AREA_GROUP = "pblock_1";
INST "control_mod/Mcount_count_reg_xor<5>" AREA_GROUP = "pblock_1";
INST "control_mod/Mcount_count_reg_cy<6>" AREA_GROUP = "pblock_1";
INST "control_mod/Mcount_count_reg_xor<6>" AREA_GROUP = "pblock_1";
INST "control_mod/Mcount_count_reg_cy<7>" AREA_GROUP = "pblock_1";
INST "control_mod/Mcount_count_reg_xor<7>" AREA_GROUP = "pblock_1";
INST "control_mod/Mcount_count_reg_cy<8>" AREA_GROUP = "pblock_1";
INST "control_mod/Mcount_count_reg_xor<8>" AREA_GROUP = "pblock_1";
INST "control_mod/Mcount_count_reg_xor<9>" AREA_GROUP = "pblock_1";
INST "rho_perm/LUT6_1_inst_or5" AREA_GROUP = "pblock_1";
INST "control_mod/LUT6_1_inst_or" AREA_GROUP = "pblock_1";
INST "control_mod/calc_gr_n_sm_446_767_3" AREA_GROUP = "pblock_1";
INST "control_mod/LUT6_1_inst_and4" AREA_GROUP = "pblock_1";
INST "control_mod/LUT6_1_inst_or2" AREA_GROUP = "pblock_1";
INST "control_mod/LUT6_2_inst765" AREA_GROUP = "pblock_1";
INST "control_mod/LUT6_2_inst383" AREA_GROUP = "pblock_1";
INST "control_mod/LUT6_2_inst447" AREA_GROUP = "pblock_1";
INST "control_mod/LUT6_2_inst62" AREA_GROUP = "pblock_1";
INST "control_mod/LUT6_2_inst319" AREA_GROUP = "pblock_1";
INST "control_mod/LUT6_1_inst_and" AREA_GROUP = "pblock_1";
INST "control_mod/LUT6_2_inst318" AREA_GROUP = "pblock_1";
INST "control_mod/LUT6_1_inst_and3" AREA_GROUP = "pblock_1";
INST "theta_perm/parity_reg_4" AREA_GROUP = "pblock_1";
INST "theta_perm/parity_reg_3" AREA_GROUP = "pblock_1";
INST "theta_perm/parity_reg_2" AREA_GROUP = "pblock_1";
INST "theta_perm/parity_reg_1" AREA_GROUP = "pblock_1";
INST "theta_perm/parity_reg_0" AREA_GROUP = "pblock_1";
INST "control_mod/round_reg_1" AREA_GROUP = "pblock_1";
INST "control_mod/round_reg_2" AREA_GROUP = "pblock_1";
INST "control_mod/round_reg_3" AREA_GROUP = "pblock_1";
INST "control_mod/round_reg_4" AREA_GROUP = "pblock_1";
INST "control_mod/count_reg_3" AREA_GROUP = "pblock_1";
INST "control_mod/count_reg_1" AREA_GROUP = "pblock_1";
INST "control_mod/count_reg_2" AREA_GROUP = "pblock_1";
INST "control_mod/count_reg_6" AREA_GROUP = "pblock_1";
INST "control_mod/count_reg_4" AREA_GROUP = "pblock_1";
INST "control_mod/count_reg_5" AREA_GROUP = "pblock_1";
INST "control_mod/count_reg_9" AREA_GROUP = "pblock_1";
INST "control_mod/count_reg_7" AREA_GROUP = "pblock_1";
INST "control_mod/count_reg_8" AREA_GROUP = "pblock_1";
INST "control_mod/count_reg_0" AREA_GROUP = "pblock_1";
INST "control_mod/Mcount_count_reg_cy<0>" AREA_GROUP = "pblock_1";
INST "control_mod/Mcount_count_reg_xor<0>" AREA_GROUP = "pblock_1";
INST "control_mod/Mcount_count_reg_cy<1>" AREA_GROUP = "pblock_1";
INST "control_mod/Mcount_count_reg_xor<1>" AREA_GROUP = "pblock_1";
INST "control_mod/Mcount_count_reg_cy<2>" AREA_GROUP = "pblock_1";
INST "Mmux_state_en<0>51" AREA_GROUP = "pblock_1";
INST "keccak_out<4>1" AREA_GROUP = "pblock_1";
INST "clk_BUFGP" AREA_GROUP = "pblock_1";
INST "rho_perm/LUT6_1_inst" AREA_GROUP = "pblock_1";
INST "rho_perm/LUT6_2_inst" AREA_GROUP = "pblock_1";
INST "rho_perm/LUT6_3_inst" AREA_GROUP = "pblock_1";
INST "rho_perm/LUT6_1_inst11" AREA_GROUP = "pblock_1";
INST "rho_perm/LUT6_2_inst10" AREA_GROUP = "pblock_1";
INST "rho_perm/LUT6_1_inst13" AREA_GROUP = "pblock_1";
INST "rho_perm/LUT6_2_inst33" AREA_GROUP = "pblock_1";
INST "rho_perm/LUT6_1_inst14" AREA_GROUP = "pblock_1";
INST "rho_perm/LUT6_1_inst21" AREA_GROUP = "pblock_1";
INST "rho_perm/LUT6_2_inst24" AREA_GROUP = "pblock_1";
INST "rho_perm/LUT6_2_inst22" AREA_GROUP = "pblock_1";
INST "rho_perm/LUT6_2_inst31" AREA_GROUP = "pblock_1";
INST "rho_perm/LUT6_inst41" AREA_GROUP = "pblock_1";
INST "rho_perm/LUT6_2_inst14" AREA_GROUP = "pblock_1";
INST "rho_perm/LUT6_2_inst44" AREA_GROUP = "pblock_1";
INST "rho_perm/LUT6_2_inst34" AREA_GROUP = "pblock_1";
INST "rho_perm/LUT6_1_inst10_good" AREA_GROUP = "pblock_1";
INST "rho_perm/LUT6_1_inst_or" AREA_GROUP = "pblock_1";
INST "rho_perm/LUT6_1_inst_or2" AREA_GROUP = "pblock_1";
INST "rho_perm/LUT6_1_inst_or7" AREA_GROUP = "pblock_1";
INST "rho_perm/LUT6_1_inst_or9" AREA_GROUP = "pblock_1";
INST "rho_perm/LUT6_1_inst_or3" AREA_GROUP = "pblock_1";
INST "rho_perm/LUT6_1_inst_or6" AREA_GROUP = "pblock_1";
INST "rho_perm/LUT6_1_inst_or4" AREA_GROUP = "pblock_1";
INST "rho_perm/LUT6_1_inst_or8" AREA_GROUP = "pblock_1";
INST "control_mod/eq_765_reg" AREA_GROUP = "pblock_1";
INST "control_mod/eq_765_reg_reg" AREA_GROUP = "pblock_1";
INST "control_mod/eq_62_reg" AREA_GROUP = "pblock_1";
INST "control_mod/round_reg_0" AREA_GROUP = "pblock_1";
INST "Mmux_state_en<3>11" AREA_GROUP = "pblock_1";
INST "Mmux_state_en<3>21" AREA_GROUP = "pblock_1";
INST "Mmux_state_en<3>31" AREA_GROUP = "pblock_1";
INST "Mmux_state_en<3>41" AREA_GROUP = "pblock_1";
INST "Mmux_state_en<3>51" AREA_GROUP = "pblock_1";
INST "Mmux_state_en<2>11" AREA_GROUP = "pblock_1";
INST "Mmux_state_en<2>21" AREA_GROUP = "pblock_1";
INST "Mmux_state_en<2>31" AREA_GROUP = "pblock_1";
INST "Mmux_state_en<2>41" AREA_GROUP = "pblock_1";
INST "Mmux_state_en<2>51" AREA_GROUP = "pblock_1";
INST "Mmux_state_en<1>11" AREA_GROUP = "pblock_1";
INST "Mmux_state_en<1>21" AREA_GROUP = "pblock_1";
INST "Mmux_state_en<1>31" AREA_GROUP = "pblock_1";
INST "Mmux_state_en<1>41" AREA_GROUP = "pblock_1";
INST "Mmux_state_en<1>51" AREA_GROUP = "pblock_1";
INST "Mmux_state_en<0>11" AREA_GROUP = "pblock_1";
INST "Mmux_state_en<0>21" AREA_GROUP = "pblock_1";
INST "Mmux_state_en<0>31" AREA_GROUP = "pblock_1";
INST "Mmux_state_en<0>41" AREA_GROUP = "pblock_1";
INST "state_regss/Mmux_row_in_0<0>11" AREA_GROUP = "pblock_1";
INST "state_regss/Mmux_row_in_451" AREA_GROUP = "pblock_1";
INST "state_regss/Mmux_row_in_441" AREA_GROUP = "pblock_1";
INST "state_regss/Mmux_row_in_431" AREA_GROUP = "pblock_1";
INST "state_regss/Mmux_row_in_421" AREA_GROUP = "pblock_1";
INST "state_regss/Mmux_row_in_411" AREA_GROUP = "pblock_1";
INST "state_regss/Mmux_row_in_351" AREA_GROUP = "pblock_1";
INST "state_regss/Mmux_row_in_341" AREA_GROUP = "pblock_1";
INST "state_regss/Mmux_row_in_331" AREA_GROUP = "pblock_1";
INST "state_regss/Mmux_row_in_321" AREA_GROUP = "pblock_1";
INST "state_regss/Mmux_row_in_311" AREA_GROUP = "pblock_1";
INST "state_regss/Mmux_row_in_251" AREA_GROUP = "pblock_1";
INST "state_regss/Mmux_row_in_241" AREA_GROUP = "pblock_1";
INST "state_regss/Mmux_row_in_231" AREA_GROUP = "pblock_1";
INST "state_regss/Mmux_row_in_221" AREA_GROUP = "pblock_1";
INST "state_regss/Mmux_row_in_211" AREA_GROUP = "pblock_1";
INST "state_regss/Mmux_row_in_151" AREA_GROUP = "pblock_1";
INST "state_regss/Mmux_row_in_141" AREA_GROUP = "pblock_1";
INST "state_regss/Mmux_row_in_131" AREA_GROUP = "pblock_1";
INST "state_regss/Mmux_row_in_121" AREA_GROUP = "pblock_1";
INST "state_regss/Mmux_row_in_111" AREA_GROUP = "pblock_1";
INST "state_regss/Mmux_row_in_0<2>11" AREA_GROUP = "pblock_1";
INST "state_regss/Mmux_row_in_0<3>11" AREA_GROUP = "pblock_1";
INST "state_regss/Mmux_row_in_0<4>11" AREA_GROUP = "pblock_1";
INST "state_regss/Mmux_row_in_0<1>11" AREA_GROUP = "pblock_1";
INST "Mmux_state_en<4>11" AREA_GROUP = "pblock_1";
INST "Mmux_state_en<4>21" AREA_GROUP = "pblock_1";
INST "Mmux_state_en<4>31" AREA_GROUP = "pblock_1";
INST "Mmux_state_en<4>41" AREA_GROUP = "pblock_1";
INST "Mmux_state_en<4>51" AREA_GROUP = "pblock_1";
INST "theta_perm/get_parity_theta_prev/Mxor_parity_out<3>_xo<0>1" AREA_GROUP = "pblock_1";
INST "theta_perm/get_parity_theta_prev/Mxor_parity_out<4>_xo<0>1" AREA_GROUP = "pblock_1";
INST "theta_perm/we_parity_mem1" AREA_GROUP = "pblock_1";
INST "theta_perm/Mmux_parity_next51" AREA_GROUP = "pblock_1";
INST "theta_perm/Mmux_parity_next41" AREA_GROUP = "pblock_1";
INST "theta_perm/Mmux_parity_next31" AREA_GROUP = "pblock_1";
INST "theta_perm/Mmux_parity_next21" AREA_GROUP = "pblock_1";
INST "theta_perm/Mmux_parity_next11" AREA_GROUP = "pblock_1";
INST "theta_perm/mux91" AREA_GROUP = "pblock_1";
INST "theta_perm/mux81" AREA_GROUP = "pblock_1";
INST "theta_perm/mux71" AREA_GROUP = "pblock_1";
INST "theta_perm/mux61" AREA_GROUP = "pblock_1";
INST "theta_perm/mux51" AREA_GROUP = "pblock_1";
INST "theta_perm/Mmux_address_parity_rs_xor<5>11" AREA_GROUP = "pblock_1";
INST "theta_perm/Mmux_parity_this51" AREA_GROUP = "pblock_1";
INST "theta_perm/Mmux_parity_this41" AREA_GROUP = "pblock_1";
INST "theta_perm/Mmux_parity_this31" AREA_GROUP = "pblock_1";
INST "theta_perm/Mmux_parity_this21" AREA_GROUP = "pblock_1";
INST "theta_perm/Mmux_parity_this11" AREA_GROUP = "pblock_1";
INST "keccak_out_3_OBUF" AREA_GROUP = "pblock_1";
INST "keccak_out_2_OBUF" AREA_GROUP = "pblock_1";
INST "keccak_out_1_OBUF" AREA_GROUP = "pblock_1";
INST "keccak_out_0_OBUF" AREA_GROUP = "pblock_1";
INST "absorpt_IBUF" AREA_GROUP = "pblock_1";
INST "rst_IBUF" AREA_GROUP = "pblock_1";
INST "keccak_in_4_IBUF" AREA_GROUP = "pblock_1";
INST "keccak_in_3_IBUF" AREA_GROUP = "pblock_1";
INST "keccak_in_2_IBUF" AREA_GROUP = "pblock_1";
INST "keccak_in_1_IBUF" AREA_GROUP = "pblock_1";
INST "keccak_in_0_IBUF" AREA_GROUP = "pblock_1";
INST "Mmux_r_con115" AREA_GROUP = "pblock_1";
INST "Mmux_r_con114" AREA_GROUP = "pblock_1";
INST "Mmux_r_con113" AREA_GROUP = "pblock_1";
INST "Mmux_r_con112" AREA_GROUP = "pblock_1";
INST "Mmux_r_con111" AREA_GROUP = "pblock_1";
INST "Mmux_r_con110" AREA_GROUP = "pblock_1";
INST "Mmux_r_con15" AREA_GROUP = "pblock_1";
INST "Mmux_r_con14" AREA_GROUP = "pblock_1";
INST "Mmux_r_con13" AREA_GROUP = "pblock_1";
INST "Mmux_r_con12" AREA_GROUP = "pblock_1";
INST "Mmux_r_con11" AREA_GROUP = "pblock_1";
INST "control_mod/Mcount_round_reg_xor<0>11" AREA_GROUP = "pblock_1";
INST "control_mod/Mcount_count_reg_val1" AREA_GROUP = "pblock_1";
INST "control_mod/less_241" AREA_GROUP = "pblock_1";
INST "control_mod/Mcount_round_reg_xor<1>11" AREA_GROUP = "pblock_1";
INST "control_mod/Mcount_round_reg_xor<2>11" AREA_GROUP = "pblock_1";
INST "control_mod/Mcount_round_reg_xor<3>11" AREA_GROUP = "pblock_1";
INST "control_mod/Mcount_round_reg_xor<4>11" AREA_GROUP = "pblock_1";
INST "theta_perm/get_parity_theta_prev/Mxor_parity_out<0>_xo<0>1" AREA_GROUP = "pblock_1";
INST "theta_perm/get_parity_theta_prev/Mxor_parity_out<1>_xo<0>1" AREA_GROUP = "pblock_1";
INST "theta_perm/get_parity_theta_prev/Mxor_parity_out<2>_xo<0>1" AREA_GROUP = "pblock_1";
INST "state_regss/Mxor_row_in_xor_kecc_in<4>_xo<0>1" AREA_GROUP = "pblock_1";
INST "state_regss/Mxor_row_in_xor_kecc_in<3>_xo<0>1" AREA_GROUP = "pblock_1";
INST "state_regss/Mxor_row_in_xor_kecc_in<2>_xo<0>1" AREA_GROUP = "pblock_1";
INST "state_regss/Mxor_row_in_xor_kecc_in<1>_xo<0>1" AREA_GROUP = "pblock_1";
INST "state_regss/Mxor_row_in_xor_kecc_in<0>_xo<0>1" AREA_GROUP = "pblock_1";
INST "theta_perm/Mmux_address_parity_rs_xor<4>11" AREA_GROUP = "pblock_1";
INST "theta_perm/Mmux_address_parity_rs_xor<2>11" AREA_GROUP = "pblock_1";
INST "theta_perm/Mmux_address_parity_rs_xor<3>11" AREA_GROUP = "pblock_1";
INST "theta_perm/Mmux_address_parity_rs_cy<3>11" AREA_GROUP = "pblock_1";
INST "control_mod/Mcount_count_reg_xor<9>_rt" AREA_GROUP = "pblock_1";
INST "control_mod/Mcount_count_reg_cy<1>_rt" AREA_GROUP = "pblock_1";
INST "control_mod/Mcount_count_reg_cy<2>_rt" AREA_GROUP = "pblock_1";
INST "control_mod/Mcount_count_reg_cy<3>_rt" AREA_GROUP = "pblock_1";
INST "control_mod/Mcount_count_reg_cy<4>_rt" AREA_GROUP = "pblock_1";
INST "control_mod/Mcount_count_reg_cy<5>_rt" AREA_GROUP = "pblock_1";
INST "control_mod/Mcount_count_reg_cy<6>_rt" AREA_GROUP = "pblock_1";
INST "control_mod/Mcount_count_reg_cy<7>_rt" AREA_GROUP = "pblock_1";
INST "control_mod/Mcount_count_reg_cy<8>_rt" AREA_GROUP = "pblock_1";
INST "keccak_out_4_OBUF" AREA_GROUP = "pblock_1";
INST "state_regss/not_absorpt1_INV_0" AREA_GROUP = "pblock_1";
INST "control_mod/Mcount_count_reg_lut<0>_INV_0" AREA_GROUP = "pblock_1";
INST "Mmux_r_con19_G" AREA_GROUP = "pblock_1";
INST "Mmux_r_con19_F" AREA_GROUP = "pblock_1";
INST "Mmux_r_con19" AREA_GROUP = "pblock_1";
INST "theta_perm/Mmux_address_parity_rs_xor<1>11" AREA_GROUP = "pblock_1";
INST "theta_perm/Mmux_address_parity_rs_lut<0>1" AREA_GROUP = "pblock_1";
AREA_GROUP "pblock_1" RANGE=SLICE_X2Y70:SLICE_X11Y79;


INST "state_regss/plane_4/SRLC32E_inst_2_1" BEL = B6LUT;
INST "state_regss/plane_4/SRLC32E_inst_2_1" LOC = SLICE_X2Y73;
INST "state_regss/plane_4/SRLC32E_inst_2_2" BEL = A6LUT;
INST "state_regss/plane_4/SRLC32E_inst_2_2" LOC = SLICE_X2Y73;
INST "state_regss/plane_0/SRLC32E_inst_2_1" BEL = B6LUT;
INST "state_regss/plane_0/SRLC32E_inst_2_1" LOC = SLICE_X6Y70;
INST "state_regss/plane_0/SRLC32E_inst_2_2" BEL = A6LUT;
INST "state_regss/plane_0/SRLC32E_inst_2_2" LOC = SLICE_X6Y70;
INST "state_regss/plane_1/SRLC32E_inst_2_2" BEL = A6LUT;
INST "state_regss/plane_1/SRLC32E_inst_2_2" LOC = SLICE_X10Y70;
INST "state_regss/plane_1/SRLC32E_inst_2_1" BEL = B6LUT;
INST "state_regss/plane_1/SRLC32E_inst_2_1" LOC = SLICE_X10Y70;
INST "state_regss/plane_1/SRLC32E_inst_0_2" BEL = A6LUT;
INST "state_regss/plane_1/SRLC32E_inst_0_2" LOC = SLICE_X10Y71;
INST "state_regss/plane_1/SRLC32E_inst_0_1" BEL = B6LUT;
INST "state_regss/plane_1/SRLC32E_inst_0_1" LOC = SLICE_X10Y71;
INST "state_regss/plane_0/SRLC32E_inst_3_2" BEL = A6LUT;
INST "state_regss/plane_0/SRLC32E_inst_3_2" LOC = SLICE_X10Y75;
INST "state_regss/plane_0/SRLC32E_inst_3_1" BEL = B6LUT;
INST "state_regss/plane_0/SRLC32E_inst_3_1" LOC = SLICE_X10Y75;
INST "state_regss/plane_3/SRLC32E_inst_0_2" BEL = A6LUT;
INST "state_regss/plane_3/SRLC32E_inst_0_2" LOC = SLICE_X10Y74;
INST "state_regss/plane_3/SRLC32E_inst_0_1" BEL = B6LUT;
INST "state_regss/plane_3/SRLC32E_inst_0_1" LOC = SLICE_X10Y74;
INST "state_regss/plane_1/SRLC32E_inst_1_2" BEL = A6LUT;
INST "state_regss/plane_1/SRLC32E_inst_1_2" LOC = SLICE_X10Y73;
INST "state_regss/plane_1/SRLC32E_inst_1_1" BEL = B6LUT;
INST "state_regss/plane_1/SRLC32E_inst_1_1" LOC = SLICE_X10Y73;
INST "state_regss/plane_2/SRLC32E_inst_4_2" BEL = A6LUT;
INST "state_regss/plane_2/SRLC32E_inst_4_2" LOC = SLICE_X10Y72;
INST "state_regss/plane_2/SRLC32E_inst_4_1" BEL = B6LUT;
INST "state_regss/plane_2/SRLC32E_inst_4_1" LOC = SLICE_X10Y72;
INST "state_regss/plane_2/SRLC32E_inst_2_2" BEL = A6LUT;
INST "state_regss/plane_2/SRLC32E_inst_2_2" LOC = SLICE_X10Y76;
INST "state_regss/plane_2/SRLC32E_inst_2_1" BEL = B6LUT;
INST "state_regss/plane_2/SRLC32E_inst_2_1" LOC = SLICE_X10Y76;
INST "state_regss/plane_3/SRLC32E_inst_4_2" BEL = A6LUT;
INST "state_regss/plane_3/SRLC32E_inst_4_2" LOC = SLICE_X10Y77;
INST "state_regss/plane_3/SRLC32E_inst_4_1" BEL = B6LUT;
INST "state_regss/plane_3/SRLC32E_inst_4_1" LOC = SLICE_X10Y77;
INST "state_regss/plane_3/SRLC32E_inst_1_2" BEL = A6LUT;
INST "state_regss/plane_3/SRLC32E_inst_1_2" LOC = SLICE_X6Y77;
INST "state_regss/plane_3/SRLC32E_inst_1_1" BEL = B6LUT;
INST "state_regss/plane_3/SRLC32E_inst_1_1" LOC = SLICE_X6Y77;
INST "state_regss/plane_0/SRLC32E_inst_1_2" BEL = A6LUT;
INST "state_regss/plane_0/SRLC32E_inst_1_2" LOC = SLICE_X6Y78;
INST "state_regss/plane_0/SRLC32E_inst_1_1" BEL = B6LUT;
INST "state_regss/plane_0/SRLC32E_inst_1_1" LOC = SLICE_X6Y78;
INST "state_regss/plane_1/SRLC32E_inst_4_2" BEL = A6LUT;
INST "state_regss/plane_1/SRLC32E_inst_4_2" LOC = SLICE_X6Y79;
INST "state_regss/plane_1/SRLC32E_inst_4_1" BEL = B6LUT;
INST "state_regss/plane_1/SRLC32E_inst_4_1" LOC = SLICE_X6Y79;
INST "state_regss/plane_0/SRLC32E_inst_0_2" BEL = A6LUT;
INST "state_regss/plane_0/SRLC32E_inst_0_2" LOC = SLICE_X2Y79;
INST "state_regss/plane_0/SRLC32E_inst_0_1" BEL = B6LUT;
INST "state_regss/plane_0/SRLC32E_inst_0_1" LOC = SLICE_X2Y79;
INST "state_regss/plane_0/SRLC32E_inst_4_2" BEL = A6LUT;
INST "state_regss/plane_0/SRLC32E_inst_4_2" LOC = SLICE_X2Y78;
INST "state_regss/plane_0/SRLC32E_inst_4_1" BEL = B6LUT;
INST "state_regss/plane_0/SRLC32E_inst_4_1" LOC = SLICE_X2Y78;
INST "state_regss/plane_4/SRLC32E_inst_4_2" BEL = A6LUT;
INST "state_regss/plane_4/SRLC32E_inst_4_2" LOC = SLICE_X2Y77;
INST "state_regss/plane_4/SRLC32E_inst_4_1" BEL = B6LUT;
INST "state_regss/plane_4/SRLC32E_inst_4_1" LOC = SLICE_X2Y77;

INST "state_regss/plane_4/SRLC32E_inst_3_2" BEL = A6LUT;
INST "state_regss/plane_4/SRLC32E_inst_3_2" LOC = SLICE_X2Y74;
INST "state_regss/plane_4/SRLC32E_inst_3_1" BEL = B6LUT;
INST "state_regss/plane_4/SRLC32E_inst_3_1" LOC = SLICE_X2Y74;
INST "state_regss/plane_3/SRLC32E_inst_2_2" BEL = A6LUT;
INST "state_regss/plane_3/SRLC32E_inst_2_2" LOC = SLICE_X2Y72;
INST "state_regss/plane_3/SRLC32E_inst_2_1" BEL = B6LUT;
INST "state_regss/plane_3/SRLC32E_inst_2_1" LOC = SLICE_X2Y72;
INST "state_regss/plane_2/SRLC32E_inst_1_2" BEL = A6LUT;
INST "state_regss/plane_2/SRLC32E_inst_1_2" LOC = SLICE_X2Y70;
INST "state_regss/plane_2/SRLC32E_inst_1_1" BEL = B6LUT;
INST "state_regss/plane_2/SRLC32E_inst_1_1" LOC = SLICE_X2Y70;
INST "state_regss/plane_2/SRLC32E_inst_3_2" BEL = A6LUT;
INST "state_regss/plane_2/SRLC32E_inst_3_2" LOC = SLICE_X2Y71;
INST "state_regss/plane_2/SRLC32E_inst_3_1" BEL = B6LUT;
INST "state_regss/plane_2/SRLC32E_inst_3_1" LOC = SLICE_X2Y71;
INST "state_regss/plane_3/SRLC32E_inst_3_2" BEL = A6LUT;
INST "state_regss/plane_3/SRLC32E_inst_3_2" LOC = SLICE_X6Y71;
INST "state_regss/plane_3/SRLC32E_inst_3_1" BEL = B6LUT;
INST "state_regss/plane_3/SRLC32E_inst_3_1" LOC = SLICE_X6Y71;
INST "state_regss/plane_1/SRLC32E_inst_3_2" BEL = A6LUT;
INST "state_regss/plane_1/SRLC32E_inst_3_2" LOC = SLICE_X6Y72;
INST "state_regss/plane_1/SRLC32E_inst_3_1" BEL = B6LUT;
INST "state_regss/plane_1/SRLC32E_inst_3_1" LOC = SLICE_X6Y72;
INST "state_regss/plane_2/SRLC32E_inst_0_2" BEL = A6LUT;
INST "state_regss/plane_2/SRLC32E_inst_0_2" LOC = SLICE_X6Y73;
INST "state_regss/plane_2/SRLC32E_inst_0_1" BEL = B6LUT;
INST "state_regss/plane_2/SRLC32E_inst_0_1" LOC = SLICE_X6Y73;
INST "state_regss/plane_4/SRLC32E_inst_0_1" BEL = B6LUT;
INST "state_regss/plane_4/SRLC32E_inst_0_1" LOC = SLICE_X6Y74;
INST "state_regss/plane_4/SRLC32E_inst_0_2" BEL = A6LUT;
INST "state_regss/plane_4/SRLC32E_inst_0_2" LOC = SLICE_X6Y74;


INST "state_regss/rst_input[2].calc_keccak_in_init" BEL = AFF;
INST "state_regss/rst_input[2].calc_keccak_in_init" LOC = SLICE_X3Y74;
INST "state_regss/rst_input[3].calc_keccak_in_init" BEL = CFF;
INST "state_regss/rst_input[3].calc_keccak_in_init" LOC = SLICE_X3Y74;

INST "control_mod/count_reg_0" BEL = CFF;
INST "control_mod/count_reg_0" LOC = SLICE_X2Y73;
INST "control_mod/count_reg_1" BEL = DFF;
INST "control_mod/count_reg_1" LOC = SLICE_X2Y73;
#INST "control_mod/count_reg_2" BEL = CFF;
#INST "control_mod/count_reg_2" LOC = SLICE_X6Y73;
#INST "control_mod/count_reg_3" BEL = DFF;
#INST "control_mod/count_reg_3" LOC = SLICE_X6Y73;
INST "control_mod/count_reg_4" BEL = AFF;
INST "control_mod/count_reg_4" LOC = SLICE_X6Y74;
#INST "control_mod/count_reg_5" BEL = BFF;
#INST "control_mod/count_reg_5" LOC = SLICE_X6Y74;
INST "control_mod/count_reg_6" BEL = CFF;
INST "control_mod/count_reg_6" LOC = SLICE_X6Y74;
INST "control_mod/count_reg_7" BEL = DFF;
INST "control_mod/count_reg_7" LOC = SLICE_X6Y74;
INST "control_mod/count_reg_8" BEL = CFF;
INST "control_mod/count_reg_8" LOC = SLICE_X2Y72;
INST "control_mod/count_reg_9" BEL = DFF;
INST "control_mod/count_reg_9" LOC = SLICE_X2Y72;

#INST "control_mod/eq_62_reg" BEL = BFF;
#INST "control_mod/eq_62_reg" LOC = SLICE_X6Y71;
INST "control_mod/eq_765_reg_reg" BEL = DFF;
INST "control_mod/eq_765_reg_reg" LOC = SLICE_X6Y71;
INST "control_mod/eq_765_reg" BEL = AFF;
INST "control_mod/eq_765_reg" LOC = SLICE_X6Y71;

INST "theta_perm/parity_reg_0" BEL = CFF;
INST "theta_perm/parity_reg_0" LOC = SLICE_X6Y71;

INST "theta_perm/parity_last_reg_0" BEL = AFF;
INST "theta_perm/parity_last_reg_0" LOC = SLICE_X6Y70;
#INST "theta_perm/parity_last_reg_1" BEL = BFF;
#INST "theta_perm/parity_last_reg_1" LOC = SLICE_X6Y70;
INST "theta_perm/parity_last_reg_2" BEL = CFF;
INST "theta_perm/parity_last_reg_2" LOC = SLICE_X6Y70;
INST "theta_perm/parity_last_reg_3" BEL = DFF;
INST "theta_perm/parity_last_reg_3" LOC = SLICE_X6Y70;

INST "control_mod/round_reg_0" BEL = AFF;
INST "control_mod/round_reg_0" LOC = SLICE_X6Y77;
INST "control_mod/round_reg_1" BEL = DFF;
INST "control_mod/round_reg_1" LOC = SLICE_X6Y77;
#INST "control_mod/round_reg_2" BEL = BFF;
#INST "control_mod/round_reg_2" LOC = SLICE_X6Y77;
#INST "control_mod/round_reg_3" BEL = C5FF;
#INST "control_mod/round_reg_3" LOC = SLICE_X6Y77;
INST "control_mod/round_reg_4" BEL = CFF;
INST "control_mod/round_reg_4" LOC = SLICE_X6Y77;

#Input RST
INST "state_regss/rst_input[4].calc_keccak_in_init" BEL = BFF;
INST "state_regss/rst_input[4].calc_keccak_in_init" LOC = SLICE_X3Y74;
INST "state_regss/rst_input[1].calc_keccak_in_init" BEL = DFF;
INST "state_regss/rst_input[1].calc_keccak_in_init" LOC = SLICE_X3Y74;

INST "control_mod/calc_gr_n_sm_446_767_3" BEL = AFF;
INST "control_mod/calc_gr_n_sm_446_767_3" LOC = SLICE_X2Y75;
INST "theta_perm/parity_last_reg_4" BEL = CFF;
INST "theta_perm/parity_last_reg_4" LOC = SLICE_X2Y70;

#INST "theta_perm/or_latch_eq_67_OR_absorpt" LOC = SLICE_X2Y73;
INST "theta_perm/parity_reg_2" LOC = SLICE_X2Y77;
INST "theta_perm/parity_reg_3" LOC = SLICE_X2Y74;
INST "theta_perm/parity_reg_4" LOC = SLICE_X2Y74;
INST "theta_perm/parities/theta_addddresses[0].RAM64X1S_inst" LOC = SLICE_X6Y76;
INST "theta_perm/parities/theta_addddresses[3].RAM64X1S_inst" LOC = SLICE_X6Y76;
INST "theta_perm/parities/theta_addddresses[1].RAM64X1S_inst" LOC = SLICE_X10Y79;
INST "theta_perm/parities/theta_addddresses[4].RAM64X1S_inst" LOC = SLICE_X6Y76;
INST "theta_perm/parities/theta_addddresses[2].RAM64X1S_inst" LOC = SLICE_X6Y76;




INST "Mmux_state_en<2>41" BEL = C6LUT;
INST "Mmux_state_en<2>41" LOC = SLICE_X2Y73;
INST "Mmux_state_en<3>31" BEL = D6LUT;
INST "Mmux_state_en<3>31" LOC = SLICE_X2Y74;
INST "Mmux_state_en<0>51" BEL = C5LUT;
INST "Mmux_state_en<0>51" LOC = SLICE_X2Y73;
INST "Mmux_state_en<4>41" BEL = C6LUT;
INST "Mmux_state_en<4>41" LOC = SLICE_X2Y72;
#INST "Mmux_r_con14" BEL = C6LUT;
#INST "Mmux_r_con14" LOC = SLICE_X2Y77;
INST "state_regss/Mmux_row_in_111" BEL = C6LUT;
INST "state_regss/Mmux_row_in_111" LOC = SLICE_X6Y72;
INST "state_regss/Mmux_row_in_441" BEL = C5LUT;
INST "state_regss/Mmux_row_in_441" LOC = SLICE_X2Y71;
INST "Mmux_state_en<3>51" BEL = C6LUT;
INST "Mmux_state_en<3>51" LOC = SLICE_X6Y74;
#INST "Mmux_state_en<4>31" BEL = C5LUT;
#INST "Mmux_state_en<4>31" LOC = SLICE_X6Y74;
#INST "control_mod/Mcount_round_reg_xor<2>11" BEL = D6LUT;
#INST "control_mod/Mcount_round_reg_xor<2>11" LOC = SLICE_X6Y77;
#INST "control_mod/Mcount_round_reg_xor<1>11" BEL = D5LUT;
#INST "control_mod/Mcount_round_reg_xor<1>11" LOC = SLICE_X6Y77;


#INST "Mmux_state_en<2>21" BEL = D6LUT;
#INST "Mmux_state_en<2>21" LOC = SLICE_X2Y70;
INST "theta_perm/Mmux_parity_this11" BEL = D6LUT;
INST "theta_perm/Mmux_parity_this11" LOC = SLICE_X2Y73;
INST "control_mod/Mcount_count_reg_val1" BEL = C6LUT;
INST "control_mod/Mcount_count_reg_val1" LOC = SLICE_X2Y74;
INST "theta_perm/Mmux_parity_this31" BEL = C6LUT;
INST "theta_perm/Mmux_parity_this31" LOC = SLICE_X6Y70;
INST "Mmux_state_en<4>11" BEL = C6LUT;
INST "Mmux_state_en<4>11" LOC = SLICE_X10Y70;
INST "Mmux_state_en<4>21" BEL = C5LUT;
INST "Mmux_state_en<4>21" LOC = SLICE_X10Y70;
INST "Mmux_state_en<3>41" BEL = D6LUT;
INST "Mmux_state_en<3>41" LOC = SLICE_X10Y70;
INST "rho_perm/LUT6_inst41" BEL = C6LUT;
INST "rho_perm/LUT6_inst41" LOC = SLICE_X10Y71;


#INST "state_regss/Mmux_row_in_221" BEL = C6LUT;
#INST "state_regss/Mmux_row_in_221" LOC = SLICE_X2Y70;
#INST "state_regss/not_absorpt1_INV_0" BEL = C5LUT;
#INST "state_regss/not_absorpt1_INV_0" LOC = SLICE_X2Y74;
INST "theta_perm/Mmux_address_parity_rs_xor<4>11" BEL = D6LUT;
INST "theta_perm/Mmux_address_parity_rs_xor<4>11" LOC = SLICE_X6Y78;
INST "state_regss/plane_4/SRLC32E_inst_1_2" BEL = A6LUT;
INST "state_regss/plane_4/SRLC32E_inst_1_2" LOC = SLICE_X6Y75;
INST "state_regss/plane_4/SRLC32E_inst_1_1" LOC = SLICE_X6Y75;
INST "state_regss/Mmux_row_in_0<2>11" BEL = D6LUT;
INST "state_regss/Mmux_row_in_0<2>11" LOC = SLICE_X10Y72;

#INST "control_mod/LUT6_1_inst_and3" LOC = SLICE_X6Y70 | BEL = D6LUT;
#INST "control_mod/LUT6_1_inst_and" BEL = C5LUT;
#INST "control_mod/LUT6_1_inst_and" LOC = SLICE_X6Y71;
INST "state_regss/Mmux_row_in_211" BEL = D6LUT;
INST "state_regss/Mmux_row_in_211" LOC = SLICE_X6Y72;
#INST "Mmux_state_en<2>51" BEL = D6LUT;
#INST "Mmux_state_en<2>51" LOC = SLICE_X10Y71;
#INST "Mmux_state_en<2>11" BEL = D6LUT;
#INST "Mmux_state_en<2>11" LOC = SLICE_X6Y73;
INST "state_regss/Mmux_row_in_351" BEL = C6LUT;
INST "state_regss/Mmux_row_in_351" LOC = SLICE_X10Y72;




INST "control_mod/LUT6_1_inst_or2" BEL = C5LUT;
INST "control_mod/LUT6_1_inst_or2" LOC = SLICE_X6Y79;
INST "state_regss/Mmux_row_in_0<3>11" BEL = C6LUT;
INST "state_regss/Mmux_row_in_0<3>11" LOC = SLICE_X10Y75;
INST "control_mod/LUT6_1_inst_and2" LOC = SLICE_X6Y75;
INST "state_regss/Mmux_row_in_341" BEL = D6LUT;
INST "state_regss/Mmux_row_in_341" LOC = SLICE_X6Y74;


INST "state_regss/Mmux_row_in_331" BEL = D6LUT;
INST "state_regss/Mmux_row_in_331" LOC = SLICE_X2Y72;
#INST "Mmux_state_en<1>11" BEL = C5LUT;
#INST "Mmux_state_en<1>11" LOC = SLICE_X2Y72;

INST "state_regss/Mmux_row_in_251" BEL = D6LUT;
INST "state_regss/Mmux_row_in_251" LOC = SLICE_X6Y70;
#INST "Mmux_state_en<1>21" BEL = D6LUT;
#INST "Mmux_state_en<1>21" LOC = SLICE_X6Y75;
#INST "rho_perm/LUT6_1_inst_or6" LOC = SLICE_X10Y73;
INST "state_regss/Mmux_row_in_121" BEL = C6LUT;
INST "state_regss/Mmux_row_in_121" LOC = SLICE_X6Y78;
#INST "Mmux_r_con13" BEL = D6LUT;
#INST "Mmux_r_con13" LOC = SLICE_X2Y71;


INST "rho_perm/LUT6_1_inst_or8" BEL = C5LUT;
INST "rho_perm/LUT6_1_inst_or8" LOC = SLICE_X10Y74;

INST "state_regss/Mmux_row_in_131" BEL = D6LUT;
INST "state_regss/Mmux_row_in_131" LOC = SLICE_X10Y74;


#INST "rho_perm/LUT6_1_inst_or6" LOC = SLICE_X10Y73;
INST "Mmux_state_en<0>41" BEL = D6LUT;
INST "Mmux_state_en<0>41" LOC = SLICE_X10Y73;
INST "Mmux_state_en<2>31" BEL = D6LUT;
INST "Mmux_state_en<2>31" LOC = SLICE_X10Y75;

INST "Mmux_state_en<3>11" BEL = C6LUT;
INST "Mmux_state_en<3>11" LOC = SLICE_X10Y76;

#INST "rho_perm/LUT6_1_inst21" BEL = C5LUT;
#INST "rho_perm/LUT6_1_inst21" LOC = SLICE_X10Y77;
#INST "state_regss/Mmux_row_in_451" BEL = D6LUT;
#INST "state_regss/Mmux_row_in_451" LOC = SLICE_X10Y77;

INST "rho_perm/LUT6_1_inst_or3" LOC = SLICE_X10Y79;
INST "state_regss/Mmux_row_in_0<1>11" BEL = C6LUT;
INST "state_regss/Mmux_row_in_0<1>11" LOC = SLICE_X10Y79;

#INST "theta_perm/Mmux_address_parity_rs_xor<3>11" BEL = D6LUT;
#INST "theta_perm/Mmux_address_parity_rs_xor<3>11" LOC = SLICE_X2Y77;

INST "state_regss/Mmux_row_in_421" BEL = D6LUT;
INST "state_regss/Mmux_row_in_421" LOC = SLICE_X2Y78;


INST "Mmux_state_en<3>21" BEL = C5LUT;
INST "Mmux_state_en<3>21" LOC = SLICE_X10Y76;
INST "theta_perm/parity_reg_1" BEL = DFF;
INST "theta_perm/parity_reg_1" LOC = SLICE_X10Y76;


INST "Mmux_r_con110" BEL = A6LUT;
INST "Mmux_r_con110" LOC = SLICE_X2Y75;
INST "Mmux_r_con15" BEL = B6LUT;
INST "Mmux_r_con15" LOC = SLICE_X2Y75;
INST "Mmux_r_con19_G" BEL = C6LUT;
INST "Mmux_r_con19_G" LOC = SLICE_X2Y75;
INST "Mmux_r_con19_F" BEL = D6LUT;
INST "Mmux_r_con19_F" LOC = SLICE_X2Y75;
INST "Mmux_r_con19" BEL = F7BMUX;
INST "Mmux_r_con19" LOC = SLICE_X2Y75;
#INST "state_regss/rst_input[0].calc_keccak_in_init" BEL = BFF;
#INST "state_regss/rst_input[0].calc_keccak_in_init" LOC = SLICE_X2Y75;
#INST "theta_perm/mux91" BEL = A5LUT;
#INST "theta_perm/mux91" LOC = SLICE_X2Y75;
#INST "state_regss/Mxor_row_in_xor_kecc_in<0>_xo<0>1" BEL = B6LUT;
#INST "state_regss/Mxor_row_in_xor_kecc_in<0>_xo<0>1" LOC = SLICE_X2Y75;
#INST "theta_perm/Mmux_parity_this51" BEL = C6LUT;
#INST "theta_perm/Mmux_parity_this51" LOC = SLICE_X2Y75;
#INST "control_mod/Mcount_count_reg_lut<0>_INV_0" BEL = A6LUT;
#INST "control_mod/Mcount_count_reg_lut<0>_INV_0" LOC = SLICE_X2Y71;


INST "theta_perm/Mmux_address_parity_rs_xor<2>11" BEL = D6LUT;
INST "theta_perm/Mmux_address_parity_rs_xor<2>11" LOC = SLICE_X9Y73;

#INST "keccak_out<4>1" BEL = B5LUT;
#INST "keccak_out<4>1" LOC = SLICE_X2Y75;



INST "state_regss/Mmux_row_in_151" BEL = B6LUT;
INST "state_regss/Mmux_row_in_151" LOC = SLICE_X3Y75;
INST "theta_perm/theta_perm/LUT5_inst_4" BEL = A6LUT;
INST "theta_perm/theta_perm/LUT5_inst_4" LOC = SLICE_X3Y75;



INST "rho_perm/LUT6_2_inst24" LOC = SLICE_X9Y73;
INST "state_regss/Mmux_row_in_0<0>11" BEL = C6LUT;
INST "state_regss/Mmux_row_in_0<0>11" LOC = SLICE_X2Y76;
INST "control_mod/LUT6_1_inst_or" LOC = SLICE_X2Y76;

INST "control_mod/LUT6_2_inst765" LOC = SLICE_X3Y74;
INST "control_mod/LUT6_2_inst765" BEL = D6LUT;


INST "rho_perm/LUT6_2_inst31" BEL = B6LUT;
INST "rho_perm/LUT6_2_inst31" LOC = SLICE_X9Y74;
INST "rho_perm/LUT6_1_inst11" BEL = D6LUT;
INST "rho_perm/LUT6_1_inst11" LOC = SLICE_X9Y74;
INST "rho_perm/LUT6_1_inst14" BEL = C6LUT;
INST "rho_perm/LUT6_1_inst14" LOC = SLICE_X9Y74;

#INST "state_regss/Mmux_row_in_321" BEL = D6LUT;
#INST "state_regss/Mmux_row_in_321" LOC = SLICE_X2Y72;



#INST "theta_perm/Mmux_parity_this21" BEL = B6LUT;
#INST "theta_perm/Mmux_parity_this21" LOC = SLICE_X2Y72;


INST "state_regss/Mmux_row_in_411" BEL = C6LUT;
INST "state_regss/Mmux_row_in_411" LOC = SLICE_X3Y73;

INST "rho_perm/LUT6_2_inst14" BEL = D6LUT;
INST "rho_perm/LUT6_2_inst14" LOC = SLICE_X5Y76;

INST "control_mod/LUT6_2_inst62" LOC = SLICE_X5Y77;

INST "state_regss/Mmux_row_in_311" BEL = C6LUT;
INST "state_regss/Mmux_row_in_311" LOC = SLICE_X5Y77;


INST "state_regss/Mmux_row_in_0<4>11" BEL = C6LUT;
INST "state_regss/Mmux_row_in_0<4>11" LOC = SLICE_X2Y78;

INST "Mmux_state_en<0>21" LOC = SLICE_X9Y73;


INST "rho_perm/LUT6_1_inst_or5" LOC = SLICE_X5Y72;

#INST "Mmux_state_en<0>31" BEL = C6LUT;
INST "Mmux_state_en<0>31" LOC = SLICE_X5Y77;

#INST "rho_perm/LUT6_1_inst13" BEL = A6LUT;
INST "rho_perm/LUT6_1_inst13" LOC = SLICE_X2Y76;

#INST "rho_perm/LUT6_2_inst33" BEL = A6LUT;
INST "rho_perm/LUT6_2_inst33" LOC = SLICE_X2Y76;

INST "rho_perm/LUT6_1_inst_or9" BEL = A6LUT;
INST "rho_perm/LUT6_1_inst_or9" LOC = SLICE_X9Y74;

INST "control_mod/LUT6_2_inst318" LOC = SLICE_X3Y74;

#INST "Mmux_state_en<1>41" BEL = C6LUT;
INST "Mmux_state_en<1>41" LOC = SLICE_X3Y73;


#INST "rho_perm/LUT6_1_inst_or4" LOC = SLICE_X2Y79;
INST "rho_perm/LUT6_2_inst44" LOC = SLICE_X2Y79;
INST "theta_perm/Mmux_parity_next21" BEL = D5LUT;
INST "theta_perm/Mmux_parity_next21" LOC = SLICE_X10Y76;
INST "theta_perm/Mmux_parity_next31" BEL = D6LUT;
INST "theta_perm/Mmux_parity_next31" LOC = SLICE_X10Y76;
INST "control_mod/Mcount_round_reg_xor<1>11" BEL = C6LUT;
INST "control_mod/Mcount_round_reg_xor<1>11" LOC = SLICE_X6Y77;
INST "control_mod/Mcount_round_reg_xor<0>11" BEL = C5LUT;
INST "control_mod/Mcount_round_reg_xor<0>11" LOC = SLICE_X6Y77;

INST "state_regss/Mmux_row_in_431" BEL = C6LUT;
INST "state_regss/Mmux_row_in_431" LOC = SLICE_X2Y70;


INST "Mmux_r_con12" BEL = C6LUT;
INST "Mmux_r_con12" LOC = SLICE_X2Y77;
INST "Mmux_r_con11" BEL = D6LUT;
INST "Mmux_r_con11" LOC = SLICE_X2Y77;


INST "theta_perm/get_parity_theta_prev/Mxor_parity_out<4>_xo<0>1" BEL = D6LUT;
INST "theta_perm/get_parity_theta_prev/Mxor_parity_out<4>_xo<0>1" LOC = SLICE_X6Y79;

INST "theta_perm/theta_perm/LUT5_inst_0" BEL = D6LUT;
INST "theta_perm/theta_perm/LUT5_inst_0" LOC = SLICE_X2Y70;


INST "Mmux_state_en<1>21" BEL = C6LUT;
INST "Mmux_state_en<1>21" LOC = SLICE_X10Y77;
INST "theta_perm/get_parity_theta_prev/Mxor_parity_out<1>_xo<0>1" BEL = D6LUT;
INST "theta_perm/get_parity_theta_prev/Mxor_parity_out<1>_xo<0>1" LOC = SLICE_X10Y77;


INST "state_regss/not_absorpt1_INV_0" BEL = D6LUT;
INST "state_regss/not_absorpt1_INV_0" LOC = SLICE_X10Y71;


INST "theta_perm/get_parity_theta_prev/Mxor_parity_out<2>_xo<0>1" BEL = A6LUT;
INST "theta_perm/get_parity_theta_prev/Mxor_parity_out<2>_xo<0>1" LOC = SLICE_X3Y73;

INST "Mmux_state_en<1>11" BEL = D6LUT;
INST "Mmux_state_en<1>11" LOC = SLICE_X2Y71;


INST "rho_perm/LUT6_2_inst10" BEL = C5LUT;
INST "rho_perm/LUT6_2_inst10" LOC = SLICE_X3Y70;


INST "Mmux_r_con113" BEL = B6LUT;
INST "Mmux_r_con113" LOC = SLICE_X5Y76;

INST "theta_perm/Mmux_parity_this41" BEL = A6LUT;
INST "theta_perm/Mmux_parity_this41" LOC = SLICE_X9Y73;

INST "rho_perm/LUT6_1_inst_or6" LOC = SLICE_X5Y73;

INST "state_regss/Mmux_row_in_241" BEL = D6LUT;
INST "state_regss/Mmux_row_in_241" LOC = SLICE_X6Y73;

INST "chi_n_iota_perms/LUT6_2_inst_2" LOC = SLICE_X5Y73;

INST "LUT6_2_keccak_out23" LOC = SLICE_X5Y73;

INST "state_regss/Mmux_row_in_451" BEL = C6LUT;
INST "state_regss/Mmux_row_in_451" LOC = SLICE_X3Y75;

INST "rho_perm/LUT6_1_inst" LOC = SLICE_X3Y70;

INST "theta_perm/mux81" BEL = B6LUT;
INST "theta_perm/mux81" LOC = SLICE_X3Y70;

INST "theta_perm/mux61" BEL = B6LUT;
INST "theta_perm/mux61" LOC = SLICE_X3Y73;

INST "theta_perm/theta_perm/LUT5_inst_2" BEL = A6LUT;
INST "theta_perm/theta_perm/LUT5_inst_2" LOC = SLICE_X10Y79;


INST "state_regss/abs_input[4].calc_keccak_in_init" BEL = AFF;
INST "state_regss/abs_input[4].calc_keccak_in_init" LOC = SLICE_X3Y70;
INST "state_regss/abs_input[0].calc_keccak_in_init" BEL = AFF;
INST "state_regss/abs_input[0].calc_keccak_in_init" LOC = SLICE_X3Y71;
INST "state_regss/abs_input[2].calc_keccak_in_init" BEL = CFF;
INST "state_regss/abs_input[2].calc_keccak_in_init" LOC = SLICE_X3Y71;
INST "state_regss/abs_input[1].calc_keccak_in_init" BEL = BFF;
INST "state_regss/abs_input[1].calc_keccak_in_init" LOC = SLICE_X3Y71;
INST "state_regss/abs_input[3].calc_keccak_in_init" BEL = DFF;
INST "state_regss/abs_input[3].calc_keccak_in_init" LOC = SLICE_X3Y71;

INST "theta_perm/mux51" BEL = A6LUT;
INST "theta_perm/mux51" LOC = SLICE_X3Y70;

INST "control_mod/LUT6_1_inst_and4" LOC = SLICE_X5Y76;

INST "theta_perm/Mmux_parity_this21" BEL = A6LUT;
INST "theta_perm/Mmux_parity_this21" LOC = SLICE_X5Y72;

# PlanAhead Generated physical constraints 

INST "control_mod/Mcount_count_reg_lut<0>_INV_0" BEL = A6LUT;
INST "control_mod/Mcount_count_reg_lut<0>_INV_0" LOC = SLICE_X4Y73;


INST "theta_perm/mux71" BEL = B6LUT;
INST "theta_perm/mux71" LOC = SLICE_X3Y71;

INST "theta_perm/get_parity_theta_prev/Mxor_parity_out<0>_xo<0>1" BEL = C6LUT;
INST "theta_perm/get_parity_theta_prev/Mxor_parity_out<0>_xo<0>1" LOC = SLICE_X6Y73;
#
INST "theta_perm/mux91" BEL = D6LUT;
INST "theta_perm/mux91" LOC = SLICE_X3Y71;
#
INST "state_regss/Mmux_row_in_321" BEL = D6LUT;
INST "state_regss/Mmux_row_in_321" LOC = SLICE_X7Y75;

INST "state_regss/Mmux_row_in_221" BEL = D6LUT;
INST "state_regss/Mmux_row_in_221" LOC = SLICE_X2Y79;

##INST "rho_perm/LUT6_1_inst_or7" BEL = A6LUT;
#INST "rho_perm/LUT6_1_inst_or7" LOC = SLICE_X4Y71;

INST "theta_perm/Mmux_address_parity_rs_xor<1>11" BEL = C6LUT;
INST "theta_perm/Mmux_address_parity_rs_xor<1>11" LOC = SLICE_X3Y71;

INST "rho_perm/LUT6_1_inst10_good" BEL = C6LUT;
INST "rho_perm/LUT6_1_inst10_good" LOC = SLICE_X3Y72;

INST "state_regss/Mmux_row_in_231" BEL = C6LUT;
INST "state_regss/Mmux_row_in_231" LOC = SLICE_X7Y75;

INST "control_mod/LUT6_1_inst_and3" BEL = B6LUT;
INST "control_mod/LUT6_1_inst_and3" LOC = SLICE_X7Y75;

#INST "control_mod/LUT6_2_inst319" BEL = A6LUT;
#INST "control_mod/LUT6_2_inst319" LOC = SLICE_X7Y75;

INST "control_mod/LUT6_2_inst319" BEL = D6LUT;
INST "control_mod/LUT6_2_inst319" LOC = SLICE_X4Y75;

INST "theta_perm/get_parity_theta_prev/Mxor_parity_out<3>_xo<0>1" BEL = C6LUT;
INST "theta_perm/get_parity_theta_prev/Mxor_parity_out<3>_xo<0>1" LOC = SLICE_X4Y75;

#INST "theta_perm/LUT6_1_inst_or2" BEL = A6LUT;
#INST "theta_perm/LUT6_1_inst_or2" LOC = SLICE_X7Y73;

INST "state_regss/Mmux_row_in_141" BEL = C6LUT;
INST "state_regss/Mmux_row_in_141" LOC = SLICE_X7Y73;

INST "Mmux_state_en<2>51" BEL = D5LUT;
INST "Mmux_state_en<2>51" LOC = SLICE_X7Y73;
INST "Mmux_state_en<1>51" BEL = D6LUT;
INST "Mmux_state_en<1>51" LOC = SLICE_X7Y73;

INST "rho_perm/LUT6_1_inst_or4" BEL = B6LUT;
INST "rho_perm/LUT6_1_inst_or4" LOC = SLICE_X4Y72;

INST "Mmux_state_en<2>21" BEL = C6LUT;
INST "Mmux_state_en<2>21" LOC = SLICE_X4Y72;
INST "Mmux_state_en<2>11" BEL = C5LUT;
INST "Mmux_state_en<2>11" LOC = SLICE_X4Y72;
INST "theta_perm/Mmux_parity_next41" BEL = A6LUT;
INST "theta_perm/Mmux_parity_next41" LOC = SLICE_X4Y72;
INST "theta_perm/Mmux_parity_next51" BEL = A5LUT;
INST "theta_perm/Mmux_parity_next51" LOC = SLICE_X4Y72;

#INST "theta_perm/LUT6_1_inst_or2" BEL = B6LUT;
#INST "theta_perm/LUT6_1_inst_or2" LOC = SLICE_X4Y72;