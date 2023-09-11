package pattern;

public class Pattern12 {
    public static void main(String[] args) {
        // write your code here
        printPattern(Integer.parseInt(args[0]));
    }

    static void printPattern(int n) {
        int i;
        for (i = 1; i < n; i++) {
            // print number
            for (int j = 1; j < i + 1; j++) {
                System.out.print(j);
            }
            // print space
            for (int k = 0; k < (n - i) * 2 - 2; k++) {
                System.out.print(" ");
            }
            // print number
            for (int j = i; j > 0; j--) {
                System.out.print(j);
            }
            System.out.println();
        }
    }
}
