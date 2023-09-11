package pattern;

public class Pattern19 {
    public static void main(String[] args) {
        // write your code here
        printPattern(Integer.parseInt(args[0]));
    }

    static void printPattern(int n) {
        for (int i = 0; i < n; i++) {
            // print stars
            for (int j = 0; j < n - i; j++) {
                System.out.print('*');
            }
            // print spaces
            for (int j = 0; j < 2 * i; j++)
                System.out.print(" ");
            // print stars
            for (int j = 0; j < n - i; j++) {
                System.out.print('*');
            }
            System.out.println();
        }
        for (int i = 0; i < n - 1; i++) {
            // print stars
            for (int j = 0; j < i + 2; j++) {
                System.out.print('*');
            }
            // print spaces
            for (int j = 0; j < (n - 2 - i) * 2; j++)
                System.out.print(" ");
            // print stars
            for (int j = 0; j < i + 2; j++) {
                System.out.print('*');
            }
            System.out.println();
        }
    }
}