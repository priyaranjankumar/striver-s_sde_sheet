package pattern;

public class Pattern10 {
    public static void main(String[] args) {
        // write your code here
        printPattern(Integer.parseInt(args[0]));
    }

    static void printPattern(int n) {
        for (int i = 1; i <= n; i++) {
            System.out.print("*".repeat(i));
            System.out.println();
        }
        for (int i = n; i > 0; i--) {
            System.out.print("*".repeat(i));
            System.out.println();
        }
    }
}
