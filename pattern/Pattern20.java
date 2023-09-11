package pattern;

public class Pattern20 {
    public static void main(String[] args) {
        // write your code here
        printPattern(Integer.parseInt(args[0]));
    }

    static void printPattern(int n) {
        for (int i = 1; i <= n; i++) {
            for (int j = 0; j < i; j++) {
                System.out.print('*');
            }
            for (int j = 0; j < (n * 2) - 2 * i; j++) {
                System.out.print(" ");
            }
            for (int j = 0; j < i; j++) {
                System.out.print('*');
            }
            System.out.println();
        }
        for (int i = n - 1; i > 0; i--) {
            for (int j = 0; j < i; j++) {
                System.out.print('*');
            }
            for (int j = 0; j < (n * 2) - 2 * i; j++) {
                System.out.print(" ");
            }
            for (int j = 0; j < i; j++) {
                System.out.print('*');
            }
            System.out.println();
        }
    }
}
