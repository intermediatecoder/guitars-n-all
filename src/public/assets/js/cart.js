
const updateQuantity = cartItemId => async (success, quantity) => {
  if(!success) {
    return;
  }

  // console.log(quantity);

  const data = {
    action: "update-quantity",
    cartItemId,
    quantity,
  };

  try {
    const response = await fetch ("/api/cart/change", {
      method: "POST",
      headers: {
        "Content-Type": "application/json",
      },
      body: JSON.stringify(data)
    });
    const result = await response.json();

    // console.log(result);

    if(!result.error) {
      return true;
    }
  } catch (e) {
    console.log("error while updating", e);
  }

  return false;
};

const updatePrices = (result) => {
  return result;
};

function initializeCart() {
  const cartElement = document.querySelector(".cart");
  const cartItems = document.querySelectorAll(".cart-item");

  const updateDetails = () => {
    let cartTotal = 0;
    for(const item of cartItems) {
      const itemTotal = item.querySelector(".item-total");
      const itemId = item.getAttribute("data-item-id");

      const itemData = items[itemId];

      const newItemTotal = itemData.quantity * itemData.price;
      itemTotal.innerText = newItemTotal.toFixed(2);
      cartTotal += newItemTotal;
    }

    const cartTotalElement = document.querySelector(".cart-total");
    cartTotalElement.innerText = cartTotal.toFixed(2);
  };

  for(const cartItem of cartItems) {
    const id = cartItem.getAttribute("data-item-id");

    const remove = cartItem.querySelector(".remove");
    const add = cartItem.querySelector(".add");
    const quantity = cartItem.querySelector(".quantity");

    const price = Number(cartItem.getAttribute("data-item-price"));

    remove.addEventListener("click", event => {
      cart.decrement(
        async (success, value) => {
          const result = await updateQuantity(id)(success, value)
          if(result) {
            items[id].quantity = value;
            updateDetails();
          }

          return result;
        }
      )(event)
    });

    add.addEventListener("click", event => {
      cart.increment(
        async (success, value) => {
          const result = await updateQuantity(id)(success, value)
          if(result) {
            items[id].quantity = value;
            updateDetails();
          }

          return result;
        }
      )(event)
    });

    quantity.addEventListener("change", event => {
      cart.update(
        async (success, value) => {
          const result = await updateQuantity(id)(success, value)
          if(result) {
            items[id].quantity = value;
            updateDetails();
          }

          return result;
        }
      )(event)
    });
  }
  updateDetails();
}

window.addEventListener("load", () => {
  initializeCart();
})
