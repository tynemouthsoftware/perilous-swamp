!- Perilous Swamp
!- by Psion 1981
!- From "Fantasy Games"
!- Sinclair Research tape G12

!- VIC20 conversion Dave Curran 2025-11-08

!- title page
10 print "{clear}"
20 print
30 print
40 print "    =============="
50 print "    perilous swamp"
60 print "    =============="
70 print
80 print
90 print
100 print " a new adventure game"
110 print
120 print " from psion computers"
130 print
140 print
150 print
160 print "   vic20 version by"
170 print
180 print "   dave curran 2025"

190 p=200
200 gosub 4270

!- instructions
210 print "{clear}"
220 print "in this game,you find"
230 print "yourself in a swampy "
240 print "forest. your task is "
250 print "to find your way to "
260 print "the edge, alive,"
270 print "and with as much"
280 print "treasure as possible."
290 print
300 print "a beautiful princess"
310 print "is held by an evil"
320 print "wizard."
330 print "the king wouldnt mind"
340 print "if you could release"
350 print "her..."
360 print
370 print "should you have to "
380 print "leave early,type out"
390 print "to leave- permanently"

!- initialise whilst user is reading those
400 clr : restore
410 dim a(11,11) : dim v(8) : dim v$(8) : dim n$(10) : dim p$(8) : dim q$(5)
420 for n = 1 to 8 : read v(n), v$(n) : next n
430 for n = 0 to 10 : read n$(n) : next n
440 for n = 0 to 8 : read p$(n) : next n
450 for n = 0 to 5 : read q$(n) : next n
460 ii=1
470 q=0
480 xxx=0
490 z=0
500 s=0
510 bat=0
520 n=0
530 pr=0
540 r=rnd(-ti)
550 for i=2 to 10
560 for j=2 to 10
570 a(i,j)=1
580 if rnd(1)>.6 then a(i,j)=2
590 next j
600 next i
610 x=int (rnd(1)*5+3)
620 y=2
630 a(x,y)=5
640 xp=int (rnd(1)*3+5)
650 yp=int (rnd(1)*3+5)
660 if a(xp,yp)=5 then goto 650
670 a(xp,yp)=4
680 c=int (rnd(1)*1501+500)

!- now show the press any key
690 print
700 print "press any key to start"
710 p=2000
720 gosub 4270
730 print "{clear}";
740 gosub 3310

!- what to do
750 goto 2060
760 print
770 print "your combat strength"
780 print "is";c
790 print
800 gosub 1560
810 if i>11 then goto 770
820 print
830 if m=0 then print "you get the treasure" : print "for free" : goto 1920
840 if m=90 and n=1 then goto 3250
850 print "do you wish to-"
860 print "fight,run,or bribe";
870 input x$
880 if x$="" then goto 870
890 x1$=left$(x$,1)
900 if x1$="f" then goto 990
910 if x$="zap" and z>0 then goto 4210
920 if x1$="r" then goto 1340
930 if x$="***" and xxx=1 then goto 4160
940 if x$="bat" and bat>0 then goto 2730
950 if x$="bat" then goto 850
960 if x1$="b" then goto 2340
970 if x1$="o" then goto 1310
980 goto 850

!- fight
990 print "how many combat points"
1000 input x$
1010 if x$="" then goto 990
1020 if left$(x$,1)="o" then goto 1310
1030 k=val(x$)
1040 if k>c then print "but you only have" : print c;"points" : print : goto 990
1050 i=int (rnd(1)*1000)
1060 l=2
1070 c=c-k
1080 k=k-.03*q
1090 for h=1000 to 0 step -50
1100 if l*m<=k and h>=i then goto 1810
1110 l=l-.1
1120 next h
1130 print
1140 print "too bad...the monster"
1150 print "ate you...and took "
1160 print "all your treasure..."
1170 if pr=0 then goto 3690
1180 print "he also gobbled up"
1190 print "the princess"
1200 pr=0
1210 print
1220 print "try again?..."
1230 print "you could get lucky"
1240 if pr=0 then goto 1270
1250 print "and find a prettier"
1260 print "princess"
1270 input x$
1280 if x$="" then goto 1270
1290 if left$(x$,1)="y" then goto 400
1300 print "{clear}"

!- out
1310 print "so long..."
1320 print "better luck next time"
1330 stop

!- run
1340 i=int (rnd(1)*12)
1350 print
1360 if i=11 then print "the monster ran" : print "faster than you" : print : goto 1130
1370 for h=0 to 10
1380 if h*10>m and h<=i then goto 1430
1390 next h
1400 print
1410 print "but not fast enough..."
1420 goto 2700

!- you ran away
1430 print "you sure run fast if"
1440 print "you need to"
1450 print
1460 if c>50 then c=c-50
1470 a=x
1480 b=y
1490 x=int (rnd(1)*3-1)+a
1500 y=int (rnd(1)*3-1)+b
1510 if a(x,y)>1 then goto 1490
1520 if a(x,y)=0 then goto 3510
1530 a(a,b)=1
1540 a(x,y)=5
1550 if i<>11 then goto 760

!- new square
1560 i=int (rnd(1)*15)
1570 if a(x,y)=4 then i=10
1580 m=i*10
1590 if i=0 then goto 3970
1600 if i=11 then goto 3890
1610 if i=12 then goto 2870
1620 if i=13 then goto 2730
1630 if i=14 then goto 3460
1640 a1=int (rnd(1)*9)
1650 a2=int (rnd(1)*9)
1660 if a2=a1 then goto 1650
1670 print "a ";p$(a1)+", "+p$(a2)
1680 print n$(i)
1690 print
1700 ii=i
1710 i=int (rnd(1)*7)+1
1720 if a(x,y)=4 then i=8
1730 print "is guarding"
1740 print v$(i)
1750 if ii=10 and rnd(1)>.4 then gosub 3830
1760 p=v(i)
1770 print
1780 print "his combat points"
1790 print "come to";m
1800 return

!- unlucky
1810 print
1820 if h>700 then goto 1880
1830 print "he wont give you his"
1840 print "treasure"
1850 print
1860 m=int (m/2)
1870 goto 850

!- lucky
1880 if h<=900 and h>700 then print "lucky he was not at" : print "all well"
1890 if h>900 then print "you sure smashed that" : print "monster"
1900 print
1910 s=s+1
1920 q=q+p
1930 if ii=10 and rnd(1)>.5 then gosub 4010
1940 if p=30 then gosub 3020
1950 if p=200 then gosub 3100
1960 if p=200 then gosub 3170
1970 print
1980 print "your illgotten gains"
1990 print "now come to";q;"points"
2000 if a(x,y)<>4 then goto 2060
2010 pr=1
2020 print
2030 print "the princess comes"
2040 print "with you"
2050 a(x,y)=5

!- which way now?
2060 print
2070 a=x
2080 b=y
2090 print "which way now?"
2100 print "n,s,e,w or"
2110 print "se,nw etc or map";
2120 input x$
2130 if x$="" then goto 2120
2140 rem print x$
2150 x1$ = left$(x$,1) : x2$ = right$(x$,1)
2160 if x1$="o" then goto 1310
2170 if x1$="m" then gosub 3300 : goto 2090
2180 if x2$="w" then x=x-1
2190 if x2$="e" then x=x+1
2200 if x1$="n" then y=y-1
2210 if x1$="s" then y=y+1
2220 if (x=a and y=b) then goto 2090
2230 if a(x,y)=0 then goto 3510
2240 if a(x,y)<>2 then goto 2310
2250 x=a
2260 y=b
2270 print
2280 print "too wet that way,clot"
2290 print
2300 goto 2090

!- move the player
2310 a(a,b)=1
2320 if a(x,y)=1 then a(x,y)=5
2330 goto 760

!- bribe
2340 print
2350 print "how much do you reckon"
2360 print "your miserable hide"
2370 print "is worth"
2380 input x$
2390 if x$="" then goto 2380
2400 if left$(x$,1)="o" then goto 1310
2410 k=val(x$)
2420 print
2430 if k<q then goto 2480
2440 if k=0 then goto 2610
2450 print "your bank manager"
2460 print "does not agree"
2470 goto 2340

!- bribe accepted
2480 i=int (rnd(1)*22)
2490 l=0
2500 if i=2 or k<1 then goto 1130
2510 for h=0 to 20
2520 if k<=l*p and i>=h then goto 2610
2530 l=l+.1
2540 next h
2550 rem scroll
2560 print "your measly bribe was"
2570 print "accepted"
2580 print
2590 q=q-k
2600 goto 1970

!- bribe with nothing
2610 print
2620 print "the monster spurns"
2630 print "such a pitifully"
2640 print "inadequate sum..."
2650 print
2660 print "which it took as an"
2670 print "insult and now "
2680 print "threatens to tear off"
2690 print "your arm..."
2700 print
2710 print "now you can only fight"
2720 goto 990

!- bat
2730 print
2740 if bat>0 then bat=bat-1
2750 print "a giant bat has"
2760 print "transported you"
2770 print "to another place"
2780 print
2790 a=x
2800 b=y
2810 x=int (rnd(1)*7)+2
2820 y=int (rnd(1)*7)+2
2830 if a(x,y)<>1 then goto 2810
2840 a(a,b)=1
2850 a(x,y)=5
2860 goto 770

!- pit
2870 j=int (rnd(1)*40+40)
2880 c=c-j
2890 print
2900 print "clumsy-you just fell"
2910 print "into a pit of noisome"
2920 print "water and used";j
2930 print "points to get out"
2940 print
2950 if c>=0 then goto 1470
2960 print
2970 print "or would have..."
2980 print "had you not drowned"
2990 print "trying..."
3000 print
3010 goto 3690

!- it's a kind of magic (sword)
3020 if rnd(1)<.5 or c>3000 then return
3030 print
3040 print "the sword was magic"
3050 print "and doubled your"
3060 print "strength"
3070 print
3080 c=c*2
3090 return

!- chest
3100 if (int (rnd(1)*10))<>5 then return
3110 print
3120 print "what rotten luck"
3130 print "the chest exploded"
3140 print "and did you in..."
3150 print
3160 goto 3690

!- knife
3170 if (int (rnd(1)*10))<8 then return
3180 print
3190 print "a magic knife was in"
3200 print "the chest which kills"
3210 print "any ogres you meet"
3220 print
3230 n=1
3240 return

!- it's a dagger now, apparently
3250 print
3260 print "your magic dagger"
3270 print "killed it"
3280 print
3290 goto 1910

!- display map
3300 print
3310 for i=1 to 11
3320 for j=1 to 11
3330 print q$(a(j,i));
3340 next j
3350 if i=2 then print "   n";
3360 if i=4 then print "  w+e";
3370 if i=5 then print "   s";
3380 if i=7 then print " x= you";
3390 if (i=8) and (pr=0) then print " S=princess"; : goto 3430
3400 if i=10 then print " {reverse on} {reverse off}=swamp";
3410 if i=11 then print " {cm +}=edge";
3420 print
3430 next i
3440 print
3450 return

!- what happened?
3460 if s<5 then goto 1560
3470 print
3480 print "a giant eagle carried"
3490 print "you to safety"
3500 print "thoughtful,eh?"
3510 print
3520 print "you survived the swamp";
3530 if q<500 then print "with 1/10 skill" : print "and 9/10 luck"
3540 if (q>=500 and c<500) then print "with not" : print "inconsiderable skill"
3550 if q>=500 and c>=500 then print "with remarkable skill" : print "and patience"
3560 print
3570 print "you ripped off a total";
3580 print "of";q;"treasure" "
3590 print "points off the poor"
3600 print "overworked monsters"
3610 if s=0 then goto 3650
3620 print s;"of them died"
3630 print "protecting their"
3640 print "rightful treasure"
3650 print
3660 print "congratulations..."
3670 print
3680 if pr=1 then goto 3760
3690 print "pity about the"
3700 print "princess...the wizard"
3710 print "fed her to a dragon"
3720 print
3730 print "the king is not all"
3740 print "that pleased"
3750 goto 1210

!- you won!
3760 print "the king was most"
3770 if q<=500 then print "grateful and let you" : print "keep one gold piece"
3780 if (q>500) and (q<=1000) then print "grateful and made you" : print "chief dragon slayer"
3790 if q>1000 then print "grateful and gave you" : print "half the kingdom"
3800 print "the princess was"
3810 print "grateful too..."
3820 goto 1210

!- the wizard has a commodore
3830 j=int (rnd(1)*9)+1
3840 print
3850 print "the wizard has his pet";
3860 print n$(j)
3870 m=m+j*10
3880 return

!- stop! theif!
3890 if q=0 then goto 1560
3900 q=int (q/2)
3910 print
3920 print "a sneaky thief stole"
3930 print "half your treasure..."
3940 print "can't trust anyone"
3950 print
3960 goto 1560

!- hey there little mouse
3970 print
3980 print "a small grey mouse"
3990 print
4000 goto 1700

!- my precious
4010 print "he had a magic ring"
4020 print "marked ";
4030 goto 4040+40*int (rnd(1)*3)

!- zap ring
4040 print "{reverse on}zap{reverse off}"
4050 print
4060 z=z+3
4070 return

!- bat ring
4080 print "{reverse on}bat{reverse off}"
4090 bat=3
4100 print
4110 return

!- xxx, oh my
4120 print "{reverse on}***{reverse off}"
4130 xxx=1
4140 print
4150 return

!- kaboom
4160 print
4170 print "the *** ring exploded"
4180 print "...how sad"
4190 print
4200 goto 3690

!- zap
4210 print
4220 print "monsters die when"
4230 print "zapped"
4240 print
4250 z=z-1
4260 goto 1900

!- pause routine
4270 t0 = ti
4280 if ti-t0 > p then return
4290 get k$
4300 if k$<>"" then return
4310 goto 4280

!- v,v$ data
4320 data 10, "10 silver spoons"
4330 data 30, "a jewelled sword"
4340 data 50, "a jar of rubies"
4350 data 200, "a treasure chest"
4360 data 50,"50 silver pieces"
4370 data 100,"100 gold pieces"
4380 data 75, "a box of jewels"
4390 data 1, "a fair princess"

!- n$ data
4400 data "nothing", "werewolf", "bunyip"
4410 data "phoenix", "troll", "goblin"
4420 data "giant", "gorgon", "dragon"
4430 data "ogre", "wizard"

!- p$ data
4440 data "fiendish", "green", "foul"
4450 data "slimy", "tough", "horrible"
4460 data "hungry", "nasty", "dirty"

!- q$ data
4470 data "{cm +}", " ", "{reverse on} {reverse off}", " ", "S", "x"
