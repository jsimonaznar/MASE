clear; 

if ~isfile('JunoAll.mat')
    close all;
% Load kernels.
METAKR= { 'https://naif.jpl.nasa.gov/pub/naif/generic_kernels/lsk/naif0012.tls', ... %Leap seconds
        'https://naif.jpl.nasa.gov/pub/naif/generic_kernels/lsk/naif0011.tls',...
        'https://naif.jpl.nasa.gov/pub/naif/JUNO/kernels/lsk/naif0009.tls',...
        'https://naif.jpl.nasa.gov/pub/naif/JUNO/kernels/lsk/naif0010.tls',...
        'https://naif.jpl.nasa.gov/pub/naif/generic_kernels/spk/planets/de430.bsp',... %Planetary ephemeris
        'https://naif.jpl.nasa.gov/pub/naif/generic_kernels/pck/pck00011.tpc',... %Planet radii and orientation
        'https://naif.jpl.nasa.gov/pub/naif/generic_kernels/pck/de-403-masses.tpc',... %Masses of planets
        'https://naif.jpl.nasa.gov/pub/naif/generic_kernels/pck/pck00010.tpc',...
        'https://naif.jpl.nasa.gov/pub/naif/MARS2020/kernels/pck/pck00010.tpc',...
        'https://naif.jpl.nasa.gov/pub/naif/generic_kernels/pck/pck00011_n0066.tpc',...
        'https://naif.jpl.nasa.gov/pub/naif/generic_kernels/pck/gm_de431.tpc',...
        'https://naif.jpl.nasa.gov/pub/naif/generic_kernels/pck/gm_de440.tpc',...
        'https://naif.jpl.nasa.gov/pub/naif/generic_kernels/pck/Gravity.tpc',... %Gravity kernel
        'https://naif.jpl.nasa.gov/pub/naif/JUNO/kernels/spk/spk_rec_110805_111026_120302.bsp',...
        'https://naif.jpl.nasa.gov/pub/naif/JUNO/kernels/spk/spk_rec_111026_120308_120726.bsp',...
        'https://naif.jpl.nasa.gov/pub/naif/JUNO/kernels/spk/spk_rec_120308_120825_121109.bsp',...
        'https://naif.jpl.nasa.gov/pub/naif/JUNO/kernels/spk/spk_rec_120825_130515_130708.bsp',...
        'https://naif.jpl.nasa.gov/pub/naif/JUNO/kernels/spk/spk_rec_130515_131005_131031.bsp',...
        'https://naif.jpl.nasa.gov/pub/naif/JUNO/kernels/spk/spk_rec_130515_131005_151210.bsp',...
        'https://naif.jpl.nasa.gov/pub/naif/JUNO/kernels/spk/spk_rec_131005_131014_131101.bsp',...
        'https://naif.jpl.nasa.gov/pub/naif/JUNO/kernels/spk/spk_rec_131005_131014_131101_reconstruction.bsp.lbl',...
        'https://naif.jpl.nasa.gov/pub/naif/JUNO/kernels/spk/spk_rec_131014_131114_140222.bsp',...
        'https://naif.jpl.nasa.gov/pub/naif/JUNO/kernels/spk/spk_rec_131114_140918_141208.bsp',...
        'https://naif.jpl.nasa.gov/pub/naif/JUNO/kernels/spk/spk_rec_131114_140918_141208_reconstruction.bsp',...
        'https://naif.jpl.nasa.gov/pub/naif/JUNO/kernels/spk/spk_rec_140903_151003_160118.bsp',...
        'https://naif.jpl.nasa.gov/pub/naif/JUNO/kernels/spk/spk_rec_151003_160312_160418.bsp',...
        'https://naif.jpl.nasa.gov/pub/naif/JUNO/kernels/spk/spk_rec_160312_160522_160614.bsp',...
        'https://naif.jpl.nasa.gov/pub/naif/JUNO/kernels/spk/spk_rec_160522_160729_160909.bsp',...
        'https://naif.jpl.nasa.gov/pub/naif/JUNO/kernels/spk/spk_rec_160729_160923_161027.bsp',...
        'https://naif.jpl.nasa.gov/pub/naif/JUNO/kernels/spk/spk_rec_160729_160924_161026_pj01.bsp',...
        'https://naif.jpl.nasa.gov/pub/naif/JUNO/kernels/spk/spk_rec_160923_161115_161121.bsp',...
        'https://naif.jpl.nasa.gov/pub/naif/JUNO/kernels/spk/spk_rec_161115_170106_170113.bsp',...
        'https://naif.jpl.nasa.gov/pub/naif/JUNO/kernels/spk/spk_rec_170106_170228_170307.bsp',...
        'https://naif.jpl.nasa.gov/pub/naif/JUNO/kernels/spk/spk_rec_170228_170422_170427.bsp',...
        'https://naif.jpl.nasa.gov/pub/naif/JUNO/kernels/spk/spk_rec_170422_170608_170621.bsp',...
        'https://naif.jpl.nasa.gov/pub/naif/JUNO/kernels/spk/spk_rec_170608_170728_170803.bsp',...
        'https://naif.jpl.nasa.gov/pub/naif/JUNO/kernels/spk/spk_rec_170728_170918_170922.bsp',...
        'https://naif.jpl.nasa.gov/pub/naif/JUNO/kernels/spk/spk_rec_170918_171121_171127.bsp',...
        'https://naif.jpl.nasa.gov/pub/naif/JUNO/kernels/spk/spk_rec_171121_180113_180117.bsp',...
        'https://naif.jpl.nasa.gov/pub/naif/JUNO/kernels/spk/spk_rec_180113_180307_180312.bsp',...
        'https://naif.jpl.nasa.gov/pub/naif/JUNO/kernels/spk/spk_rec_180307_180429_180504.bsp',...
        'https://naif.jpl.nasa.gov/pub/naif/JUNO/kernels/spk/spk_rec_180429_180621_180626.bsp',...
        'https://naif.jpl.nasa.gov/pub/naif/JUNO/kernels/spk/spk_rec_180620_180812_180821.bsp',...
        'https://naif.jpl.nasa.gov/pub/naif/JUNO/kernels/spk/spk_rec_180812_181004_181011.bsp',...
        'https://naif.jpl.nasa.gov/pub/naif/JUNO/kernels/spk/spk_rec_181004_181126_181205.bsp',...
        'https://naif.jpl.nasa.gov/pub/naif/JUNO/kernels/spk/spk_rec_181126_190118_190124.bsp',...
        'https://naif.jpl.nasa.gov/pub/naif/JUNO/kernels/spk/spk_rec_190118_190312_190319.bsp',...
        'https://naif.jpl.nasa.gov/pub/naif/JUNO/kernels/spk/spk_rec_190312_190504_190509.bsp',...
        'https://naif.jpl.nasa.gov/pub/naif/JUNO/kernels/spk/spk_rec_190504_190626_190627.bsp',...
        'https://naif.jpl.nasa.gov/pub/naif/JUNO/kernels/spk/spk_rec_190626_190817_190822.bsp',...
        'https://naif.jpl.nasa.gov/pub/naif/JUNO/kernels/spk/spk_rec_190817_191010_191022.bsp',...
        'https://naif.jpl.nasa.gov/pub/naif/JUNO/kernels/spk/spk_rec_191010_191201_191210.bsp',...
        'https://naif.jpl.nasa.gov/pub/naif/JUNO/kernels/spk/spk_rec_191201_200124_200129.bsp',...
        'https://naif.jpl.nasa.gov/pub/naif/JUNO/kernels/spk/spk_rec_200124_200316_200324.bsp',...
        'https://naif.jpl.nasa.gov/pub/naif/JUNO/kernels/spk/spk_rec_200316_200508_200512.bsp',...
        'https://naif.jpl.nasa.gov/pub/naif/JUNO/kernels/spk/spk_rec_200508_200629_200709.bsp',...
        'https://naif.jpl.nasa.gov/pub/naif/JUNO/kernels/spk/spk_rec_200629_200822_200826.bsp',...
        'https://naif.jpl.nasa.gov/pub/naif/JUNO/kernels/spk/spk_rec_200822_201014_201016.bsp',...
        'https://naif.jpl.nasa.gov/pub/naif/JUNO/kernels/spk/spk_rec_201014_201205_201208.bsp',...
        'https://naif.jpl.nasa.gov/pub/naif/JUNO/kernels/spk/spk_rec_201205_210127_210210.bsp',...
        'https://naif.jpl.nasa.gov/pub/naif/JUNO/kernels/spk/spk_rec_210127_210321_210329.bsp',...
        'https://naif.jpl.nasa.gov/pub/naif/JUNO/kernels/spk/spk_rec_210321_210513_210517.bsp',...
        'https://naif.jpl.nasa.gov/pub/naif/JUNO/kernels/spk/spk_rec_210513_210630_210707.bsp',...
        'https://naif.jpl.nasa.gov/pub/naif/JUNO/kernels/spk/spk_rec_210630_210813_210825.bsp',...
        'https://naif.jpl.nasa.gov/pub/naif/JUNO/kernels/spk/spk_rec_210813_210925_211005.bsp',...
        'https://naif.jpl.nasa.gov/pub/naif/JUNO/kernels/spk/spk_rec_210925_211108_211115.bsp',...
        'https://naif.jpl.nasa.gov/pub/naif/JUNO/kernels/spk/spk_rec_211108_211222_220104.bsp',...
        'https://naif.jpl.nasa.gov/pub/naif/JUNO/kernels/spk/spk_rec_211222_220204_220210.bsp',...
        'https://naif.jpl.nasa.gov/pub/naif/JUNO/kernels/spk/spk_rec_220204_220319_220330.bsp',...
        'https://naif.jpl.nasa.gov/pub/naif/JUNO/kernels/spk/spk_rec_220319_220502_220510.bsp',...
        'https://naif.jpl.nasa.gov/pub/naif/JUNO/kernels/spk/spk_rec_220502_220614_220622.bsp',...
        'https://naif.jpl.nasa.gov/pub/naif/JUNO/kernels/spk/spk_rec_220614_220728_220805.bsp',...
        'https://naif.jpl.nasa.gov/pub/naif/JUNO/kernels/spk/spk_rec_220728_220909_220913.bsp',...
        'https://naif.jpl.nasa.gov/pub/naif/JUNO/kernels/spk/spk_rec_220909_221019_221027.bsp',...
        'https://naif.jpl.nasa.gov/pub/naif/JUNO/kernels/spk/spk_rec_221019_221127_221208.bsp',...
        'https://naif.jpl.nasa.gov/pub/naif/JUNO/kernels/spk/spk_rec_221127_230104_230111.bsp',...
        'https://naif.jpl.nasa.gov/pub/naif/JUNO/kernels/spk/spk_rec_230104_230211_230221.bsp',...
        'https://naif.jpl.nasa.gov/pub/naif/JUNO/kernels/spk/spk_rec_230211_230321_230327.bsp',...
        'https://naif.jpl.nasa.gov/pub/naif/JUNO/kernels/spk/spk_rec_230321_230428_230504.bsp',...
        'https://naif.jpl.nasa.gov/pub/naif/JUNO/kernels/spk/spk_rec_230428_230605_230613.bsp',...
        'https://naif.jpl.nasa.gov/pub/naif/JUNO/kernels/spk/spk_rec_230605_230713_230720.bsp',...
        'https://naif.jpl.nasa.gov/pub/naif/JUNO/kernels/spk/spk_rec_230713_230820_230823.bsp',...
        'https://naif.jpl.nasa.gov/pub/naif/JUNO/kernels/spk/spk_rec_230820_230927_231003.bsp',...
        'https://naif.jpl.nasa.gov/pub/naif/JUNO/kernels/fk/juno_v12.tf',...
        'https://naif.jpl.nasa.gov/pub/naif/generic_kernels/spk/planets/de441_part-1.bsp',...
        'https://naif.jpl.nasa.gov/pub/naif/generic_kernels/spk/planets/de441_part-2.bsp',...
        'https://naif.jpl.nasa.gov/pub/naif/generic_kernels/pck/mars_iau2000_v1.tpc',...
        'https://naif.jpl.nasa.gov/pub/naif/generic_kernels/fk/planets/earth_assoc_itrf93.tf',...
        'https://naif.jpl.nasa.gov/pub/naif/MARS2020/kernels/spk/de430s.bsp',...
        'https://naif.jpl.nasa.gov/pub/naif/MARS2020/kernels/spk/de438s.bsp',...
        'https://naif.jpl.nasa.gov/pub/naif/MARS2020/kernels/spk/mar097.bsp',...
        'https://naif.jpl.nasa.gov/pub/naif/MARS2020/kernels/spk/mar097s.bsp',...
        'https://naif.jpl.nasa.gov/pub/naif/JUNO/kernels/fk/juno_v01.tf',...
        'https://naif.jpl.nasa.gov/pub/naif/JUNO/kernels/fk/juno_v02.tf',...
        'https://naif.jpl.nasa.gov/pub/naif/JUNO/kernels/fk/juno_v07.tf',...
        'https://naif.jpl.nasa.gov/pub/naif/JUNO/kernels/fk/juno_v08.tf',...
        'https://naif.jpl.nasa.gov/pub/naif/JUNO/kernels/fk/juno_v09.tf',...
        'https://naif.jpl.nasa.gov/pub/naif/JUNO/kernels/fk/juno_v10.tf',...
        'https://naif.jpl.nasa.gov/pub/naif/JUNO/kernels/fk/juno_v11.tf',...
        'https://naif.jpl.nasa.gov/pub/naif/JUNO/kernels/fk/juno_v12.tf',...
        'https://naif.jpl.nasa.gov/pub/naif/JUNO/kernels/pck/pck00008.tpc',...
        'https://naif.jpl.nasa.gov/pub/naif/JUNO/kernels/pck/pck00009.tpc',...
        'https://naif.jpl.nasa.gov/pub/naif/JUNO/kernels/pck/pck00010.tpc',...
        'https://naif.jpl.nasa.gov/pub/naif/generic_kernels/spk/satellites/jup344.cmt', ... %Jupiter moons kernel
        'https://naif.jpl.nasa.gov/pub/naif/generic_kernels/spk/satellites/jup346.cmt', ... %Jupiter kernel
        'https://naif.jpl.nasa.gov/pub/naif/generic_kernels/lsk/naif0012.tls', ... %Leap seconds
        'https://naif.jpl.nasa.gov/pub/naif/generic_kernels/spk/planets/de430.bsp',... %Planetary ephemeris
        'https://naif.jpl.nasa.gov/pub/naif/generic_kernels/pck/pck00011.tpc',... %Planet radii and orientation
        'https://naif.jpl.nasa.gov/pub/naif/generic_kernels/pck/de-403-masses.tpc',... %Masses of planets
        'https://naif.jpl.nasa.gov/pub/naif/generic_kernels/pck/moon_pa_de403_1950-2198.bpc',... %Masses of moons
        'https://naif.jpl.nasa.gov/pub/naif/generic_kernels/pck/Gravity.tpc',... %Gravity kernel
        'https://naif.jpl.nasa.gov/pub/naif/generic_kernels/spk/satellites/jup365.bsp',...
        'https://naif.jpl.nasa.gov/pub/naif/JUNO/kernels/fk/juno_v12.tf',...
        'https://naif.jpl.nasa.gov/pub/naif/JUNO/kernels/ck/juno_sa_nom_110801_171101_v01.bc',...
        'https://naif.jpl.nasa.gov/pub/naif/JUNO/kernels/sclk/JNO_SCLKSCET.00158.tsc',...
        'https://naif.jpl.nasa.gov/pub/naif/JUNO/kernels/spk/juno_struct_v04.bsp',...
        'https://naif.jpl.nasa.gov/pub/naif/JUNO/kernels/spk/juno_struct_v03.bsp.lbl',...
        'https://naif.jpl.nasa.gov/pub/naif/JUNO/kernels/spk/juno_struct_v02.bsp',...
        'https://naif.jpl.nasa.gov/pub/naif/JUNO/kernels/spk/juno_struct_v01.bsp.lbl',...
        'https://naif.jpl.nasa.gov/pub/naif/JUNO/kernels/ck/juno_sc_nom_110807_171016_v01.bc',...
        'https://naif.jpl.nasa.gov/pub/naif/generic_kernels/lsk/naif0012.tls', ...
        'https://naif.jpl.nasa.gov/pub/naif/generic_kernels/spk/planets/de430.bsp', ...
        'https://naif.jpl.nasa.gov/pub/naif/generic_kernels/pck/pck00010.tpc', ...
        'https://naif.jpl.nasa.gov/pub/naif/generic_kernels/pck/Gravity.tpc', ...
        'https://naif.jpl.nasa.gov/pub/naif/pds/data/jno-j_e_ss-spice-6-v1.0/jnosp_1000/data/spk/juno_rec_110805_111026_120302.bsp', ...
        'https://naif.jpl.nasa.gov/pub/naif/pds/data/jno-j_e_ss-spice-6-v1.0/jnosp_1000/data/spk/juno_rec_111026_120308_120726.bsp', ...
        'https://naif.jpl.nasa.gov/pub/naif/JUNO/kernels/fk/juno_v12.tf',... % juno frame definition 
        'https://naif.jpl.nasa.gov/pub/naif/JUNO/kernels/ik/juno_struct_v02.ti',... % jun attitude kernel
        'https://naif.jpl.nasa.gov/pub/naif/JUNO/kernels/ik/juno_junocam_v03.ti',... % junocam attitude kernel
        'https://naif.jpl.nasa.gov/pub/naif/JUNO/kernels/ck/juno_sa_nom_110801_171101_v01.bc',... % juno solar pannels
        'https://naif.jpl.nasa.gov/pub/naif/pds/data/jno-j_e_ss-spice-6-v1.0/jnosp_1000/data/sclk/jno_sclkscet_00132.tsc',... % system time kernel
        'https://naif.jpl.nasa.gov/pub/naif/pds/data/jno-j_e_ss-spice-6-v1.0/jnosp_1000/data/spk/juno_rec_160312_160522_160614.bsp',... % position kernels
        'https://naif.jpl.nasa.gov/pub/naif/pds/data/jno-j_e_ss-spice-6-v1.0/jnosp_1000/data/spk/juno_rec_160522_160729_160909.bsp',...
        'https://naif.jpl.nasa.gov/pub/naif/pds/data/jno-j_e_ss-spice-6-v1.0/jnosp_1000/data/spk/juno_rec_160729_160923_161027.bsp',...
        'https://naif.jpl.nasa.gov/pub/naif/pds/data/jno-j_e_ss-spice-6-v1.0/jnosp_1000/data/spk/juno_rec_160923_161115_161121.bsp',...
        'https://naif.jpl.nasa.gov/pub/naif/pds/data/jno-j_e_ss-spice-6-v1.0/jnosp_1000/data/ck/juno_sc_rec_160424_160430_v03.bc',... % attitude kernels
        'https://naif.jpl.nasa.gov/pub/naif/pds/data/jno-j_e_ss-spice-6-v1.0/jnosp_1000/data/ck/juno_sc_rec_160501_160507_v03.bc',...
        'https://naif.jpl.nasa.gov/pub/naif/pds/data/jno-j_e_ss-spice-6-v1.0/jnosp_1000/data/ck/juno_sc_rec_160508_160514_v03.bc',...
        'https://naif.jpl.nasa.gov/pub/naif/pds/data/jno-j_e_ss-spice-6-v1.0/jnosp_1000/data/ck/juno_sc_rec_160515_160521_v01.bc',...
        'https://naif.jpl.nasa.gov/pub/naif/pds/data/jno-j_e_ss-spice-6-v1.0/jnosp_1000/data/ck/juno_sc_rec_160522_160528_v01.bc',...
        'https://naif.jpl.nasa.gov/pub/naif/pds/data/jno-j_e_ss-spice-6-v1.0/jnosp_1000/data/ck/juno_sc_rec_160529_160604_v01.bc',...
        'https://naif.jpl.nasa.gov/pub/naif/pds/data/jno-j_e_ss-spice-6-v1.0/jnosp_1000/data/ck/juno_sc_rec_160605_160611_v01.bc',...
        'https://naif.jpl.nasa.gov/pub/naif/pds/data/jno-j_e_ss-spice-6-v1.0/jnosp_1000/data/ck/juno_sc_rec_160612_160618_v01.bc',...
        'https://naif.jpl.nasa.gov/pub/naif/pds/data/jno-j_e_ss-spice-6-v1.0/jnosp_1000/data/ck/juno_sc_rec_160619_160625_v01.bc',...
        'https://naif.jpl.nasa.gov/pub/naif/pds/data/jno-j_e_ss-spice-6-v1.0/jnosp_1000/data/ck/juno_sc_rec_160626_160702_v01.bc',...
        'https://naif.jpl.nasa.gov/pub/naif/pds/data/jno-j_e_ss-spice-6-v1.0/jnosp_1000/data/ck/juno_sc_rec_160703_160705_v01.bc',...
        'https://naif.jpl.nasa.gov/pub/naif/pds/data/jno-j_e_ss-spice-6-v1.0/jnosp_1000/data/ck/juno_sc_rec_160705_160709_v01.bc',...
        'https://naif.jpl.nasa.gov/pub/naif/pds/data/jno-j_e_ss-spice-6-v1.0/jnosp_1000/data/ck/juno_sc_rec_160710_160716_v01.bc',...
        'https://naif.jpl.nasa.gov/pub/naif/pds/data/jno-j_e_ss-spice-6-v1.0/jnosp_1000/data/ck/juno_sc_rec_160717_160723_v01.bc',...
        'https://naif.jpl.nasa.gov/pub/naif/pds/data/jno-j_e_ss-spice-6-v1.0/jnosp_1000/data/ck/juno_sc_rec_160724_160730_v01.bc',...
        'https://naif.jpl.nasa.gov/pub/naif/pds/data/jno-j_e_ss-spice-6-v1.0/jnosp_1000/data/ck/juno_sc_rec_160731_160731_v01.bc',...
        'https://naif.jpl.nasa.gov/pub/naif/pds/data/jno-j_e_ss-spice-6-v1.0/jnosp_1000/data/ck/juno_sc_rec_160731_160806_v01.bc',...
        'https://naif.jpl.nasa.gov/pub/naif/pds/data/jno-j_e_ss-spice-6-v1.0/jnosp_1000/data/ck/juno_sc_rec_160807_160813_v01.bc',...
        'https://naif.jpl.nasa.gov/pub/naif/pds/data/jno-j_e_ss-spice-6-v1.0/jnosp_1000/data/ck/juno_sc_rec_160814_160820_v01.bc',...
        'https://naif.jpl.nasa.gov/pub/naif/pds/data/jno-j_e_ss-spice-6-v1.0/jnosp_1000/data/ck/juno_sc_rec_160821_160827_v01.bc',...
        'https://naif.jpl.nasa.gov/pub/naif/pds/data/jno-j_e_ss-spice-6-v1.0/jnosp_1000/data/ck/juno_sc_rec_160828_160903_v01.bc',...
        'https://naif.jpl.nasa.gov/pub/naif/pds/data/jno-j_e_ss-spice-6-v1.0/jnosp_1000/data/ck/juno_sc_rec_160904_160910_v01.bc',...
        'https://naif.jpl.nasa.gov/pub/naif/pds/data/jno-j_e_ss-spice-6-v1.0/jnosp_1000/data/ck/juno_sc_rec_160911_160917_v01.bc',...
        'https://naif.jpl.nasa.gov/pub/naif/pds/data/jno-j_e_ss-spice-6-v1.0/jnosp_1000/data/ck/juno_sc_rec_160918_160924_v01.bc',...
        'https://naif.jpl.nasa.gov/pub/naif/pds/data/jno-j_e_ss-spice-6-v1.0/jnosp_1000/data/ck/juno_sc_rec_160925_161001_v01.bc',...
        'https://naif.jpl.nasa.gov/pub/naif/JUNO/kernels/sclk/JNO_SCLKSCET.00158.tsc',...
        'https://naif.jpl.nasa.gov/pub/naif/pds/data/jno-j_e_ss-spice-6-v1.0/jnosp_1000/data/sclk/jno_sclkscet_00157.tsc'};

    save('JunoAll.mat','METAKR');
else % otherwise, load it
    load('JunoAll.mat');
end

for i=1:numel(METAKR)
    fprintf('\"%s\", \n',METAKR{i});
end

initSPICEv(fullK(METAKR)); % fullK forms the full list needed by initSPICEv

numFrames = 1000;
% 1-FROM: the name of a reference frame in which a position vector is known.
ffrom = 'JUNO_HGA';
% 2-TO: the name of a reference frame in which it is desired to
%represent a position vector.
fto = 'J2000';
% Interval of time
dates = cspice_str2et( { '2016 OCT 16 17:34:00 TDB', ...
                      '2017 AUG 16 14:55:00 TDB'} );
twi = cspice_wninsd( dates(1), dates(2) );

% set up estimation time frames
et=linspace(twi(1),twi(2),numFrames);
sunA=zeros(size(et));
earthA=zeros(size(et));

% Just an auxiliary function to get the angle in degrees
anglev = @(a,b)acosd(dot(a/norm(a),b/norm(b) ) ) ;

% 3-ET: the epoch in ephemeris seconds past the epoch of J2000 (TDB), or an N-vector of epochs
for i = 1:numel(et)

% CSPICE_PXFORM returns the matrix that transforms position vectors from one specified frame to another at a specified epoch.
%try

rot=cspice_pxform(ffrom, fto, et(i));
% rot=cspice_pxform('JUNO_JUNOCAM','J2000',et) % not needed !

% Z axis is the normal to the solar arrays
ZaxisJ2000 = rot*[0 ; 0 ; 1];
[SunJ2000, ~] = cspice_spkpos('SUN',et(i),'J2000','NONE','JUNO'); % SUN POS. IN J2000 observed from JUNO
[EarthJ2000, ~] = cspice_spkpos('EARTH',et(i),'J2000','NONE','JUNO'); % EARTH IN J2000 observed from JUNO

%SunJ2000 = [SunJ2000; [0.; 0.; 0.] ]; if using sxform function
%EarthJ2000 = [EarthJ2000; [0.; 0.; 0.] ]; if using sxform function

sunA(end+1)=anglev(SunJ2000,ZaxisJ2000);
earthA(end+1)=anglev(EarthJ2000,ZaxisJ2000);

end

sunA = sunA(1001:end);
earthA = earthA(1001:end);
% Plots

plot(et/(3600*24),sunA, 'LineWidth', 2, 'Color', 'yellow', 'DisplayName', 'Z-axis to Sun');
hold on
plot(et/(3600*24), earthA, 'LineWidth', 2, 'Color', 'blue', 'DisplayName', 'Z-axis to Earth');
xlabel('Ephemeris Time [Days]','Interpreter','latex',FontSize=25)
ylabel('Angle [Degrees]','Interpreter','latex',FontSize=25)
leyenda = legend('show');
% setup plot colour options
set(gcf, 'color', 'none');
set(gca, 'color', 'none');
set(gca, 'xcolor', 'white');
set(gca, 'ycolor', 'white');
set(gca, 'zcolor', 'white');
set(leyenda, 'Color', 'none','Interpreter','latex', 'TextColor', 'white', 'Location', 'North West'); 
set(gca, 'FontSize', 25); 

