import graph;

settings.outformat = "svg";
unitsize(1.5cm);
defaultpen(fontsize(10pt));

real w = 5;
real h = 3;
pen areacolor = RGB(129, 161, 193);

void xtick_at(real x, string l) {
    real h = 0.05;
    draw((x, h) -- (x, -h), L=Label(l, position=EndPoint, align=S), p=linewidth(0.5pt));
}

void ytick_at(real y, string l) {
    real h = 0.05;
    draw((-h, y) -- (h, y), L=Label(l, position=BeginPoint, align=W), p=linewidth(0.5pt));
}

real f(real x) {
    return 3 * x / 8 + 3 * x / 16 * sin(x) ^ 2;
}

real upper = 3.5;
real lower = 0;
int n = 400;

real dx = (upper - lower) / n;

path area = (lower, 0);

for (int i = 0; i < n; ++i) {
    real x = lower + i * dx;
    real y = f(x);

    area = area -- (x, y);
}

fill(area -- (lower + (n - 1) * dx, 0) -- cycle, p=areacolor);

xtick_at(upper * 2 / 3, "{\tiny \( a \)}");
xtick_at(upper, "{\tiny \( b \)}");

draw(graph(f, 0, w * 0.90), arrow=Arrow(TeXHead), p=linewidth(0.7pt));

draw((-0.1, 0) -- (w, 0), arrow=Arrow(TeXHead), L=Label("\( x \)", position=EndPoint, align=2N + 2.5W), p=linewidth(0.5pt));
draw((0, -0.1) -- (0, h), arrow=Arrow(TeXHead), L=Label("\( y \)", position=EndPoint, align=2E + 2.5S), p=linewidth(0.5pt));

