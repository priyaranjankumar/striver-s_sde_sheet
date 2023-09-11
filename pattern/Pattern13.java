package pattern;

public class Pattern13 {
    public static void main(String[] args) {
        // write your code here
        printPattern(Integer.parseInt(args[0]));
    }

    static void printPattern(int n) {
        int m = 1;
        for (int i = 0; i < n; i++) {
            for (int j = 0; j < i + 1; j++) {
                System.out.print(m + " ");
                m++;
            }
            System.out.println();
        }
    }
}
