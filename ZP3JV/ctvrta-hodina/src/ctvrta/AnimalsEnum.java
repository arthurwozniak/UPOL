package ctvrta;

public enum AnimalsEnum {
    DOG("pes", "fena", "haf-haf"), 
    HORSE("kůň", "kobyla", "ííí ha ha ha"), 
    PIG("prase", "prasnice", "chro-chro"), 
    DONKEY("osel", "oslice", "íá-íá");

    private String maleName;
    private String femaleName;
    private String sound;

    private AnimalsEnum(String male, String female, String sound) {
	this.maleName = male;
	this.femaleName = female;
	this.sound = sound;
    }

    public String getType(AnimalType type) {
	if (type.equals(AnimalType.MALE))
	    return maleName;
	return femaleName;
    }

    public String getSound() {
	return sound;
    }

}
