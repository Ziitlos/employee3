package ch.helsana.web.helper;

/**
 * Created by hkfq4 on 02.03.2017.
 */
public class ZahlChecker {
    public boolean isEsEineZahl(String s){
        try {
            Integer.parseInt(s);
        } catch(NumberFormatException e) {
            return false;
        } catch(NullPointerException e) {
            return false;
        }
        // only got here if we didn't return false
        return true;
    }
}
