package pattern;

public class Pattern18 {
    public static void main(String[] args) {
        // write your code here
        printPattern(Integer.parseInt(args[0]));
    }

    static void printPattern(int n) {
        for (int i = n; i >= 1; i--) {
            // print alphabets
            for (int j = i; j <= n; j++) {
                System.out.print((char) (j + 64) + " ");
            }
            System.out.println();
        }
    }
}
