import graph;

settings.outformat = "svg";
unitsize(1.5cm);
defaultpen(fontsize(10pt));

real w = 4;
real h = 4;
pen funccolor = RGB(129, 161, 193);

draw((-0.1, 0) -- (w, 0), arrow=Arrow(TeXHead), L=Label("\( t \)", position=EndPoint, align=2N + 2.5W), p=linewidth(0.5pt));
draw((0, -0.1) -- (0, h), arrow=Arrow(TeXHead), L=Label("\( v \left( t \right) \)", position=EndPoint, align=2E + 2.5S), p=linewidth(0.5pt));

void xtick_at(real x, string l) {
    real h = 0.05;
    draw((x, h) -- (x, -h), L=Label(l, position=EndPoint, align=S), p=linewidth(0.5pt));
}

void ytick_at(real y, string l) {
    real h = 0.05;
    draw((-h, y) -- (h, y), L=Label(l, position=BeginPoint, align=W), p=linewidth(0.5pt));
}

real f(real x) {
    return sqrt(4 - x^2) + 1;
}

xtick_at(2, "\( 2 \)");
ytick_at(1, "\( 1 \)");
ytick_at(3, "\( 3 \)");

draw(graph(f, 0, 2), arrow=Arrow(TeXHead), p=linewidth(0.7pt));

draw((2, 0) -- (2, 1), p=linewidth(0.7pt) + dashed + opacity(0.5));
draw((0, 1) -- (2, 1), p=linewidth(0.7pt) + dashed + opacity(0.5));
