
const cart = {
  increment: onChange => e => {
    cart._updateCount
      (e)
      (count => count + 1)
      (onChange);
  },
  decrement: onChange => e => {
    cart._updateCount
      (e)
      (count => count - 1)
      (onChange);
  },
  update: onChange => e => {
    cart._updateCount
      (e)
      (count => count)
      (onChange);
  },
  _updateCount: e => changer => async cb => {
    let value = cart.getCount(e);


    if(changer) {
      value = changer(value);
    }

    if(value < 1) {
      return cb(false, null);
    }

    if(cb) {
      const result = await cb(true, value);
      if(result) {
        cart.getInput(e).value = value;
      }
    }

    return true;
  },
  getCount: e => {
    const input = cart.getInput(e);
    return Number(input.value);
  },
  getInput: e => {
    const parent = e.target.parentElement;
    const input = parent.querySelector("input.quantity");

    return input;
  }
};
