package ctvrta;

import java.util.ArrayList;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class AnimalFarm {
    private List<Animal> animals = new ArrayList<Animal>();

    public void add(String name, AnimalsEnum type, AnimalType sex) {
	// List<Object> animal = new ArrayList<Object>();
	Animal animal = new Animal(type, sex, name);
	this.animals.add(animal);
    }

    public void list() {
	String pattern = "%0 je %1 a dělá \"%2\"";
	for (Animal animal : this.animals) {
	    String info = formatStr(pattern, animal.getName(), animal
		    .getEnumType().getType(animal.getSex()), animal
		    .getEnumType().getSound());
	    System.out.println(info);
	}
    }

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
}
