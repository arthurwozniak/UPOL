package sorting;

import java.util.ArrayList;
import java.util.List;

public class Main {

    static int[] odd(int[] foo) {
	int[] odds = new int[foo.length];

	int index;
	index = 0;
	for (int i = 0; i < foo.length; i++) {
	    if ((foo[i] % 2 == 1) && (foo[i] != 0)) {
		odds[index] = foo[i];
		index++;
	    }
	}
	odds = java.util.Arrays.copyOf(odds, index);

	return odds;
    }

    static List<Object> odd(List<Object> receivedList) {
	List<Object> oddList = new ArrayList<Object>();

	for (Object item : receivedList) {
	    if (item instanceof Integer) {
		if (((Integer) item).intValue() % 2 == 1)
		    oddList.add(item);
	    }
	}

	return oddList;
    }

    static List<Integer> oddNumbers(List<Integer> receivedList) {
	List<Integer> oddList = new ArrayList<Integer>();

	for (Integer item : receivedList) {
	    if (item % 2 == 1)
		oddList.add(item);
	}

	return oddList;
    }

    static Point nearest(Point p, List<Point> points) {
	Point min = points.get(0);

	for (Point iterPoint : points) {
	    if (p.distance(iterPoint) < p.distance(min))
		min = iterPoint;
	}

	return min;
    }

    static int[] merge(int[] numbersA, int[] numbersB) {
	int sizeA, sizeB, posA, posB;
	int[] result;
	sizeA = numbersA.length;
	sizeB = numbersB.length;
	result = new int[sizeA + sizeB];
	posA = posB = 0;

	while ((posA < sizeA) && (posB < sizeB)) {
	    if (numbersA[posA] <= numbersB[posB]) {
		result[posA + posB] = numbersA[posA];
		posA++;
	    } else {
		result[posA + posB] = numbersB[posB];
		posB++;
	    }
	}

	while (posA < sizeA) {
	    result[posA + posB] = numbersA[posA];
	    posA++;
	}

	while (posB < sizeB) {
	    result[posA + posB] = numbersB[posB];
	    posB++;
	}

	return result;
    }

    public static List<Integer> merge(List<Integer> numbersA,
	    List<Integer> numbersB) {
	List<Integer> result = new ArrayList<Integer>();
	int posA, posB, sizeA, sizeB;
	posA = posB = 0;
	sizeA = numbersA.size();
	sizeB = numbersB.size();
	while ((posA < sizeA) && (posB < sizeB)) {
	    if (numbersA.get(0) <= numbersB.get(0)) {
		result.add(numbersA.get(posA));
		posA++;
	    } else {
		result.add(numbersB.get(posB));
		posB++;
	    }
	}
	while (posA < sizeA) {
	    result.add(numbersA.get(posA));
	    posA++;
	}

	while (posB < sizeB) {
	    result.add(numbersB.get(posB));
	    posB++;
	}
	return result;
    }

    public static List<Integer> mergeSort(List<Integer> numbers) {
	List<Integer> sortedNumbers = new ArrayList<Integer>();
	List<Integer> left = new ArrayList<Integer>();
	List<Integer> right = new ArrayList<Integer>();
	int middle, size, pos;
	size = numbers.size();
	if (size <= 1) {
	    sortedNumbers.addAll(numbers);
	    return sortedNumbers;

	}
	middle = size / 2;
	pos = 0;
	for (Integer i : numbers) {
	    if (pos < middle)
		left.add(i.intValue());
	    else
		right.add(i.intValue());
	    pos++;
	}
	left = mergeSort(left);
	right = mergeSort(right);
	sortedNumbers = merge(left, right);
	return sortedNumbers;
    }

    public static void main(String[] args) {
	int[] numbersArray = new int[20];
	int[] oddsArray;
	int i;

	// zaplnění pole foo náhodnými hodnotami [0; 999]
	for (i = 0; i < 20; i++) {
	    numbersArray[i] = (int) (Math.random() * 1000);
	}

	oddsArray = odd(numbersArray);

	List<Integer> numbersInteger = new ArrayList<Integer>();
	List<Integer> oddsInteger = new ArrayList<Integer>();
	List<Object> numbersObject = new ArrayList<Object>();
	List<Object> oddsObject = new ArrayList<Object>();

	for (i = 0; i < numbersArray.length; i++) {
	    numbersInteger.add(numbersArray[i]);
	    numbersObject.add(numbersArray[i]);
	}

	numbersObject.add("some string");
	numbersObject.add(new Point(2, 4));

	oddsObject = odd(numbersObject);
	oddsInteger = oddNumbers(numbersInteger);

	// vytvoření List<Points> s náhodnými hodnotami
	List<Point> points = new ArrayList<Point>();
	Point p = new Point(3, 10);
	Point min;
	double x, y;
	for (i = 0; i < 10; i++) {
	    x = Math.random() * 20;
	    y = Math.random() * 20;
	    points.add(new Point(x, y));
	}

	min = nearest(p, points);

	int[] arrayA = new int[] { 1, 3, 5, 7, 8, 9 };
	int[] arrayB = new int[] { 2, 4, 6, 10 };
	int[] sorted = new int[arrayA.length + arrayB.length];

	sorted = merge(arrayA, arrayB);

	List<Integer> listA = new ArrayList<Integer>();
	List<Integer> listB = new ArrayList<Integer>();
	List<Integer> mergedAB;

	for (i = 0; i < 20; i++) {
	    if (i % 2 == 1)
		listA.add(i);
	    else
		listB.add(i);
	}

	mergedAB = merge(listA, listB);

	List<Integer> arrayListNumbers = new ArrayList<Integer>();

	for (i = 0; i < 20; i++) {
	    arrayListNumbers.add((int) (Math.random() * 100));
	}

	arrayListNumbers = mergeSort(arrayListNumbers);

    }

}
