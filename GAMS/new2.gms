* Notes
* Only one student/instructor (UP/IP) per event. Need to implement crews
Sets
    e       events              / TR-1, TR-2, BSA-1, BSA-2, SAT-1, SAT-2, ISR-1, ISR-2, SCAR-1, CSAR-1, CAS-1, CAS-2 /
    ip      instructor pilots   / Capt-Campbell, Capt-Ward, Capt-Barron, Capt-Ray, Capt-Yama /
    iso     instructor SOs      / MSgt-Nelson, SSgt-Brant, TSgt-Bianco, MSgt-Zimmerman, MSgt-Yerke /
    up      student pilots      / Lt-Chambers, Lt-Vaughn, Lt-Solano, Lt-Pineiro, Lt-Avignano /
    d       days                / 1, 2, 3, 4, 5 /
* For now, only 20 periods; 4 periods for each day (5 days) and only one line
    p       periods             / P1, P2, P3, P4, P5, P6, P7, P8, P9, P10, P11, P12, P13, P14, P15, P16, P17, P18, P19, P20 /    

    D1p(p)     periods in day 1    / P1, P2, P3, P4 /
    D2p(p)     periods in day 2    / P5, P6, P7, P8 /
    D3p(p)     periods in day 3    / P9, P10, P11, P12 /
    D4p(p)     periods in day 4    / P13, P14, P15, P16 /
    D5p(p)     periods in day 5    / P17, P18, P19, P20 /
    
    TR1ips(ip)  IPs who can instruct TR1    / Capt-Campbell, Capt-Ward, Capt-Barron /
    TR2ips(ip)  IPs who can instruct TR2    / Capt-Campbell, Capt-Ward, Capt-Barron /
    BSA1ips(ip) IPs who can instruct BSA1   / Capt-Campbell, Capt-Ward, Capt-Barron /
    BSA2ips(ip) IPs who can instruct BSA2   / Capt-Campbell, Capt-Ward, Capt-Barron /
    SAT1ips(ip) IPs who can instruct SAT1   / Capt-Campbell, Capt-Ward, Capt-Barron /
    SAT2ips(ip) IPs who can instruct SAT2   / Capt-Campbell, Capt-Ward, Capt-Barron /
    ISR1ips(ip) IPs who can instruct ISR1   / Capt-Campbell, Capt-Ward, Capt-Barron, Capt-Ray, Capt-Yama /
    ISR2ips(ip) IPs who can instruct ISR2   / Capt-Campbell, Capt-Ward, Capt-Barron, Capt-Ray, Capt-Yama /
    SCAR1ips(ip) IPs who can instruct SCAR1 / Capt-Campbell, Capt-Ward, Capt-Barron, Capt-Ray, Capt-Yama /
    CSAR1ips(ip) IPs who can instruct CSAR1 / Capt-Campbell, Capt-Ward, Capt-Barron, Capt-Ray, Capt-Yama /
    CAS1ips(ip) IPs who can instruct CAS1   / Capt-Campbell, Capt-Ward, Capt-Barron, Capt-Ray, Capt-Yama /
    CAS2ips(ip) IPs who can instruct CAS2   / Capt-Campbell, Capt-Ward, Capt-Barron, Capt-Ray, Capt-Yama /
    
    TR1isos(iso)  ISOs who can instruct TR1    / MSgt-Nelson, SSgt-Brant, TSgt-Bianco /
    TR2isos(iso)  ISOs who can instruct TR2    / MSgt-Nelson, SSgt-Brant, TSgt-Bianco /
    BSA1isos(iso) ISOs who can instruct BSA1   / MSgt-Nelson, SSgt-Brant, TSgt-Bianco /
    BSA2isos(iso) ISOs who can instruct BSA2   / MSgt-Nelson, SSgt-Brant, TSgt-Bianco /
    SAT1isos(iso) ISOs who can instruct SAT1   / MSgt-Nelson, SSgt-Brant, TSgt-Bianco /
    SAT2isos(iso) ISOs who can instruct SAT2   / MSgt-Nelson, SSgt-Brant, TSgt-Bianco /
    ISR1isos(iso) ISOs who can instruct ISR1   / MSgt-Nelson, SSgt-Brant, TSgt-Bianco, MSgt-Zimmerman, MSgt-Yerke /
    ISR2isos(iso) ISOs who can instruct ISR2   / MSgt-Nelson, SSgt-Brant, TSgt-Bianco, MSgt-Zimmerman, MSgt-Yerke /
    SCAR1isos(iso) ISOs who can instruct SCAR1 / MSgt-Nelson, SSgt-Brant, TSgt-Bianco, MSgt-Zimmerman, MSgt-Yerke /
    CSAR1isos(iso) ISOs who can instruct CSAR1 / MSgt-Nelson, SSgt-Brant, TSgt-Bianco, MSgt-Zimmerman, MSgt-Yerke /
    CAS1isos(iso) ISOs who can instruct CAS1   / MSgt-Nelson, SSgt-Brant, TSgt-Bianco, MSgt-Zimmerman, MSgt-Yerke /
    CAS2isos(iso) ISOs who can instruct CAS2   / MSgt-Nelson, SSgt-Brant, TSgt-Bianco, MSgt-Zimmerman, MSgt-Yerke /
    
* Lt-Chambers, Lt-Vaughn, Lt-Solano, Lt-Pineiro, Lt-Avignano
    ChambersFirst(e) First event for Chambers  / TR-1 /
    VaughnFirst(e)  First event for Vaughn      / TR-1 /
    SolanoFirst(e)  First event for Solano      / SAT-1 /
    PineiroFirst(e) First event for Pineiro     / SCAR-1 /
    AvignanoFirst(e) First event for Avignano   / SCAR-1 /;
    
Table IPe(ip, e) IPs who can instruct event e
                        TR-1    TR-2    BSA-1   BSA-2   SAT-1   SAT-2   ISR-1   ISR-2   SCAR-1  CSAR-1  CAS-1   CAS-2
    Capt-Campbell       1       1       1       1       1       1       1       1       1       1       1       1
    Capt-Ward           1       1       1       1       1       1       1       1       1       1       1       1
    Capt-Barron         1       1       1       1       1       1       1       1       1       1       1       1
    Capt-Ray                                                            1       1       1       1       1       1
    Capt-Yama                                                           1       1       1       1       1       1;
    
Parameters
       v(e)  value for a student completing event e
        /   TR-1            1
            TR-2            1
            BSA-1           2
            BSA-2           2
            SAT-1           3
            SAT-2           3
            ISR-1           4
            ISR-2           4
            SCAR-1          5
            CSAR-1          6
            CAS-1           7
            CAS-2           8   /
            
        dp(p)    day in which period occurs
        /   P1  1
            P2  1
            P3  1
            P4  1
            P5  2
            P6  2
            P7  2
            P8  2
            P9  3
            P10 3
            P11 3
            P12 3
            P13 4
            P14 4
            P15 4
            P16 4
            P17 5
            P18 5
            P19 5
            P20 5   /;

Variables
    Rep     reward
    Xsep    scheduled variable
    z       sum of rewards;

Equations
* just the definitions of the equations
* semicolon goes at the end of the last definition
     reward(e, p)   reward to have a student in event e in period p
     schedule(up, e, p) 1 if student s is scheduled for event e in period p;
     
* equations
* semicolon goes at the end of every equation
reward(e, p) ..    Rep =e= v(e) / sqrt(dp(p));
    
    


* Example subsets
* subitem1 has pen and pencil when declared, then adds ink and lipstick to it
* subitem2 has everything in item then gets perfume removed from it
*Set  item            "all items"              / dish, ink, lipstick, pen, pencil, perfume /
*     subitem1(item)  "first subset of item"   / pen, pencil /
*     subitem2(item)  "second subset of item";

*subitem1('ink')      = yes ;
*subitem1('lipstick') = yes ;
*subitem2(item)       = yes  ;
*subitem2('perfume')  = no ;
*display subitem1, subitem2;