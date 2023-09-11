package pattern;

public class Pattern21 {
    public static void main(String[] args) {
        // write your code here
        printPattern(Integer.parseInt(args[0]));
    }

    static void printPattern(int n) {
        // print first line
        for (int i = 1; i <= n; i++) {
            System.out.print('*');
        }
        System.out.println();
        // print middle lines
        for (int i = 1; i <= n - 2; i++) {
            System.out.print('*');
            // print spaces
            for (int j = 0; j < n - 2; j++) {
                System.out.print(" ");
            }
            System.out.print('*');
            System.out.println();
        }
        // print last line
        for (int i = 1; i <= n; i++) {
            System.out.print('*');
        }
    }
}
