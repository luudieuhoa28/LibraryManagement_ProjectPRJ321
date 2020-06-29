package dtos;

import java.util.HashMap;
import java.util.Map;

public class CartDTO {
    private String userId;
    private Map<String, BookDTO> cart;

    public CartDTO() {
    }

    public CartDTO(String userName, Map<String, BookDTO> cart) {
        this.userId = userName;
        this.cart = cart;
    }

    public String getUserName() {
        return userId;
    }

    public void setUserName(String userName) {
        this.userId = userName;
    }

    public Map<String, BookDTO> getCart() {
        return cart;
    }

    public void setCart(Map<String, BookDTO> cart) {
        this.cart = cart;
    }

    public void addToCard(BookDTO bookDTO) {
        if (this.cart == null) {
            this.cart = new HashMap<>();
        }

        if (this.cart.containsKey(bookDTO.getBookId())) {
            int quantity = this.cart.get(bookDTO.getBookId()).getNumInCart();
            bookDTO.setNumInCart(quantity + 1);
        }

        cart.put(bookDTO.getBookId(), bookDTO);
    }

    public void delete(String bookId) {
        if (this.cart != null) {
            this.cart.remove(bookId);
        }
    }

    public void updateQuantity(String bookId, int quantity) {
        if (this.cart != null) {
            if (this.cart.containsKey(bookId)) {
                this.cart.get(bookId).setNumInCart(quantity);
            }
        }
    }
}
