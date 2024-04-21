import graph;

settings.outformat = "svg";
unitsize(1.5cm);
defaultpen(fontsize(10pt));

real w = 5;
real h = 3;
pen funccolor = RGB(129, 161, 193);
pen areacolor = RGB(119, 151, 183); /* RGB(167, 189, 212); funccolor + opacity(0.3); */

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
    return 3 * x / 8 + 3 * x / 16 * sin(x) ^ 2;
}

real lower = 0;
real upper = 2.5;
int n = 400;

real dx = (upper - lower) / n;

path area = (0, 0);

for (int i = 0; i < n; ++i) {
    real x = i * dx;
    real y = f(x);

    area = area -- (x, y);
}

fill(area -- ((n - 1) * dx, 0) -- cycle, p=funccolor);

real graph_dx = 0.03;

fill((upper, f(upper)) -- (upper + graph_dx, f(upper + graph_dx)) -- (upper + graph_dx, 0) -- (upper, 0) -- cycle, p=areacolor);
draw((upper, f(upper)) -- (upper + graph_dx, f(upper + graph_dx)) -- (upper + graph_dx, 0) -- (upper, 0) -- cycle, p=linewidth(0.4pt));

draw(graph(f, 0, w * 0.90), arrow=Arrow(TeXHead), p=linewidth(0.7pt));

label("{\tiny \( dx \)}", ((upper + graph_dx / 2), f(upper + graph_dx / 2) + 0.1));
label("\( A \left( x \right) \)", (3 * upper / 4, f(3 * upper / 4) / 2));
label("{\tiny \( f ( x ) \)}", (upper + 0.25, f(upper + 0.25) / 2));

draw((upper + 0.5, 3 * f(upper + graph_dx) / 4) -- (upper + graph_dx / 2, 3 * f(upper + graph_dx) / 4), arrow=Arrow(TeXHead, 0.75bp), L=Label("{\tiny \( dA \)}", position=BeginPoint));
