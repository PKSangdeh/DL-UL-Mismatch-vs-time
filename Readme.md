# Reciprocity Test 
_This repo has the experimental data sets for measuring USRP N210 Reciprocity over 420 mins._

***1 Objective:***

o This test examines the channel reciprocity for USRP N210 at 2.4 GHz with 5MSps for 7 hours. 

***2. Specs:***

o  We used Wi-Fi legacy PHY to measure the uplink and downlink channels over 52 valid subcarriers and
   the mismatch is the average over all the valid subcarriers. 

o  We used 4 USRPs N210 as the main antennas and one USRP N210 as a dedicated reference antenna to 
   measure UL/DL channels for the four main antennas with respect to the dedicated one.

o  All USRPs were connected to an external clock OctoClock-G CDA-2990 , hence the freq. and time offsets
   were negligible. Then we could get a better understanding about the real behavior of the channel 
   reciprocity over time.

***3. Approach:***

o  Since the internal temperature of devices are the most dominant factor in the mismatch, it should be 
   noted that at the beginning of this 7-hour period, we turned on the USRPs and the temperature of 
   devices was not stable yet.

o   We have used Argos, a relative calibration method. You can find more detail at:
   https://dl.acm.org/citation.cfm?id=2348553

***4. Results:***
   You can find the results either in the .m file or the report file. The report file also includes the 
   diagrams showing the phase and magnitude of the channel mismatch over time.
