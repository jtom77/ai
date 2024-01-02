verbatimtex
%&latex
\documentclass{article}
\usepackage{amssymb}
\begin{document}
\footnotesize
\etex

input mpcolornames;
input TEX;
TEXPRE("%&latex" & char(10) & "\documentclass{article}\begin{document}\footnotesize");
TEXPOST("\end{document}");

beginfig(1);

    u := cm;
    ys := 4u;
    xs := 4u;

    pair a[][];
    numeric l[];
    color gr, clr, bclr;
    gr := 0.7white;
    bclr := white;
    clr := red;

    def randomcolor = (uniformdeviate(1),uniformdeviate(1),uniformdeviate(1)) enddef;

    l[0] := 4;
    l[1] := 5;
    l[2] := 3;

    for i=0 upto 2:
        len := l[i];
        yshift := -(len-2)/2;
        for j=0 upto len:
            a[i][j] := (i, j);
            a[i][j] := a[i][j] shifted (0,yshift);
            a[i][j] := a[i][j] xscaled 5u yscaled 1.3u;
        endfor;
    endfor;

    for i=0 upto 1  :
        for j=0 upto l[i]:
            for k=0 upto l[i+1]:
                draw a[i][j]--a[i+1][k];
            endfor;
        endfor;
    endfor;

    vardef drawit(expr a,b,lab,f) = 
        bboxmargin := 0pt;
        save c; color c; c := DeepSkyBlue4;
        draw a--b withcolor c;
        picture im; 
        im := thelabel(lab, f[a,b]);
        fill bbox im withcolor white;
        draw im withcolor c;
    enddef;

    drawoptions(withpen pencircle scaled 1.8pt);
    drawit(a[0][0], a[1][2], btex $w_{20}^1$ etex,.8);
    drawit(a[1][2], a[2][0], btex $w_{02}^2$ etex,.3);
    drawit(a[1][2], a[2][1], btex $w_{12}^2$ etex,.3);
    drawoptions();

    vardef drawcircle(expr mid, lab) = 
        save c; path c;
        c := fullcircle scaled .6u shifted mid;
        unfill c;
        draw c;
        draw thelabel(lab,mid);
    enddef;

    for i=0 upto 2:
        len := l[i];
        yshift := - (len-2)/2;
        for j=0 upto len:
            path c; c := fullcircle scaled .6u shifted a[i][j];  
            unfill c;
            draw c;
            label(TEX("$a^" & decimal(i) & "_" & decimal (j) & "$"), a[i][j]);
        endfor;
    endfor;

endfig;
end