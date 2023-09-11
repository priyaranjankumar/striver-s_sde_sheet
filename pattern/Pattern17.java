package pattern;

public class Pattern17 {
    public static void main(String[] args) {
        // write your code here
        printPattern(Integer.parseInt(args[0]));
    }

    static void printPattern(int n) {
        for (int i = 1; i <= n; i++) {
            // print spaces
            for (int j = 1; j <= n - i; j++) {
                System.out.print(" ");
            }
            // print alphabets
            for (int j = 1; j <= i; j++) {
                System.out.print(((char) (j + 64)));
            }
            // print alphabets rev
            for (int j = i - 1; j >= 1; j--) {
                System.out.print(((char) (j + 64)));
            }
            // print spaces
            for (int j = 1; j <= n - i; j++) {
                System.out.print(" ");
            }
            System.out.println();
        }
    }
}
