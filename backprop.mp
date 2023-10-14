beginfig(1);

    u := cm;
    ys := 4u;
    xs := 4u;

    pair a[][];
    numeric l[];
    color gr, clr, bclr;
    gr := 0.7white;
    bclr := .9white;
    clr := red;

    def randomcolor = (uniformdeviate(1),uniformdeviate(1),uniformdeviate(1)) enddef;

    l[0] := 2;
    l[1] := 3;
    l[2] := 1;

    for i=0 upto 2:
        len := l[i];
        yshift := - (len-2)/2;
        for j=0 upto len:
            a[i][j] := (i, j);
            a[i][j] := a[i][j] shifted (0,yshift);
            a[i][j] := a[i][j] xscaled 5u yscaled 2u;
            draw a[i][j] withpen pencircle scaled 10pt; 
        endfor;
    endfor;

    for i=0 upto 1  :
        for j=0 upto l[i]:
            for k=0 upto l[i+1]:
                draw a[i][j]--a[i+1][k];
            endfor;
        endfor;
    endfor;




    z0.0 = (0,0);
    z0.1 = z0.0 shifted (0,-ys);
    z1.0 = z0.0 shifted (xs,0);
    z1.1 = z1.0 shifted (0,-ys);
    z2.0 = .5[z1.0,z1.1] shifted (xs,0);

    vardef drawit(expr a,b,lab,f) = 
        bboxmargin := 0pt;
        color c;
        c := randomcolor;
        draw a--b withcolor c;
        picture im; 
        im := thelabel(lab, f[a,b]);
        fill bbox im withcolor bclr;
        draw im withcolor c;
    enddef;

    drawoptions(withcolor gr);
    drawit(a[0][0], a[1][0], btex $w_{00}^1$ etex,.7);
    drawit(a[0][0], a[1][1], btex $w_{10}^1$ etex,.3);
    drawit(a[0][0], a[1][3], btex $w_{30}^1$ etex,.8);

    drawit(a[0][1], a[1][0], btex $w_{01}^1$ etex,.65);
    drawit(a[0][1], a[1][1], btex $w_{11}^1$ etex,.3);
    drawit(a[0][1], a[1][2], btex $w_{21}^1$ etex,.7);
    drawit(a[0][1], a[1][3], btex $w_{31}^1$ etex,.6);

    drawit(a[0][2], a[1][0], btex $w_{02}^1$ etex,.8);
    drawit(a[0][2], a[1][1], btex $w_{12}^1$ etex,.8);
    drawit(a[0][2], a[1][2], btex $w_{22}^1$ etex,.3);
    drawit(a[0][2], a[1][3], btex $w_{32}^1$ etex,.3);

    %%%% 

    drawit(a[1][0], a[2][0], btex $w_{00}^2$ etex,.5);
    drawit(a[1][0], a[2][1], btex $w_{10}^2$ etex,.3);
    drawit(a[1][1], a[2][0], btex $w_{01}^2$ etex,.3);
    drawit(a[1][1], a[2][1], btex $w_{11}^2$ etex,.3);
    
    drawit(a[1][3], a[2][0], btex $w_{03}^2$ etex,.3);
    drawit(a[1][3], a[2][1], btex $w_{13}^2$ etex,.5);

    drawoptions(withcolor red withpen pencircle scaled 2pt);
    drawit(a[0][0], a[1][2], btex $w_{20}^1$ etex,.8);
    drawit(a[1][2], a[2][0], btex $w_{02}^2$ etex,.3);
    drawit(a[1][2], a[2][1], btex $w_{12}^2$ etex,.3);

    drawoptions();

    % drawit(a[0][0], a[1][2], btex $w_{20}^1$ etex);
    % drawit(a[1][2], a[2][0], btex $w_{02}^2$ etex);
    % drawit(a[1][2], a[2][1], btex $w_{12}^2$ etex);

    vardef drawcircle(expr mid, lab) = 
        save c; 
        path c;
        c := fullcircle scaled .8u shifted mid;
        unfill c;
        draw c;
        label(lab,mid);
    enddef;

    drawcircle(a[0][0], btex $a_0^0$ etex);
    drawcircle(a[0][1], btex $a_1^0$ etex);
    drawcircle(a[0][2], btex $a_2^0$ etex);
    drawcircle(a[1][0], btex $a_0^1$ etex);
    drawcircle(a[1][1], btex $a_1^1$ etex);
    drawcircle(a[1][2], btex $a_2^1$ etex);
    drawcircle(a[1][3], btex $a_3^1$ etex);
    drawcircle(a[2][0], btex $a_0^2$ etex);
    drawcircle(a[2][1], btex $a_1^2$ etex);

    bboxmargin := 3pt;
    picture pic;
    pic := currentpicture;
    fill bbox pic withcolor .9 white;
    draw bbox pic withpen pencircle scaled 1pt;
    draw pic;

    % drawit(z0.0,z1.0,btex $w_{00}^1$ etex);
    % drawit(z0.0,z1.1,btex $w_{01}^1$ etex);
    % drawoptions(withcolor red);
    % drawit(z0.1,z1.0,btex $w_{10}^1$ etex);
    % drawoptions(withcolor black);
    % drawit(z0.1,z1.1,btex $w_{11}^1$ etex);

    % drawit(z1.0,z2.0,btex $w_{00}^2$ etex);
    % drawit(z1.1,z2.0,btex $w_{10}^2$ etex);

    % drawcircle(z0.0,btex $a_0^0$ etex);
    % drawcircle(z0.1,btex $a_1^0$ etex);
    % drawcircle(z1.0,btex $a_0^1$ etex);
    % drawcircle(z1.1,btex $a_1^1$ etex);
    % drawcircle(z2.0,btex $a_0^2$ etex);



endfig;
end