(function() {
  // const tabs = document.querySelectorAll(`*[data-tab-id]`);
  const toggles = document.querySelectorAll("*[data-tab]");
  
  const switchTab = (tabId) => (event) => {
    const activeTab = document.querySelector(".tab-active");
    if (activeTab) {
      activeTab.classList.remove("tab-active");
    }
  
    const newActiveTab = document.querySelector(`*[data-tab-id='${tabId}']`);
    if (newActiveTab) {
      newActiveTab.classList.add("tab-active");
    }
  };
  
  for (const toggle of toggles) {
    const tabId = toggle.getAttribute("data-tab");
    toggle.addEventListener("click", switchTab(tabId));
  }


  const remove = document.querySelector(".remove");
  const add = document.querySelector(".add");
  const quantity = document.querySelector(".quantity");

  if(remove && add && quantity) {
    remove.addEventListener("click", event => {
      event.preventDefault();
      cart.decrement(
        async (success, value) => {
          return true;
        }
      )(event)
    });

    add.addEventListener("click", event => {
      event.preventDefault();
      cart.increment(
        async (success, value) => {
          return true;
        }
      )(event)
    });

    quantity.addEventListener("change", event => {
      cart.update(
        async (success, value) => {
          return true;
        }
      )(event)
    });
  }
})();

document.querySelector(".card-number-input").oninput = () => {
  const box = document.querySelector(".card-number-box");
  const input = document.querySelector(".card-number-input");
  box.innerText = input.value;

  if (input.value === "") {
    box.innerText = "################";
  }
};

document.querySelector(".card-holder-input").oninput = () => {
  document.querySelector(".card-holder-name").innerText =
    document.querySelector(".card-holder-input").value;
};

document.querySelector(".month-input").oninput = () => {
  document.querySelector(".exp-month").innerText =
    document.querySelector(".month-input").value;
};

document.querySelector(".year-input").oninput = () => {
  document.querySelector(".exp-year").innerText =
    document.querySelector(".year-input").value;
};

document.querySelector(".cvv-input").onmouseenter = () => {
  document.querySelector(".front").style.transform =
    "perspective(1000px) rotateY(-180deg)";
  document.querySelector(".back").style.transform =
    "perspective(1000px) rotateY(0deg)";
};

document.querySelector(".cvv-input").onmouseleave = () => {
  document.querySelector(".front").style.transform =
    "perspective(1000px) rotateY(0deg)";
  document.querySelector(".back").style.transform =
    "perspective(1000px) rotateY(180deg)";
};

document.querySelector(".cvv-input").oninput = () => {
  document.querySelector(".cvv-box").innerText =
    document.querySelector(".cvv-input").value;
};
