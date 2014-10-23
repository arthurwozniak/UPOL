package ctvrta;

import java.util.ArrayList;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class Main {

    public static String formatStr(String format, Object... args) {
	int i;
	String regex;
	String replacement;
	String formatCopy = format;
	for (i = 0; i < args.length; i++) {
	    regex = "%" + i + "(?!\\d)";
	    Matcher m = Pattern.compile(regex).matcher(formatCopy);
	    while (m.find()) {
		replacement = args[i].toString();
		formatCopy = m.replaceAll(replacement);
	    }
	}
	return formatCopy;
    }

    public static void main(String args[]) {

	int i, size;
	Number first;
	double sum;
	NumericList<Number> genericList;
	List<Number> numbers;

	String pattern = "z : %25; a : %0; b : %1; c : %2; d : %3; e : %4; z : %25;  f : %5; g : %6; h : %7; i : %8; j : %9; k : %10; l : %11; m : %12; n : %13; o : %14; p : %15; q : %16; r : %17; s : %18; t : %19; u : %20; v : %21; w : %22; x : %23; y : %24; z : %25";
	String formatted = formatStr(pattern, "a", "b", "c", "d", "e", "f",
		"g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r",
		"s", "t", "u", "v", "w", "x", "y", "z");
	AnimalFarm farm = new AnimalFarm();
	farm.add("Kuliš", AnimalsEnum.PIG, AnimalType.MALE);
	farm.add("Boxer", AnimalsEnum.HORSE, AnimalType.MALE);
	farm.add("Lupina", AnimalsEnum.HORSE, AnimalType.FEMALE);
	farm.add("Benjamin", AnimalsEnum.DONKEY, AnimalType.MALE);
	farm.list();

	numbers = new ArrayList<Number>();

	for (i = 1; i < 11; i++) {
	    numbers.add(i);
	}

	genericList = new NumericList<Number>(numbers);

	first = genericList.first();
	sum = genericList.sum();
	size = genericList.size();
	genericList = genericList.next();
	first = genericList.first();
	genericList = genericList.next();
	size = genericList.size();
    }
}
