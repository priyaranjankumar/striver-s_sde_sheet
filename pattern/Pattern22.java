package pattern;

public class Pattern22 {
    public static void main(String[] args) {
        // write your code here
        printPattern(Integer.parseInt(args[0]));
    }

    static void printPattern(int n) {

        // System.out.println(right + " " + bottom);
        for (int i = 0; i < 2 * n - 1; i++) {
            for (int j = 0; j < 2 * n - 1; j++) {
                int right = 2 * n - 2 - j;
                int bottom = 2 * n - 2 - i;
                // System.out.print(right + " " + bottom + " ");
                // System.out.print((Math.min(right, bottom)));
                System.out.print(n - Math.min(Math.min(i, j), Math.min(right, bottom)));

            }
            System.out.println();
        }
    }
}
