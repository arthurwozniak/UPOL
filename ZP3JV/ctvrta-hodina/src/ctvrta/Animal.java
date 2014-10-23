package ctvrta;

public class Animal {
    private AnimalsEnum type;
    private AnimalType sex;
    private String name;

    public Animal(AnimalsEnum type, AnimalType sex, String name) {
	this.type = type;
	this.sex = sex;
	this.name = name;
    }

    public String getName() {
	return this.name;
    }

    public AnimalType getSex() {
	return this.sex;
    }

    public AnimalsEnum getEnumType() {
	return this.type;
    }

}
