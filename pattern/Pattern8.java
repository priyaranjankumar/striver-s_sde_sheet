package pattern;

public class Pattern8 {
    public static void main(String[] args) {
        // write your code here
        printPattern(Integer.parseInt(args[0]));
    }

    static void printPattern(int n) {
        int i, j, k, l;
        for (i = 1; i <= n; i++) {
            // print spaces
            // ********
            for (j = 0; j < i - 1; j++) {
                System.out.print(" ");
            }
            // print stars
            for (k = 0; k < n * 2 - i - j; k++) {
                System.out.print("*");
            }
            // print spaces
            for (l = 0; l < i - 1; l++) {
                System.out.print(" ");
            }

            System.out.println();
        }
    }
}
