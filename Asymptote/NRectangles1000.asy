import graph;

settings.outformat = "svg";
unitsize(1.5cm);
defaultpen(fontsize(10pt));

real w = 6;
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
    return x^2 / w^2 * h * 0.9;
}

// Actually rendering 1000 rectangles will probably kill some pdf readers, so we're just going to cheat and trace the actual function at this point.
// don't tell any of my readers

real lower = 0;
real upper = w - 1;
int n = 400;

real dx = (upper - lower) / n;

path area = (0, 0);

for (int i = 0; i < n; ++i) {
    real x = i * dx;
    real y = f(x);

    area = area -- (x, y);
}

fill(area -- ((n - 1) * dx, 0) -- cycle, p=funccolor);
draw(graph(f, 0, w * 0.99), arrow=Arrow(TeXHead), p=linewidth(0.7pt));
