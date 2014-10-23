package graphics;

public class Rectangle {
    private Line l1;
    private Line l2;
    private Line l3;
    private Line l4;
    private Point p1;
    private Point p2;
    private Point p3;
    private Point p4;
    private double area;

    // Třída předpokládá obdržení dvou protilehlých bodů
    public Rectangle(Point p1, Point p2) {
	this.p1 = p1;
	this.p2 = p2;
	this.p3 = new Point(p1.getX(), p2.getY());
	this.p4 = new Point(p2.getX(), p1.getY());
	this.l1 = new Line(this.p1, this.p3);
	this.l2 = new Line(this.p3, this.p2);
	this.l3 = new Line(this.p2, this.p4);
	this.l4 = new Line(this.p4, this.p1);
	this.calcArea();
    }

    // Třída předpokládá obdržení levé dolní souřadnice
    public Rectangle(Point p, double x, double y) {
	this.p3 = p;
	this.p1 = new Point(p.getX() + x, p.getY());
	this.p2 = new Point(p.getX(), p.getY() + y);
	this.p4 = new Point(p.getX() + x, p.getY() + y);
	this.l1 = new Line(this.p1, this.p3);
	this.l2 = new Line(this.p3, this.p2);
	this.l3 = new Line(this.p2, this.p4);
	this.l4 = new Line(this.p4, this.p1);
	this.calcArea();

    }

    private void calcArea() {
	this.area = this.l1.getLength() * this.l2.getLength();
    }

    public double getArea() {
	return this.area;
    }

    public double distance(Point p) {
	return Math.min(Math.min(l1.distance(p), l2.distance(p)),
		Math.min(l3.distance(p), l4.distance(p)));
    }
}
