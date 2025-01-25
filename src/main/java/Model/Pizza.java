package Model;

import java.util.ArrayList;

public class Pizza {
    private int size;
    private ArrayList<Topping> topp;

    public Pizza(int size) {
        this.size = size;
        topp = new ArrayList<>();
    }

    public int getSize() {
        return size;
    }

    public ArrayList<Topping> getTopp() {
        return topp;
    }

    public void addTopping(Topping t){
        topp.add(t);
    }

    public void removeTopping(Topping t){
        topp.remove(t);
    }

    public int totalPrice(){
        int price = size * 50;
        for(Topping t: topp){
            price += t.getPrice();
        }
        return price;
    }
}
