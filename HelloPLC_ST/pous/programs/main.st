PROGRAM main
  VAR
    Timer : TON;
    RealTime : TIME;
  END_VAR
  VAR_INPUT
    NGFel : BOOL;
    NGLe : BOOL;
    Allj : BOOL;
    Vegallas_fent : BOOL;
    Vegallas_lent : BOOL;
  END_VAR
  VAR_OUTPUT
    Kapu_fel : BOOL;
    Kapu_le : BOOL;
    lmpa : BOOL;
  END_VAR

Timer(IN:=NGFel OR NGLe, PT:=T#4s);
if NGFel OR NGLe then
    RealTime:=Timer.ET;
end_if;
Kapu_fel := NOT Allj AND NOT Vegallas_fent AND (NGFel OR RealTime<T#4s) AND NOT Kapu_le ;
Kapu_le:=NOT Allj AND NOT Vegallas_lent AND (NGLe OR RealTime<T#4s) AND NOT Kapu_fel;
lmpa:=Kapu_fel OR Kapu_le;

END_PROGRAM