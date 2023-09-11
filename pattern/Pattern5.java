package pattern;

public class Pattern5 {
    public static void main(String[] args) {
        // write your code here
        printPattern(Integer.parseInt(args[0]));
    }

    static void printPattern(int n) {
        for (int i = n; i >= 1; i--) {
            System.out.println("*".repeat(i));
        }
    }
}
