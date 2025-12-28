!- Perilous Swamp
!- by Psion 1981
!- From "Fantasy Games"
!- Sinclair Research tape G12
!- TED conversion Dave Curran 2025-11-09

!- title page
10 print "{clear}"
20 print
30 print
40 print "            =============="
50 print "            perilous swamp"
60 print "            =============="
70 print
80 print
90 print
100 print "         a new adventure game"
110 print
120 print "         from psion computers"
130 print
140 print
150 print
160 print "            ted version by"
170 print
180 print "           dave curran 2025"
190 p=200
200 gosub 3930

!- instructions
210 print "{clear}"
220 print "in this game, you find yourself in a"
230 print
240 print "swampy forest. your task is to find"
250 print
260 print "your way to the edge, alive, and with"
270 print
280 print "as much treasure as possible."
290 print
300 print
310 print "a beautiful princess is held by an"
320 print
330 print "evil wizard. the king wouldnt mind"
340 print
350 print "if you could release her..."
360 print
370 print
380 print "should you have to leave early,"
390 print
400 print "type out to leave - permanently"
410 print

!- initialise whilst user is reading those
420 clr : restore
430 dim a(11,11) : dim v(8) : dim v$(8) : dim n$(10) : dim p$(8) : dim q$(5)
440 for n = 1 to 8 : read v(n), v$(n) : next n
450 for n = 0 to 10 : read n$(n) : next n
460 for n = 0 to 8 : read p$(n) : next n
470 for n = 0 to 5 : read q$(n) : next n
480 ii=1
490 q=0
500 xxx=0
510 z=0
520 s=0
530 bat=0
540 n=0
550 pr=0
560 r=rnd(-ti)
570 for i=2 to 10
580 for j=2 to 10
590 a(i,j)=1
600 if rnd(1)>.6 then a(i,j)=2
610 next j
620 next i
630 x=int (rnd(1)*5+3)
640 y=2
650 a(x,y)=5
660 xp=int (rnd(1)*3+5)
670 yp=int (rnd(1)*3+5)
680 if a(xp,yp)=5 then goto 670
690 a(xp,yp)=4
700 c=int (rnd(1)*1501+500)

!- now show the press any key
710 print
720 print "        press any key to start"
730 p=2000
740 gosub 3930
750 print "{clear}";
760 gosub 3080

!- what to do
770 goto 1960
780 print
790 print "your combat strength is";c
800 print
810 gosub 1510
820 if i>11 then goto 790
830 print
840 if m=0 then print "you get the treasure for free" : goto 1830
850 if m=90 and n=1 then goto 3030
860 print "do you wish to fight, run, or bribe"
870 input x$
880 if x$="" then goto 870
890 x1$=left$(x$,1)
900 if x1$="f" then goto 990
910 if x$="zap" and z>0 then goto 3880
920 if x1$="r" then goto 1300
930 if x$="***" and xxx=1 then goto 3840
940 if x$="bat" and bat>0 then goto 2570
950 if x$="bat" then goto 860
960 if x1$="b" then goto 2230
970 if x1$="o" then goto 1270
980 goto 860

!- fight
990 print "how many combat points"
1000 input x$
1010 if x$="" then goto 990
1020 if left$(x$,1)="o" then goto 1270
1030 k=val(x$)
1040 if k>c then print "but you only have";c;"points" : print : goto 990
1050 i=int (rnd(1)*1000)
1060 l=2
1070 c=c-k
1080 k=k-.03*q
1090 for h=1000 to 0 step -50
1100 if l*m<=k and h>=i then goto 1730
1110 l=l-.1
1120 next h
1130 print
1140 print "too bad...the monster ate you..."
1150 print "and took all your treasure..."
1160 if pr=0 then goto 3430
1170 print "he also gobbled up the princess"
1180 pr=0
1190 print
1200 print "try again?...you could get lucky"
1210 if pr=0 then goto 1230
1220 print "and find a prettier princess"
1230 input x$
1240 if x$="" then goto 1230
1250 if left$(x$,1)="y" then goto 420
1260 print "{clear}"

!- out
1270 print "so long..."
1280 print "better luck next time"
1290 stop

!- run
1300 i=int (rnd(1)*12)
1310 print
1320 if i=11 then print "the monster ran faster than you" : print : goto 1130
1330 for h=0 to 10
1340 if h*10>m and h<=i then goto 1390
1350 next h
1360 print
1370 print "but not fast enough..."
1380 goto 2530

!- you ran away
1390 print "you sure run fast if you need to"
1400 print
1410 if c>50 then c=c-50
1420 a=x
1430 b=y
1440 x=int (rnd(1)*3-1)+a
1450 y=int (rnd(1)*3-1)+b
1460 if a(x,y)>1 then goto 1440
1470 if a(x,y)=0 then goto 3270
1480 a(a,b)=1
1490 a(x,y)=5
1500 if i<>11 then goto 780

!- new square
1510 i=int (rnd(1)*15)
1520 if a(x,y)=4 then i=10
1530 m=i*10
1540 if i=0 then goto 3660
1550 if i=11 then goto 3590
1560 if i=12 then goto 2700
1570 if i=13 then goto 2570
1580 if i=14 then goto 3230
1590 a1=int (rnd(1)*9)
1600 a2=int (rnd(1)*9)
1610 if a2=a1 then goto 1600
1620 print "a ";p$(a1);", ";p$(a2);" ";n$(i)
1630 print
1640 ii=i
1650 i=int (rnd(1)*7)+1
1660 if a(x,y)=4 then i=8
1670 print "is guarding ";v$(i)
1680 if ii=10 and rnd(1)>.4 then gosub 3540
1690 p=v(i)
1700 print
1710 print "his combat points come to";m
1720 return

!- unlucky
1730 print
1740 if h>700 then goto 1790
1750 print "he wont give you his treasure"
1760 print
1770 m=int (m/2)
1780 goto 860

!- lucky
1790 if h<=900 and h>700 then print "lucky he was not at all well"
1800 if h>900 then print "you sure smashed that monster"
1810 print
1820 s=s+1
1830 q=q+p
1840 if ii=10 and rnd(1)>.5 then gosub 3700
1850 if p=30 then gosub 2830
1860 if p=200 then gosub 2900
1870 if p=200 then gosub 2960
1880 print
1890 print "your illgotten gains now come to"
1900 print q;"points"
1910 if a(x,y)<>4 then goto 1960
1920 pr=1
1930 print
1940 print "the princess comes with you"
1950 a(x,y)=5

!- which way now?
1960 print
1970 a=x
1980 b=y
1990 print "which way now?"
2000 print "n,s,e,w or se,nw etc or map";
2010 input x$
2020 if x$="" then goto 2010
2030 rem print x$
2040 x1$ = left$(x$,1) : x2$ = right$(x$,1)
2050 if x1$="o" then goto 1270
2060 if x1$="m" then gosub 3070 : goto 1990
2070 if x2$="w" then x=x-1
2080 if x2$="e" then x=x+1
2090 if x1$="n" then y=y-1
2100 if x1$="s" then y=y+1
2110 if (x=a and y=b) then goto 1990
2120 if a(x,y)=0 then goto 3270
2130 if a(x,y)<>2 then goto 2200
2140 x=a
2150 y=b
2160 print
2170 print "too wet that way, clot"
2180 print
2190 goto 1990

!- move the player
2200 a(a,b)=1
2210 if a(x,y)=1 then a(x,y)=5
2220 goto 780

!- bribe
2230 print
2240 print "how much do you reckon your miserable"
2250 print "hide is worth"
2260 input x$
2270 if x$="" then goto 2260
2280 if left$(x$,1)="o" then goto 1270
2290 k=val(x$)
2300 print
2310 if k<q then goto 2350
2320 if k=0 then goto 2470
2330 print "your bank manager does not agree"
2340 goto 2230

!- bribe accepted
2350 i=int (rnd(1)*22)
2360 l=0
2370 if i=2 or k<1 then goto 1130
2380 for h=0 to 20
2390 if k<=l*p and i>=h then goto 2470
2400 l=l+.1
2410 next h
2420 rem scroll
2430 print "your measly bribe was accepted"
2440 print
2450 q=q-k
2460 goto 1880

!- bribe with nothing
2470 print
2480 print "the monster spurns such a pitifully"
2490 print "inadequate sum..."
2500 print
2510 print "which it took as an insult and now"
2520 print "threatens to tear off your arm..."
2530 print
2540 print "now you can only fight"
2550 print
2560 goto 990

!- bat
2570 print
2580 if bat>0 then bat=bat-1
2590 print "a giant bat has transported you to"
2600 print "another place"
2610 print
2620 a=x
2630 b=y
2640 x=int (rnd(1)*7)+2
2650 y=int (rnd(1)*7)+2
2660 if a(x,y)<>1 then goto 2640
2670 a(a,b)=1
2680 a(x,y)=5
2690 goto 790

!- pit
2700 j=int (rnd(1)*40+40)
2710 c=c-j
2720 print
2730 print "clumsy-you just fell into a pit of"
2740 print "noisome  water and used";j
2750 print "points to get out"
2760 print
2770 if c>=0 then goto 1420
2780 print
2790 print "or would have..."
2800 print "had you not drowned trying..."
2810 print
2820 goto 3430

!- it's a kind of magic (sword)
2830 if rnd(1)<.5 or c>3000 then return
2840 print
2850 print "the sword was magic and doubled your"
2860 print "strength"
2870 print
2880 c=c*2
2890 return

!- chest
2900 if (int (rnd(1)*10))<>5 then return
2910 print
2920 print "what rotten luck the chest exploded"
2930 print "and did you in..."
2940 print
2950 goto 3430

!- knife
2960 if (int (rnd(1)*10))<8 then return
2970 print
2980 print "a magic knife was in the chest which"
2990 print "kills any ogres you meet"
3000 print
3010 n=1
3020 return

!- it's a dagger now, apparently
3030 print
3040 print "your magic dagger killed it"
3050 print
3060 goto 1820

!- display map
3070 print
3080 for i=1 to 11
3090 for j=1 to 11
3100 print q$(a(j,i));
3110 next j
3120 if i=2 then print "   n";
3130 if i=4 then print "  w+e";
3140 if i=5 then print "   s";
3150 if i=7 then print " x= you";
3160 if (i=8) and (pr=0) then print " S=princess";
3170 if i=10 then print " {reverse on} {reverse off}=swamp";
3180 if i=11 then print " {166}=edge";
3190 print
3200 next i
3210 print
3220 return

!- what happened?
3230 if s<5 then goto 1510
3240 print
3250 print "a giant eagle carried you to safety"
3260 print "thoughtful,eh?"
3270 print
3280 print "you survived the swamp with"
3290 if q<500 then print "1/10 skill and 9/10 luck"
3300 if (q>=500 and c<500) then print "not inconsiderable skill"
3310 if q>=500 and c>=500 then print "remarkable skill and patience"
3320 print
3330 print "you ripped off a total of"
3340 print q;"treasure points off the"
3350 print "poor overworked monsters"
3360 if s=0 then goto 3390
3370 print s;"of them died protecting their"
3380 print "rightful treasure"
3390 print
3400 print "congratulations..."
3410 print
3420 if pr=1 then goto 3480
3430 print "pity about the princess..."
3440 print "the wizard fed her to a dragon"
3450 print
3460 print "the king is not all that pleased"
3470 goto 1190

!- you won!
3480 print "the king was most grateful and"
3490 if q<=500 then print "let you keep one gold piece"
3500 if (q>500) and (q<=1000) then print "made you chief dragon slayer"
3510 if q>1000 then print "gave you half the kingdom"
3520 print "the princess was grateful too..."
3530 goto 1190

!- the wizard has a commodore
3540 j=int (rnd(1)*9)+1
3550 print
3560 print "the wizard has his pet ";n$(j)
3570 m=m+j*10
3580 return

!- stop! theif!
3590 if q=0 then goto 1510
3600 q=int (q/2)
3610 print
3620 print "a sneaky thief stole half your"
3630 print "treasure...can't trust anyone"
3640 print
3650 goto 1510

!- hey there little mouse
3660 print
3670 print "a small grey mouse"
3680 print
3690 goto 1640

!- my precious
3700 print "he had a magic ring marked ";
3710 on int(rnd(1)*3) goto 3760,3800

!- zap ring
3720 print "{reverse on}zap{reverse off}"
3730 print
3740 z=z+3
3750 return

!- bat ring
3760 print "{reverse on}bat{reverse off}"
3770 bat=3
3780 print
3790 return

!- xxx, oh my
3800 print "{reverse on}***{reverse off}"
3810 xxx=1
3820 print
3830 return

!- kaboom
3840 print
3850 print "the *** ring exploded...how sad"
3860 print
3870 goto 3430

!- zap
3880 print
3890 print "monsters die when zapped"
3900 print
3910 z=z-1
3920 goto 1810

!- press a key
3930 t0 = ti
3940 if ti-t0 > p then return
3950 get k$
3960 if k$<>"" then return
3970 goto 3940

!- v,v$ data
3980 data 10, "10 silver spoons"
3990 data 30, "a jewelled sword"
4000 data 50, "a jar of rubies"
4010 data 200, "a treasure chest"
4020 data 50,"50 silver pieces"
4030 data 100,"100 gold pieces"
4040 data 75, "a box of jewels"
4050 data 1, "a fair princess"

!- n$ data
4060 data "nothing", "werewolf", "bunyip"
4070 data "phoenix", "troll", "goblin"
4080 data "giant", "gorgon", "dragon"
4090 data "ogre", "wizard"

!- p$ data
4100 data "fiendish", "green", "foul"
4110 data "slimy", "tough", "horrible"
4120 data "hungry", "nasty", "dirty"

!- q$ data
4130 data "{166}", " ", "{reverse on} {reverse off}", " ", "S", "x"