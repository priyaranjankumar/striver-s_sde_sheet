package pattern;

public class Pattern3 {
    public static void main(String[] args) {
        // write your code here
        printPattern(Integer.parseInt(args[0]));
    }

    static void printPattern(int n) {
        for (int i = 1; i <= n; i++) {
            for (int j = 1; j <= i; j++) {
                System.out.print(j);
            }
            System.out.println();
        }
    }
}
