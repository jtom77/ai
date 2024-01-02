verbatimtex
%&latex
\documentclass{article}
\usepackage{amssymb}
\begin{document}
\footnotesize
\etex

input mpcolornames;

beginfig(1);

u := 20pt;
path c[];

c1 := fullcircle scaled .8u;
c2 := fullcircle scaled 1.2u;

z0 = (5u,0);

s := 3;
path p[];
p0 := (origin -- z0) shifted (0, s);
p1 := (origin -- z0) shifted (0,-s);
p0 := p0 cutbefore c2;
p1 := reverse(p1) cutafter c2;

rot := 150;
p2 := p0 rotated rot;
p3 := p1 rotated rot;

p4 := p0 rotated -rot;
p5 := p1 rotated -rot;

drawarrow p0;
drawarrow p3;
drawarrow p5;

draw c1;
label(btex $\circledast$ etex, origin);

label.top(btex $Z$ etex, point .5 of p0);
label.urt(btex $A$ etex, point .5 of p3);
label.ulft(btex $K, B$ etex, point .5 of p5);

drawoptions(withcolor DeepSkyBlue4);
drawarrow p1;
drawarrow p2;
drawarrow p4;
label.bot(btex $\frac{\partial L}{\partial Z}$ etex, point .5 of p1);
label.llft(btex $\frac{\partial L}{\partial A}$ etex, point .5 of p2);
label.lrt(btex $\frac{\partial L}{\partial K}, \frac{\partial L}{\partial b}$ etex, point .5 of p4);

endfig;
end