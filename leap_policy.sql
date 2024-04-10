create or replace FUNCTION LEAP_YN (P_FMD IN DATE, P_TOD IN DATE) RETURN NUMBER IS

F_YN VARCHAR(2);
T_YN VARCHAR(2);
RES NUMBER(2);

BEGIN
         IF  mod(to_number(to_char(P_FMD, 'YYYY')),100)=0 THEN	
             IF mod(to_number(to_char(P_FMD, 'YYYY')),400)=0 THEN 
                 IF to_number(to_char(P_FMD, 'MM'))<=2 THEN F_YN:='Y';
                 ELSE F_YN:=NULL;
                 END IF;
             END IF;
        ELSE IF mod(to_number(to_char(P_FMD, 'YYYY')), 4)=0 THEN
                IF to_number(to_char(P_FMD, 'MM'))<=2  THEN F_YN:='Y' ;
                ELSE F_YN:=NULL;
                END IF;
             END IF;
            END IF;

         IF  mod(to_number(to_char(P_TOD, 'YYYY')), 100)=0 THEN
             IF mod(to_number(to_char(P_TOD, 'YYYY')), 400) = 0 THEN 
                 IF to_number(to_char(P_TOD, 'MM'))>=2  THEN T_YN:='Y';
                 ELSE T_YN:=NULL;
                 END IF;
             END IF;
        ELSE IF mod(to_number(to_char(P_TOD, 'YYYY')), 4)=0 THEN
                IF (to_number(to_char(P_TOD, 'MM'))>=2) THEN T_YN:='Y' ;
                ELSE T_YN:=NULL;
                END IF;
             END IF;
        END IF;

        IF NVL(F_YN,T_YN)='Y' THEN RES:=1;
        ELSE RES:=0;
        END IF;
        RETURN RES;

END LEAP_YN;
