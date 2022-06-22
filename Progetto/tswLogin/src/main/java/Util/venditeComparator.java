package Util;

import java.util.Comparator;

import Model.Articolo;

public class venditeComparator implements Comparator<Articolo> {
    public int compare(Articolo articolo1, Articolo articolo2) {
        return articolo1.getNumVendite() - articolo2.getNumVendite();
    }
}
