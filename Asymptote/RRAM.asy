import graph;

settings.outformat = "svg";
unitsize(1.5cm);
defaultpen(fontsize(10pt));

real w = 6;
real w_shrink = w * 0.8;
real h = 4;
pen funccolor = RGB(129, 161, 193);
pen areacolor = /* RGB(167, 189, 212) */ funccolor + opacity(0.3);

draw((-0.1, 0) -- (w, 0), arrow=Arrow(TeXHead), L=Label("\( x \)", position=EndPoint, align=2N + 2.5W), p=linewidth(0.5pt));
draw((0, -0.1) -- (0, h), arrow=Arrow(TeXHead), L=Label("\( y \)", position=EndPoint, align=2E + 2.5S), p=linewidth(0.5pt));

void xtick_at(real x, string l) {
    real h = 0.05;
    draw((x, h) -- (x, -h), L=Label(l, position=EndPoint, align=S), p=linewidth(0.5pt));
}

void ytick_at(real y, string l) {
    real h = 0.05;
    draw((-h, y) -- (h, y), L=Label(l, position=BeginPoint, align=W), p=linewidth(0.5pt));
}

real f(real x) {
    // f(0) = 0
    // => -a (- w / 2)^2 + 0.9 * h = 0
    // => -a * w^2/4 = -0.9 * h
    // => a = 0.9 * h / (w^2 / 4)
    real a = 0.9 * h / (w_shrink^2 / 4);
    return -a * (x - w_shrink / 2)^2 + 0.9 * h;
}

real lower = 0;
real upper = w_shrink;
int n = 5;

real dx = (upper - lower) / n;

for (int i = 0; i < n; ++i) {
    real x = i * dx;
    real y = f(x + dx);

    path rect = (i * dx, 0) --
        (x, y) --
        (x + dx, y) --
        (x + dx, 0);
    draw(rect, p=funccolor);
    fill(rect -- cycle, p=areacolor);
}

draw(graph(f, 0, w_shrink), arrow=Arrow(TeXHead), p=linewidth(0.7pt));
