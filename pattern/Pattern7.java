package pattern;

public class Pattern7 {
    public static void main(String[] args) {
        // write your code here
        printPattern(Integer.parseInt(args[0]));
    }

    static void printPattern(int n) {
        int i, j, k, l;
        for (i = 0; i < n; i++) {
            // print spaces
            for (j = 1; j <= n - i - 1; j++) {
                System.out.print(" ");
            }
            // print stars
            for (k = 0; k < 2 * i + 1; k++) {
                System.out.print("*");
            }
            // print spaces
            for (l = 1; l <= n - i - 1; l++) {
                System.out.print(" ");
            }

            System.out.println();
        }
    }
}
