package graphics;

public class Circle {
    private Point center;
    private double radius;
    private double area;

    public Circle(Point p, double r) {
	this.center = p;
	this.radius = r;
	this.calcArea();
    }

    private void calcArea() {
	this.area = Math.PI * Math.pow(radius, 2);
    }

    public double getArea() {
	return this.area;
    }

    public double distance(Point p) {
	Line l = new Line(this.center, p);
	return Math.abs(l.getLength() - this.radius);
    }

}
