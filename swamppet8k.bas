!- Perilous Swamp
!- by Psion 1981
!- From "Fantasy Games"
!- Sinclair Research tape G12
!- PET conversion Dave Curran 2025-11-09
!- Revised to fit in 8K 2025-12-20
!- title page
1print"{clear}{down}{down}{down}            ==============
2print"            perilous swamp
3print"            ==============
4print"{down}{down}{down}         a new adventure game
5print"{down}         from psion computers
6print"{down}{down}{down}            pet version by
7print"{down}           dave curran 2025":p=200:gosub187
!- instructions
8print"{clear}in this game, you find yourself in a
9print"{down}swampy forest. your task is to find
10print"{down}your way to the edge, alive, and with
11print"{down}as much treasure as possible.
12print"{down}{down}a beautiful princess is held by an
13print"{down}evil wizard. the king wouldnt mind
14print"{down}if you could release her...
15print"{down}{down}should you have to leave early,
16print"{down}type out to leave - permanently
17clr:restore:dima%(11,11):dimn$(10):dimp$(8):dimq$(5):fori=0to10:readn$(i):next
18fori=0to8:readp$(i):next:fori=0to5:readq$(i):next
19ii=1:q=0:xxx=0:z=0:s=0:bat=0:n=0:pr=0:r=rnd(-ti):fori=2to10:forj=2to10:a%(i,j)=1
20ifrnd(1)>.6thena%(i,j)=2
21next:next:x=int(rnd(1)*5+3):y=2:a%(x,y)=5:xp=int(rnd(1)*3+5)
22yp=int(rnd(1)*3+5):ifa%(xp,yp)=5thengoto22
23a%(xp,yp)=4:c=int(rnd(1)*1501+500)
!- now show the press any key
24print "{down}{down}        press any key to start":p=2000:gosub187
25print"{clear}";:gosub150
!- what to do
26goto103
27print"{down}your combat strength is"c"{return}":gosub69
28ifi>11thengoto27
29print:ifm=0thenprint"you get the treasure for free":goto96
30ifm=90andn=1thengoto148
31print"do you wish to fight, run, or bribe
32inputx$:ifx$=""thengoto32
33x1$=left$(x$,1)
34ifx1$="f"thengoto43
35ifx$="zap"andz>0thengoto186
36ifx1$="r"thengoto59
37ifx$="***"andxxx=1thengoto185
38ifx$="bat"andbat>0thengoto133
39ifx$="bat"thengoto31
40ifx1$="b"thengoto119
41ifx1$="o"thengoto58
42goto31
!- fight
43print"how many combat points":inputx$:ifx$=""thengoto43
44ifleft$(x$,1)="o"thengoto58
45k=val(x$):ifk>cthenprint"but you only have"c"points":print:goto43
46i=int(rnd(1)*1000):l=2:c=c-k:k=k-.03*q
47forh=1000to0step-50:ifl*m<=kandh>=ithengoto91
48l=l-.1:next
49print"{down}too bad...the monster ate you...{return}and took all your treasure...
50ifpr=0thengoto169
51print"he also gobbled up the princess":pr=0
52print"{down}try again?...you could get lucky
53ifpr=0thengoto55
54print"and find a prettier princess
55inputx$:ifx$=""thengoto55
56ifleft$(x$,1)="y"thengoto17
57print"{clear}
!- out
58print"so long...{return}better luck next time":stop
!- run
59i=int(rnd(1)*12):print
60ifi=11thenprint"the monster ran faster than you{return}":goto49
61forh=0to10:ifh*10>mandh<=ithengoto64
62next
63print"{down}but not fast enough...":goto132
!- you ran away
64print"you sure run fast if you need to{return}":ifc>50thenc=c-50
65a=x:b=y
66x=int(rnd(1)*3-1)+a:y=int(rnd(1)*3-1)+b:ifa%(x,y)>1thengoto66
67ifa%(x,y)=0thengoto161
68a%(a,b)=1:a%(x,y)=5:ifi<>11thengoto27
!- new square
69i=int(rnd(1)*15):ifa%(x,y)=4theni=10
70m=i*10
71ifi=0thengoto180
72ifi=11thengoto177
73ifi=12thengoto138
74ifi=13thengoto133
75ifi=14thengoto159
76a1=int(rnd(1)*9)
77a2=int(rnd(1)*9):ifa2=a1thengoto77
78print"a "p$(a1)", "p$(a2)" "n$(i)"{return}"
79ii=i:i=int(rnd(1)*7)+1:ifa%(x,y)=4theni=8
80print"is guarding ";
81ifi=1thenp=10:print"10 silver spoons
82ifi=2thenp=30:print"a jewelled sword
83ifi=3thenp=50:print"a jar of rubies
84ifi=4thenp=200:print"a treasure chest
85ifi=5thenp=50:print"50 silver pieces
86ifi=6thenp=100:print"100 gold pieces
87ifi=7thenp=75:print"a box of jewels
88ifi=8thenp=1:print"a fair princess
89ifii=10andrnd(1)>.4thengosub176
90print"{down}his combat points come to"m:return
!- unlucky
91print:ifh>700thengoto93
92print"he wont give you his treasure{return}":m=int(m/2):goto31
!- lucky
93ifh<=900andh>700thenprint"lucky he was not at all well
94ifh>900thenprint"you sure smashed that monster
95print:s=s+1
96q=q+p:ifii=10andrnd(1)>.5thengosub181
97ifp=30thengosub142
98ifp=200thengosub144
99ifp=200thengosub146
100print"{down}your illgotten gains now come to{return}"q"points
101ifa%(x,y)<>4thengoto103
102pr=1:print"{down}the princess comes with you":a%(x,y)=5
!- which way now?
103print:a=x:b=y
104print"which way now?{return}n,s,e,w or se,nw etc or map";
105inputx$:ifx$=""thengoto105
106x1$=left$(x$,1):x2$=right$(x$,1)
107ifx1$="o"thengoto58
108ifx1$="m"thengosub149:goto104
109ifx2$="w"thenx=x-1
110ifx2$="e"thenx=x+1
111ifx1$="n"theny=y-1
112ifx1$="s"theny=y+1
113if(x=aandy=b)thengoto104
114ifa%(x,y)=0thengoto161
115ifa%(x,y)<>2thengoto117
116x=a:y=b:print"{down}too wet that way, clot{return}":goto104
!- move the player
117a%(a,b)=1:ifa%(x,y)=1thena%(x,y)=5
118goto27
!- bribe
119print"{down}how much do you reckon your miserable{return}hide is worth
120inputx$:ifx$=""thengoto120
121ifleft$(x$,1)="o"thengoto58
122k=val(x$):print
123ifk<qthengoto126
124ifk=0thengoto130
125print"your bank manager does not agree":goto119
!- bribe accepted
126i=int(rnd(1)*22):l=0:ifi=2ork<1thengoto49
127forh=0to20:ifk<=l*pandi>=hthengoto130
128l=l+.1:2410next
129print"your measly bribe was accepted{return}":q=q-k:goto100
!- bribe with nothing
130print"{down}the monster spurns such a pitifully{return}inadequate sum...
131print"{down}which it took as an insult and now{return}threatens to tear off your arm...
132print"{down}now you can only fight{return}":goto43
!- bat
133ifbat>0thenbat=bat-1
134print"{down}a giant bat has transported you to{return}another place{return}
135a=x:b=y
136x=int(rnd(1)*7)+2:y=int(rnd(1)*7)+2:ifa%(x,y)<>1thengoto136
137a%(a,b)=1:a%(x,y)=5:goto27
!- pit
138j=int(rnd(1)*40+40):c=c-j
139print"{down}clumsy-you just fell into a pit of{return}noisome  water and used"j
140print"points to get out{return}":ifc>=0thengoto65
141print"{down}or would have...{return}had you not drowned trying...{return}":goto169
!- it's a kind of magic (sword)
142ifrnd(1)<.5orc>3000thenreturn
143print"{down}the sword was magic and doubled your{return}strength{return}":c=c*2:return
!- chest
144if(int(rnd(1)*10))<>5thenreturn
145print"{down}what rotten luck the chest exploded{return}and did you in...{return}":goto169
!- knife
146if(int(rnd(1)*10))<8thenreturn
147print"{down}a magic knife was in the chest which{return}kills any ogres you meet{return}":n=1:return
!- it's a dagger now, apparently
148print"{down}your magic dagger killed it":goto95
!- display map
149print
150fori=1to11:forj=1to11:printq$(a%(j,i));:next
151ifi=2thenprint"   n";
152ifi=4thenprint"  w+e";
153ifi=5thenprint"   s";
154ifi=7thenprint" x= you";
155if(i=8)and(pr=0)thenprint" S=princess";
156ifi=10thenprint" {reverse on} {reverse off}=swamp";
157ifi=11thenprint" {cm +}=edge";
158print:next:print:return
!- what happened?
159ifs<5thengoto69
160print"{down}a giant eagle carried you to safety{return}thoughtful,eh?
161print"{down}you survived the swamp with
162ifq<500thenprint"1/10 skill and 9/10 luck
163if(q>=500andc<500)thenprint"not inconsiderable skill
164ifq>=500andc>=500thenprint"remarkable skill and patience
165print"{down}you ripped off a total of{return}"q"treasure points off the
166print"poor overworked monsters":ifs=0thengoto168
167prints"of them died protecting their{return}rightful treasure
168print"{down}congratulations...{return}":ifpr=1thengoto171
169print"pity about the princess...{return}the wizard fed her to a dragon
170print"{down}the king is not all that pleased":goto52
!- you won!
171print"the king was most grateful and
172ifq<=500thenprint"let you keep one gold piece
173if(q>500)and(q<=1000)thenprint"made you chief dragon slayer
174ifq>1000thenprint"gave you half the kingdom
175print"the princess was grateful too...":goto52
!- the wizard has a commodore
176j=int(rnd(1)*9)+1:print"{down}the wizard has his pet "n$(j):m=m+j*10:return
!- stop! thief!
177ifq=0thengoto69
178q=int(q/2):print"{down}a sneaky thief stole half your
179print"treasure...can't trust anyone{return}":goto69
!- hey there little mouse
180print"{down}a small grey mouse{return}":goto79
!- my precious
181print"he had a magic ring marked ";:onrnd(1)*3goto183,184
!- zap ring
182print"{reverse on}zap{reverse off}{return}":z=z+3:return
!- bat ring
183print"{reverse on}bat{reverse off}{return}":bat=3:return
!- xxx, oh my
184print"{reverse on}***{reverse off}{return}":xxx=1:return
!- kaboom
185print"{down}the *** ring exploded...how sad{return}":goto169
!- zap
186print"{down}monsters die when zapped{return}":z=z-1:goto95
!- press a key
187t0=ti
188ifti-t0>pthenreturn
189getk$:ifk$<>""thenreturn
190goto188
!- data
191datanothing,werewolf,bunyip,phoenix,troll,goblin,giant,gorgon,dragon,ogre
192datawizard,fiendish,green,foul,slimy,tough,horrible,hungry,nasty,dirty
193data"{cm +}"," ","{reverse on} {reverse off}"," ","S","x"