package graphics;

public class Main {

    public static void main(String[] args) {
	Point p1 = new Point(0, 0);
	Point p2 = new Point(2, 2);
	Point p3 = new Point(-3, 3);
	Point p4 = new Point(4, 2);
	Line l1 = new Line(p1, p2);
	Rectangle r1 = new Rectangle(p1, p4);
	Square s1 = new Square(p2, 2);
	Circle c1 = new Circle(p2, 2);

	System.out.println("P1 x: " + p1.getX() + " y: " + p1.getY());
	System.out.println("P2 x: " + p2.getX() + " y: " + p2.getY());
	System.out.println("P3 x: " + p3.getX() + " y: " + p3.getY());
	System.out.println("P4 x: " + p4.getX() + " y: " + p4.getY());
	System.out.println("Distance of p1 and p2: " + p1.distance(p2));
	System.out.println("Length of line l1 is: " + l1.getLength());
	System.out.println("Distance of point p3 from line l1 is: "
		+ l1.distance(p3));
	System.out.println("Area inside rectangle r1 is: " + r1.getArea());
	System.out.println("Distance of point p3 and rectangle r1 is: "
		+ r1.distance(p3));
	System.out.println("Distance of point p4 and square s1 is: "
		+ s1.distance(p4));
	System.out.println("Distance of circle c1 and point p4 is: "
		+ c1.distance(p4));
    }
}
