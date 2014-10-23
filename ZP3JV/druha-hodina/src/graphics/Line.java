package graphics;

public class Line {
    private Point a;
    private Point b;
    private double length;

    public Line(Point a, Point b) {
	this.a = a;
	this.b = b;
    }

    private void calcLength() {
	this.length = this.a.distance(this.b);
    }

    public double getLength() {
	return this.length;
    }

    // http://geomalgorithms.com/a02-_lines.html#Distance-to-Ray-or-Segment
    // http://www.matematika.cz/vzdalenost-bod-primka
    public double distance(Point p) {
	double abLenght = this.a.distance(this.b);
	double[] normalizedVector = new double[2];
	// V případě, že se úsečka nadefinuje v jednom bode (což v podstatě není
	// úsečka), jedná se o vzdálenost x a p
	if (abLenght == 0)
	    return this.a.distance(p);

	// Kontrola, zda bod P leží uvnitř obdélníku definovaného body A a B
	if (p.getX() >= Math.min(this.a.getX(), this.b.getX())
		&& p.getX() <= Math.max(this.a.getX(), this.b.getX())
		&& p.getY() >= Math.min(this.a.getY(), this.b.getY())
		&& p.getY() <= Math.max(this.a.getY(), this.b.getY())) {
	    // spočítá se kolmice z bodu P k úsečce AB užitím vzorce pro výpočet
	    // vzdálenosti bodu od přímky
	    normalizedVector[0] = this.b.getX() - this.a.getX();
	    normalizedVector[1] = this.b.getY() - this.a.getY();
	    return Math.abs(-normalizedVector[1] * p.getX()
		    + normalizedVector[0] * p.getY() + normalizedVector[1]
		    * this.a.getX() - normalizedVector[0] * this.a.getY())
		    / Math.sqrt(Math.pow(normalizedVector[1], 2)
			    + Math.pow(normalizedVector[0], 2));
	}
	return Math.min(this.a.distance(p), this.b.distance(p));
    }

    public Point getA() {
	return a;
    }

    public void setA(Point a) {
	this.a = a;
	this.calcLength();
    }

    public Point getB() {
	return b;
    }

    public void setB(Point b) {
	this.b = b;
	this.calcLength();
    }
}
