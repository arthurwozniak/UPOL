package sorting;

public class Point {
    // atributy
    private double x;
    private double y;

    // konstruktor
    public Point(double x, double y) {
	this.x = x;
	this.y = y;
    }

    // metody
    // distance - navrácení vzdálenosti mezi body
    public double distance(Point p) {
	return Math.sqrt(Math.abs(Math.pow((this.x - p.getX()), 2)
		+ Math.pow((this.y - p.getY()), 2)));
    }

    // metody umožňující přístup k jednotlivým částem souřadnice a také jejich
    // úpravu
    public double getX() {
	return this.x;
    }

    public double getY() {
	return this.y;
    }

    public void setX(double n) {
	this.x = n;
    }

    public void setY(double n) {
	this.y = n;
    }
}
