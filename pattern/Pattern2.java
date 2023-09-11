package pattern;

public class Pattern2 {
    // write your code here
    public static void main(String[] args) {
        printPattern(Integer.parseInt(args[0]));
    }

    static void printPattern(int n) {
        for (int i = 0; i < n; i++) {
            System.out.println("*".repeat(i + 1));
        }
    }
}
