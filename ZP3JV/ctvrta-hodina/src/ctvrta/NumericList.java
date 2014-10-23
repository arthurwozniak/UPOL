package ctvrta;

import java.util.ArrayList;
import java.util.List;

public class NumericList<T extends Number> {

    private List<T> privateList = new ArrayList<T>();
    private int size;

    // konstruktor předpokládá obdržení neprázdného seznamu
    public NumericList(List<T> givenList) {
	privateList.addAll(givenList);
    }

    public T first() {
	return this.privateList.get(0);
    }

    public NumericList<T> next() {
	size = this.size();
	if (this.size > 1) {
	    return new NumericList<T>(this.privateList.subList(1, this.size));
	}
	return null;

    }

    public int size() {
	return this.privateList.size();
    }

    public double sum() {
	double sum = 0;
	for (T item : this.privateList) {
	    sum += item.intValue();
	}
	return sum;
    }
}
