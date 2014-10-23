package FirstLecture;

import java.util.Arrays;
import java.util.List;

public class FirstLecture {

	/*
	 * Napište v jazyku Java program, který vykreslí pomocí znaku "*" na
	 * obrazovku rovnoramenný trojuhelník zadané velikosti. Velikost bude zadána
	 * pomocí lokální proměnné.
	 */
	public static void triangles(int rows) {
		List<Integer> excludedRows = Arrays.asList(1, 2, rows);
		for (int i = 1; i <= rows; i++) {
			char[] row = new char[i];
			if (excludedRows.contains(i)) { // vždy budou pouze hvězdy
				for (int index = 0; index < i; index++) {
					row[index] = '*';
				}
				System.out.println(row);
			} else {
				for (int index = 0; index < i; index++) {
					if ((index == 0) || (index == (i - 1))) {
						row[index] = '*';
					} else
						row[index] = ' ';
				}
				System.out.println(row);
			}
		}
		System.out.println();
	}

	/*
	 * Napište v jazyku Java program, který pro zadanou mzdu vypočítá a na
	 * obrazovku vypíše výši odpovídající daně.
	 * 
	 * Pro účel této úlohy uvažujme progresivní zdanění ve výši 10 % pro příjem
	 * do 10000, 20 % pro příjem od 10000 do 20000 a 30 % pro příjem nad 20000.
	 * Například, pokud máme hrubou mzdu 24000, bude se prvních 10000 danit 10 %
	 * (tj. daň z této části mzdy je 1000), dalších 10000 se daní 20 % (daň z
	 * této části je 2000) a zbývající 4000 se daní 30 % (daň je 1200). Celkovou
	 * výši daně pak vypočítáme jako součet jednotlivých "částečných" daní (tj.
	 * celková daň 4200).
	 */
	public static void taxes(int income) {
		double totalTax = 0;
		int percentage = 10;
		System.out.println("Zadaná mzda je " + income);
		System.out.print("Odpovídající daň je :");

		while (true) {
			if (percentage == 30) {
				totalTax += income * percentage * 0.01;
				break;
			}
			if (income <= 10000) {
				totalTax += income * percentage * 0.01;
				break;
			}
			totalTax += 10000 * percentage * 0.01;
			income -= 10000;
			percentage += 10;
		}
		System.out.println(totalTax);
		System.out.println();
	}

	/*
	 * V programu vytvořte jednorozměrné pole, naplňte ho čísly a vypište toto
	 * pole na standardní výstup společně s nejmenší a největší hodnotu, která
	 * se nachází v tomto poli.
	 */
	public static void minAndMax(int[] numbers) {
		int min, max;
		min = max = numbers[0];
		System.out.print("Pole: ");
		for (int i = 0; i < numbers.length; i++) {
			min = (numbers[i] < min) ? numbers[i] : min;
			max = (numbers[i] > max) ? numbers[i] : max;
			System.out.print(numbers[i] + ", ");
		}
		System.out.println();
		System.out.println("Nejmensi: " + min);
		System.out.println("Nejvetsi: " + max);
		System.out.println();
	}

	/*
	 * Napište v jazyku Java program, který vypíše na obrazovku všechna
	 * prvočísla menší než 100. Implementace : Eratosthenovo síto
	 */
	public static void primes(int limit) {
		int[] numbers = new int[limit - 1];
		limit -= 2;
		for (int i = 2; i < limit; i++) {
			numbers[i] = i;
		}
		/* Vyfiltrování násobků prvočísel */
		for (int i = 0; i < limit; i++) {
			if (numbers[i] > 0) {
				for (int j = (i + 1); j < limit; j++) {
					numbers[j] = ((numbers[j] % numbers[i]) == 0) ? 0
							: numbers[j];
				}
			}
		}

		System.out.print("Prvočísla: ");
		for (int i = 0; i < limit; i++) {
			if (numbers[i] > 0) {
				System.out.print(numbers[i] + ", ");
			}
		}
		System.out.println();
	}

	public static void main(String[] args) {

		// Otestovani fce triangles
		for (int a = 0; a < 10; a++) {
			triangles(a);
		}

		// Otestovani fce taxes
		taxes(8330);
		taxes(12000);
		taxes(24000);
		taxes(33353);

		// Otestovani fce minAndMax
		minAndMax(new int[] { 10, 3, 4 });
		minAndMax(new int[] { 10, 2, 13, -4, 15, -6, 7 });

		// Otestování síta prvočísel
		primes(50);
		primes(100);
	}
}